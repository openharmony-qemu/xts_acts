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

export default function int8ArraySetPart03Test(): void {
  describe('Int8ArraySetPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0100
     * @tc.name int8ArraySetPart03Test001
     * @tc.desc Verify set single arg writes source from index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-1, 0, 1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0200
     * @tc.name int8ArraySetPart03Test002
     * @tc.desc Verify set empty source keeps initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0300
     * @tc.name int8ArraySetPart03Test003
     * @tc.desc Verify set source full capacity write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, 0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0400
     * @tc.name int8ArraySetPart03Test004
     * @tc.desc Verify set empty source to empty target no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(0);
      const source: FixedArray<byte> = [];
      target.set(source);
      let actualLength: int = target.length;
      let expected1: int = 0;
      expect(actualLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0500
     * @tc.name int8ArraySetPart03Test005
     * @tc.desc Verify set empty source keeps target values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, INT8_MIN, 0]);
      const source: FixedArray<byte> = [];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0600
     * @tc.name int8ArraySetPart03Test006
     * @tc.desc Verify set single-element source to single-element target, element is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(1);
      const source: FixedArray<byte> = [99];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 99;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0700
     * @tc.name int8ArraySetPart03Test007
     * @tc.desc Verify set single element source writes first only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, INT8_MIN, 0]);
      const source: FixedArray<byte> = [1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0800
     * @tc.name int8ArraySetPart03Test008
     * @tc.desc Verify set three element source copies all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-1, 0, 1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 1;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_0900
     * @tc.name int8ArraySetPart03Test009
     * @tc.desc Verify set exact capacity boundary no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target.set(source);
      let actualLength: int = target.length;
      let expected1: int = 2;
      expect(actualLength).assertEqual(expected1);
      let firstValue: number = target.$_get(0);
      let expected2: number = INT8_MAX;
      expect(firstValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1000
     * @tc.name int8ArraySetPart03Test010
     * @tc.desc Verify set byte min value written intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(1);
      const source: FixedArray<byte> = [-128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1100
     * @tc.name int8ArraySetPart03Test011
     * @tc.desc Verify set byte max value written intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(1);
      const source: FixedArray<byte> = [127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1200
     * @tc.name int8ArraySetPart03Test012
     * @tc.desc Verify set source contains zero value 0, written correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(1);
      const source: FixedArray<byte> = [0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1300
     * @tc.name int8ArraySetPart03Test013
     * @tc.desc Verify set source contains -1, written correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(1);
      const source: FixedArray<byte> = [-1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1400
     * @tc.name int8ArraySetPart03Test014
     * @tc.desc Verify set source contains 1, written correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(1);
      const source: FixedArray<byte> = [1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1500
     * @tc.name int8ArraySetPart03Test015
     * @tc.desc Verify set dual boundary values written intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [-128, 127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1600
     * @tc.name int8ArraySetPart03Test016
     * @tc.desc Verify set reversed boundary order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1700
     * @tc.name int8ArraySetPart03Test017
     * @tc.desc Verify set source [-128, 0, 127] ascending boundary, order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-128, 0, 127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: number = INT8_MAX;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1800
     * @tc.name int8ArraySetPart03Test018
     * @tc.desc Verify set source [127, 0, -128] descending boundary, order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [127, 0, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: number = INT8_MIN;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_1900
     * @tc.name int8ArraySetPart03Test019
     * @tc.desc Verify set all min values written intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-128, -128, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: number = INT8_MIN;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2000
     * @tc.name int8ArraySetPart03Test020
     * @tc.desc Verify set all max values written intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [127, 127, 127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: number = INT8_MAX;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2100
     * @tc.name int8ArraySetPart03Test021
     * @tc.desc Verify set all zero values written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [0, 0, 0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2200
     * @tc.name int8ArraySetPart03Test022
     * @tc.desc Verify set full overwrite prefilled target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([-1, -1]);
      const source: FixedArray<byte> = [1, 1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2300
     * @tc.name int8ArraySetPart03Test023
     * @tc.desc Verify set shorter source overwrites prefix only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, INT8_MIN, 0]);
      const source: FixedArray<byte> = [-1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2400
     * @tc.name int8ArraySetPart03Test024
     * @tc.desc Verify set negative ones overwrite max target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, 0]);
      const source: FixedArray<byte> = [-1, -1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2500
     * @tc.name int8ArraySetPart03Test025
     * @tc.desc Verify set boundary pair overwrites zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([0, 0]);
      const source: FixedArray<byte> = [127, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2600
     * @tc.name int8ArraySetPart03Test026
     * @tc.desc Verify set single element changes first only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([-1, -1, -1]);
      const source: FixedArray<byte> = [127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2700
     * @tc.name int8ArraySetPart03Test027
     * @tc.desc Verify set() on ArrayBuffer view writes from view index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Int8Array(buf, 2, 2);
      const source: FixedArray<byte> = [127, -128];
      view.set(source);
      const full = new Int8Array(buf);
      let firstValue: number = full.$_get(2);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = full.$_get(3);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2800
     * @tc.name int8ArraySetPart03Test028
     * @tc.desc Verify set() does not affect buffer regions outside the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstValue = new Int8Array(buf, 0, 2);
      const secondValue = new Int8Array(buf, 2, 2);
      firstValue.$_set(0, INT8_MAX);
      firstValue.$_set(1, INT8_MIN);
      const source: FixedArray<byte> = [0, 0];
      secondValue.set(source);
      let firstViewValue: number = firstValue.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstViewValue).assertEqual(expected1);
      let secondViewValue: number = firstValue.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondViewValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_2900
     * @tc.name int8ArraySetPart03Test029
     * @tc.desc Verify after set() target[0] equals source first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3000
     * @tc.name int8ArraySetPart03Test030
     * @tc.desc Verify after set() target last element equals source last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target.set(source);
      let firstValue: number = target.$_get(1);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3100
     * @tc.name int8ArraySetPart03Test031
     * @tc.desc Verify set excess target part keeps original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([-1, INT8_MAX, INT8_MIN]);
      const source: FixedArray<byte> = [0, 0];
      target.set(source);
      let firstValue: number = target.$_get(2);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3200
     * @tc.name int8ArraySetPart03Test032
     * @tc.desc Verify source array length unchanged after set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target.set(source);
      let actualLength: int = source.length;
      let expected1: int = 2;
      expect(actualLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3300
     * @tc.name int8ArraySetPart03Test033
     * @tc.desc Verify set() copies elements in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [-128, -1, 0, 127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
      let fourthValue: number = target.$_get(3);
      let expected4: number = INT8_MAX;
      expect(fourthValue).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3400
     * @tc.name int8ArraySetPart03Test034
     * @tc.desc Verify set empty source to non-empty target, no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, INT8_MIN]);
      const source: FixedArray<byte> = [];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3500
     * @tc.name int8ArraySetPart03Test035
     * @tc.desc Verify set pair min values not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [-128, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3600
     * @tc.name int8ArraySetPart03Test036
     * @tc.desc Verify set pair max values not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, 127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3700
     * @tc.name int8ArraySetPart03Test037
     * @tc.desc Verify set source exactly fills capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-128, 0, 127];
      target.set(source);
      let actualLength: int = target.length;
      let expected1: int = 3;
      expect(actualLength).assertEqual(expected1);
      let firstValue: number = target.$_get(0);
      let expected2: number = INT8_MIN;
      expect(firstValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3800
     * @tc.name int8ArraySetPart03Test038
     * @tc.desc Verify set mixed boundary triple no truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-128, 127, 0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_3900
     * @tc.name int8ArraySetPart03Test039
     * @tc.desc Verify set zero negative pair fills target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [0, -1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4000
     * @tc.name int8ArraySetPart03Test040
     * @tc.desc Verify set alternating signs fill exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [1, -1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4100
     * @tc.name int8ArraySetPart03Test041
     * @tc.desc Verify set four element fills boundaries intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [-128, 127, 0, -1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
      let fourthValue: number = target.$_get(3);
      let expected4: int = -1;
      expect(fourthValue).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4200
     * @tc.name int8ArraySetPart03Test042
     * @tc.desc Verify set reversed four element fills intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [127, -128, -1, 0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = -1;
      expect(thirdValue).assertEqual(expected3);
      let fourthValue: number = target.$_get(3);
      let expected4: int = 0;
      expect(fourthValue).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4300
     * @tc.name int8ArraySetPart03Test043
     * @tc.desc Verify set source [-1] overwrites target [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([0]);
      const source: FixedArray<byte> = [-1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4400
     * @tc.name int8ArraySetPart03Test044
     * @tc.desc Verify set source [0] overwrites target [-128], zero overwrites min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MIN]);
      const source: FixedArray<byte> = [0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4500
     * @tc.name int8ArraySetPart03Test045
     * @tc.desc Verify set max overwrites negative single
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([-1]);
      const source: FixedArray<byte> = [127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4600
     * @tc.name int8ArraySetPart03Test046
     * @tc.desc Verify set source [-128] overwrites target [127], min value overwrites max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX]);
      const source: FixedArray<byte> = [-128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4700
     * @tc.name int8ArraySetPart03Test047
     * @tc.desc Verify two consecutive set calls, second fully overwrites first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const src1: FixedArray<byte> = [127, -128];
      const src2: FixedArray<byte> = [0, 0];
      target.set(src1);
      target.set(src2);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4800
     * @tc.name int8ArraySetPart03Test048
     * @tc.desc Verify two consecutive set calls, second shorter only overwrites front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const src1: FixedArray<byte> = [127, -128, 0];
      const src2: FixedArray<byte> = [-1];
      target.set(src1);
      target.set(src2);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 0;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_4900
     * @tc.name int8ArraySetPart03Test049
     * @tc.desc Verify set three alternating to equal target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, -1, 1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = 1;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5000
     * @tc.name int8ArraySetPart03Test050
     * @tc.desc Verify set four alternating to equal target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [-1, 1, -1, 1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 1;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: int = -1;
      expect(thirdValue).assertEqual(expected3);
      let fourthValue: number = target.$_get(3);
      let expected4: int = 1;
      expect(fourthValue).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5100
     * @tc.name int8ArraySetPart03Test051
     * @tc.desc Verify set negative ones overwrite max pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, INT8_MAX]);
      const source: FixedArray<byte> = [-1, -1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = -1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5200
     * @tc.name int8ArraySetPart03Test052
     * @tc.desc Verify set ones overwrite min pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MIN, INT8_MIN]);
      const source: FixedArray<byte> = [1, 1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5300
     * @tc.name int8ArraySetPart03Test053
     * @tc.desc Verify set large capacity target (4) receives small source (1), only first element written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [127];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(3);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5400
     * @tc.name int8ArraySetPart03Test054
     * @tc.desc Verify set zero overwrites first of maxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX]);
      const source: FixedArray<byte> = [0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(3);
      let expected3: number = INT8_MAX;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5500
     * @tc.name int8ArraySetPart03Test055
     * @tc.desc Verify set zero pair overwrites min prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      const source: FixedArray<byte> = [0, 0];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 0;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = 0;
      expect(secondValue).assertEqual(expected2);
      let thirdValue: number = target.$_get(2);
      let expected3: number = INT8_MIN;
      expect(thirdValue).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5600
     * @tc.name int8ArraySetPart03Test056
     * @tc.desc Verify byteOffset unchanged after set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Int8Array(buf, 2, 2);
      const source: FixedArray<byte> = [1, -1];
      view.set(source);
      let actualByteOffset: int = view.byteOffset;
      let expected1: int = 2;
      expect(actualByteOffset).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5700
     * @tc.name int8ArraySetPart03Test057
     * @tc.desc Verify byteLength unchanged after set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, -1, 0];
      target.set(source);
      let actualByteLength: int = target.byteLength;
      let expected1: int = 3;
      expect(actualByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5800
     * @tc.name int8ArraySetPart03Test058
     * @tc.desc Verify same source array can be reused for set to different targets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target1 = new Int8Array(2);
      const target2 = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target1.set(source);
      target2.set(source);
      let firstValue: number = target1.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target2.$_get(0);
      let expected2: number = INT8_MAX;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_5900
     * @tc.name int8ArraySetPart03Test059
     * @tc.desc Verify set() works on array created via constructor with initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array([0, 0]);
      const source: FixedArray<byte> = [1, -1];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(1);
      let expected2: int = -1;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_6000
     * @tc.name int8ArraySetPart03Test060
     * @tc.desc Verify set five element source fills capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(5);
      const source: FixedArray<byte> = [1, 0, -1, 127, -128];
      target.set(source);
      let firstValue: number = target.$_get(0);
      let expected1: int = 1;
      expect(firstValue).assertEqual(expected1);
      let secondValue: number = target.$_get(4);
      let expected2: number = INT8_MIN;
      expect(secondValue).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART03_TEST_6100
     * @tc.name int8ArraySetPart03Test061
     * @tc.desc Verify set five-element source exceeds capacity (3), throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, 0, -1, 127, -128];
      try {
        target.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
