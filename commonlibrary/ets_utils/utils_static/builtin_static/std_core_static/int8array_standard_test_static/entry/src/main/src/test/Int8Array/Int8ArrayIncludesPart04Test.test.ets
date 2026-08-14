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

export default function int8ArrayIncludesPart04Test(): void {
  describe('Int8ArrayIncludesPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0100
     * @tc.name int8ArrayIncludesPart04Test001
     * @tc.desc Verify $_set(0, 128) -128 includes(-128) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      arr.$_set(0, 128);
      let r1: boolean = arr.includes(INT8_MIN);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0200
     * @tc.name int8ArrayIncludesPart04Test002
     * @tc.desc Verify $_set(0, -129) 127 includes(127) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, -129);
      expect(arr.includes(INT8_MAX)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0300
     * @tc.name int8ArrayIncludesPart04Test003
     * @tc.desc Verify $_set(0, 255) -1 includes(-1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 255);
      expect(arr.includes(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0400
     * @tc.name int8ArrayIncludesPart04Test004
     * @tc.desc Verify $_set(0, 256) 0 includes(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      arr.$_set(0, 256);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0500
     * @tc.name int8ArrayIncludesPart04Test005
     * @tc.desc Verify $_set(0, 300) 44 includes(44) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 300);
      expect(arr.includes(44)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0600
     * @tc.name int8ArrayIncludesPart04Test006
     * @tc.desc Verify $_set(0, -200) 56 includes(56) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, -200);
      expect(arr.includes(56)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0700
     * @tc.name int8ArrayIncludesPart04Test007
     * @tc.desc Verify $_set(0, 0x81) -127 includes(-127) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 0x81);
      expect(arr.includes(-INT8_MAX)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0800
     * @tc.name int8ArrayIncludesPart04Test008
     * @tc.desc Verify $_set(0, Number.NaN) 0 includes(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      arr.$_set(0, Number.NaN);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_0900
     * @tc.name int8ArrayIncludesPart04Test009
     * @tc.desc Verify $_set(0, 1.9) 1 includes(1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 1.9);
      expect(arr.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1000
     * @tc.name int8ArrayIncludesPart04Test010
     * @tc.desc Verify $_set(0, -1.9) -1 includes(-1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, -1.9);
      expect(arr.includes(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1100
     * @tc.name int8ArrayIncludesPart04Test011
     * @tc.desc Verify $_set(0, -0.5) 0 includes(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      arr.$_set(0, -0.5);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1200
     * @tc.name int8ArrayIncludesPart04Test012
     * @tc.desc Verify includes(50) returns true after $_set(0, 50) on new Int8Array([0, 0, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 50);
      expect(arr.includes(50)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1300
     * @tc.name int8ArrayIncludesPart04Test013
     * @tc.desc Verify includes(5, 1) returns true and includes(0) returns true after $_set(0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      arr.$_set(0, 0);
      expect(arr.includes(5, 1)).assertTrue();
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1400
     * @tc.name int8ArrayIncludesPart04Test014
     * @tc.desc Verify $_set overwrite: after $_set(1, 30) then $_set(1, 60), includes(30) returns false, includes(60) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(1, 30);
      arr.$_set(1, 60);
      expect(arr.includes(30)).assertFalse();
      expect(arr.includes(60)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1500
     * @tc.name int8ArrayIncludesPart04Test015
     * @tc.desc Verify includes(INT8_MIN) returns true after $_set(0, INT8_MIN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, INT8_MIN);
      let r1: boolean = arr.includes(INT8_MIN);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1600
     * @tc.name int8ArrayIncludesPart04Test016
     * @tc.desc Verify $_set(0, 42) index 0 includes(42, 1) index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0]);
      arr.$_set(0, 42);
      expect(arr.includes(42, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1700
     * @tc.name int8ArrayIncludesPart04Test017
     * @tc.desc Verify $_set(2, 42) index 2 includes(42, 2) index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0]);
      arr.$_set(2, 42);
      expect(arr.includes(42, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1800
     * @tc.name int8ArrayIncludesPart04Test018
     * @tc.desc Verify $_set(3, 42) index 3 includes(42, 1) index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0]);
      arr.$_set(3, 42);
      expect(arr.includes(42, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_1900
     * @tc.name int8ArrayIncludesPart04Test019
     * @tc.desc Verify $_set(3, 42) includes(42, -2) index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      arr.$_set(3, 42);
      expect(arr.includes(42, -2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2000
     * @tc.name int8ArrayIncludesPart04Test020
     * @tc.desc Verify includes searchElement=88, -1 returns true when element exists in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(2, 88);
      expect(arr.includes(88, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2100
     * @tc.name int8ArrayIncludesPart04Test021
     * @tc.desc Verify $_set(1, 127) index 1 includes(127, 1) index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(1, INT8_MAX);
      expect(arr.includes(INT8_MAX, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2200
     * @tc.name int8ArrayIncludesPart04Test022
     * @tc.desc Verify $_set(0, 127) index 0 includes(127, 1) index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, INT8_MAX);
      expect(arr.includes(INT8_MAX, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2300
     * @tc.name int8ArrayIncludesPart04Test023
     * @tc.desc Verify includes(99) on subarray(1, 3) reflects original modification via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sub: Int8Array = arr.subarray(1, 3);
      arr.$_set(1, 99);
      expect(sub.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2400
     * @tc.name int8ArrayIncludesPart04Test024
     * @tc.desc Verify includes(77) returns true when subarray write is visible to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sub: Int8Array = arr.subarray(1, 3);
      sub.$_set(0, 77);
      expect(arr.includes(77)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2500
     * @tc.name int8ArrayIncludesPart04Test025
     * @tc.desc Verify includes(55) returns true when overlapping subarrays share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let sub1: Int8Array = arr.subarray(0, 3);
      let sub2: Int8Array = arr.subarray(2, 5);
      sub1.$_set(2, 55);
      expect(sub2.includes(55)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2600
     * @tc.name int8ArrayIncludesPart04Test026
     * @tc.desc Verify subarray of subarray $_set includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let sub1: Int8Array = arr.subarray(1, 5);
      let sub2: Int8Array = sub1.subarray(1, 3);
      arr.$_set(2, 33);
      expect(sub2.includes(33)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2700
     * @tc.name int8ArrayIncludesPart04Test027
     * @tc.desc Verify includes(-56) on original reflects $_set(0, 200) on subarray via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0]);
      let sub: Int8Array = arr.subarray(1, 3);
      sub.$_set(0, 200);
      expect(arr.includes(-56)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2800
     * @tc.name int8ArrayIncludesPart04Test028
     * @tc.desc Verify ArrayBuffer Int8Array offset $_set includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let view1: Int8Array = new Int8Array(buf, 0, 3);
      let view2: Int8Array = new Int8Array(buf, 2, 3);
      view1.$_set(2, 66);
      expect(view2.includes(66)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_2900
     * @tc.name int8ArrayIncludesPart04Test029
     * @tc.desc Verify includes(30, 0) returns true and includes(30, 1) returns false on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      let sub: Int8Array = arr.subarray(2, 5);
      expect(sub.includes(30, 0)).assertTrue();
      expect(sub.includes(30, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3000
     * @tc.name int8ArrayIncludesPart04Test030
     * @tc.desc Verify includes(44) returns true on subarray(-3) after $_set(3, 44)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let sub: Int8Array = arr.subarray(-3);
      arr.$_set(3, 44);
      expect(sub.includes(44)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3100
     * @tc.name int8ArrayIncludesPart04Test031
     * @tc.desc Verify includes(99) returns false after $_set on independent slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let copy: Int8Array = arr.slice(0, 3);
      copy.$_set(0, 99);
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3200
     * @tc.name int8ArrayIncludesPart04Test032
     * @tc.desc Verify includes(99) returns false on independent array after $_set(0, 99) on another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array([1, 2, 3]);
      let b: Int8Array = new Int8Array([1, 2, 3]);
      a.$_set(0, 99);
      expect(b.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3300
     * @tc.name int8ArrayIncludesPart04Test033
     * @tc.desc Verify includes(42, 0) on subarray(1, 4) true and includes(42, 3) false after $_set(2, 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let sub: Int8Array = arr.subarray(1, 4);
      arr.$_set(2, 42);
      expect(sub.includes(42, 0)).assertTrue();
      expect(sub.includes(42, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3400
     * @tc.name int8ArrayIncludesPart04Test034
     * @tc.desc Verify includes searchElement=5 returns false when element does not exist in subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let sub: Int8Array = arr.subarray(0, 3);
      expect(sub.includes(5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3500
     * @tc.name int8ArrayIncludesPart04Test035
     * @tc.desc Verify includes(128) does not modify array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.includes(128);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3600
     * @tc.name int8ArrayIncludesPart04Test036
     * @tc.desc Verify includes(1, 100) does not modify array elements or length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.includes(1, 100);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3700
     * @tc.name int8ArrayIncludesPart04Test037
     * @tc.desc Verify includes(1, -1) does not modify array element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.includes(1, -1);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3800
     * @tc.name int8ArrayIncludesPart04Test038
     * @tc.desc Verify includes(0) does not modify empty array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let has0: boolean = arr.includes(0);
      expect(has0).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_3900
     * @tc.name int8ArrayIncludesPart04Test039
     * @tc.desc Verify includes() does not modify array element values after multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      arr.includes(10);
      arr.includes(99);
      arr.includes(200);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4000
     * @tc.name int8ArrayIncludesPart04Test040
     * @tc.desc Verify includes(200) does not modify array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: boolean = arr.includes(200);
      expect(r1).assertFalse();
      let r2: number = arr.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4100
     * @tc.name int8ArrayIncludesPart04Test041
     * @tc.desc Verify includes(255) does not modify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let has255: boolean = arr.includes(255);
      expect(has255).assertFalse();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4200
     * @tc.name int8ArrayIncludesPart04Test042
     * @tc.desc Verify includes(0) does not modify array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(new ArrayBuffer(8), 2, 4);
      let has0: boolean = arr.includes(0);
      expect(has0).assertTrue();
      let r1: int = arr.byteOffset;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4300
     * @tc.name int8ArrayIncludesPart04Test043
     * @tc.desc Verify includes(10) returns true on new Int8Array([5, 10, 15])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let r1: boolean = arr.includes(10);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4400
     * @tc.name int8ArrayIncludesPart04Test044
     * @tc.desc Verify includes(1) true and includes(99) false, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4500
     * @tc.name int8ArrayIncludesPart04Test045
     * @tc.desc Verify arr.includes(arr.includes(x) ? y, z)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const inner: boolean = arr.includes(2);
      const target: int = inner ? 3 : 99;
      expect(arr.includes(target)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4600
     * @tc.name int8ArrayIncludesPart04Test046
     * @tc.desc Verify includes(1) checks element presence in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let counter: int = 0;
      counter = counter + (arr.includes(1) ? 1 : 0);
      counter = counter + (arr.includes(2) ? 1 : 0);
      counter = counter + (arr.includes(99) ? 1 : 0);
      expect(counter).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4700
     * @tc.name int8ArrayIncludesPart04Test047
     * @tc.desc Verify includes(10) returns true on new Int8Array([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let r1: boolean = arr.includes(10);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4800
     * @tc.name int8ArrayIncludesPart04Test048
     * @tc.desc Verify includes(7) returns true on Int8Array(4) after fill(7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      arr.fill(7);
      expect(arr.includes(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_4900
     * @tc.name int8ArrayIncludesPart04Test049
     * @tc.desc Verify includes(9, 0) returns true and includes(9, 3) returns false after fill(9, 1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      arr.fill(9, 1, 3);
      expect(arr.includes(9, 0)).assertTrue();
      expect(arr.includes(9, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5000
     * @tc.name int8ArrayIncludesPart04Test050
     * @tc.desc Verify includes(6) returns false on Int8Array(3) after fill(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(5);
      expect(arr.includes(6)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5100
     * @tc.name int8ArrayIncludesPart04Test051
     * @tc.desc Verify includes after reverse finds 1 and 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reverse();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5200
     * @tc.name int8ArrayIncludesPart04Test052
     * @tc.desc Verify includes(1) returns true after sort() on new Int8Array([3, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.sort();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5300
     * @tc.name int8ArrayIncludesPart04Test053
     * @tc.desc Verify includes(4) and includes(5) return true after copyWithin(0, 3, 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      expect(arr.includes(4)).assertTrue();
      expect(arr.includes(5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5400
     * @tc.name int8ArrayIncludesPart04Test054
     * @tc.desc Verify includes(1) returns true after copyWithin(1, 0, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 0, 4);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5500
     * @tc.name int8ArrayIncludesPart04Test055
     * @tc.desc Verify includes(8) and includes(7, 1) return true after set(src, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([7, 8, 9]);
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      arr.set(src, 1);
      expect(arr.includes(8)).assertTrue();
      expect(arr.includes(7, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5600
     * @tc.name int8ArrayIncludesPart04Test056
     * @tc.desc Verify includes(11) returns true after $_set(11) on all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      for (let i: int = 0; i < arr.length; i++) {
        arr.$_set(i, 11);
      }
      let r1: boolean = arr.includes(11);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5700
     * @tc.name int8ArrayIncludesPart04Test057
     * @tc.desc Verify includes results array [true, true, false], on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let results: boolean[] = [arr.includes(1), arr.includes(2), arr.includes(99)];
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5800
     * @tc.name int8ArrayIncludesPart04Test058
     * @tc.desc Verify includes(v) checks element presence in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let other: Int8Array = new Int8Array([2, 4, 6]);
      let matchCount: int = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        if (other.includes(v)) {
          matchCount = matchCount + 1;
        }
      });
      expect(matchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_5900
     * @tc.name int8ArrayIncludesPart04Test059
     * @tc.desc Verify fill(200) clamps to -56, includes(-56) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(200);
      expect(arr.includes(-56)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6000
     * @tc.name int8ArrayIncludesPart04Test060
     * @tc.desc Verify includes(-56) returns true after clamped $_set(0, 200) copied via set(src, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([0, 0, 0]);
      src.$_set(0, 200);
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      arr.set(src, 1);
      expect(arr.includes(-56)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6100
     * @tc.name int8ArrayIncludesPart04Test061
     * @tc.desc Verify $_set(0, 127.9) 127 includes(127) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 127.9);
      expect(arr.includes(INT8_MAX)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6200
     * @tc.name int8ArrayIncludesPart04Test062
     * @tc.desc Verify $_set(0, -128.9) -128 includes(-128) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, -128.9);
      let r1: boolean = arr.includes(INT8_MIN);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6300
     * @tc.name int8ArrayIncludesPart04Test063
     * @tc.desc Verify includes(42, 0) on original true and includes(42, 3) false after $_set(1, 42) on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let sub: Int8Array = arr.subarray(1, 4);
      sub.$_set(1, 42);
      expect(arr.includes(42, 0)).assertTrue();
      expect(arr.includes(42, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6400
     * @tc.name int8ArrayIncludesPart04Test064
     * @tc.desc Verify includes(33) returns true via nested subarray write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
      let sub1: Int8Array = arr.subarray(0, 4);
      let sub2: Int8Array = sub1.subarray(1, 3);
      sub2.$_set(0, 33);
      expect(arr.includes(33)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6500
     * @tc.name int8ArrayIncludesPart04Test065
     * @tc.desc Verify copyWithin(0, 3, 5) then includes(4) and includes(99) return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      arr.$_set(2, 99);
      expect(arr.includes(99)).assertTrue();
      expect(arr.includes(4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6600
     * @tc.name int8ArrayIncludesPart04Test066
     * @tc.desc Verify $_set(0, 257) 1 includes(1) true +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 257);
      expect(arr.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6700
     * @tc.name int8ArrayIncludesPart04Test067
     * @tc.desc Verify $_set index=length no-op includes, throws RangeError for out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6800
     * @tc.name int8ArrayIncludesPart04Test068
     * @tc.desc Verify $_set(0, Number.POSITIVE_INFINITY) 127 includes(127) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, Number.POSITIVE_INFINITY);
      expect(arr.includes(127)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_6900
     * @tc.name int8ArrayIncludesPart04Test069
     * @tc.desc Verify $_set(0, Number.NEGATIVE_INFINITY) -128 includes(-128) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      let r1: boolean = arr.includes(INT8_MIN);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INCLUDES_PART04_TEST_7000
     * @tc.name int8ArrayIncludesPart04Test070
     * @tc.desc Verify $_set(0, 200) -56 includes(200) false searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIncludesPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 200);
      expect(arr.includes(200)).assertFalse();
    });
  });
}
