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
import Utils from './../Util.test';

export default function int8ArraySetPart02Test(): void {
  describe('Int8ArraySetPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0100
     * @tc.name int8ArraySetPart02Test001
     * @tc.desc Verify set arity 2 number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.set(1, 42);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 42;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 0;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0200
     * @tc.name int8ArraySetPart02Test002
     * @tc.desc Verify set insertPos=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.set(0, 7);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 7;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 0;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0300
     * @tc.name int8ArraySetPart02Test003
     * @tc.desc Verify set(3, 9) writes 9 at last index keeping 0 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set(3, 9);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 9;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0400
     * @tc.name int8ArraySetPart02Test004
     * @tc.desc Verify set insertPos=2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      arr.set(2, 11);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 11;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex4: number = arr[4];
      let expectedValueAtIndex4: int = 0;
      expect(valueAtIndex4).assertEqual(expectedValueAtIndex4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0500
     * @tc.name int8ArraySetPart02Test005
     * @tc.desc Verify set(0, 0) overwrites previous value with 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, 50);
      arr.set(0, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0600
     * @tc.name int8ArraySetPart02Test006
     * @tc.desc Verify set val=127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, 127);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MAX;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0700
     * @tc.name int8ArraySetPart02Test007
     * @tc.desc Verify set val=-128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, -128);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MIN;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0800
     * @tc.name int8ArraySetPart02Test008
     * @tc.desc Verify set val=-129 -1 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, -129);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MAX;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_0900
     * @tc.name int8ArraySetPart02Test009
     * @tc.desc Verify set val=256 256 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, 256);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1000
     * @tc.name int8ArraySetPart02Test010
     * @tc.desc Verify set val=1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, 1.9);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1100
     * @tc.name int8ArraySetPart02Test011
     * @tc.desc Verify set val=-0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, -0.5);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1200
     * @tc.name int8ArraySetPart02Test012
     * @tc.desc Verify set val=-0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, 50);
      arr.set(0, -0.0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1300
     * @tc.name int8ArraySetPart02Test013
     * @tc.desc Verify set(index, value) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      expect(arr.set(0, 5)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1500
     * @tc.name int8ArraySetPart02Test015
     * @tc.desc Verify set overwrites previous value at same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr.set(0, 100);
      arr.set(0, 50);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 50;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1600
     * @tc.name int8ArraySetPart02Test016
     * @tc.desc Verify arity 1 offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.set([1, 2, 3]);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 2;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 3;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1700
     * @tc.name int8ArraySetPart02Test017
     * @tc.desc Verify arity 2 offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const src: Array<number> = [7, 8, 9];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 7;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 9;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_1800
     * @tc.name int8ArraySetPart02Test018
     * @tc.desc Verify arity 2 offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set([10, 20], 2);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 10;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 20;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2000
     * @tc.name int8ArraySetPart02Test020
     * @tc.desc Verify set [1] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.set([1], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 0;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2100
     * @tc.name int8ArraySetPart02Test021
     * @tc.desc Verify set(src, 0) copies elements beginning at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      arr.set([1, 2, 3], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 3;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 0;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
      let valueAtIndex4: number = arr[4];
      let expectedValueAtIndex4: int = 0;
      expect(valueAtIndex4).assertEqual(expectedValueAtIndex4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2200
     * @tc.name int8ArraySetPart02Test022
     * @tc.desc Verify set([-1, -128]) writes boundary negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.set([-1, -128], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = -1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: number = INT8_MIN;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2300
     * @tc.name int8ArraySetPart02Test023
     * @tc.desc Verify set(src, 0) overwrites existing elements at target offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr[0] = 9;
      arr[1] = 9;
      arr[2] = 9;
      arr.set([0, 0, 0], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 0;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2400
     * @tc.name int8ArraySetPart02Test024
     * @tc.desc Verify set([5, 5, 5]) fills all elements with 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.set([5, 5, 5], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 5;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 5;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 5;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2500
     * @tc.name int8ArraySetPart02Test025
     * @tc.desc Verify set([1, 2, 3, 4]) keeps length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set([1, 2, 3, 4], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 4;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
      let arrayLength: int = arr.length;
      let expectedLength: int = 4;
      expect(arrayLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2600
     * @tc.name int8ArraySetPart02Test026
     * @tc.desc Verify set([127, -128, 0]) writes boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.set([127, -128, 0], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MAX;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: number = INT8_MIN;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 0;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2700
     * @tc.name int8ArraySetPart02Test027
     * @tc.desc Verify set([7, 8], 0) overwrites first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr[2] = 1;
      arr[3] = 1;
      arr.set([7, 8], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 7;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 8;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 1;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2800
     * @tc.name int8ArraySetPart02Test028
     * @tc.desc Verify set([7, 8], 1) keeps index 0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set([7, 8], 1);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 7;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 8;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 0;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_2900
     * @tc.name int8ArraySetPart02Test029
     * @tc.desc Verify set([9], 3) writes last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set([9], 3);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 0;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 9;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3100
     * @tc.name int8ArraySetPart02Test031
     * @tc.desc Verify set([128]) converts 128 to -128 via ToInt8 storage conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [128];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MIN;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3200
     * @tc.name int8ArraySetPart02Test032
     * @tc.desc Verify set([-129]) converts -129 to 127 via ToInt8 storage conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [-129];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MAX;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3300
     * @tc.name int8ArraySetPart02Test033
     * @tc.desc Verify set([255]) converts 255 to -1 via ToInt8 modulo wrapping-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [255];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = -1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3400
     * @tc.name int8ArraySetPart02Test034
     * @tc.desc Verify set([256]) converts 256 to 0 via ToInt8 modulo wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [256];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3500
     * @tc.name int8ArraySetPart02Test035
     * @tc.desc Verify set Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [Number.NaN];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3600
     * @tc.name int8ArraySetPart02Test036
     * @tc.desc Verify set([1.9]) truncates 1.9 to 1 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [1.9];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3700
     * @tc.name int8ArraySetPart02Test037
     * @tc.desc Verify set -1.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [-1.9];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = -1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3800
     * @tc.name int8ArraySetPart02Test038
     * @tc.desc Verify set([0.5]) truncates 0.5 to 0 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [0.5];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_3900
     * @tc.name int8ArraySetPart02Test039
     * @tc.desc Verify set([0.1]) truncates fractional source to int 0 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [0.1];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_4000
     * @tc.name int8ArraySetPart02Test040
     * @tc.desc Verify set([-0.0]) converts -0.0 to 0 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      arr[0] = 50;
      const src: Array<number> = [-0.0];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_4100
     * @tc.name int8ArraySetPart02Test041
     * @tc.desc Verify set([127]) copies INT8_MAX value unchanged to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [127];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MAX;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_4200
     * @tc.name int8ArraySetPart02Test042
     * @tc.desc Verify set([-128]) copies INT8_MIN value unchanged to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(1);
      const src: Array<number> = [-128];
      arr.set(src, 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: number = INT8_MIN;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5000
     * @tc.name int8ArraySetPart02Test050
     * @tc.desc Verify set on subarray view writes into base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Int8Array([1, 2, 3, 4, 5]);
      const view = base.subarray(2);
      view.set([9, 9], 0);
      let valueAtIndex2: number = base[2];
      let expectedValueAtIndex2: int = 9;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = base[3];
      let expectedValueAtIndex3: int = 9;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
      let valueAtIndex0: number = base[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5100
     * @tc.name int8ArraySetPart02Test051
     * @tc.desc Verify set offset on subarray view writes into base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Int8Array([1, 2, 3, 4, 5, 6]);
      const view = base.subarray(2);
      view.set([9, 9], 1);
      let valueAtIndex2: number = base[2];
      let expectedValueAtIndex2: int = 3;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = base[3];
      let expectedValueAtIndex3: int = 9;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
      let valueAtIndex4: number = base[4];
      let expectedValueAtIndex4: int = 9;
      expect(valueAtIndex4).assertEqual(expectedValueAtIndex4);
      let valueAtIndex5: number = base[5];
      let expectedValueAtIndex5: int = 6;
      expect(valueAtIndex5).assertEqual(expectedValueAtIndex5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5200
     * @tc.name int8ArraySetPart02Test052
     * @tc.desc Verify set([1, 2], 2) overwrites middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set([1, 2], 2);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 0;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 0;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 1;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 2;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5300
     * @tc.name int8ArraySetPart02Test053
     * @tc.desc Verify set([1, 2, 3], 0) overwrites all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr[0] = 8;
      arr[1] = 8;
      arr[2] = 8;
      arr.set([1, 2, 3], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 2;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 3;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5400
     * @tc.name int8ArraySetPart02Test054
     * @tc.desc Verify set(array, offset) writes at two offsets in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(5);
      arr.set([1, 2], 0);
      arr.set([3, 4], 2);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 2;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 3;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 4;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
      let valueAtIndex4: number = arr[4];
      let expectedValueAtIndex4: int = 0;
      expect(valueAtIndex4).assertEqual(expectedValueAtIndex4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5500
     * @tc.name int8ArraySetPart02Test055
     * @tc.desc Verify set copies source values without sharing reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const src: Array<number> = [1, 2, 3];
      arr.set(src, 0);
      src[0] = 99;
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 1;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let srcValueAtIndex0: number = src[0];
      let expectedSrcValueAtIndex0: int = 99;
      expect(srcValueAtIndex0).assertEqual(expectedSrcValueAtIndex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART02_TEST_5600
     * @tc.name int8ArraySetPart02Test056
     * @tc.desc Verify repeated set overwrites first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      arr.set([1, 2, 3, 4], 0);
      arr.set([9, 9], 0);
      let valueAtIndex0: number = arr[0];
      let expectedValueAtIndex0: int = 9;
      expect(valueAtIndex0).assertEqual(expectedValueAtIndex0);
      let valueAtIndex1: number = arr[1];
      let expectedValueAtIndex1: int = 9;
      expect(valueAtIndex1).assertEqual(expectedValueAtIndex1);
      let valueAtIndex2: number = arr[2];
      let expectedValueAtIndex2: int = 3;
      expect(valueAtIndex2).assertEqual(expectedValueAtIndex2);
      let valueAtIndex3: number = arr[3];
      let expectedValueAtIndex3: int = 4;
      expect(valueAtIndex3).assertEqual(expectedValueAtIndex3);
    });
  });
}
