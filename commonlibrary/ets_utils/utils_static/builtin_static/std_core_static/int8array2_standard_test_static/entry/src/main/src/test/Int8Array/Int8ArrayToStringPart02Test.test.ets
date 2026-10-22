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

export default function int8ArrayToStringPart02Test(): void {
  describe('Int8ArrayToStringPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0100
     * @tc.name int8ArrayToStringPart02Test001
     * @tc.desc Verify toString() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let s: string = arr.toString();
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0200
     * @tc.name int8ArrayToStringPart02Test002
     * @tc.desc Verify toString() returns '7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let s: string = arr.toString();
      expect(s).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0300
     * @tc.name int8ArrayToStringPart02Test003
     * @tc.desc Verify toString() returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let s: string = arr.toString();
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0400
     * @tc.name int8ArrayToStringPart02Test004
     * @tc.desc Verify toString() returns '1,-2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3]);
      let toStringResult4 = arr.toString();
      expect(toStringResult4).assertEqual('1,-2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0500
     * @tc.name int8ArrayToStringPart02Test005
     * @tc.desc Verify toString() returns '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let toStringResult5 = arr.toString();
      expect(toStringResult5).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0600
     * @tc.name int8ArrayToStringPart02Test006
     * @tc.desc Verify toString() returns '1,2' and valueOf() length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let toStringResult6 = arr.toString();
      expect(toStringResult6).assertEqual('1,2');
      let actualLength: int = arr.valueOf().length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0700
     * @tc.name int8ArrayToStringPart02Test007
     * @tc.desc Verify toString() does not mutate original array type (name property remains Int8Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualName: string = arr.name;
      let expectedName: string = 'Int8Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0800
     * @tc.name int8ArrayToStringPart02Test008
     * @tc.desc Verify toString() does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_0900
     * @tc.name int8ArrayToStringPart02Test009
     * @tc.desc Verify toString() does not alter array name property before vs after invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([4, 5]);
      let before: string = arr.name;
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '4,5';
      expect(resultVal1).assertEqual(expectedVal1);
      let after: string = arr.name;
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1000
     * @tc.name int8ArrayToStringPart02Test010
     * @tc.desc Verify toString 0 '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: string = arr.toString();
      let expected: string = '0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1100
     * @tc.name int8ArrayToStringPart02Test011
     * @tc.desc Verify toString int8 -128 '-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1200
     * @tc.name int8ArrayToStringPart02Test012
     * @tc.desc Verify toString int8 127 '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = '127';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1300
     * @tc.name int8ArrayToStringPart02Test013
     * @tc.desc Verify toString -1 '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let result: string = arr.toString();
      let expected: string = '-1';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1400
     * @tc.name int8ArrayToStringPart02Test014
     * @tc.desc Verify toString on constructor-created [1, 2] returns '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: string = arr.toString();
      let expected: string = '1,2';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1500
     * @tc.name int8ArrayToStringPart02Test015
     * @tc.desc Verify toString [1, -1, 0] '1,-1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 0]);
      let result: string = arr.toString();
      let expected: string = '1,-1,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1600
     * @tc.name int8ArrayToStringPart02Test016
     * @tc.desc Verify toString [5, 5, 5] '5,5,5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let result: string = arr.toString();
      let expected: string = '5,5,5';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1700
     * @tc.name int8ArrayToStringPart02Test017
     * @tc.desc Verify toString 0 [0, 0, 0] '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: string = arr.toString();
      let expected: string = '0,0,0';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1800
     * @tc.name int8ArrayToStringPart02Test018
     * @tc.desc Verify toString [-128, -128, -128] '-128,-128,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let result: string = arr.toString();
      let expected: string = '-128,-128,-128';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_1900
     * @tc.name int8ArrayToStringPart02Test019
     * @tc.desc Verify toString().length === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 0;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2000
     * @tc.name int8ArrayToStringPart02Test020
     * @tc.desc Verify [0] toString().length === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 1;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2100
     * @tc.name int8ArrayToStringPart02Test021
     * @tc.desc Verify [-128] toString().length === 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 4;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2200
     * @tc.name int8ArrayToStringPart02Test022
     * @tc.desc Verify [127] toString().length === 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 3;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2300
     * @tc.name int8ArrayToStringPart02Test023
     * @tc.desc Verify [-1] toString().length === 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 2;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2400
     * @tc.name int8ArrayToStringPart02Test024
     * @tc.desc Verify [1, 2] toString().length === 3 '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 3;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2500
     * @tc.name int8ArrayToStringPart02Test025
     * @tc.desc Verify [1, -1, 0] toString().length === 6 '1,-1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 0]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 6;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2600
     * @tc.name int8ArrayToStringPart02Test026
     * @tc.desc Verify 0 toString().length === 5 '0,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 5;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2700
     * @tc.name int8ArrayToStringPart02Test027
     * @tc.desc Verify [127, -128] toString().length === 8 '127,-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let result: string = arr.toString();
      let resultLen: int = result.length;
      let expectedLen: int = 8;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2800
     * @tc.name int8ArrayToStringPart02Test028
     * @tc.desc Verify toString() length equals join(',') length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN, 0]);
      let toStringResult: string = arr.toString();
      let toStringLen: int = toStringResult.length;
      let joinResult: string = arr.join(',');
      let joinLen: int = joinResult.length;
      expect(toStringLen).assertEqual(joinLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_2900
     * @tc.name int8ArrayToStringPart02Test029
     * @tc.desc Verify toString() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3000
     * @tc.name int8ArrayToStringPart02Test030
     * @tc.desc Verify toString() does not mutate array length on a constructor-created [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3100
     * @tc.name int8ArrayToStringPart02Test031
     * @tc.desc Verify toString() does not mutate element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3200
     * @tc.name int8ArrayToStringPart02Test032
     * @tc.desc Verify toString() does not mutate element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = arr.$_get(2);
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3300
     * @tc.name int8ArrayToStringPart02Test033
     * @tc.desc Verify toString() does not mutate element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3400
     * @tc.name int8ArrayToStringPart02Test034
     * @tc.desc Verify toString() keeps buffer.byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualByteLength: int = arr.buffer.byteLength;
      let expectedByteLength: int = 3;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3500
     * @tc.name int8ArrayToStringPart02Test035
     * @tc.desc Verify toString() keeps byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '0,0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualOffset: int = arr.byteOffset;
      let expectedOffset: int = 2;
      expect(actualOffset).assertEqual(expectedOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3600
     * @tc.name int8ArrayToStringPart02Test036
     * @tc.desc Verify $_set works after toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      arr.$_set(0, 9);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 9;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3700
     * @tc.name int8ArrayToStringPart02Test037
     * @tc.desc Verify slice(0, 2) works after toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let sub: Int8Array = arr.slice(0, 2);
      let actualLength: int = sub.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3800
     * @tc.name int8ArrayToStringPart02Test038
     * @tc.desc Verify forEach visits 3 after toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let count: int = 0;
      arr.forEach((v: number, i: int) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return;
        }
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_3900
     * @tc.name int8ArrayToStringPart02Test039
     * @tc.desc Verify toString() does not change element order for indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualIndex: int = arr.indexOf(2);
      let expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4000
     * @tc.name int8ArrayToStringPart02Test040
     * @tc.desc Verify reverse works after toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      arr.reverse();
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4100
     * @tc.name int8ArrayToStringPart02Test041
     * @tc.desc Verify fill(0) works after toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      arr.fill(0);
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4200
     * @tc.name int8ArrayToStringPart02Test042
     * @tc.desc Verify toString() returns same string for repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let s1: string = arr.toString();
      let s2: string = arr.toString();
      let expected1: string = '1,2,3';
      expect(s1).assertEqual(expected1);
      expect(s2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4300
     * @tc.name int8ArrayToStringPart02Test043
     * @tc.desc Verify toString() returns same string for repeated calls [INT8_MIN, INT8_MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let s1: string = arr.toString();
      let s2: string = arr.toString();
      let expected1: string = '-128,127';
      expect(s1).assertEqual(expected1);
      expect(s2).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4400
     * @tc.name int8ArrayToStringPart02Test044
     * @tc.desc Verify toString() returns equal strings for equal arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array([1, -2, 3]);
      let b: Int8Array = new Int8Array([1, -2, 3]);
      let actualResult: string = b.toString();
      let expectedResult: string = a.toString();
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4500
     * @tc.name int8ArrayToStringPart02Test045
     * @tc.desc Verify toString() $_set toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      arr.$_set(0, 9);
      let s2: string = arr.toString();
      expect(s2).assertEqual('9,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4600
     * @tc.name int8ArrayToStringPart02Test046
     * @tc.desc Verify toString() equals join(',') on boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = arr.join(',');
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4700
     * @tc.name int8ArrayToStringPart02Test047
     * @tc.desc Verify toString() equals join() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, INT8_MAX]);
      let result: string = arr.toString();
      let expected: string = arr.join();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4800
     * @tc.name int8ArrayToStringPart02Test048
     * @tc.desc Verify toString() charCode 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let s: string = arr.toString();
      let actualCharCode: number = s.charCodeAt(0);
      let expectedCharCode: int = 45;
      expect(actualCharCode).assertEqual(expectedCharCode);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_4900
     * @tc.name int8ArrayToStringPart02Test049
     * @tc.desc Verify toString() charCode 49 '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1]);
      let s: string = arr.toString();
      let actualCharCode: number = s.charCodeAt(0);
      let expectedCharCode: int = 49;
      expect(actualCharCode).assertEqual(expectedCharCode);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_5000
     * @tc.name int8ArrayToStringPart02Test050
     * @tc.desc Verify toString() charCode 53 '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 5]);
      let s: string = arr.toString();
      let actualCharCode: number = s.charCodeAt(s.length - 1);
      let expectedCharCode: int = 53;
      expect(actualCharCode).assertEqual(expectedCharCode);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_5100
     * @tc.name int8ArrayToStringPart02Test051
     * @tc.desc Verify toString() result contains comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let s: string = arr.toString();
      let actualIndex: int = s.indexOf(',');
      let expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_5200
     * @tc.name int8ArrayToStringPart02Test052
     * @tc.desc Verify toString() indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let s: string = arr.toString();
      let actualIndex: int = s.indexOf(',');
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_5300
     * @tc.name int8ArrayToStringPart02Test053
     * @tc.desc Verify toString() contains no spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3]);
      let s: string = arr.toString();
      let actualIndex: int = s.indexOf(' ');
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_5400
     * @tc.name int8ArrayToStringPart02Test054
     * @tc.desc Verify toString() reflects sibling view write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let a: Int8Array = new Int8Array(buf, 0, 2);
      let b: Int8Array = new Int8Array(buf, 0, 2);
      a.$_set(0, 7);
      let actualResult: string = b.toString();
      let expectedResult: string = '7,0';
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOSTRING_PART02_5500
     * @tc.name int8ArrayToStringPart02Test055
     * @tc.desc Verify subarray toString() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToStringPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sub: Int8Array = arr.subarray(0, 2);
      arr.$_set(0, 9);
      let actualResult: string = sub.toString();
      let expectedResult: string = '9,2';
      expect(actualResult).assertEqual(expectedResult);
    });
  });
}
