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

export default function int8ArrayIndexSetPart05Test(): void {
  describe('Int8ArrayIndexSetPart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0100
     * @tc.name int8ArrayIndexSetPart05Test001
     * @tc.desc Verify $_set then $_get expects 42, with $_get(1), on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 42;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0200
     * @tc.name int8ArrayIndexSetPart05Test002
     * @tc.desc Verify $_set(1, 42) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.$_set(1, 42);
      expect(arr.$_get(1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0300
     * @tc.name int8ArrayIndexSetPart05Test003
     * @tc.desc Verify $_set then $_get expects 11, on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = 11;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0400
     * @tc.name int8ArrayIndexSetPart05Test004
     * @tc.desc Verify $_set then $_get expects 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = 22;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0500
     * @tc.name int8ArrayIndexSetPart05Test005
     * @tc.desc Verify $_set(2, v) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = 33;
      arr.$_set(2, v);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0600
     * @tc.name int8ArrayIndexSetPart05Test006
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, v), on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = 44;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0700
     * @tc.name int8ArrayIndexSetPart05Test007
     * @tc.desc Verify $_set(-2, 66) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      try {
        arr.$_set(-2, 66);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0800
     * @tc.name int8ArrayIndexSetPart05Test008
     * @tc.desc Verify $_set(-3, 77) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = 77;
      try {
        arr.$_set(-3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_0900
     * @tc.name int8ArrayIndexSetPart05Test009
     * @tc.desc Verify $_set(-4, 50) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([3, 6, 9]);
      try {
        arr.$_set(-4, 50);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1000
     * @tc.name int8ArrayIndexSetPart05Test010
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2147483648, 99), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(-2147483648, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1100
     * @tc.name int8ArrayIndexSetPart05Test011
     * @tc.desc Verify $_set(0, 42) on new Int8Array(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      try {
        arr.$_set(0, 42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1200
     * @tc.name int8ArrayIndexSetPart05Test012
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, v), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(0);
      const v: byte = 42;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1300
     * @tc.name int8ArrayIndexSetPart05Test013
     * @tc.desc Verify $_set then $_get expects 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0]);
      const v: byte = 88;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1400
     * @tc.name int8ArrayIndexSetPart05Test014
     * @tc.desc Verify $_set(-1, 88) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0]);
      try {
        arr.$_set(-1, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1500
     * @tc.name int8ArrayIndexSetPart05Test015
     * @tc.desc Verify $_set then $_get expects -128, after $_set(0, INT8_MIN), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: byte = INT8_MIN;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1600
     * @tc.name int8ArrayIndexSetPart05Test016
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, INT8_MAX), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: byte = INT8_MAX;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1700
     * @tc.name int8ArrayIndexSetPart05Test017
     * @tc.desc Verify $_set then $_get expects 0, on new Int8Array([9, 9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([9, 9]);
      const v: byte = 0;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1800
     * @tc.name int8ArrayIndexSetPart05Test018
     * @tc.desc Verify $_set then $_get expects -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([9, 9]);
      const v: byte = -1;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_1900
     * @tc.name int8ArrayIndexSetPart05Test019
     * @tc.desc Verify $_set then $_get expects 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([9, 9]);
      const v: byte = 1;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2000
     * @tc.name int8ArrayIndexSetPart05Test020
     * @tc.desc Verify $_set(0, INT8_MAX) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2100
     * @tc.name int8ArrayIndexSetPart05Test021
     * @tc.desc Verify $_set(0, -128) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2200
     * @tc.name int8ArrayIndexSetPart05Test022
     * @tc.desc Verify $_set(1, 50) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(1, 50);
      expect(arr.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2300
     * @tc.name int8ArrayIndexSetPart05Test023
     * @tc.desc Verify $_set(0, 128) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2400
     * @tc.name int8ArrayIndexSetPart05Test024
     * @tc.desc Verify $_set(0, -129) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -129);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2500
     * @tc.name int8ArrayIndexSetPart05Test025
     * @tc.desc Verify $_set(0, 255) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 255);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2600
     * @tc.name int8ArrayIndexSetPart05Test026
     * @tc.desc Verify $_set(0, 256) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2700
     * @tc.name int8ArrayIndexSetPart05Test027
     * @tc.desc Verify $_set(0, 129) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 129);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2800
     * @tc.name int8ArrayIndexSetPart05Test028
     * @tc.desc Verify $_set then $_get expects -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 200);
      expect(arr.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_2900
     * @tc.name int8ArrayIndexSetPart05Test029
     * @tc.desc Verify $_set(0, 257) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 257);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3000
     * @tc.name int8ArrayIndexSetPart05Test030
     * @tc.desc Verify $_set(0, Number.NaN) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3100
     * @tc.name int8ArrayIndexSetPart05Test031
     * @tc.desc Verify $_set(0, 1.9) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 1.9);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3200
     * @tc.name int8ArrayIndexSetPart05Test032
     * @tc.desc Verify $_set(0, -1.9) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -1.9);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3300
     * @tc.name int8ArrayIndexSetPart05Test033
     * @tc.desc Verify $_set(0, -0.0) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -0.0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3400
     * @tc.name int8ArrayIndexSetPart05Test034
     * @tc.desc Verify $_set(0, 0.5) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 0.5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3500
     * @tc.name int8ArrayIndexSetPart05Test035
     * @tc.desc Verify $_set(0, -0.5) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -0.5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3600
     * @tc.name int8ArrayIndexSetPart05Test036
     * @tc.desc Verify $_set(0, 127.5) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 127.5);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3700
     * @tc.name int8ArrayIndexSetPart05Test037
     * @tc.desc Verify $_set(0, -128.5) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -128.5);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3800
     * @tc.name int8ArrayIndexSetPart05Test038
     * @tc.desc Verify $_set(0, 50) writes 50 on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int8Array(2);
      const b = new Int8Array(2);
      a.$_set(0, 50);
      b.$_set(0, 50);
      let r1: number = a.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_3900
     * @tc.name int8ArrayIndexSetPart05Test039
     * @tc.desc Verify $_set(0, -100) writes -100 on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int8Array(2);
      const b = new Int8Array(2);
      a.$_set(0, -100);
      b.$_set(0, -100);
      let r1: number = a.$_get(0);
      let e1: int = -100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4000
     * @tc.name int8ArrayIndexSetPart05Test040
     * @tc.desc Verify $_set then $_get expects 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: byte = 30;
      arr.$_set(0, v);
      arr.$_set(1, 70);
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(1)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4100
     * @tc.name int8ArrayIndexSetPart05Test041
     * @tc.desc Verify $_set then $_get expects 0, on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = 73;
      arr.$_set(1, v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(73);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4200
     * @tc.name int8ArrayIndexSetPart05Test042
     * @tc.desc Verify $_set(1, 200) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      arr.$_set(1, 200);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(-56);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4300
     * @tc.name int8ArrayIndexSetPart05Test043
     * @tc.desc Verify $_set(0, 42) writes 42 and length remains 3 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.$_set(0, 42);
      let r1: number = arr.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4400
     * @tc.name int8ArrayIndexSetPart05Test044
     * @tc.desc Verify $_set(0, 200) truncates to -56 and length remains 3 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      arr.$_set(0, 200);
      let r1: number = arr.$_get(0);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4500
     * @tc.name int8ArrayIndexSetPart05Test045
     * @tc.desc Verify $_set then $_get expects 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const v: byte = 10;
      arr.$_set(0, v);
      arr.$_set(0, 20);
      expect(arr.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4600
     * @tc.name int8ArrayIndexSetPart05Test046
     * @tc.desc Verify $_set(0, 20) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 20);
      const v: byte = 10;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4700
     * @tc.name int8ArrayIndexSetPart05Test047
     * @tc.desc Verify $_set then $_get expects 11, on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      const v: byte = 11;
      arr.$_set(0, v);
      arr.$_set(2, 33);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4800
     * @tc.name int8ArrayIndexSetPart05Test048
     * @tc.desc Verify $_set(0, 41) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 41);
      expect(arr.$_get(0)).assertEqual(41);
      arr.$_set(0, 52);
      expect(arr.$_get(0)).assertEqual(52);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_4900
     * @tc.name int8ArrayIndexSetPart05Test049
     * @tc.desc Verify $_set(0, 99) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([15, 25]);
      arr.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5000
     * @tc.name int8ArrayIndexSetPart05Test050
     * @tc.desc Verify $_set(0, 0) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([80, 90]);
      arr.$_set(0, 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5100
     * @tc.name int8ArrayIndexSetPart05Test051
     * @tc.desc Verify $_set then $_get expects 42, with $_get(0), on new Int8Array([42, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([42, 0]);
      const v: byte = 42;
      arr.$_set(0, v);
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5200
     * @tc.name int8ArrayIndexSetPart05Test052
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, -128), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const min: byte = -128;
      const max: byte = INT8_MAX;
      arr.$_set(0, min);
      arr.$_set(0, max);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5300
     * @tc.name int8ArrayIndexSetPart05Test053
     * @tc.desc Verify $_set then $_get expects -128, after $_set(0, -128), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      const min: byte = -128;
      const max: byte = INT8_MAX;
      arr.$_set(0, min);
      arr.$_set(1, max);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5400
     * @tc.name int8ArrayIndexSetPart05Test054
     * @tc.desc Verify $_set(-2, 99) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([7]);
      try {
        arr.$_set(-2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5500
     * @tc.name int8ArrayIndexSetPart05Test055
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2147483648, 99), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      try {
        arr.$_set(-2147483648, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5600
     * @tc.name int8ArrayIndexSetPart05Test056
     * @tc.desc Verify $_set(-10, Number.NaN) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([5, 10]);
      try {
        arr.$_set(-10, Number.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5700
     * @tc.name int8ArrayIndexSetPart05Test057
     * @tc.desc Verify $_set(-1, -128) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([0, 0, 0]);
      const v: byte = -128;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5800
     * @tc.name int8ArrayIndexSetPart05Test058
     * @tc.desc Verify $_set(1, Number.NaN) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([9, 9, 9]);
      arr.$_set(1, Number.NaN);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_5900
     * @tc.name int8ArrayIndexSetPart05Test059
     * @tc.desc Verify $_set(2, 200) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([9, 9, 9]);
      arr.$_set(2, 200);
      expect(arr.$_get(2)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6000
     * @tc.name int8ArrayIndexSetPart05Test060
     * @tc.desc Verify $_set(3, 100) on new Int8Array([7,8,9]) throws RangeError and elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([7, 8, 9]);
      try {
        arr.$_set(3, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6100
     * @tc.name int8ArrayIndexSetPart05Test061
     * @tc.desc Verify $_set expects RangeError throws exception, on new Int8Array([7, 8, 9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([7, 8, 9]);
      const v: byte = 55;
      try {
        arr.$_set(4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6200
     * @tc.name int8ArrayIndexSetPart05Test062
     * @tc.desc Verify $_set(2147483647, v) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      try {
        arr.$_set(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6300
     * @tc.name int8ArrayIndexSetPart05Test063
     * @tc.desc Verify $_set expects RangeError throws exception, on new Int8Array([5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([5]);
      const v: byte = 88;
      try {
        arr.$_set(1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6400
     * @tc.name int8ArrayIndexSetPart05Test064
     * @tc.desc Verify $_set(10, 200) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(10, 200);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6500
     * @tc.name int8ArrayIndexSetPart05Test065
     * @tc.desc Verify $_set expects RangeError throws exception, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(4);
      const v: byte = 55;
      try {
        arr.$_set(4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6600
     * @tc.name int8ArrayIndexSetPart05Test066
     * @tc.desc Verify $_set(100, 42) throws RangeError for out-of-bounds index and byteLength remains 3 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(3);
      try {
        arr.$_set(100, 42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: int = arr.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6700
     * @tc.name int8ArrayIndexSetPart05Test067
     * @tc.desc Verify $_set(0, Number.POSITIVE_INFINITY) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6800
     * @tc.name int8ArrayIndexSetPart05Test068
     * @tc.desc Verify $_set(0, -Number.POSITIVE_INFINITY) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, -Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART05_TEST_6900
     * @tc.name int8ArrayIndexSetPart05Test069
     * @tc.desc Verify $_set(0, 3.4028235e38) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array(2);
      arr.$_set(0, 3.4028235e38);
      expect(arr.$_get(0)).assertEqual(0);
    });
  });
}
