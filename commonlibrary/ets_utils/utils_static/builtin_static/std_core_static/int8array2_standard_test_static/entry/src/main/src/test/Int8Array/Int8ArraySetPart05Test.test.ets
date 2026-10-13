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

export default function int8ArraySetPart05Test(): void {
  describe('Int8ArraySetPart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0100
     * @tc.name int8ArraySetPart05Test001
     * @tc.desc Verify set(src) without offset defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const src: FixedArray<number> = [8.0, 9.0];
      arr.set(src);
      let resultLength: int = arr.length;
      let expectedLength: int = 2;
      expect(resultLength).assertEqual(expectedLength);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 8;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 9;
      expect(resultAtOne).assertEqual(expectedAtOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0200
     * @tc.name int8ArraySetPart05Test002
     * @tc.desc Verify set(empty_src) on empty target array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      const src: FixedArray<number> = [];
      arr.set(src);
      let resultLength: int = arr.length;
      let expectedLength: int = 0;
      expect(resultLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0300
     * @tc.name int8ArraySetPart05Test003
     * @tc.desc Verify set(empty_src) on non-empty array does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5, 6, 7);
      const src: FixedArray<number> = [];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 5;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 6;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 7;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0400
     * @tc.name int8ArraySetPart05Test004
     * @tc.desc Verify set([42.0]) on new Int8Array(1) copies single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [42.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 42;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0500
     * @tc.name int8ArraySetPart05Test005
     * @tc.desc Verify set([99.0]) on Int8Array.of(11,22) overwrites index 0, index 1 preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22);
      const src: FixedArray<number> = [99.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 99;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 22;
      expect(resultAtOne).assertEqual(expectedAtOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0600
     * @tc.name int8ArraySetPart05Test006
     * @tc.desc Verify set([3.0, 4.0]) on new Int8Array(2) copies all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const src: FixedArray<number> = [3.0, 4.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 3;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 4;
      expect(resultAtOne).assertEqual(expectedAtOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0700
     * @tc.name int8ArraySetPart05Test007
     * @tc.desc Verify set(src) copies all source elements to target array positions 0 to N-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const src: FixedArray<number> = [10.0, 20.0, 30.0, 40.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 10;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtThree: number = arr.$_get(3);
      let expectedAtThree: int = 40;
      expect(resultAtThree).assertEqual(expectedAtThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0800
     * @tc.name int8ArraySetPart05Test008
     * @tc.desc Verify set([0]) copies single zero value to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_0900
     * @tc.name int8ArraySetPart05Test009
     * @tc.desc Verify set([127.0]) copies INT8_MAX value unchanged to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [127.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MAX;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1000
     * @tc.name int8ArraySetPart05Test010
     * @tc.desc Verify set([-128.0]) copies INT8_MIN value unchanged to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-128.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MIN;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1100
     * @tc.name int8ArraySetPart05Test011
     * @tc.desc Verify set([1.0]) copies positive one to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [1.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1200
     * @tc.name int8ArraySetPart05Test012
     * @tc.desc Verify set([-1.0]) copies negative one to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-1.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1300
     * @tc.name int8ArraySetPart05Test013
     * @tc.desc Verify set([128.0]) clamps 128 to -128 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [128.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MIN;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1400
     * @tc.name int8ArraySetPart05Test014
     * @tc.desc Verify set([255.0]) wraps 255 to -1 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [255.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1500
     * @tc.name int8ArraySetPart05Test015
     * @tc.desc Verify set([256.0]) wraps 256 to 0 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [256.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1600
     * @tc.name int8ArraySetPart05Test016
     * @tc.desc Verify set([257.0]) wraps 257 to 1 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [257.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1700
     * @tc.name int8ArraySetPart05Test017
     * @tc.desc Verify set([511.0]) wraps 511 to -1 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [511.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1800
     * @tc.name int8ArraySetPart05Test018
     * @tc.desc Verify set([-129.0]) clamps -129 to 127 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-129.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MAX;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_1900
     * @tc.name int8ArraySetPart05Test019
     * @tc.desc Verify set([-255.0]) wraps -255 to 1 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-255.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2000
     * @tc.name int8ArraySetPart05Test020
     * @tc.desc Verify set([-256.0]) wraps -256 to 0 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-256.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2100
     * @tc.name int8ArraySetPart05Test021
     * @tc.desc Verify set([-257.0]) wraps -257 to -1 via ToInt8 modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-257.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2200
     * @tc.name int8ArraySetPart05Test022
     * @tc.desc Verify set([5e-324]) converts Number.MIN_VALUE to 0 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [5e-324];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2300
     * @tc.name int8ArraySetPart05Test023
     * @tc.desc Verify set([Number.NaN]) converts NaN to 0 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [Number.NaN];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2400
     * @tc.name int8ArraySetPart05Test024
     * @tc.desc Verify set([0.0]) copies 0.0 as integer 0 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [0.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2500
     * @tc.name int8ArraySetPart05Test025
     * @tc.desc Verify set([-0.0]) converts -0.0 to 0 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-0.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2600
     * @tc.name int8ArraySetPart05Test026
     * @tc.desc Verify set([9007199254740991]) wraps Number.MAX_SAFE_INTEGER to -1 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [9007199254740991];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2700
     * @tc.name int8ArraySetPart05Test027
     * @tc.desc Verify set([-9007199254740991]) wraps Number.MIN_SAFE_INTEGER to 1 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-9007199254740991];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2800
     * @tc.name int8ArraySetPart05Test028
     * @tc.desc Verify set([0.5]) truncates 0.5 to 0 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [0.5];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_2900
     * @tc.name int8ArraySetPart05Test029
     * @tc.desc Verify set([-0.5]) truncates -0.5 to 0 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-0.5];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3000
     * @tc.name int8ArraySetPart05Test030
     * @tc.desc Verify set([1.9]) truncates 1.9 to 1 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [1.9];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3100
     * @tc.name int8ArraySetPart05Test031
     * @tc.desc Verify set([-1.9]) truncates -1.9 to -1 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-1.9];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3200
     * @tc.name int8ArraySetPart05Test032
     * @tc.desc Verify set([127.9]) truncates 127.9 to 127 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [127.9];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MAX;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3300
     * @tc.name int8ArraySetPart05Test033
     * @tc.desc Verify set([-128.9]) truncates -128.9 to -128 via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-128.9];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MIN;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3400
     * @tc.name int8ArraySetPart05Test034
     * @tc.desc Verify for-of iteration over Int8Array after set(src) yields sum of copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [5.0, 6.0, 7.0];
      arr.set(src);
      let sum: number = 0;
      for (const e of arr) {
        sum = sum + e;
      }
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3500
     * @tc.name int8ArraySetPart05Test035
     * @tc.desc Verify byteLength remains 4 after set([1.0, 2.0, 3.0]) on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      let resultByteLength: int = arr.byteLength;
      let expectedByteLength: int = 4;
      expect(resultByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3600
     * @tc.name int8ArraySetPart05Test036
     * @tc.desc Verify set([1.0, 2.0, 3.0]) on new Int8Array(3) copies all source elements to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      let arr2: Int8Array = new Int8Array(3);
      arr2.set(src);
      let resultAtZero: number = arr2.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr2.$_get(1);
      let expectedAtOne: int = 2;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr2.$_get(2);
      let expectedAtTwo: int = 3;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3700
     * @tc.name int8ArraySetPart05Test037
     * @tc.desc Verify at(0) and at(2) return set source values on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [7.0, 8.0, 9.0];
      arr.set(src);
      let resultAtZero = arr.at(0);
      let expectedAtZero: int = 7;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtTwo = arr.at(2);
      let expectedAtTwo: int = 9;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3800
     * @tc.name int8ArraySetPart05Test038
     * @tc.desc Verify $_get(0) and $_get(2) return set source values after set(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 10;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 30;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_3900
     * @tc.name int8ArraySetPart05Test039
     * @tc.desc Verify second set(src2) overwrites first set values on Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src1: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src1);
      const src2: FixedArray<number> = [4.0, 5.0, 6.0];
      arr.set(src2);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 4;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 6;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4000
     * @tc.name int8ArraySetPart05Test040
     * @tc.desc Verify set(src) copies shorter source into prefix of target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(9, 9, 9, 9);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 3;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
      let resultAtThree: number = arr.$_get(3);
      let expectedAtThree: int = 9;
      expect(resultAtThree).assertEqual(expectedAtThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4100
     * @tc.name int8ArraySetPart05Test041
     * @tc.desc Verify set([0, 0, 0]) overwrites all elements to zero via FixedArray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 7, 7);
      const src: FixedArray<number> = [0.0, 0.0, 0.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 0;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4200
     * @tc.name int8ArraySetPart05Test042
     * @tc.desc Verify set([50, 50, 50]) overwrites all elements to 50 via FixedArray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [50.0, 50.0, 50.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 50;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 50;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4300
     * @tc.name int8ArraySetPart05Test043
     * @tc.desc Verify set(src) copies negative source values into target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const src: FixedArray<number> = [1.0, -1.0, 2.0, -2.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = -1;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtThree: number = arr.$_get(3);
      let expectedAtThree: int = -2;
      expect(resultAtThree).assertEqual(expectedAtThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4400
     * @tc.name int8ArraySetPart05Test044
     * @tc.desc Verify set([127.0, -128.0, 0.0]) copies INT8 boundary values to Int8Array target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [127.0, -128.0, 0.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MAX;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: number = INT8_MIN;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 0;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4500
     * @tc.name int8ArraySetPart05Test045
     * @tc.desc Verify set([128.0, 129.0, 130.0]) converts to -128, -127, -126 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [128.0, 129.0, 130.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MIN;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = -127;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = -126;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4600
     * @tc.name int8ArraySetPart05Test046
     * @tc.desc Verify set([-129.0, -130.0, -131.0]) converts to 127, 126, 125 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [-129.0, -130.0, -131.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MAX;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 126;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 125;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4700
     * @tc.name int8ArraySetPart05Test047
     * @tc.desc Verify set([255.0, 256.0, 257.0]) converts to -1, 0, 1 via ToInt8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [255.0, 256.0, 257.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 0;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 1;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4800
     * @tc.name int8ArraySetPart05Test048
     * @tc.desc Verify set([0.5, 1.5, 2.5]) truncates fractional source values to [0, 1, 2] via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [0.5, 1.5, 2.5];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 0;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 1;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 2;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_4900
     * @tc.name int8ArraySetPart05Test049
     * @tc.desc Verify set 127 128 -128 -129
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const src: FixedArray<number> = [127.0, 128.0, -128.0, -129.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MAX;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: number = INT8_MIN;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: number = INT8_MIN;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
      let resultAtThree: number = arr.$_get(3);
      let expectedAtThree: number = INT8_MAX;
      expect(resultAtThree).assertEqual(expectedAtThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5000
     * @tc.name int8ArraySetPart05Test050
     * @tc.desc Verify set(src) overwrites index 0 of Int8Array.of(100, 200, 300) with copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 200, 300);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 2;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 3;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5100
     * @tc.name int8ArraySetPart05Test051
     * @tc.desc Verify set() copies source array to target Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [4.0, 5.0, 6.0];
      arr.set(src);
      let resultAtLast = arr.at(-1);
      let expectedAtLast: int = 6;
      expect(resultAtLast).assertEqual(expectedAtLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5200
     * @tc.name int8ArraySetPart05Test052
     * @tc.desc Verify set([1.0]) on Int8Array.of(8,8,8) overwrites index 0, other indices preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(8, 8, 8);
      const src: FixedArray<number> = [1.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 8;
      expect(resultAtOne).assertEqual(expectedAtOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5300
     * @tc.name int8ArraySetPart05Test053
     * @tc.desc Verify set([128.0, 200.0]) clamps overflow values via ToInt8 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const src: FixedArray<number> = [128.0, 200.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: number = INT8_MIN;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = -56;
      expect(resultAtOne).assertEqual(expectedAtOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5400
     * @tc.name int8ArraySetPart05Test054
     * @tc.desc Verify set(empty_src) preserves length and elements of target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const before: number = arr.length;
      const src: FixedArray<number> = [];
      arr.set(src);
      let resultLength: int = arr.length;
      let expectedLength: number = before;
      expect(resultLength).assertEqual(expectedLength);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 2;
      expect(resultAtOne).assertEqual(expectedAtOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5500
     * @tc.name int8ArraySetPart05Test055
     * @tc.desc Verify set([11.0, 22.0, 33.0]) on new Int8Array(3) copies all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [11.0, 22.0, 33.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 11;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 22;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 33;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5600
     * @tc.name int8ArraySetPart05Test056
     * @tc.desc Verify set() copies FixedArray source with multiple elements to target Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(9, 9, 9, 9);
      const src: FixedArray<number> = [1.0, 2.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = arr.$_get(1);
      let expectedAtOne: int = 2;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = arr.$_get(2);
      let expectedAtTwo: int = 9;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
      let resultAtThree: number = arr.$_get(3);
      let expectedAtThree: int = 9;
      expect(resultAtThree).assertEqual(expectedAtThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5700
     * @tc.name int8ArraySetPart05Test057
     * @tc.desc Verify toString returns '1,2,3' after set(src) on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      let resultString: string = arr.toString();
      let expectedString: string = '1,2,3';
      expect(resultString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5800
     * @tc.name int8ArraySetPart05Test058
     * @tc.desc Verify set(src) fills target positions 0 and 3 with source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtThree: number = arr.$_get(3);
      let expectedAtThree: int = 4;
      expect(resultAtThree).assertEqual(expectedAtThree);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_5900
     * @tc.name int8ArraySetPart05Test059
     * @tc.desc Verify set([1000.0]) wraps 1000 to -24 via ToInt8 modulo 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [1000.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = -24;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_6000
     * @tc.name int8ArraySetPart05Test060
     * @tc.desc Verify set subarray index0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let view: Int8Array = base.subarray(1, 4);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      view.set(src);
      let resultAtZero: number = base.$_get(0);
      let expectedAtZero: int = 1;
      expect(resultAtZero).assertEqual(expectedAtZero);
      let resultAtOne: number = base.$_get(1);
      let expectedAtOne: int = 10;
      expect(resultAtOne).assertEqual(expectedAtOne);
      let resultAtTwo: number = base.$_get(2);
      let expectedAtTwo: int = 20;
      expect(resultAtTwo).assertEqual(expectedAtTwo);
      let resultAtThree: number = base.$_get(3);
      let expectedAtThree: int = 30;
      expect(resultAtThree).assertEqual(expectedAtThree);
      let resultAtFour: number = base.$_get(4);
      let expectedAtFour: int = 5;
      expect(resultAtFour).assertEqual(expectedAtFour);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART05_TEST_6100
     * @tc.name int8ArraySetPart05Test061
     * @tc.desc Verify set([-1000.0]) wraps -1000 to 24 via ToInt8 modulo 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const src: FixedArray<number> = [-1000.0];
      arr.set(src);
      let resultAtZero: number = arr.$_get(0);
      let expectedAtZero: int = 24;
      expect(resultAtZero).assertEqual(expectedAtZero);
    });
  });
}
