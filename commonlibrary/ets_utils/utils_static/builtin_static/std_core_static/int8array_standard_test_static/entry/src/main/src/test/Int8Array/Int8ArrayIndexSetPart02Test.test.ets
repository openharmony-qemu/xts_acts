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

export default function int8ArrayIndexSetPart02Test(): void {
  describe('Int8ArrayIndexSetPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0100
     * @tc.name int8ArrayIndexSetPart02Test001
     * @tc.desc Verify $_set with byte 10 leaves length 2, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 10;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0200
     * @tc.name int8ArrayIndexSetPart02Test002
     * @tc.desc Verify $_set with number 10 leaves length 2, on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: number = 10;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0300
     * @tc.name int8ArrayIndexSetPart02Test003
     * @tc.desc Verify $_set returns undefined, with $_set(0, v), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 5;
      arr.$_set(0, v);
      let result: Object | void = arr.$_set(0, v);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0400
     * @tc.name int8ArrayIndexSetPart02Test004
     * @tc.desc Verify $_set writes 1, 2, 3 and length remains 3 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const firstVal: byte = 1;
      const secondVal: byte = 2;
      const thirdVal: byte = 3;
      arr.$_set(0, firstVal);
      arr.$_set(1, secondVal);
      arr.$_set(2, thirdVal);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0500
     * @tc.name int8ArrayIndexSetPart02Test005
     * @tc.desc Verify $_set then $_get expects INT8_MAX with byte value, after $_set(0, INT8_MAX), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = INT8_MAX;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0600
     * @tc.name int8ArrayIndexSetPart02Test006
     * @tc.desc Verify $_set then $_get expects INT8_MAX with number value, after $_set(0, INT8_MAX), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = INT8_MAX;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0700
     * @tc.name int8ArrayIndexSetPart02Test007
     * @tc.desc Verify $_set then $_get expects INT8_MAX, after $_set(0, -129), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = -129;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0800
     * @tc.name int8ArrayIndexSetPart02Test008
     * @tc.desc Verify $_set then $_get expects -INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 0x81;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_0900
     * @tc.name int8ArrayIndexSetPart02Test009
     * @tc.desc Verify $_set then $_get expects -1, after $_set(0, -1.9), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = -1.9;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1000
     * @tc.name int8ArrayIndexSetPart02Test010
     * @tc.desc Verify $_set then $_get expects 0, with $_get(1), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 50;
      arr.$_set(0, v);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1100
     * @tc.name int8ArrayIndexSetPart02Test011
     * @tc.desc Verify $_set then $_get expects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      const v: byte = 99;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1200
     * @tc.name int8ArrayIndexSetPart02Test012
     * @tc.desc Verify $_set then $_get expects 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = 100;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1300
     * @tc.name int8ArrayIndexSetPart02Test013
     * @tc.desc Verify at(0) returns 64 after $_set(0, 64)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = 64;
      arr.$_set(0, v);
      expect(arr.at(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1400
     * @tc.name int8ArrayIndexSetPart02Test014
     * @tc.desc Verify at(-1) returns -50 after $_set(2, -50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const v: byte = -50;
      arr.$_set(2, v);
      expect(arr.at(-1)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1500
     * @tc.name int8ArrayIndexSetPart02Test015
     * @tc.desc Verify $_set then $_get expects 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = 42;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1600
     * @tc.name int8ArrayIndexSetPart02Test016
     * @tc.desc Verify $_set then $_get expects 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 88;
      arr.$_set(3, v);
      expect(arr.$_get(3)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1700
     * @tc.name int8ArrayIndexSetPart02Test017
     * @tc.desc Verify $_set(1, 7) writes 7 and length remains 3 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const v: byte = 7;
      arr.$_set(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1800
     * @tc.name int8ArrayIndexSetPart02Test018
     * @tc.desc Verify $_set(1, 7) writes 7 and byteLength remains 3 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const v: byte = 7;
      arr.$_set(1, v);
      let r1: number = arr.$_get(1);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_1900
     * @tc.name int8ArrayIndexSetPart02Test019
     * @tc.desc Verify $_set(0, 7) writes 7 on new Int8Array(new ArrayBuffer(4))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      const v: byte = 7;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2000
     * @tc.name int8ArrayIndexSetPart02Test020
     * @tc.desc Verify $_set(0, 1) and $_set(1, 2) write values and length remains 2 on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const firstVal: byte = 1;
      const secondVal: byte = 2;
      arr.$_set(0, firstVal);
      arr.$_set(1, secondVal);
      let r1: number = arr.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2100
     * @tc.name int8ArrayIndexSetPart02Test021
     * @tc.desc Verify $_set(0, 10) writes 10 on new Int8Array(buf) from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf);
      const v: byte = 10;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2200
     * @tc.name int8ArrayIndexSetPart02Test022
     * @tc.desc Verify $_set then $_get expects 5, with $_get(0), on new Int8Array([5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5]);
      const v: byte = 99;
      arr.$_set(1, v);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2300
     * @tc.name int8ArrayIndexSetPart02Test023
     * @tc.desc Verify $_set then $_get expects 5, with $_get(1), on new Int8Array([5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5]);
      const v: byte = 99;
      arr.$_set(0, v);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2400
     * @tc.name int8ArrayIndexSetPart02Test024
     * @tc.desc Verify $_set then $_get expects 1, after $_set(1, 99), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      arr.$_set(1, v);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2500
     * @tc.name int8ArrayIndexSetPart02Test025
     * @tc.desc Verify $_set then $_get expects 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      arr.$_set(1, v);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2600
     * @tc.name int8ArrayIndexSetPart02Test026
     * @tc.desc Verify $_set then $_get expects 1, after $_set(2, 99), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      arr.$_set(2, v);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2700
     * @tc.name int8ArrayIndexSetPart02Test027
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 77;
      arr.$_set(2, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2800
     * @tc.name int8ArrayIndexSetPart02Test028
     * @tc.desc Verify $_set then $_get expects 0, with $_get(3), on new Int8Array(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 77;
      arr.$_set(2, v);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_2900
     * @tc.name int8ArrayIndexSetPart02Test029
     * @tc.desc Verify indexOf(99) returns 0 after $_set(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      arr.$_set(0, v);
      expect(arr.indexOf(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3000
     * @tc.name int8ArrayIndexSetPart02Test030
     * @tc.desc Verify includes, with $_set(1, v), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      arr.$_set(1, v);
      expect(arr.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3100
     * @tc.name int8ArrayIndexSetPart02Test031
     * @tc.desc Verify toString returns "9,2" after $_set(0, 9) on Int8Array([1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      const v: byte = 9;
      arr.$_set(0, v);
      expect(arr.toString()).assertEqual('9,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3200
     * @tc.name int8ArrayIndexSetPart02Test032
     * @tc.desc Verify lastIndexOf(1) returns 0 after $_set(2, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 1]);
      const v: byte = 9;
      arr.$_set(2, v);
      expect(arr.lastIndexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3300
     * @tc.name int8ArrayIndexSetPart02Test033
     * @tc.desc Verify join('-') returns 9-2 after $_set(0, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      const v: byte = 9;
      arr.$_set(0, v);
      expect(arr.join('-')).assertEqual('9-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3400
     * @tc.name int8ArrayIndexSetPart02Test034
     * @tc.desc Verify $_set then $_get expects 100 from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr1: Int8Array = new Int8Array(buf);
      let arr2: Int8Array = new Int8Array(buf);
      const v: byte = 100;
      arr1.$_set(0, v);
      expect(arr2.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3500
     * @tc.name int8ArrayIndexSetPart02Test035
     * @tc.desc Verify $_set expects 100 from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf);
      let dv: DataView = new DataView(buf);
      const v: byte = 100;
      arr.$_set(0, v);
      expect(dv.getInt8(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3600
     * @tc.name int8ArrayIndexSetPart02Test036
     * @tc.desc Verify $_set(0, 50) writes 50 on offset view new Int8Array(buf, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, 1, 2);
      const v: byte = 50;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3700
     * @tc.name int8ArrayIndexSetPart02Test037
     * @tc.desc Verify $_set(0, 50) writes 50 on new Int8Array(buf, 0, 2) from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, 0, 2);
      const v: byte = 50;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3800
     * @tc.name int8ArrayIndexSetPart02Test038
     * @tc.desc Verify subarray(1, 3) shares buffer, $_set on subarray reflected in original expects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      const v: byte = 99;
      view.$_set(0, v);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_3900
     * @tc.name int8ArrayIndexSetPart02Test039
     * @tc.desc Verify $_get(0) on subarray(1, 3) returns 88 after $_set(1, 88) on base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      const v: byte = 88;
      arr.$_set(1, v);
      expect(view.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4000
     * @tc.name int8ArrayIndexSetPart02Test040
     * @tc.desc Verify slice(0, 3) creates independent copy and $_set on copy does not affect original expects 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let copy: Int8Array = arr.slice(0, 3);
      const v: byte = 99;
      arr.$_set(0, v);
      expect(copy.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4100
     * @tc.name int8ArrayIndexSetPart02Test041
     * @tc.desc Verify $_set on offset view does not affect adjacent offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr1: Int8Array = new Int8Array(buf, 0, 1);
      let arr2: Int8Array = new Int8Array(buf, 1, 1);
      const v: byte = 77;
      arr1.$_set(0, v);
      expect(arr2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4200
     * @tc.name int8ArrayIndexSetPart02Test042
     * @tc.desc Verify $_set(0, 5) then $_get(0) returns 5 on new Int8Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const v: byte = 5;
      arr.$_set(0, v);
      let r1: number = arr.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4300
     * @tc.name int8ArrayIndexSetPart02Test043
     * @tc.desc Verify $_set then $_get expects -128 with byte value, after $_set(0, -128), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = -128;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4400
     * @tc.name int8ArrayIndexSetPart02Test044
     * @tc.desc Verify $_set then $_get expects -128, after $_set(0, 128), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 128;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4500
     * @tc.name int8ArrayIndexSetPart02Test045
     * @tc.desc Verify $_set then $_get expects -1, after $_set(0, 255), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 255;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4600
     * @tc.name int8ArrayIndexSetPart02Test046
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), after $_set(0, Number.NaN), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = Number.NaN;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4700
     * @tc.name int8ArrayIndexSetPart02Test047
     * @tc.desc Verify $_set then $_get expects 1, on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 1.9;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4800
     * @tc.name int8ArrayIndexSetPart02Test048
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), after $_set(0, -0.0), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = -0.0;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_4900
     * @tc.name int8ArrayIndexSetPart02Test049
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), after $_set(0, 256), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 256;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5000
     * @tc.name int8ArrayIndexSetPart02Test050
     * @tc.desc Verify $_set then $_get expects -128 with number value, after $_set(0, -128), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = -128;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5100
     * @tc.name int8ArrayIndexSetPart02Test051
     * @tc.desc Verify toString returns "127,0" after $_set(0, INT8_MAX) on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: number = INT8_MAX;
      arr.$_set(0, v);
      expect(arr.toString()).assertEqual('127,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5200
     * @tc.name int8ArrayIndexSetPart02Test052
     * @tc.desc Verify indexOf expects 0, after $_set(0, 255), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 255;
      arr.$_set(0, v);
      expect(arr.indexOf(-1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5300
     * @tc.name int8ArrayIndexSetPart02Test053
     * @tc.desc Verify indexOf expects 0, after $_set(0, Number.NaN), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = Number.NaN;
      arr.$_set(0, v);
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5400
     * @tc.name int8ArrayIndexSetPart02Test054
     * @tc.desc Verify includes, with $_set(0, v), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 128;
      arr.$_set(0, v);
      expect(arr.includes(-128)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5500
     * @tc.name int8ArrayIndexSetPart02Test055
     * @tc.desc Verify $_set(-1, v) throws RangeError for negative out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      try {
        arr.$_set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5600
     * @tc.name int8ArrayIndexSetPart02Test056
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-3, v), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 77;
      try {
        arr.$_set(-3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5700
     * @tc.name int8ArrayIndexSetPart02Test057
     * @tc.desc Verify $_set(-4, v) throws RangeError for index beyond array lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      try {
        arr.$_set(-4, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5800
     * @tc.name int8ArrayIndexSetPart02Test058
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(-3, v), on new Int8Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 10;
      try {
        arr.$_set(-3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_5900
     * @tc.name int8ArrayIndexSetPart02Test059
     * @tc.desc Verify byte $_set(index, value: byte) and $_get returns 64 on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = 64;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6000
     * @tc.name int8ArrayIndexSetPart02Test060
     * @tc.desc Verify number $_set(index, value: number) and $_get returns 64 on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = 64;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6100
     * @tc.name int8ArrayIndexSetPart02Test061
     * @tc.desc Verify $_get expects arr1.$_get(0) equals arr2.$_get(0) after $_set on separate Int8Array(1) arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array(1);
      let arr2: Int8Array = new Int8Array(1);
      const ve: byte = 50;
      const vn: number = 50;
      arr1.$_set(0, ve);
      arr2.$_set(0, vn);
      expect(arr1.$_get(0)).assertEqual(arr2.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6200
     * @tc.name int8ArrayIndexSetPart02Test062
     * @tc.desc Verify $_set then $_get expects 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const ve: byte = 50;
      const vn: number = 60;
      arr.$_set(0, ve);
      arr.$_set(0, vn);
      expect(arr.$_get(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6300
     * @tc.name int8ArrayIndexSetPart02Test063
     * @tc.desc Verify $_set(0, vn) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const vn: number = 60;
      const ve: byte = 50;
      arr.$_set(0, vn);
      arr.$_set(0, ve);
      expect(arr.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6400
     * @tc.name int8ArrayIndexSetPart02Test064
     * @tc.desc Verify $_set(index beyond length) throws RangeError and array state unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 10;
      try {
        arr.$_set(10, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6500
     * @tc.name int8ArrayIndexSetPart02Test065
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(3, v), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      try {
        arr.$_set(3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6600
     * @tc.name int8ArrayIndexSetPart02Test066
     * @tc.desc Verify $_set(2147483647, v) throws RangeError for far out-of-bounds index and original array elements remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const v: byte = 99;
      try {
        arr.$_set(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6700
     * @tc.name int8ArrayIndexSetPart02Test067
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), after $_set(0, Number.POSITIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = Number.POSITIVE_INFINITY;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6800
     * @tc.name int8ArrayIndexSetPart02Test068
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), after $_set(0, Number.NEGATIVE_INFINITY), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = Number.NEGATIVE_INFINITY;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART02_TEST_6900
     * @tc.name int8ArrayIndexSetPart02Test069
     * @tc.desc Verify $_set then $_get expects 0, with $_get(0), after $_set(0, Number.MAX_VALUE), on new Int8Array(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: number = Number.MAX_VALUE;
      arr.$_set(0, v);
      expect(arr.$_get(0)).assertEqual(0);
    });
  });
}
