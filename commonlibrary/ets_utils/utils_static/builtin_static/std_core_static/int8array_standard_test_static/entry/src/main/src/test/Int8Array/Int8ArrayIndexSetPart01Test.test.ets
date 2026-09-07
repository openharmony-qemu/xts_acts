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

export default function int8ArrayIndexSetPart01Test(): void {
  describe('Int8ArrayIndexSetPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0100
     * @tc.name int8ArrayIndexSetPart01Test001
     * @tc.desc Verify $_set then $_get expects 10 with byte value, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 10;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0200
     * @tc.name int8ArrayIndexSetPart01Test002
     * @tc.desc Verify $_set then $_get expects 10 with number value, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 10;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0300
     * @tc.name int8ArrayIndexSetPart01Test003
     * @tc.desc Verify $_set then $_get expects 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0400
     * @tc.name int8ArrayIndexSetPart01Test004
     * @tc.desc Verify $_set(1, v) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      arr.$_set(1, v);
      expect(arr.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0500
     * @tc.name int8ArrayIndexSetPart01Test005
     * @tc.desc Verify $_set(3, v) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      arr.$_set(3, v);
      expect(arr.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0600
     * @tc.name int8ArrayIndexSetPart01Test006
     * @tc.desc Verify $_set(2, 50) on new Int8Array([-128, -1, 1, INT8_MAX]) sets element 2 to 50, preserves others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const v: byte = 50;
      arr.$_set(2, v);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(50);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0700
     * @tc.name int8ArrayIndexSetPart01Test007
     * @tc.desc Verify $_set(-1, 50) throws RangeError, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      try {
        arr.$_set(-1, 50);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0800
     * @tc.name int8ArrayIndexSetPart01Test008
     * @tc.desc Verify $_set(-4, v) throws RangeError, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      try {
        arr.$_set(-4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_0900
     * @tc.name int8ArrayIndexSetPart01Test009
     * @tc.desc Verify $_set(-2, v) throws RangeError, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      try {
        arr.$_set(-2, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1000
     * @tc.name int8ArrayIndexSetPart01Test010
     * @tc.desc Verify $_set then $_get expects 60, with $_get(0), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1100
     * @tc.name int8ArrayIndexSetPart01Test011
     * @tc.desc Verify $_set then $_get expects 60, with $_get(1), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      arr.$_set(1, n);
      expect(arr.$_get(1)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1200
     * @tc.name int8ArrayIndexSetPart01Test012
     * @tc.desc Verify $_set then $_get expects 60, with $_get(3), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      arr.$_set(3, n);
      expect(arr.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1300
     * @tc.name int8ArrayIndexSetPart01Test013
     * @tc.desc Verify $_set(2, 60) on new Int8Array([-128, -1, 1, INT8_MAX]) sets element 2 to 60, preserves others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const n: number = 60;
      arr.$_set(2, n);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(60);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1400
     * @tc.name int8ArrayIndexSetPart01Test014
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, 60), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      try {
        arr.$_set(-1, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1500
     * @tc.name int8ArrayIndexSetPart01Test015
     * @tc.desc Verify $_set(-4, n) throws RangeError, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      try {
        arr.$_set(-4, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1600
     * @tc.name int8ArrayIndexSetPart01Test016
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2, 60), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      try {
        arr.$_set(-2, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1700
     * @tc.name int8ArrayIndexSetPart01Test017
     * @tc.desc Verify $_set then $_get expects -128 with byte value, after $_set(0, -128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = -128;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1800
     * @tc.name int8ArrayIndexSetPart01Test018
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), on new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX, INT8_MAX]);
      const v: byte = 0;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_1900
     * @tc.name int8ArrayIndexSetPart01Test019
     * @tc.desc Verify $_set then $_get expects INT8_MAX with byte value, after $_set(0, INT8_MAX), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = INT8_MAX;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2000
     * @tc.name int8ArrayIndexSetPart01Test020
     * @tc.desc Verify $_set then $_get expects -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = -1;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2100
     * @tc.name int8ArrayIndexSetPart01Test021
     * @tc.desc Verify $_set then $_get expects 1, after $_set(0, 1), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 1;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2200
     * @tc.name int8ArrayIndexSetPart01Test022
     * @tc.desc Verify $_set then $_get expects -128 with number value, after $_set(0, -128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = -128;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2300
     * @tc.name int8ArrayIndexSetPart01Test023
     * @tc.desc Verify $_set then $_get expects -128, with $_get(0), after $_set(0, 128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 128;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2400
     * @tc.name int8ArrayIndexSetPart01Test024
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 256;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2500
     * @tc.name int8ArrayIndexSetPart01Test025
     * @tc.desc Verify $_set then $_get expects 1 after $_set(0, 1.9), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 1.9;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2600
     * @tc.name int8ArrayIndexSetPart01Test026
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, 128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 128;
      try {
        arr.$_set(-1, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2700
     * @tc.name int8ArrayIndexSetPart01Test027
     * @tc.desc Verify $_set then $_get expects 0, with $_get(3), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 256;
      arr.$_set(3, n);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2800
     * @tc.name int8ArrayIndexSetPart01Test028
     * @tc.desc Verify $_set then $_get expects -128, with $_get(1), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 128;
      arr.$_set(1, n);
      expect(arr.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_2900
     * @tc.name int8ArrayIndexSetPart01Test029
     * @tc.desc Verify $_set(0, 128) equals $_set(0, byte -128) both truncate to same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array(4);
      const n: number = 128;
      arr1.$_set(0, n);
      let arr2: Int8Array = new Int8Array(4);
      const v: byte = -128;
      arr2.$_set(0, v);
      expect(arr1.$_get(0)).assertEqual(arr2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3000
     * @tc.name int8ArrayIndexSetPart01Test030
     * @tc.desc Verify $_set(0, 256) truncates to same value as $_set(0, byte 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array(4);
      const n: number = 256;
      arr1.$_set(0, n);
      let arr2: Int8Array = new Int8Array(4);
      const v: byte = 0;
      arr2.$_set(0, v);
      expect(arr1.$_get(0)).assertEqual(arr2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3100
     * @tc.name int8ArrayIndexSetPart01Test031
     * @tc.desc Verify $_set(0, 1.9) truncates to same value as $_set(0, byte 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array(4);
      const n: number = 1.9;
      arr1.$_set(0, n);
      let arr2: Int8Array = new Int8Array(4);
      const v: byte = 1;
      arr2.$_set(0, v);
      expect(arr1.$_get(0)).assertEqual(arr2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3200
     * @tc.name int8ArrayIndexSetPart01Test032
     * @tc.desc Verify at(0) returns -128 after $_set(0, 128) wraps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 128;
      arr.$_set(0, n);
      expect(arr.at(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3300
     * @tc.name int8ArrayIndexSetPart01Test033
     * @tc.desc Verify at(0) returns 1 after $_set(0, 1.9) truncates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 1.9;
      arr.$_set(0, n);
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3400
     * @tc.name int8ArrayIndexSetPart01Test034
     * @tc.desc Verify $_set then $_get expects 1 and 2 after $_set(0, 1.9) and $_set(0, 2), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array(4);
      const n: number = 1.9;
      arr1.$_set(0, n);
      let arr2: Int8Array = new Int8Array(4);
      const v: byte = 2;
      arr2.$_set(0, v);
      expect(arr1.$_get(0)).assertEqual(1);
      expect(arr2.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3500
     * @tc.name int8ArrayIndexSetPart01Test035
     * @tc.desc Verify $_set(2, 128) on new Int8Array([-128, -1, 1, INT8_MAX]) wraps to -128, preserves others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const n: number = 128;
      arr.$_set(2, n);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-128);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3600
     * @tc.name int8ArrayIndexSetPart01Test036
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, 128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 128;
      arr.$_set(0, n);
      const v: byte = INT8_MAX;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3700
     * @tc.name int8ArrayIndexSetPart01Test037
     * @tc.desc Verify $_set(2, 256) on new Int8Array([-128, -1, 1, INT8_MAX]) wraps to 0, preserves others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const n: number = 256;
      arr.$_set(2, n);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3800
     * @tc.name int8ArrayIndexSetPart01Test038
     * @tc.desc Verify $_set(0, 128) truncates to -128 and length remains 4 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 128);
      let r1: number = arr.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_3900
     * @tc.name int8ArrayIndexSetPart01Test039
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2, 1.9), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 1.9;
      try {
        arr.$_set(-2, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4000
     * @tc.name int8ArrayIndexSetPart01Test040
     * @tc.desc Verify $_set(2, v) returns undefined (void return type)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      let result = arr.$_set(2, v);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4100
     * @tc.name int8ArrayIndexSetPart01Test041
     * @tc.desc Verify $_set(2, n) returns undefined (void return type) with number argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      let result = arr.$_set(2, n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4200
     * @tc.name int8ArrayIndexSetPart01Test042
     * @tc.desc Verify $_set(-5, v) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const v: byte = 50;
      try {
        arr.$_set(-5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4300
     * @tc.name int8ArrayIndexSetPart01Test043
     * @tc.desc Verify $_set(-2147483648, v) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const v: byte = 50;
      try {
        arr.$_set(-2147483648, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4400
     * @tc.name int8ArrayIndexSetPart01Test044
     * @tc.desc Verify $_set(-5, n) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const n: number = 128;
      try {
        arr.$_set(-5, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4500
     * @tc.name int8ArrayIndexSetPart01Test045
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(0, v), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      const v: byte = 50;
      try {
        arr.$_set(0, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4600
     * @tc.name int8ArrayIndexSetPart01Test046
     * @tc.desc Verify $_set(-1, v) throws RangeError, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      const v: byte = 50;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4700
     * @tc.name int8ArrayIndexSetPart01Test047
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(2147483647, n), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      const n: number = 128;
      try {
        arr.$_set(2147483647, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4800
     * @tc.name int8ArrayIndexSetPart01Test048
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-2, n), on new Int8Array([99])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([99]);
      const n: number = 128;
      try {
        arr.$_set(-2, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_4900
     * @tc.name int8ArrayIndexSetPart01Test049
     * @tc.desc Verify $_set(-1, INT8_MAX) on new Int8Array(4) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      try {
        arr.$_set(-1, INT8_MAX);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5000
     * @tc.name int8ArrayIndexSetPart01Test050
     * @tc.desc Verify $_set(-4, -128) on new Int8Array(4) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      try {
        arr.$_set(-4, -128);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5100
     * @tc.name int8ArrayIndexSetPart01Test051
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, 50), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const a: byte = 50;
      arr.$_set(0, a);
      const b: byte = INT8_MAX;
      arr.$_set(0, b);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5200
     * @tc.name int8ArrayIndexSetPart01Test052
     * @tc.desc Verify $_set then $_get expects -128, with $_get(0), after $_set(0, 50), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      arr.$_set(0, v);
      const n: number = 128;
      arr.$_set(0, n);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5300
     * @tc.name int8ArrayIndexSetPart01Test053
     * @tc.desc Verify $_set then $_get expects 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 128;
      arr.$_set(0, n);
      const v: byte = 100;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5400
     * @tc.name int8ArrayIndexSetPart01Test054
     * @tc.desc Verify $_set then $_get expects -128, with $_get(0), $_get(1), $_get(2), $_get(3), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const a: byte = -128;
      const b: byte = -1;
      const c: byte = 1;
      const d: byte = INT8_MAX;
      arr.$_set(0, a);
      arr.$_set(1, b);
      arr.$_set(2, c);
      arr.$_set(3, d);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5500
     * @tc.name int8ArrayIndexSetPart01Test055
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, -1), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const a: byte = -1;
      const b: byte = 1;
      const c: byte = INT8_MAX;
      arr.$_set(0, a);
      arr.$_set(1, b);
      arr.$_set(0, c);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5600
     * @tc.name int8ArrayIndexSetPart01Test056
     * @tc.desc Verify at(2) returns 50 after $_set(2, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      arr.$_set(2, v);
      expect(arr.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5700
     * @tc.name int8ArrayIndexSetPart01Test057
     * @tc.desc Verify at(0) returns 60 after $_set(0, 60)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = 60;
      arr.$_set(0, n);
      expect(arr.at(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5800
     * @tc.name int8ArrayIndexSetPart01Test058
     * @tc.desc Verify $_set then $_get expects INT8_MAX with extra $_set(1, -1), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const a: byte = INT8_MAX;
      arr.$_set(0, a);
      const b: byte = -1;
      arr.$_set(1, b);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_5900
     * @tc.name int8ArrayIndexSetPart01Test059
     * @tc.desc Verify $_set(0, 50) writes 50 and length remains 4 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 50);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6000
     * @tc.name int8ArrayIndexSetPart01Test060
     * @tc.desc Verify $_set(0, 60) writes 60 and byteLength remains 4 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.$_set(0, 60);
      let r1: number = arr.$_get(0);
      let e1: int = 60;
      expect(r1).assertEqual(e1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6100
     * @tc.name int8ArrayIndexSetPart01Test061
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, -128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const a: byte = -128;
      arr.$_set(0, a);
      const b: byte = INT8_MAX;
      arr.$_set(0, b);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6200
     * @tc.name int8ArrayIndexSetPart01Test062
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-1, -128), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const n: number = -128;
      try {
        arr.$_set(-1, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6300
     * @tc.name int8ArrayIndexSetPart01Test063
     * @tc.desc Verify $_set(4, v) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const v: byte = 50;
      try {
        arr.$_set(4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6400
     * @tc.name int8ArrayIndexSetPart01Test064
     * @tc.desc Verify $_set(5, v) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const v: byte = 50;
      try {
        arr.$_set(5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6500
     * @tc.name int8ArrayIndexSetPart01Test065
     * @tc.desc Verify $_set(2147483647, v) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const v: byte = 50;
      try {
        arr.$_set(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6600
     * @tc.name int8ArrayIndexSetPart01Test066
     * @tc.desc Verify $_set(4, n) throws RangeError, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const n: number = 128;
      try {
        arr.$_set(4, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6700
     * @tc.name int8ArrayIndexSetPart01Test067
     * @tc.desc Verify $_set expects RangeError throws exception, on new Int8Array([-128, -1, 1, INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 1, INT8_MAX]);
      const n: number = 128;
      try {
        arr.$_set(2147483647, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6800
     * @tc.name int8ArrayIndexSetPart01Test068
     * @tc.desc Verify $_set expects RangeError throws exception, on new Int8Array([99])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([99]);
      const n: number = 128;
      try {
        arr.$_set(1, n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_6900
     * @tc.name int8ArrayIndexSetPart01Test069
     * @tc.desc Verify $_set length 4, throws RangeError for out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      try {
        arr.$_set(4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART01_TEST_7000
     * @tc.name int8ArrayIndexSetPart01Test070
     * @tc.desc Verify $_set byteLength 4, throws RangeError for out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 50;
      try {
        arr.$_set(4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.byteLength).assertEqual(4);
    });
  });
}
