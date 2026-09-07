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

export default function int8ArrayIndexSetPart03Test(): void {
  describe('Int8ArrayIndexSetPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0100
     * @tc.name int8ArrayIndexSetPart03Test001
     * @tc.desc Verify $_set(1, 99) then $_get(1) reads value 99 on new Int8Array([3, 4, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 4, 5]);
      arr.$_set(1, 99);
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0200
     * @tc.name int8ArrayIndexSetPart03Test002
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2, 99), on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      try {
        arr.$_set(-2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0300
     * @tc.name int8ArrayIndexSetPart03Test003
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-4, 99), on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0400
     * @tc.name int8ArrayIndexSetPart03Test004
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, 99), on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0500
     * @tc.name int8ArrayIndexSetPart03Test005
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-5, 99), on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      try {
        arr.$_set(-5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0600
     * @tc.name int8ArrayIndexSetPart03Test006
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2, 99), on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      try {
        arr.$_set(-2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0700
     * @tc.name int8ArrayIndexSetPart03Test007
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2147483648, 99), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(-2147483648, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0800
     * @tc.name int8ArrayIndexSetPart03Test008
     * @tc.desc Verify $_set(0, 99) then $_get(0) reads value 99 on new Int8Array([7, 8, 9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      arr.$_set(0, 99);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_0900
     * @tc.name int8ArrayIndexSetPart03Test009
     * @tc.desc Verify $_set(4, 99) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      arr.$_set(4, 99);
      let resultValue: number = arr.$_get(4);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1000
     * @tc.name int8ArrayIndexSetPart03Test010
     * @tc.desc Verify $_set(1, 99) then $_get(1) reads value 99 on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      arr.$_set(1, 99);
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1100
     * @tc.name int8ArrayIndexSetPart03Test011
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-5, 99), on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(-5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1200
     * @tc.name int8ArrayIndexSetPart03Test012
     * @tc.desc Verify $_set(0, 254) then $_get(0) reads truncated value -2 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 254;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1300
     * @tc.name int8ArrayIndexSetPart03Test013
     * @tc.desc Verify $_set(0, -254) then $_get(0) reads truncated value 2 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -254;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1400
     * @tc.name int8ArrayIndexSetPart03Test014
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value 1 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 257;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1500
     * @tc.name int8ArrayIndexSetPart03Test015
     * @tc.desc Verify $_set(0, -257) then $_get(0) reads truncated value -1 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -257;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1600
     * @tc.name int8ArrayIndexSetPart03Test016
     * @tc.desc Verify $_set(0, -256) then $_get(0) reads truncated value 0 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -256;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1700
     * @tc.name int8ArrayIndexSetPart03Test017
     * @tc.desc Verify $_set(0, 2.5) then $_get(0) reads truncated value 2 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 2.5;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1800
     * @tc.name int8ArrayIndexSetPart03Test018
     * @tc.desc Verify $_set(0, -2.5) then $_get(0) reads truncated value -2 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -2.5;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -2;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_1900
     * @tc.name int8ArrayIndexSetPart03Test019
     * @tc.desc Verify $_set(0, 2147483647) then $_get(0) reads truncated value -1 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 2147483647;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2000
     * @tc.name int8ArrayIndexSetPart03Test020
     * @tc.desc Verify $_set(0, -2147483648) then $_get(0) reads truncated value 0 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -2147483648;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2100
     * @tc.name int8ArrayIndexSetPart03Test021
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value 64 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 1000000;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 64;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2200
     * @tc.name int8ArrayIndexSetPart03Test022
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value -64 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -1000000;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -64;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2300
     * @tc.name int8ArrayIndexSetPart03Test023
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value -56 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 200;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -56;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2400
     * @tc.name int8ArrayIndexSetPart03Test024
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value 56 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -200;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 56;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2500
     * @tc.name int8ArrayIndexSetPart03Test025
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value -126 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 130;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -126;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2600
     * @tc.name int8ArrayIndexSetPart03Test026
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value 126 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -130;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 126;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2700
     * @tc.name int8ArrayIndexSetPart03Test027
     * @tc.desc Verify $_set(0, 2.220446049250313e-16) then $_get(0) reads truncated value 0 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 2.220446049250313e-16;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2800
     * @tc.name int8ArrayIndexSetPart03Test028
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value INT8_MAX on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 127.5;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_2900
     * @tc.name int8ArrayIndexSetPart03Test029
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value -128 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -128.5;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = INT8_MIN;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3000
     * @tc.name int8ArrayIndexSetPart03Test030
     * @tc.desc Verify $_set(index, value: byte=32) and $_get returns 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: byte = 32;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 32;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3100
     * @tc.name int8ArrayIndexSetPart03Test031
     * @tc.desc Verify $_set(index, value: byte=100) and $_get returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: byte = 100;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 100;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3200
     * @tc.name int8ArrayIndexSetPart03Test032
     * @tc.desc Verify $_set(index, value: byte=-100) and $_get returns -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: byte = -100;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -100;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3300
     * @tc.name int8ArrayIndexSetPart03Test033
     * @tc.desc Verify $_set(index, value: byte=0) and $_get returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: byte = 0;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 0;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3400
     * @tc.name int8ArrayIndexSetPart03Test034
     * @tc.desc Verify $_set(index, value: byte=-1) and $_get returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: byte = -1;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3500
     * @tc.name int8ArrayIndexSetPart03Test035
     * @tc.desc Verify number $_set(index, value=10.5) truncates to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = 10.5;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 10;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3600
     * @tc.name int8ArrayIndexSetPart03Test036
     * @tc.desc Verify $_set(0, v) then $_get(0) reads truncated value -10 on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      const v: number = -10.5;
      arr.$_set(0, v);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = -10;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3700
     * @tc.name int8ArrayIndexSetPart03Test037
     * @tc.desc Verify $_set(0, ve) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([0]);
      let arr2: Int8Array = new Int8Array([0]);
      const ve: byte = 32;
      const vn: number = 32;
      arr1.$_set(0, ve);
      arr2.$_set(0, vn);
      let resultValue: number = arr1.$_get(0);
      let expectedValue: number = arr2.$_get(0);
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3800
     * @tc.name int8ArrayIndexSetPart03Test038
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(0, 99), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_3900
     * @tc.name int8ArrayIndexSetPart03Test039
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, 99), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4000
     * @tc.name int8ArrayIndexSetPart03Test040
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(2147483647, 99), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4100
     * @tc.name int8ArrayIndexSetPart03Test041
     * @tc.desc Verify $_set(0, 99) then $_get(0) reads value 99 on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      arr.$_set(0, 99);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4200
     * @tc.name int8ArrayIndexSetPart03Test042
     * @tc.desc Verify $_set(1, 10) then $_get(1) reads truncated value 10 on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      arr.$_set(1, 10);
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 10;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4300
     * @tc.name int8ArrayIndexSetPart03Test043
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2, 10), on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      try {
        arr.$_set(-2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4400
     * @tc.name int8ArrayIndexSetPart03Test044
     * @tc.desc Verify $_set(0, -128) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      arr.$_set(0, INT8_MIN);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = INT8_MIN;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4500
     * @tc.name int8ArrayIndexSetPart03Test045
     * @tc.desc Verify $_set(1, 1) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -1, -1]);
      arr.$_set(1, 1);
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 1;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4600
     * @tc.name int8ArrayIndexSetPart03Test046
     * @tc.desc Verify $_set(2, 100) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(2, 100);
      let resultValue: number = arr.$_get(2);
      let expectedValue: int = 100;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4700
     * @tc.name int8ArrayIndexSetPart03Test047
     * @tc.desc Verify $_set(1, 10) does not affect $_get(0), still 5 on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      arr.$_set(1, 10);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 5;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4800
     * @tc.name int8ArrayIndexSetPart03Test048
     * @tc.desc Verify $_set returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result = arr.$_set(0, 99);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_4900
     * @tc.name int8ArrayIndexSetPart03Test049
     * @tc.desc Verify forEach sum equals 139 after $_set(1, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_set(1, 99);
      let sum: number = 0;
      arr.forEach((v: number, _i: int): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(139);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5000
     * @tc.name int8ArrayIndexSetPart03Test050
     * @tc.desc Verify forEach callback index 1 for value 99 after $_set(1, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.$_set(1, 99);
      let idx: number = -1;
      arr.forEach((v: number, i: int): void => {
        if (v === 99) {
          idx = i;
        }
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5100
     * @tc.name int8ArrayIndexSetPart03Test051
     * @tc.desc Verify toString after $_set(0, 99) returns "99,22,33" on new Int8Array([11, 22, 33])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33]);
      arr.$_set(0, 99);
      let resultValue: string = arr.toString();
      let expectedValue: string = '99,22,33';
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5200
     * @tc.name int8ArrayIndexSetPart03Test052
     * @tc.desc Verify multiple $_set calls assign correct values to elements at indices 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      let resultValue: string = arr.toString();
      let expectedValue: string = '10,20,30';
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5300
     * @tc.name int8ArrayIndexSetPart03Test053
     * @tc.desc Verify $_set(1, 88) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 4, 5]);
      arr.$_set(1, 88);
      let resultValue: number = arr.$_get(1);
      let expectedValue: int = 88;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5400
     * @tc.name int8ArrayIndexSetPart03Test054
     * @tc.desc Verify repeated $_set(0, ...) overwrites previous value, final $_get(0) expects 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      arr.$_set(0, 100);
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 100;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5500
     * @tc.name int8ArrayIndexSetPart03Test055
     * @tc.desc Verify at expects 99, with $_set(0, 99), on new Int8Array([6, 7, 8])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([6, 7, 8]);
      arr.$_set(0, 99);
      let resultValue = arr.at(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5600
     * @tc.name int8ArrayIndexSetPart03Test056
     * @tc.desc Verify at expects 99, with $_set(2, 99), on new Int8Array([6, 7, 8])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([6, 7, 8]);
      arr.$_set(2, 99);
      let resultValue = arr.at(-1);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5700
     * @tc.name int8ArrayIndexSetPart03Test057
     * @tc.desc Verify $_get(0) on subarray(1, 3) returns 99 after $_set(1, 99) on base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33, 44]);
      let view: Int8Array = arr.subarray(1, 3);
      arr.$_set(1, 99);
      let resultValue: number = view.$_get(0);
      let expectedValue: int = 99;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5800
     * @tc.name int8ArrayIndexSetPart03Test058
     * @tc.desc Verify slice(0, 2) creates independent copy and $_set on copy does not affect original expects 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33]);
      let copy: Int8Array = arr.slice(0, 2);
      arr.$_set(0, 99);
      let resultValue: number = copy.$_get(0);
      let expectedValue: int = 11;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_5900
     * @tc.name int8ArrayIndexSetPart03Test059
     * @tc.desc Verify join('|') returns 11|99|33 after $_set(1, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33]);
      arr.$_set(1, 99);
      let resultValue: string = arr.join('|');
      let expectedValue: string = '11|99|33';
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_6000
     * @tc.name int8ArrayIndexSetPart03Test060
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(5, 99), on new Int8Array([10, 20, 30, 40])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      try {
        arr.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(3);
      let expectedValue: int = 40;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_6100
     * @tc.name int8ArrayIndexSetPart03Test061
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(5, 99), on new Int8Array([10, 20, 30, 40, 50])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      try {
        arr.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(4);
      let expectedValue: int = 50;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_6200
     * @tc.name int8ArrayIndexSetPart03Test062
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(2, 99), on new Int8Array([7]), then $_get(0) still expects 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      try {
        arr.$_set(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 7;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_6300
     * @tc.name int8ArrayIndexSetPart03Test063
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(1, 99), on new Int8Array([7]), then $_get(0) still expects 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      try {
        arr.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(0);
      let expectedValue: int = 7;
      expect(resultValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART03_TEST_6400
     * @tc.name int8ArrayIndexSetPart03Test064
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(3, 99), on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let resultValue: number = arr.$_get(2);
      let expectedValue: int = 5;
      expect(resultValue).assertEqual(expectedValue);
    });
  });
}
