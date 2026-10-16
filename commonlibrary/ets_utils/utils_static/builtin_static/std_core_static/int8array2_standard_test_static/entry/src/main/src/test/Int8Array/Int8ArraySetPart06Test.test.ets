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

export default function int8ArraySetPart06Test(): void {
  describe('Int8ArraySetPart06Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0100
     * @tc.name int8ArraySetPart06Test001
     * @tc.desc Verify arity set(src, 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [10.0, 20.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 10;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 20;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 0;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0200
     * @tc.name int8ArraySetPart06Test002
     * @tc.desc Verify set([42.0], 0) copies single element to index 0 on Int8Array of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [42.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 42;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 0;
      expect(actualAt1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0300
     * @tc.name int8ArraySetPart06Test003
     * @tc.desc Verify set([42.0], 2) writes to last element, leaves earlier indices at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [42.0];
      target.set(src, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 0;
      expect(actualAt0).assertEqual(expected1);
      let actualAt2: number = target.$_get(2);
      let expected2: int = 42;
      expect(actualAt2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0400
     * @tc.name int8ArraySetPart06Test004
     * @tc.desc Verify set with 3 elements keeps fourth element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 0;
      expect(actualAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0500
     * @tc.name int8ArraySetPart06Test005
     * @tc.desc Verify set(src) copies all source elements to target array positions 0 to N-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(5);
      let src: FixedArray<number> = [7.0, 8.0];
      target.set(src, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 0;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 0;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 7;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 8;
      expect(actualAt3).assertEqual(expected4);
      let actualAt4: number = target.$_get(4);
      let expected5: int = 0;
      expect(actualAt4).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0600
     * @tc.name int8ArraySetPart06Test006
     * @tc.desc Verify set float source writes truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
      let actualLength: int = target.length;
      let expected4: int = 3;
      expect(actualLength).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0700
     * @tc.name int8ArraySetPart06Test007
     * @tc.desc Verify set int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [127.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0800
     * @tc.name int8ArraySetPart06Test008
     * @tc.desc Verify set int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [-128.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_0900
     * @tc.name int8ArraySetPart06Test009
     * @tc.desc Verify set([0.0], 0) overwrites index 0 to 0 and keeps index 1 unchanged at 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(2);
      target.$_set(0, 5);
      target.$_set(1, 6);
      let src: FixedArray<number> = [0.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 0;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 6;
      expect(actualAt1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1000
     * @tc.name int8ArraySetPart06Test010
     * @tc.desc Verify set([5, 5, 5]) overwrites all target elements to 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [5.0, 5.0, 5.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 5;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 5;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 5;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1100
     * @tc.name int8ArraySetPart06Test011
     * @tc.desc Verify set([100.0, -100.0, 50.0], 0) copies mixed-sign elements to Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [100.0, -100.0, 50.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 100;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = -100;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 50;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1200
     * @tc.name int8ArraySetPart06Test012
     * @tc.desc Verify set([-1.0, -50.0, -127.0], 0) copies all-negative elements to Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [-1.0, -50.0, -127.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = -1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = -50;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = -127;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1300
     * @tc.name int8ArraySetPart06Test013
     * @tc.desc Verify set() does not mutate source FixedArray after copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(2);
      let src: FixedArray<number> = [11.0, 22.0];
      target.set(src, 0);
      let srcValue0: number = src[0];
      let expected1: int = 11;
      expect(srcValue0).assertEqual(expected1);
      let srcValue1: number = src[1];
      let expected2: int = 22;
      expect(srcValue1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1400
     * @tc.name int8ArraySetPart06Test014
     * @tc.desc Verify set insertPos = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1500
     * @tc.name int8ArraySetPart06Test015
     * @tc.desc Verify set insertPos = 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      let src: FixedArray<number> = [3.0, 4.0];
      target.set(src, 1);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 0;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 3;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 4;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 0;
      expect(actualAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1600
     * @tc.name int8ArraySetPart06Test016
     * @tc.desc Verify set last position single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [9.0];
      target.set(src, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 0;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 0;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 9;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1700
     * @tc.name int8ArraySetPart06Test017
     * @tc.desc Verify set writes visible via buffer and $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src, 0);
      let actualByteLength: int = target.buffer.byteLength;
      let expected1: int = 3;
      expect(actualByteLength).assertEqual(expected1);
      let actualAt0: number = target.$_get(0);
      let expected2: int = 10;
      expect(actualAt0).assertEqual(expected2);
      let actualAt1: number = target.$_get(1);
      let expected3: int = 20;
      expect(actualAt1).assertEqual(expected3);
      let actualAt2: number = target.$_get(2);
      let expected4: int = 30;
      expect(actualAt2).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1800
     * @tc.name int8ArraySetPart06Test018
     * @tc.desc Verify target.set(src, 0) writes 1 into target[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(2);
      let src: FixedArray<number> = [1.0];
      target.set(src, 0);
      let actualValue: number = target.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_1900
     * @tc.name int8ArraySetPart06Test019
     * @tc.desc Verify set(src, 1) writes 2 elements starting at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 1);
      let actualAt1: number = target.$_get(1);
      let expected1: int = 1;
      expect(actualAt1).assertEqual(expected1);
      let actualAt2: number = target.$_get(2);
      let expected2: int = 2;
      expect(actualAt2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2000
     * @tc.name int8ArraySetPart06Test020
     * @tc.desc Verify set([128.0]) clamps 128 to -128 via ToInt8 conversion-128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [128.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2100
     * @tc.name int8ArraySetPart06Test021
     * @tc.desc Verify set([-129.0]) clamps -129 to 127 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [-129.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2200
     * @tc.name int8ArraySetPart06Test022
     * @tc.desc Verify set([254.0]) wraps 254 to -2 via ToInt8 modulo-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [254.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = -2;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2300
     * @tc.name int8ArraySetPart06Test023
     * @tc.desc Verify set([130.0]) wraps 130 to -126 via ToInt8 modulo-126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [130.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = -126;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2400
     * @tc.name int8ArraySetPart06Test024
     * @tc.desc Verify set([129.0]) wraps 129 to -127 via ToInt8 modulo-127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [129.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = -127;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2500
     * @tc.name int8ArraySetPart06Test025
     * @tc.desc Verify set Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [Number.NaN];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 0;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2600
     * @tc.name int8ArraySetPart06Test026
     * @tc.desc Verify set([127.999]) truncates 127.999 to 127 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [127.999];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2700
     * @tc.name int8ArraySetPart06Test027
     * @tc.desc Verify set -128.999 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [-128.999];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2800
     * @tc.name int8ArraySetPart06Test028
     * @tc.desc Verify set([200.0]) wraps 200 to -56 via ToInt8 modulo-56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [200.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = -56;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_2900
     * @tc.name int8ArraySetPart06Test029
     * @tc.desc Verify set([-200.0]) wraps -200 to 56 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(1);
      let src: FixedArray<number> = [-200.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 56;
      expect(actualAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3000
     * @tc.name int8ArraySetPart06Test030
     * @tc.desc Verify sequential set(src1,0) then set(src2,2) writes non-overlapping regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      let src1: FixedArray<number> = [1.0, 2.0];
      let src2: FixedArray<number> = [3.0, 4.0];
      target.set(src1, 0);
      target.set(src2, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 4;
      expect(actualAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3100
     * @tc.name int8ArraySetPart06Test031
     * @tc.desc Verify second set(src2,0) overwrites first set result at overlapping positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src1: FixedArray<number> = [1.0, 2.0, 3.0];
      let src2: FixedArray<number> = [9.0, 8.0];
      target.set(src1, 0);
      target.set(src2, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 9;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 8;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3200
     * @tc.name int8ArraySetPart06Test032
     * @tc.desc Verify $_get reads correct values after set([11,22,33], 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [11.0, 22.0, 33.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 11;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 22;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 33;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3300
     * @tc.name int8ArraySetPart06Test033
     * @tc.desc Verify set writes visible via includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [7.0, 8.0, 9.0];
      target.set(src, 0);
      let includes8: boolean = target.includes(8);
      expect(includes8).assertTrue();
      let includes99: boolean = target.includes(99);
      expect(includes99).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3400
     * @tc.name int8ArraySetPart06Test034
     * @tc.desc Verify set subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      let src: FixedArray<number> = [5.0, 6.0];
      target.set(src, 1);
      let view: Int8Array = target.subarray(1, 3);
      let viewAt0: number = view.$_get(0);
      let expected1: int = 5;
      expect(viewAt0).assertEqual(expected1);
      let viewAt1: number = view.$_get(1);
      let expected2: int = 6;
      expect(viewAt1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3500
     * @tc.name int8ArraySetPart06Test035
     * @tc.desc Verify set writes visible via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      let actualString: string = target.toString();
      let expected1: string = '1,2,3';
      expect(actualString).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3600
     * @tc.name int8ArraySetPart06Test036
     * @tc.desc Verify set(src, 1) writes range starting at insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(5);
      target.$_set(0, 1);
      target.$_set(1, 2);
      target.$_set(2, 3);
      target.$_set(3, 4);
      target.$_set(4, 5);
      let src: FixedArray<number> = [9.0, 8.0];
      target.set(src, 1);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 9;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 8;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 4;
      expect(actualAt3).assertEqual(expected4);
      let actualAt4: number = target.$_get(4);
      let expected5: int = 5;
      expect(actualAt4).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3700
     * @tc.name int8ArraySetPart06Test037
     * @tc.desc Verify set writes visible via at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src, 0);
      let actualAt0 = target.at(0);
      let expected1: int = 10;
      expect(actualAt0).assertEqual(expected1);
      let actualAtLast = target.at(-1);
      let expected2: int = 30;
      expect(actualAtLast).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3800
     * @tc.name int8ArraySetPart06Test038
     * @tc.desc Verify set writes visible via indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [7.0, 8.0, 9.0];
      target.set(src, 0);
      let indexOf8: int = target.indexOf(8);
      let expected1: int = 1;
      expect(indexOf8).assertEqual(expected1);
      let indexOf99: int = target.indexOf(99);
      let expected2: int = -1;
      expect(indexOf99).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_3900
     * @tc.name int8ArraySetPart06Test039
     * @tc.desc Verify set [128, 255, 256]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [128.0, 255.0, 256.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = -1;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 0;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4000
     * @tc.name int8ArraySetPart06Test040
     * @tc.desc Verify set([128, 128, 128]) clamps all 128 values to -128 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [128.0, 128.0, 128.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: number = INT8_MIN;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4100
     * @tc.name int8ArraySetPart06Test041
     * @tc.desc Verify set(src, 2) writes from insertPos 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(5);
      target.$_set(0, 1);
      target.$_set(1, 2);
      target.$_set(2, 3);
      target.$_set(3, 4);
      target.$_set(4, 5);
      let src: FixedArray<number> = [20.0, 30.0];
      target.set(src, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 20;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 30;
      expect(actualAt3).assertEqual(expected4);
      let actualAt4: number = target.$_get(4);
      let expected5: int = 5;
      expect(actualAt4).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4200
     * @tc.name int8ArraySetPart06Test042
     * @tc.desc Verify set([-128, 0, 127], 0) writes boundary values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [-128.0, 0.0, 127.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 0;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: number = INT8_MAX;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4300
     * @tc.name int8ArraySetPart06Test043
     * @tc.desc Verify set zero position overwrites nines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      target.$_set(0, 9);
      target.$_set(1, 9);
      target.$_set(2, 9);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4400
     * @tc.name int8ArraySetPart06Test044
     * @tc.desc Verify set position length minus two writes tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      target.$_set(0, 1);
      target.$_set(1, 2);
      let src: FixedArray<number> = [3.0, 4.0];
      target.set(src, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 4;
      expect(actualAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4500
     * @tc.name int8ArraySetPart06Test045
     * @tc.desc Verify set writes visible via forEach sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src, 0);
      let sum: number = 0;
      target.forEach((v: number) => {
        sum += v;
      });
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4600
     * @tc.name int8ArraySetPart06Test046
     * @tc.desc Verify four sequential single-element set() calls at positions 0-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      let src1: FixedArray<number> = [1.0];
      let src2: FixedArray<number> = [2.0];
      let src3: FixedArray<number> = [3.0];
      let src4: FixedArray<number> = [4.0];
      target.set(src1, 0);
      target.set(src2, 1);
      target.set(src3, 2);
      target.set(src4, 3);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 3;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 4;
      expect(actualAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4700
     * @tc.name int8ArraySetPart06Test047
     * @tc.desc Verify set buffer Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let target: Int8Array = new Int8Array(buf, 0, 3);
      let observer: Int8Array = new Int8Array(buf, 0, 3);
      let src: FixedArray<number> = [7.0, 8.0];
      target.set(src, 0);
      let observerAt0: number = observer.$_get(0);
      let expected1: int = 7;
      expect(observerAt0).assertEqual(expected1);
      let observerAt1: number = observer.$_get(1);
      let expected2: int = 8;
      expect(observerAt1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4800
     * @tc.name int8ArraySetPart06Test048
     * @tc.desc Verify set then reverse order yields 3, 2, 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(3);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      target.reverse();
      let actualAt0: number = target.$_get(0);
      let expected1: int = 3;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 1;
      expect(actualAt2).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_4900
     * @tc.name int8ArraySetPart06Test049
     * @tc.desc Verify set then copyWithin duplicates elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(4);
      let src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 0);
      target.copyWithin(2, 0, 2);
      let actualAt0: number = target.$_get(0);
      let expected1: int = 1;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: int = 2;
      expect(actualAt1).assertEqual(expected2);
      let actualAt2: number = target.$_get(2);
      let expected3: int = 1;
      expect(actualAt2).assertEqual(expected3);
      let actualAt3: number = target.$_get(3);
      let expected4: int = 2;
      expect(actualAt3).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART06_TEST_5000
     * @tc.name int8ArraySetPart06Test050
     * @tc.desc Verify set [-129, 128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart06Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int8Array = new Int8Array(2);
      let src: FixedArray<number> = [-129.0, 128.0];
      target.set(src, 0);
      let actualAt0: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(actualAt0).assertEqual(expected1);
      let actualAt1: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(actualAt1).assertEqual(expected2);
    });
  });
}
