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

export default function int8ArrayIndexSetPart04Test(): void {
  describe('Int8ArrayIndexSetPart04Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {
      Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0100
     * @tc.name int8ArrayIndexSetPart04Test001
     * @tc.desc Verify $_set(1, 200) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(1, 200);
      let valueAt1: number = arr.$_get(1);
      let expected1: int = -56;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0200
     * @tc.name int8ArrayIndexSetPart04Test002
     * @tc.desc Verify $_set(0, 128) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 128);
      let atResult0: number | undefined = arr.at(0);
      let expected1: number = INT8_MIN;
      expect(atResult0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0300
     * @tc.name int8ArrayIndexSetPart04Test003
     * @tc.desc Verify $_set(0, -129) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, -129);
      let strResult: string = arr.toString();
      let expected1: string = '127,0,0';
      expect(strResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0400
     * @tc.name int8ArrayIndexSetPart04Test004
     * @tc.desc Verify $_set(0, 255) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 255);
      let reader: Int8Array = new Int8Array(buf);
      let valueAt0: number = reader.$_get(0);
      let expected1: int = -1;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0500
     * @tc.name int8ArrayIndexSetPart04Test005
     * @tc.desc Verify $_set(0, 256) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      arr.$_set(0, 256);
      let joinResult: string = arr.join('|');
      let expected1: string = '0|5|5';
      expect(joinResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0600
     * @tc.name int8ArrayIndexSetPart04Test006
     * @tc.desc Verify $_set(1, 0x81) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(1, 0x81);
      let indexOfResult: int = arr.indexOf(-INT8_MAX);
      let expected1: int = 1;
      expect(indexOfResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0700
     * @tc.name int8ArrayIndexSetPart04Test007
     * @tc.desc Verify $_set(0, Number.NaN) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([50, 60, 70]);
      arr.$_set(0, Number.NaN);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 0;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0800
     * @tc.name int8ArrayIndexSetPart04Test008
     * @tc.desc Verify $_set(2, 1.9) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(2, 1.9);
      let includesResult: boolean = arr.includes(1);
      expect(includesResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_0900
     * @tc.name int8ArrayIndexSetPart04Test009
     * @tc.desc Verify $_set(0, -1.9) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, -1.9);
      let found = arr.find((value: number, index: int, array: Int8Array) => value === -1);
      expect(found).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1000
     * @tc.name int8ArrayIndexSetPart04Test010
     * @tc.desc Verify $_set(1, -0.0) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([50, 60, 70]);
      arr.$_set(1, -0.0);
      let lastIndexOfResult: int = arr.lastIndexOf(0);
      let expected1: int = 1;
      expect(lastIndexOfResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1100
     * @tc.name int8ArrayIndexSetPart04Test011
     * @tc.desc Verify $_set(0, INT8_MAX) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, INT8_MAX);
      arr.$_set(1, INT8_MAX);
      arr.$_set(2, INT8_MAX);
      let indexOfResult: int = arr.indexOf(INT8_MAX);
      let expected1: int = 0;
      expect(indexOfResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1200
     * @tc.name int8ArrayIndexSetPart04Test012
     * @tc.desc Verify $_set(0, -128) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, INT8_MIN);
      arr.reverse();
      let valueAt2: number = arr.$_get(2);
      let expected1: number = INT8_MIN;
      expect(valueAt2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1300
     * @tc.name int8ArrayIndexSetPart04Test013
     * @tc.desc Verify $_set(0, 99) writes 99 and length remains 3 on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1400
     * @tc.name int8ArrayIndexSetPart04Test014
     * @tc.desc Verify $_set(0, 99) writes 99 and byteLength remains 3 on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1500
     * @tc.name int8ArrayIndexSetPart04Test015
     * @tc.desc Verify $_set(0, 99) writes 99 and leaves $_get(2) as 3 on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1600
     * @tc.name int8ArrayIndexSetPart04Test016
     * @tc.desc Verify $_set then $_get expects 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(2, 99);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 1;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1700
     * @tc.name int8ArrayIndexSetPart04Test017
     * @tc.desc Verify $_set then $_get expects 50, with $_get(1), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(1, 50);
      let valueAt1: number = arr.$_get(1);
      let expected1: int = 50;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1800
     * @tc.name int8ArrayIndexSetPart04Test018
     * @tc.desc Verify $_set(0, 10) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 10);
      arr.$_set(0, 20);
      arr.$_set(0, 30);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 30;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_1900
     * @tc.name int8ArrayIndexSetPart04Test019
     * @tc.desc Verify toString() returns 99,2,3 after $_set(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let strResult: string = arr.toString();
      let expected1: string = '99,2,3';
      expect(strResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2000
     * @tc.name int8ArrayIndexSetPart04Test020
     * @tc.desc Verify $_set expects RangeError throws exception, with $_set(0, 99), on new Int8Array(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      try {
        arr.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2100
     * @tc.name int8ArrayIndexSetPart04Test021
     * @tc.desc Verify $_set then $_get expects 50, with $_get(0), on new Int8Array([1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      arr.$_set(0, 50);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 50;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2200
     * @tc.name int8ArrayIndexSetPart04Test022
     * @tc.desc Verify $_set(1, 50) writes 50 and leaves unmodified elements as 7 on new Int8Array([7, 7, 7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      arr.$_set(1, 50);
      let r1: number = arr.$_get(1);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2300
     * @tc.name int8ArrayIndexSetPart04Test023
     * @tc.desc Verify $_set(-1, 99) on arr2 throws RangeError while $_set(2, 99) succeeds on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([1, 2, 3]);
      let arr2: Int8Array = new Int8Array([1, 2, 3]);
      arr1.$_set(2, 99);
      let r1: number = arr1.$_get(2);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      try {
        arr2.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2400
     * @tc.name int8ArrayIndexSetPart04Test024
     * @tc.desc Verify $_set(0, 99) writes 99 and byteOffset remains 1 on offset view new Int8Array(new ArrayBuffer(4), 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(new ArrayBuffer(4), 1, 2);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteOffset;
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2500
     * @tc.name int8ArrayIndexSetPart04Test025
     * @tc.desc Verify $_set(0, 99) writes 99 and buffer reference unchanged on new Int8Array(new ArrayBuffer(4))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2600
     * @tc.name int8ArrayIndexSetPart04Test026
     * @tc.desc Verify at(-1) returns 50 after $_set(2, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(2, 50);
      let atResultLast: number | undefined = arr.at(-1);
      let expected1: int = 50;
      expect(atResultLast).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2700
     * @tc.name int8ArrayIndexSetPart04Test027
     * @tc.desc Verify $_set then $_get expects -50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      arr.$_set(0, -50);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = -50;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2800
     * @tc.name int8ArrayIndexSetPart04Test028
     * @tc.desc Verify indexOf(50) returns 1 after $_set(1, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(1, 50);
      let indexOfResult: int = arr.indexOf(50);
      let expected1: int = 1;
      expect(indexOfResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_2900
     * @tc.name int8ArrayIndexSetPart04Test029
     * @tc.desc Verify $_set(2, -50) then includes(-50) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(2, -50);
      let includesResult: boolean = arr.includes(-50);
      expect(includesResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3000
     * @tc.name int8ArrayIndexSetPart04Test030
     * @tc.desc Verify forEach sum equals 54 after $_set(1, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(1, 50);
      let sum: number = 0;
      arr.forEach((value: number, index: int, array: Int8Array) => {
        sum = sum + value;
      });
      expect(sum).assertEqual(54);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3100
     * @tc.name int8ArrayIndexSetPart04Test031
     * @tc.desc Verify join('-') returns 50-2-3 after $_set(0, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      let joinResult: string = arr.join('-');
      let expected1: string = '50-2-3';
      expect(joinResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3200
     * @tc.name int8ArrayIndexSetPart04Test032
     * @tc.desc Verify $_set(index, value * 2) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.forEach((value: number, index: int, array: Int8Array) => {
        arr.$_set(index, value * 2);
      });
      let valueAt1: number = arr.$_get(1);
      let expected1: int = 4;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3300
     * @tc.name int8ArrayIndexSetPart04Test033
     * @tc.desc Verify $_set(index, 99) inside map callback assigns 99 to all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const mapped: Int8Array = arr.map((value: number, index: int, array: Int8Array) => {
        arr.$_set(index, 99);
        return value;
      });
      let r1: int = mapped.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = mapped.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 99;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3400
     * @tc.name int8ArrayIndexSetPart04Test034
     * @tc.desc Verify $_set(index, 99) inside filter callback assigns 99 to all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      const filtered: Int8Array = arr.filter((value: number, index: int, array: Int8Array) => {
        if (index === 0) {
          expect(value).assertEqual(1);
        }
        arr.$_set(index, 99);
        return true;
      });
      let r1: int = filtered.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let valueAt2: number = arr.$_get(2);
      let expected1: int = 99;
      expect(valueAt2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3500
     * @tc.name int8ArrayIndexSetPart04Test035
     * @tc.desc Verify $_set(2, 99) inside forEach callback assigns 99 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.forEach((value: number, index: int, array: Int8Array) => {
        if (index === 0) {
          expect(value).assertEqual(1);
        }
        arr.$_set(2, 99);
      });
      let valueAt2: number = arr.$_get(2);
      let expected1: int = 99;
      expect(valueAt2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3600
     * @tc.name int8ArrayIndexSetPart04Test036
     * @tc.desc Verify forEach callback captures last value 3 after $_set(0, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let captured: number = 0;
      arr.$_set(0, 50);
      arr.forEach((value: number, index: int, array: Int8Array) => {
        captured = value;
      });
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3700
     * @tc.name int8ArrayIndexSetPart04Test037
     * @tc.desc Verify $_set(1, -50) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(1, -50);
      let atResult1: number | undefined = arr.at(1);
      let expected1: int = -50;
      expect(atResult1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3800
     * @tc.name int8ArrayIndexSetPart04Test038
     * @tc.desc Verify $_set then $_get expects 1, on new Int8Array([1, 2, 3, 4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.$_set(2, 99);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 1;
      expect(valueAt0).assertEqual(expected1);
      let valueAt1: number = arr.$_get(1);
      let expected2: int = 2;
      expect(valueAt1).assertEqual(expected2);
      let valueAt3: number = arr.$_get(3);
      let expected3: int = 4;
      expect(valueAt3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_3900
     * @tc.name int8ArrayIndexSetPart04Test039
     * @tc.desc Verify $_get(0) on subarray(1, 2) returns 50 after $_set(1, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(1, 50);
      let view: Int8Array = arr.subarray(1, 2);
      let valueAt0: number = view.$_get(0);
      let expected1: int = 50;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4000
     * @tc.name int8ArrayIndexSetPart04Test040
     * @tc.desc Verify slice(0, 1) copy reads back 50 after $_set(0, 50) on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      let copy: Int8Array = arr.slice(0, 1);
      expect(copy.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4100
     * @tc.name int8ArrayIndexSetPart04Test041
     * @tc.desc Verify find(value === 50) returns 50 after $_set(1, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(1, 50);
      let found = arr.find((value: number, index: int, array: Int8Array) => value === 50);
      expect(found).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4200
     * @tc.name int8ArrayIndexSetPart04Test042
     * @tc.desc Verify findIndex(value === -50) returns 2 after $_set(2, -50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(2, -50);
      let findIndexResult: int = arr.findIndex((value: number, index: int, array: Int8Array) => value === -50);
      let expected1: int = 2;
      expect(findIndexResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4300
     * @tc.name int8ArrayIndexSetPart04Test043
     * @tc.desc Verify $_set then $_get expects 99, with $_get(2), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      for (let i = 0; i < arr.length; i++) {
        if (i === 0) {
          arr.$_set(2, 99);
        }
      }
      let valueAt2: number = arr.$_get(2);
      let expected1: int = 99;
      expect(valueAt2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4400
     * @tc.name int8ArrayIndexSetPart04Test044
     * @tc.desc Verify $_set(i, 99) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let captured: number = 0;
      for (let i = 0; i < arr.length; i++) {
        arr.$_set(i, 99);
        captured++;
      }
      expect(captured).assertEqual(3);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 99;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4500
     * @tc.name int8ArrayIndexSetPart04Test045
     * @tc.desc Verify values expects 99, with $_set(0, 99), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      for (const v of arr.values()) {
        expect(v).assertEqual(99);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4600
     * @tc.name int8ArrayIndexSetPart04Test046
     * @tc.desc Verify $_set(0, 99) and $_get(0) expects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 99;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4700
     * @tc.name int8ArrayIndexSetPart04Test047
     * @tc.desc Verify $_get(1) on subarray(0, 3) returns 50 after $_set(1, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 3);
      arr.$_set(1, 50);
      let valueAt1: number = view.$_get(1);
      let expected1: int = 50;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4800
     * @tc.name int8ArrayIndexSetPart04Test048
     * @tc.desc Verify $_get(0) on both subarray views returns 50 and 99 after $_set(0, 50) and $_set(2, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let subLeft: Int8Array = arr.subarray(0, 2);
      let subRight: Int8Array = arr.subarray(2, 4);
      arr.$_set(0, 50);
      arr.$_set(2, 99);
      let subLeftValueAt0: number = subLeft.$_get(0);
      let expected1: int = 50;
      expect(subLeftValueAt0).assertEqual(expected1);
      let subRightValueAt0: number = subRight.$_get(0);
      let expected2: int = 99;
      expect(subRightValueAt0).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_4900
     * @tc.name int8ArrayIndexSetPart04Test049
     * @tc.desc Verify $_set then $_get expects 50 from ArrayBuffer, with $_get(0), on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let a: Int8Array = new Int8Array(buf);
      let b: Int8Array = new Int8Array(buf);
      a.$_set(0, 50);
      let valueAt0: number = b.$_get(0);
      let expected1: int = 50;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5000
     * @tc.name int8ArrayIndexSetPart04Test050
     * @tc.desc Verify $_set(0, 99) on original does not affect slice(0, 3) copy which keeps 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let copy: Int8Array = arr.slice(0, 3);
      arr.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5100
     * @tc.name int8ArrayIndexSetPart04Test051
     * @tc.desc Verify $_get(0) on subarray(0, 3) returns 99 after $_set(0, 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 3);
      arr.$_set(0, 99);
      let valueAt0: number = view.$_get(0);
      let expected1: int = 99;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5200
     * @tc.name int8ArrayIndexSetPart04Test052
     * @tc.desc Verify $_set then $_get expects 50 from ArrayBuffer, with $_get(2), on new Int8Array(buf, 0, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let a: Int8Array = new Int8Array(buf, 0, 3);
      let b: Int8Array = new Int8Array(buf, 3, 3);
      a.$_set(2, 50);
      b.$_set(0, 99);
      let valueAt2: number = a.$_get(2);
      let expected1: int = 50;
      expect(valueAt2).assertEqual(expected1);
      let valueAt0: number = b.$_get(0);
      let expected2: int = 99;
      expect(valueAt0).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5300
     * @tc.name int8ArrayIndexSetPart04Test053
     * @tc.desc Verify $_get(2) on subarray(0, 4) returns 99 after $_set(0, 99) and copyWithin(2, 0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(0, 4);
      arr.$_set(0, 99);
      arr.copyWithin(2, 0, 1);
      let valueAt2: number = view.$_get(2);
      let expected1: int = 99;
      expect(valueAt2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5400
     * @tc.name int8ArrayIndexSetPart04Test054
     * @tc.desc Verify $_get(0) on subarray(0, 1) returns 50 after $_set(0, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      let view: Int8Array = arr.subarray(0, 1);
      let valueAt0: number = view.$_get(0);
      let expected1: int = 50;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5500
     * @tc.name int8ArrayIndexSetPart04Test055
     * @tc.desc Verify subarray(1, 2) shares buffer, $_set on subarray reflected in original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(1, 2);
      view.$_set(0, 50);
      let r1: number = arr.$_get(1);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 1;
      expect(valueAt0).assertEqual(expected1);
      let valueAt2: number = arr.$_get(2);
      let expected2: int = 3;
      expect(valueAt2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5600
     * @tc.name int8ArrayIndexSetPart04Test056
     * @tc.desc Verify $_set(-1, 50) throws RangeError for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(-1, 50);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5700
     * @tc.name int8ArrayIndexSetPart04Test057
     * @tc.desc Verify $_set(0, 200) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 200);
      let reader: Int8Array = new Int8Array(buf);
      let valueAt0: number = reader.$_get(0);
      let expected1: int = -56;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5800
     * @tc.name int8ArrayIndexSetPart04Test058
     * @tc.desc Verify $_set then $_get expects 50, with $_get(0), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      let rev: Int8Array = arr.toReversed();
      rev.$_set(0, 99);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 50;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_5900
     * @tc.name int8ArrayIndexSetPart04Test059
     * @tc.desc Verify $_set then $_get expects 99, with $_get(0), on new Int8Array([3, 1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.$_set(0, 99);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 99;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6000
     * @tc.name int8ArrayIndexSetPart04Test060
     * @tc.desc Verify $_set(1, 0) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([50, 60, 70]);
      arr.$_set(1, 0);
      let valueAt1: number = arr.$_get(1);
      let expected1: int = 0;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6100
     * @tc.name int8ArrayIndexSetPart04Test061
     * @tc.desc Verify $_set(0, 1) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let strResult: string = arr.toString();
      let expected1: string = '1,2,3';
      expect(strResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6200
     * @tc.name int8ArrayIndexSetPart04Test062
     * @tc.desc Verify $_get expects 2, with $_get(1) unchanged after $_set(0, 50), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 50);
      let valueAt1: number = arr.$_get(1);
      let expected1: int = 2;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6300
     * @tc.name int8ArrayIndexSetPart04Test063
     * @tc.desc Verify $_get(2) returns 99 after $_set(0, 99) and reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      arr.reverse();
      let valueAt2: number = arr.$_get(2);
      let expected1: int = 99;
      expect(valueAt2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6400
     * @tc.name int8ArrayIndexSetPart04Test064
     * @tc.desc Verify $_get(0) returns 0 after $_set(0, 99) and fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(0, 99);
      arr.fill(0);
      let valueAt0: number = arr.$_get(0);
      let expected1: int = 0;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6500
     * @tc.name int8ArrayIndexSetPart04Test065
     * @tc.desc Verify $_set(-2, 99) throws RangeError for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      try {
        arr.$_set(-2, 99);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6600
     * @tc.name int8ArrayIndexSetPart04Test066
     * @tc.desc Verify $_set(-3, 99) throws RangeError for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(-3, 99);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6700
     * @tc.name int8ArrayIndexSetPart04Test067
     * @tc.desc Verify $_set(-4, 99) throws RangeError for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(-4, 99);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6800
     * @tc.name int8ArrayIndexSetPart04Test068
     * @tc.desc Verify lastIndexOf(50) returns 1 after $_set(1, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 2, 1]);
      arr.$_set(1, 50);
      let lastIndexOfResult: int = arr.lastIndexOf(50);
      let expected1: int = 1;
      expect(lastIndexOfResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_6900
     * @tc.name int8ArrayIndexSetPart04Test069
     * @tc.desc Verify $_set no-op, throws RangeError for out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 3);
      try {
        arr.$_set(5, 99);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
      let valueAt0: number = view.$_get(0);
      let expected1: int = 1;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_7000
     * @tc.name int8ArrayIndexSetPart04Test070
     * @tc.desc Verify $_set length no-op, throws RangeError for out-of-bounds index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        let errName: string = e.name;
        let expected1: string = 'RangeError';
        expect(errName).assertEqual(expected1);
      }
      let lenResult: int = arr.length;
      let expected1: int = 3;
      expect(lenResult).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_7100
     * @tc.name int8ArrayIndexSetPart04Test071
     * @tc.desc Verify $_set(1, Number.POSITIVE_INFINITY) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let view: Int8Array = arr.subarray(0, 3);
      arr.$_set(1, Number.POSITIVE_INFINITY);
      let valueAt1: number = view.$_get(1);
      let expected1: int = 0;
      expect(valueAt1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_7200
     * @tc.name int8ArrayIndexSetPart04Test072
     * @tc.desc Verify $_set(0, Number.NEGATIVE_INFINITY) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(0, Number.NEGATIVE_INFINITY);
      let copy: Int8Array = arr.slice(0, 1);
      let valueAt0: number = copy.$_get(0);
      let expected1: int = 0;
      expect(valueAt0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_INDEX_SET_PART04_TEST_7300
     * @tc.name int8ArrayIndexSetPart04Test073
     * @tc.desc Verify $_set(1, Number.MAX_VALUE) assigns value to element at specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayIndexSetPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      arr.$_set(1, Number.MAX_VALUE);
      let captured: number = 0;
      arr.forEach((value: number, index: int, array: Int8Array) => {
        if (index === 1) captured = value;
      });
      expect(captured).assertEqual(0);
    });
  });
}
