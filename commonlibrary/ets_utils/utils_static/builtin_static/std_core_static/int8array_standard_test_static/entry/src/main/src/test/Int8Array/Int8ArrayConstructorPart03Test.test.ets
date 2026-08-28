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

export default function int8ArrayConstructorPart03Test(): void {
  describe('Int8ArrayConstructorPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0100
     * @tc.name int8ArrayConstructorPart03Test001
     * @tc.desc Verify length expects 4 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0200
     * @tc.name int8ArrayConstructorPart03Test002
     * @tc.desc Verify length expects 0, on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 0;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0300
     * @tc.name int8ArrayConstructorPart03Test003
     * @tc.desc Verify length expects 1, on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0400
     * @tc.name int8ArrayConstructorPart03Test004
     * @tc.desc Verify length expects 100 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 100;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0500
     * @tc.name int8ArrayConstructorPart03Test005
     * @tc.desc Verify length expects 2 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 2.5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0600
     * @tc.name int8ArrayConstructorPart03Test006
     * @tc.desc Verify length expects 0, on new Int8Array(0.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 0.5;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0700
     * @tc.name int8ArrayConstructorPart03Test007
     * @tc.desc Verify length expects 1, on new Int8Array(1.9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1.9;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0800
     * @tc.name int8ArrayConstructorPart03Test008
     * @tc.desc Verify length expects 0, on new Int8Array(Number.NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = Number.NaN;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_0900
     * @tc.name int8ArrayConstructorPart03Test009
     * @tc.desc Verify new Int8Array(Number.POSITIVE_INFINITY) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = Number.POSITIVE_INFINITY;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1000
     * @tc.name int8ArrayConstructorPart03Test010
     * @tc.desc Verify new Int8Array(-Number.POSITIVE_INFINITY) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = -Number.POSITIVE_INFINITY;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1100
     * @tc.name int8ArrayConstructorPart03Test011
     * @tc.desc Verify new Int8Array(1.7976931348623157e308) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1.7976931348623157e308;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1200
     * @tc.name int8ArrayConstructorPart03Test012
     * @tc.desc Verify length expects 0, on new Int8Array(5e-324)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 5e-324;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1300
     * @tc.name int8ArrayConstructorPart03Test013
     * @tc.desc Verify new Int8Array(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = -1;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1400
     * @tc.name int8ArrayConstructorPart03Test014
     * @tc.desc Verify new Int8Array(9007199254740992) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 9007199254740992;
      try {
        let arr: Int8Array = new Int8Array(len);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1500
     * @tc.name int8ArrayConstructorPart03Test015
     * @tc.desc Verify length on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1600
     * @tc.name int8ArrayConstructorPart03Test016
     * @tc.desc Verify new Int8Array(len) is not an Array via Array.isArray returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(Array.isArray(arr)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1700
     * @tc.name int8ArrayConstructorPart03Test017
     * @tc.desc Verify length expects 8 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 8;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1800
     * @tc.name int8ArrayConstructorPart03Test018
     * @tc.desc Verify byteOffset of new Int8Array(len) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_1900
     * @tc.name int8ArrayConstructorPart03Test019
     * @tc.desc Verify buffer.byteLength of new Int8Array(len) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2000
     * @tc.name int8ArrayConstructorPart03Test020
     * @tc.desc Verify equals 1 for Int8Array BYTES_PER_ELEMENT on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2100
     * @tc.name int8ArrayConstructorPart03Test021
     * @tc.desc Verify arr.buffer returns the same underlying ArrayBuffer reference on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf1: ArrayBuffer = arr.buffer;
      let buf2: ArrayBuffer = arr.buffer;
      let other: Int8Array = new Int8Array(4);
      expect(buf1).assertEqual(buf2);
      expect(buf1).not().assertEqual(other.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2200
     * @tc.name int8ArrayConstructorPart03Test022
     * @tc.desc Verify new Int8Array(len) constructor creates independent buffers: arr1.$_set(0,99) does not affect arr2.$_get(0) expects 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr1: Int8Array = new Int8Array(len);
      let arr2: Int8Array = new Int8Array(len);
      expect(arr1.buffer.byteLength).assertEqual(4);
      expect(arr2.buffer.byteLength).assertEqual(4);
      arr1.$_set(0, 99);
      expect(arr2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2300
     * @tc.name int8ArrayConstructorPart03Test023
     * @tc.desc Verify $_get expects 0, with $_get(0), $_get(1), $_get(2), $_get(3), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2400
     * @tc.name int8ArrayConstructorPart03Test024
     * @tc.desc Verify $_get expects 0, with $_get(0), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2500
     * @tc.name int8ArrayConstructorPart03Test025
     * @tc.desc Verify $_get expects 0, with $_get(3), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2600
     * @tc.name int8ArrayConstructorPart03Test026
     * @tc.desc Verify toString() returns empty string on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 0;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2700
     * @tc.name int8ArrayConstructorPart03Test027
     * @tc.desc Verify new Int8Array(len) constructor toString equals '0,0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.toString()).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2800
     * @tc.name int8ArrayConstructorPart03Test028
     * @tc.desc Verify $_get expects 42 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_2900
     * @tc.name int8ArrayConstructorPart03Test029
     * @tc.desc Verify at expects 0, with at(0), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3000
     * @tc.name int8ArrayConstructorPart03Test030
     * @tc.desc Verify at expects 0, with at(-1), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3100
     * @tc.name int8ArrayConstructorPart03Test031
     * @tc.desc Verify at returns undefined, with at(4), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(4)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3200
     * @tc.name int8ArrayConstructorPart03Test032
     * @tc.desc Verify at returns undefined, with at(-5), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.at(-5)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3300
     * @tc.name int8ArrayConstructorPart03Test033
     * @tc.desc Verify includes, with includes(0), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3400
     * @tc.name int8ArrayConstructorPart03Test034
     * @tc.desc Verify includes, with includes(1), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3500
     * @tc.name int8ArrayConstructorPart03Test035
     * @tc.desc Verify indexOf expects 0 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3600
     * @tc.name int8ArrayConstructorPart03Test036
     * @tc.desc Verify indexOf expects -1 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3700
     * @tc.name int8ArrayConstructorPart03Test037
     * @tc.desc Verify lastIndexOf expects 3 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      expect(arr.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3800
     * @tc.name int8ArrayConstructorPart03Test038
     * @tc.desc Verify fill expects INT8_MAX on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.fill(INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_3900
     * @tc.name int8ArrayConstructorPart03Test039
     * @tc.desc Verify fill expects -128 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.fill(128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4000
     * @tc.name int8ArrayConstructorPart03Test040
     * @tc.desc Verify reverse expects arr on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let result: Int8Array = arr.reverse();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4100
     * @tc.name int8ArrayConstructorPart03Test041
     * @tc.desc Verify every() returns true for zero-filled new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let result: boolean = arr.every((x: number): boolean => {
        return x === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4200
     * @tc.name int8ArrayConstructorPart03Test042
     * @tc.desc Verify some() returns false for zero-filled new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let result: boolean = arr.some((x: number): boolean => {
        return x !== 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4300
     * @tc.name int8ArrayConstructorPart03Test043
     * @tc.desc Verify find expects 0 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let result: number | undefined = arr.find((x: number): boolean => {
        return x === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4400
     * @tc.name int8ArrayConstructorPart03Test044
     * @tc.desc Verify findIndex expects 0 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let result: number = arr.findIndex((x: number): boolean => {
        return x === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4500
     * @tc.name int8ArrayConstructorPart03Test045
     * @tc.desc Verify forEach expects 4 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let count: number = 0;
      arr.forEach((x: number): void => {
        if (x < INT8_MIN || x > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4600
     * @tc.name int8ArrayConstructorPart03Test046
     * @tc.desc Verify map expects 1 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let mapped: Int8Array = arr.map((x: number) => {
        return x + 1;
      });
      expect(mapped.$_get(0)).assertEqual(1);
      expect(mapped.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4700
     * @tc.name int8ArrayConstructorPart03Test047
     * @tc.desc Verify keys expects 0 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let iter = arr.keys();
      let first = iter.next();
      expect(first.value).assertEqual(0);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4800
     * @tc.name int8ArrayConstructorPart03Test048
     * @tc.desc Verify entries on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let iter = arr.entries();
      let first = iter.next();
      expect(first.done).assertFalse();
      let entry = first.value;
      if (entry != undefined) {
        let [k0, v0]: [int, double] = entry!;
        expect(k0).assertEqual(0);
        expect(v0).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_4900
     * @tc.name int8ArrayConstructorPart03Test049
     * @tc.desc Verify with(0, INT8_MAX) returns new Int8Array with $_get(0) equals INT8_MAX and original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let newArr: Int8Array = arr.with(0, INT8_MAX);
      expect(newArr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5000
     * @tc.name int8ArrayConstructorPart03Test050
     * @tc.desc Verify with(0, 128) on new Int8Array(len) returns $_get(0) equals -128 due to int8 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let newArr: Int8Array = arr.with(0, 128);
      expect(newArr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5100
     * @tc.name int8ArrayConstructorPart03Test051
     * @tc.desc Verify toReversed() on new Int8Array returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 1);
      arr.$_set(3, 2);
      let reversed: Int8Array = arr.toReversed();
      expect(reversed.$_get(0)).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5200
     * @tc.name int8ArrayConstructorPart03Test052
     * @tc.desc Verify toSorted() on new Int8Array(len) returns sorted copy with $_get(0) equals 1 and original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 3;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      let sorted: Int8Array = arr.toSorted();
      expect(sorted.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5300
     * @tc.name int8ArrayConstructorPart03Test053
     * @tc.desc Verify $_get expects RangeError throws exception, with $_get(4), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      try {
        arr.$_get(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5400
     * @tc.name int8ArrayConstructorPart03Test054
     * @tc.desc Verify $_set expects RangeError throws exception on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      try {
        arr.$_set(-5, INT8_MAX);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5500
     * @tc.name int8ArrayConstructorPart03Test055
     * @tc.desc Verify $_get expects RangeError throws exception, with $_get(-5), on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      try {
        arr.$_get(-5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5600
     * @tc.name int8ArrayConstructorPart03Test056
     * @tc.desc Verify with(4, 0) throws RangeError, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      try {
        arr.with(4, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5700
     * @tc.name int8ArrayConstructorPart03Test057
     * @tc.desc Verify with(-5, 0) throws RangeError, on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      try {
        arr.with(-5, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5800
     * @tc.name int8ArrayConstructorPart03Test058
     * @tc.desc Verify $_get expects -128, on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 128);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_5900
     * @tc.name int8ArrayConstructorPart03Test059
     * @tc.desc Verify $_get expects 0, with $_get(0), after $_set(0, 256), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6000
     * @tc.name int8ArrayConstructorPart03Test060
     * @tc.desc Verify $_get expects -1 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 255);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6100
     * @tc.name int8ArrayConstructorPart03Test061
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -129);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6200
     * @tc.name int8ArrayConstructorPart03Test062
     * @tc.desc Verify $_get expects 0, with $_get(0), after $_set(0, -256), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, -256);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6300
     * @tc.name int8ArrayConstructorPart03Test063
     * @tc.desc Verify $_get expects 0, with $_get(0), after $_set(0, Number.NaN), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6400
     * @tc.name int8ArrayConstructorPart03Test064
     * @tc.desc Verify $_get expects 1, on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, 1.9);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6500
     * @tc.name int8ArrayConstructorPart03Test065
     * @tc.desc Verify $_get expects INT8_MAX from ArrayBuffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int8Array = new Int8Array(buf);
      arr.$_set(0, INT8_MAX);
      expect(view.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6600
     * @tc.name int8ArrayConstructorPart03Test066
     * @tc.desc Verify $_get expects 99 from ArrayBuffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int8Array = new Int8Array(buf);
      view.$_set(1, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6700
     * @tc.name int8ArrayConstructorPart03Test067
     * @tc.desc Verify $_get expects 10 from ArrayBuffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int8Array = new Int8Array(buf);
      arr.$_set(0, 10);
      view.$_set(1, 20);
      expect(view.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6800
     * @tc.name int8ArrayConstructorPart03Test068
     * @tc.desc Verify $_get expects 50 from ArrayBuffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf: ArrayBuffer = arr.buffer;
      let view2: Int8Array = new Int8Array(buf);
      let view3: Int8Array = new Int8Array(buf);
      arr.$_set(0, 50);
      expect(view2.$_get(0)).assertEqual(50);
      expect(view3.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_6900
     * @tc.name int8ArrayConstructorPart03Test069
     * @tc.desc Verify $_get expects 255 from ArrayBuffer on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf: ArrayBuffer = arr.buffer;
      let uview: Uint8Array = new Uint8Array(buf);
      arr.$_set(0, -1);
      expect(uview.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7000
     * @tc.name int8ArrayConstructorPart03Test070
     * @tc.desc Verify subarray(0, 2) shares buffer, $_set on subarray reflected in original expects INT8_MAX on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let sub: Int8Array = arr.subarray(0, 2);
      sub.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7100
     * @tc.name int8ArrayConstructorPart03Test071
     * @tc.desc Verify subarray(1, 3) shares buffer, modification is bidirectional expects -128 on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let sub: Int8Array = arr.subarray(1, 3);
      arr.$_set(1, -128);
      expect(sub.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7200
     * @tc.name int8ArrayConstructorPart03Test072
     * @tc.desc Verify slice(0, 2) creates independent copy and $_set on copy does not affect original on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let copy: Int8Array = arr.slice(0, 2);
      copy.$_set(0, INT8_MAX);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7300
     * @tc.name int8ArrayConstructorPart03Test073
     * @tc.desc Verify subarray(1, 3) byteOffset on new Int8Array(len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let sub: Int8Array = arr.subarray(1, 3);
      expect(sub.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7400
     * @tc.name int8ArrayConstructorPart03Test074
     * @tc.desc Verify buffer.byteLength is 4 on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      let buf: ArrayBuffer = arr.buffer;
      arr.$_set(0, INT8_MAX);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7500
     * @tc.name int8ArrayConstructorPart03Test075
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(4) OOB index, on new Int8Array(len), and verify arr.length and arr.$_get(0) are unaffected after exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 4;
      let arr: Int8Array = new Int8Array(len);
      try {
        arr.$_set(4, INT8_MAX);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7600
     * @tc.name int8ArrayConstructorPart03Test076
     * @tc.desc Verify new Int8Array(-0.5) truncates length to 0 and constructs empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = -0.5;
      let arr: Int8Array = new Int8Array(len);
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART03_TEST_7700
     * @tc.name int8ArrayConstructorPart03Test077
     * @tc.desc Verify $_get expects 0, with $_get(0), after $_set(0, Number.POSITIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: number = 1;
      let arr: Int8Array = new Int8Array(len);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });
  });
}
