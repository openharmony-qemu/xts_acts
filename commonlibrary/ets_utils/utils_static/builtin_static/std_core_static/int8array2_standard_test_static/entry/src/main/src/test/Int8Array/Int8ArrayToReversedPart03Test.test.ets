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

export default function int8ArrayToReversedPart03Test(): void {
  describe('Int8ArrayToReversedPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0100
     * @tc.name int8ArrayToReversedPart03Test001
     * @tc.desc Verify toReversed() copy length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      let r1: int = reversed.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0200
     * @tc.name int8ArrayToReversedPart03Test002
     * @tc.desc Verify [-128] int8 toReversed -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0300
     * @tc.name int8ArrayToReversedPart03Test003
     * @tc.desc Verify [127] int8 toReversed 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(127);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0400
     * @tc.name int8ArrayToReversedPart03Test004
     * @tc.desc Verify [-128, 127] toReversed [127, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, 127);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0500
     * @tc.name int8ArrayToReversedPart03Test005
     * @tc.desc Verify [127, -128] toReversed [-128, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(127, -128);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0600
     * @tc.name int8ArrayToReversedPart03Test006
     * @tc.desc Verify [-128, 0, 127] toReversed [127, 0, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, 0, 127);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = reversed.$_get(2);
      let e3: number = INT8_MIN;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0700
     * @tc.name int8ArrayToReversedPart03Test007
     * @tc.desc Verify 128 -128 toReversed -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, 128);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0800
     * @tc.name int8ArrayToReversedPart03Test008
     * @tc.desc Verify -129 127 toReversed 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, -129);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_0900
     * @tc.name int8ArrayToReversedPart03Test009
     * @tc.desc Verify 255 -1 toReversed -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, 255);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1000
     * @tc.name int8ArrayToReversedPart03Test010
     * @tc.desc Verify 256 0 toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, 256);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1100
     * @tc.name int8ArrayToReversedPart03Test011
     * @tc.desc Verify 0x81 -127 toReversed -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, 0x81);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = -127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1200
     * @tc.name int8ArrayToReversedPart03Test012
     * @tc.desc Verify Number.NaN 0 toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, Number.NaN);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1300
     * @tc.name int8ArrayToReversedPart03Test013
     * @tc.desc Verify Number.POSITIVE_INFINITY 0 toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1400
     * @tc.name int8ArrayToReversedPart03Test014
     * @tc.desc Verify Number.NEGATIVE_INFINITY 0 toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1500
     * @tc.name int8ArrayToReversedPart03Test015
     * @tc.desc Verify 1.9 1 toReversed 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, 1.9);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1600
     * @tc.name int8ArrayToReversedPart03Test016
     * @tc.desc Verify -1.9 -1 toReversed -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(1);
      arr.$_set(0, -1.9);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1700
     * @tc.name int8ArrayToReversedPart03Test017
     * @tc.desc Verify [5] toReversed 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1800
     * @tc.name int8ArrayToReversedPart03Test018
     * @tc.desc Verify [5] toReversed length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5);
      let reversed = arr.toReversed();
      let r1: int = reversed.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_1900
     * @tc.name int8ArrayToReversedPart03Test019
     * @tc.desc Verify toReversed() copy $_set leaves source 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5);
      let reversed = arr.toReversed();
      reversed.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2000
     * @tc.name int8ArrayToReversedPart03Test020
     * @tc.desc Verify 0 [0,0,0] toReversed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(0, 0, 0);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      expect(reversed).not().assertEqual(arr);
      reversed.$_set(0, 99);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = 0;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2100
     * @tc.name int8ArrayToReversedPart03Test021
     * @tc.desc Verify -128 [-128,-128,-128] toReversed -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, -128, -128);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
      expect(reversed).not().assertEqual(arr);
      reversed.$_set(0, 0);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: number = INT8_MIN;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2200
     * @tc.name int8ArrayToReversedPart03Test022
     * @tc.desc Verify 127 [127,127,127] toReversed 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(127, 127, 127);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
      expect(reversed).not().assertEqual(arr);
      reversed.$_set(0, 0);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: number = INT8_MAX;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2300
     * @tc.name int8ArrayToReversedPart03Test023
     * @tc.desc Verify -1 [-1,-1,-1] toReversed -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-1, -1, -1);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      expect(reversed).not().assertEqual(arr);
      reversed.$_set(0, 0);
      let originalFirst: number = arr.$_get(0);
      let originalExpected: int = -1;
      expect(originalFirst).assertEqual(originalExpected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2400
     * @tc.name int8ArrayToReversedPart03Test024
     * @tc.desc Verify toReversed() keeps length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      arr.toReversed();
      let r1: int = arr.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2500
     * @tc.name int8ArrayToReversedPart03Test025
     * @tc.desc Verify toReversed leaves first element of original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      arr.toReversed();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2600
     * @tc.name int8ArrayToReversedPart03Test026
     * @tc.desc Verify toReversed leaves last element of original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      arr.toReversed();
      let r1: number = arr.$_get(3);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2700
     * @tc.name int8ArrayToReversedPart03Test027
     * @tc.desc Verify toReversed leaves middle elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      arr.toReversed();
      let r1: number = arr.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2800
     * @tc.name int8ArrayToReversedPart03Test028
     * @tc.desc Verify toReversed result mutation does not affect original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      reversed.$_set(0, -99);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_2900
     * @tc.name int8ArrayToReversedPart03Test029
     * @tc.desc Verify toReversed result mutation does not affect original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      reversed.$_set(2, -99);
      let r1: number = arr.$_get(2);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3000
     * @tc.name int8ArrayToReversedPart03Test030
     * @tc.desc Verify [-1, 0, 1] toReversed [1, 0, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-1, 0, 1);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3100
     * @tc.name int8ArrayToReversedPart03Test031
     * @tc.desc Verify [0, -1, 127, -128] toReversed [-128, 127, -1, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(0, -1, 127, -128);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(3);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3200
     * @tc.name int8ArrayToReversedPart03Test032
     * @tc.desc Verify toReversed() on of()-created [1, 2, 3] returns [3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3300
     * @tc.name int8ArrayToReversedPart03Test033
     * @tc.desc Verify toReversed().toReversed() restores original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let restored = arr.toReversed().toReversed();
      let r1: number = restored.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = restored.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3400
     * @tc.name int8ArrayToReversedPart03Test034
     * @tc.desc Verify toReversed().toReversed() result is independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let restored = arr.toReversed().toReversed();
      restored.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3500
     * @tc.name int8ArrayToReversedPart03Test035
     * @tc.desc Verify toReversed result name is 'Int8Array' on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      let r1: string = reversed.name;
      let e1: string = 'Int8Array';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3600
     * @tc.name int8ArrayToReversedPart03Test036
     * @tc.desc Verify two toReversed calls return equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let rev1 = arr.toReversed();
      let rev2 = arr.toReversed();
      let r1: number = rev1.$_get(0);
      let e1: number = rev2.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = rev1.$_get(2);
      let e2: number = rev2.$_get(2);
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3700
     * @tc.name int8ArrayToReversedPart03Test037
     * @tc.desc Verify repeated toReversed leaves original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      arr.toReversed();
      arr.toReversed();
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3800
     * @tc.name int8ArrayToReversedPart03Test038
     * @tc.desc Verify toReversed results are independent copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let rev1 = arr.toReversed();
      let rev2 = arr.toReversed();
      rev1.$_set(0, 99);
      let r1: number = rev2.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_3900
     * @tc.name int8ArrayToReversedPart03Test039
     * @tc.desc Verify [128,255,0] [-128,-1,0] toReversed [0,-1,-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(3);
      arr.$_set(0, 128);
      arr.$_set(1, 255);
      arr.$_set(2, 0);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = reversed.$_get(2);
      let e3: number = INT8_MIN;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4000
     * @tc.name int8ArrayToReversedPart03Test040
     * @tc.desc Verify [Number.NaN,Number.POSITIVE_INFINITY,Number.NEGATIVE_INFINITY] [0,0,0] toReversed [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(3);
      arr.$_set(0, Number.NaN);
      arr.$_set(1, Number.POSITIVE_INFINITY);
      arr.$_set(2, Number.NEGATIVE_INFINITY);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = reversed.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4100
     * @tc.name int8ArrayToReversedPart03Test041
     * @tc.desc Verify toReversed() copy $_set leaves source 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      reversed.$_set(1, 100);
      let r1: number = reversed.$_get(1);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4200
     * @tc.name int8ArrayToReversedPart03Test042
     * @tc.desc Verify toReversed() subarray(1, 3) yields 3, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let reversed = arr.toReversed();
      let sub = reversed.subarray(1, 3);
      let r1: number = sub.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = sub.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4300
     * @tc.name int8ArrayToReversedPart03Test043
     * @tc.desc Verify toReversed() slice(0, 2) yields 4, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let reversed = arr.toReversed();
      let sliced = reversed.slice(0, 2);
      let r1: number = sliced.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = sliced.$_get(1);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4400
     * @tc.name int8ArrayToReversedPart03Test044
     * @tc.desc Verify [127,-128,0] toReversed [0,-128,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(127, -128, 0);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(2);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4500
     * @tc.name int8ArrayToReversedPart03Test045
     * @tc.desc Verify [-128,127,-1,1] toReversed [1,-1,127,-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, 127, -1, 1);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(3);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4600
     * @tc.name int8ArrayToReversedPart03Test046
     * @tc.desc Verify toReversed() at(0) equals source at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      let r1 = reversed.at(0);
      let e1 = arr.at(-1);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4700
     * @tc.name int8ArrayToReversedPart03Test047
     * @tc.desc Verify toReversed() at(-1) equals source at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let reversed = arr.toReversed();
      let r1 = reversed.at(-1);
      let e1 = arr.at(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4800
     * @tc.name int8ArrayToReversedPart03Test048
     * @tc.desc Verify toReversed on of()-created [1,-1,1,-1] returns [-1,1,-1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, -1, 1, -1);
      let reversed = arr.toReversed();
      let r1: number = reversed.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = reversed.$_get(3);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_4900
     * @tc.name int8ArrayToReversedPart03Test049
     * @tc.desc Verify toReversed keeps clamped INT8_MIN values in original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(3);
      arr.$_set(0, 128);
      arr.$_set(1, 255);
      arr.$_set(2, 0);
      arr.toReversed();
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TO_REVERSED_PART03_TEST_5000
     * @tc.name int8ArrayToReversedPart03Test050
     * @tc.desc Verify toReversed() keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToReversedPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let originalByteLength = arr.byteLength;
      arr.toReversed();
      let r1: int = arr.byteLength;
      let e1: number = originalByteLength;
      expect(r1).assertEqual(e1);
    });
  });
}
