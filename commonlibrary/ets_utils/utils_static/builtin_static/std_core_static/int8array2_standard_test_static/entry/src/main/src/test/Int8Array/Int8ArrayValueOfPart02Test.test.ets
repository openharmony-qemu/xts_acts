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

export default function int8ArrayValueOfPart02Test(): void {
  describe('Int8ArrayValueOfPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0100
     * @tc.name int8ArrayValueOfPart02Test001
     * @tc.desc Verify valueOf() on empty Int8Array returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
      let bpe: int = result.BYTES_PER_ELEMENT;
      let expected: int = 1;
      expect(bpe).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0200
     * @tc.name int8ArrayValueOfPart02Test002
     * @tc.desc Verify valueOf() on ArrayBuffer-constructed Int8Array returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 4, 2);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
      let resultLen: int = result.length;
      let expectedLen: int = 2;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0300
     * @tc.name int8ArrayValueOfPart02Test003
     * @tc.desc Verify valueOf() returns the same array after set() mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      arr.set([30], 1);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
      let mutatedVal: number = result.$_get(1);
      let expectedMutated: int = 30;
      expect(mutatedVal).assertEqual(expectedMutated);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0400
     * @tc.name int8ArrayValueOfPart02Test004
     * @tc.desc Verify valueOf() returns the same single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1]);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
      let firstVal: number = result.$_get(0);
      let expectedFirst: int = 1;
      expect(firstVal).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0500
     * @tc.name int8ArrayValueOfPart02Test005
     * @tc.desc Verify valueOf() on buffer view returns the same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
      let resultLen: int = result.length;
      let expectedLen: int = 4;
      expect(resultLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0600
     * @tc.name int8ArrayValueOfPart02Test006
     * @tc.desc Verify valueOf() length property returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: Int8Array = arr.valueOf();
      let len: int = result.length;
      let expected: int = 3;
      expect(len).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0700
     * @tc.name int8ArrayValueOfPart02Test007
     * @tc.desc Verify valueOf() returns the same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0800
     * @tc.name int8ArrayValueOfPart02Test008
     * @tc.desc Verify valueOf()[0] returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42, -42, 0]);
      let r1Val: number = arr.valueOf()[0];
      let e1Val: int = 42;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_0900
     * @tc.name int8ArrayValueOfPart02Test009
     * @tc.desc Verify -128 valueOf()[0] -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let r1Val: number = arr.valueOf()[0];
      let e1Val: number = INT8_MIN;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1000
     * @tc.name int8ArrayValueOfPart02Test010
     * @tc.desc Verify 127 valueOf()[0] 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let r1Val: number = arr.valueOf()[0];
      let e1Val: number = INT8_MAX;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1100
     * @tc.name int8ArrayValueOfPart02Test011
     * @tc.desc Verify valueOf() length equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r1Val: int = arr.valueOf().length;
      let e1Val: int = arr.length;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1200
     * @tc.name int8ArrayValueOfPart02Test012
     * @tc.desc Verify valueOf() on empty array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: Int8Array = arr.valueOf();
      let len: int = result.length;
      let expected: int = 0;
      expect(len).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1300
     * @tc.name int8ArrayValueOfPart02Test013
     * @tc.desc Verify valueOf().length length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 0, 3);
      let result: Int8Array = arr.valueOf();
      let len: int = result.length;
      let expected: int = 3;
      expect(len).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1400
     * @tc.name int8ArrayValueOfPart02Test014
     * @tc.desc Verify 100 valueOf().length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let result: Int8Array = arr.valueOf();
      let len: int = result.length;
      let expected: int = 100;
      expect(len).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1500
     * @tc.name int8ArrayValueOfPart02Test015
     * @tc.desc Verify valueOf() byteLength equals array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r1Val: int = arr.valueOf().byteLength;
      let e1Val: int = arr.byteLength;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1600
     * @tc.name int8ArrayValueOfPart02Test016
     * @tc.desc Verify valueOf().byteLength byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int8Array = new Int8Array(buf, 4, 6);
      let r1Val: int = arr.valueOf().byteLength;
      let e1Val: int = 6;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1700
     * @tc.name int8ArrayValueOfPart02Test017
     * @tc.desc Verify valueOf() byteOffset equals view offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int8Array = new Int8Array(buf, 4, 6);
      let r1Val: int = arr.valueOf().byteOffset;
      let e1Val: int = arr.byteOffset;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1800
     * @tc.name int8ArrayValueOfPart02Test018
     * @tc.desc Verify valueOf() byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1Val: int = arr.valueOf().byteOffset;
      let e1Val: int = 0;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_1900
     * @tc.name int8ArrayValueOfPart02Test019
     * @tc.desc Verify offset=2 valueOf().byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let r1Val: int = arr.valueOf().byteOffset;
      let e1Val: int = 2;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2000
     * @tc.name int8ArrayValueOfPart02Test020
     * @tc.desc Verify offset=0 valueOf().byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      let r1Val: int = arr.valueOf().byteOffset;
      let e1Val: int = 0;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2100
     * @tc.name int8ArrayValueOfPart02Test021
     * @tc.desc Verify valueOf() keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: number = arr.length;
      arr.valueOf();
      let r1Val: int = arr.length;
      let e1Val = before;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2200
     * @tc.name int8ArrayValueOfPart02Test022
     * @tc.desc Verify valueOf() leaves first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42, -42, 0]);
      arr.valueOf();
      let r1Val: number = arr[0];
      let e1Val: int = 42;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2300
     * @tc.name int8ArrayValueOfPart02Test023
     * @tc.desc Verify valueOf() leaves last element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 99]);
      arr.valueOf();
      let r1Val: number = arr[2];
      let e1Val: int = 99;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2400
     * @tc.name int8ArrayValueOfPart02Test024
     * @tc.desc Verify valueOf() keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let before: number = arr.byteLength;
      arr.valueOf();
      let r1Val: int = arr.byteLength;
      let e1Val = before;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2500
     * @tc.name int8ArrayValueOfPart02Test025
     * @tc.desc Verify valueOf() keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int8Array = new Int8Array(buf, 4, 6);
      let before: number = arr.byteOffset;
      arr.valueOf();
      let r1Val: int = arr.byteOffset;
      let e1Val = before;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2600
     * @tc.name int8ArrayValueOfPart02Test026
     * @tc.desc Verify valueOf() keeps buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.valueOf();
      let r1Val: ArrayBuffer = arr.buffer;
      let e1Val: ArrayBuffer = bufBefore;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2700
     * @tc.name int8ArrayValueOfPart02Test027
     * @tc.desc Verify valueOf() leaves toString unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3]);
      let before: string = arr.toString();
      arr.valueOf();
      let r1Val: string = arr.toString();
      let e1Val = before;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2800
     * @tc.name int8ArrayValueOfPart02Test028
     * @tc.desc Verify valueOf() leaves join('-') unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: string = arr.join('-');
      arr.valueOf();
      let r1Val: string = arr.join('-');
      let e1Val = before;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_2900
     * @tc.name int8ArrayValueOfPart02Test029
     * @tc.desc Verify valueOf() twice returns same this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1Val: Int8Array = arr.valueOf().valueOf();
      let e1Val: Int8Array = arr;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3000
     * @tc.name int8ArrayValueOfPart02Test030
     * @tc.desc Verify valueOf() thrice returns same this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 10, 15]);
      let r1Val: Int8Array = arr.valueOf().valueOf().valueOf();
      let e1Val: Int8Array = arr;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3100
     * @tc.name int8ArrayValueOfPart02Test031
     * @tc.desc Verify valueOf() returns the same Int8Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let r1Val: Int8Array = arr.valueOf();
      expect(r1Val).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3200
     * @tc.name int8ArrayValueOfPart02Test032
     * @tc.desc Verify valueOf().at(-1) equals arr.at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33]);
      let r1Val = arr.valueOf().at(-1);
      let e1Val = arr.at(-1);
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3300
     * @tc.name int8ArrayValueOfPart02Test033
     * @tc.desc Verify arr.valueOf()[0] = 99 99 this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.valueOf()[0] = 99;
      let r1Val: number = arr[0];
      let e1Val: int = 99;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3400
     * @tc.name int8ArrayValueOfPart02Test034
     * @tc.desc Verify arr.valueOf().fill(0) 0 this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.valueOf().fill(0);
      let r1Val: number = arr[2];
      let e1Val: int = 0;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3500
     * @tc.name int8ArrayValueOfPart02Test035
     * @tc.desc Verify reverse() on valueOf() mutates source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.valueOf().reverse();
      let r1Val: number = arr[0];
      let e1Val: int = 3;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3600
     * @tc.name int8ArrayValueOfPart02Test036
     * @tc.desc Verify sort() on valueOf() mutates source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.valueOf().sort();
      let r1Val: number = arr[0];
      let e1Val: int = 1;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3700
     * @tc.name int8ArrayValueOfPart02Test037
     * @tc.desc Verify arr.valueOf().copyWithin(0, 2) this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.valueOf().copyWithin(0, 2);
      let r1Val: number = arr[0];
      let e1Val: int = 3;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3800
     * @tc.name int8ArrayValueOfPart02Test038
     * @tc.desc Verify arr.valueOf().subarray(0, 2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sub: Int8Array = arr.valueOf().subarray(0, 2);
      sub[0] = 99;
      let r1Val: number = arr[0];
      let e1Val: int = 99;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_3900
     * @tc.name int8ArrayValueOfPart02Test039
     * @tc.desc Verify valueOf().buffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1Val: ArrayBuffer = arr.valueOf().buffer;
      let e1Val: ArrayBuffer = arr.buffer;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4000
     * @tc.name int8ArrayValueOfPart02Test040
     * @tc.desc Verify ArrayBuffer.isView(valueOf()) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1Val: boolean = ArrayBuffer.isView(arr.valueOf());
      expect(r1Val).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4100
     * @tc.name int8ArrayValueOfPart02Test041
     * @tc.desc Verify valueOf() buffer.byteLength equals array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r1Val: int = arr.valueOf().buffer.byteLength;
      let e1Val: int = arr.buffer.byteLength;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4200
     * @tc.name int8ArrayValueOfPart02Test042
     * @tc.desc Verify valueOf() result shares mutations with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let ref: Int8Array = arr.valueOf();
      arr[1] = 88;
      let r1Val: number = ref[1];
      let e1Val: int = 88;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4300
     * @tc.name int8ArrayValueOfPart02Test043
     * @tc.desc Verify valueOf() result write visible through buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      arr.valueOf()[0] = 55;
      let view: Int8Array = new Int8Array(buf);
      let r1Val: number = view[0];
      let e1Val: int = 55;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4400
     * @tc.name int8ArrayValueOfPart02Test044
     * @tc.desc Verify valueOf() on views shares same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr1: Int8Array = new Int8Array(buf, 0, 4);
      let arr2: Int8Array = new Int8Array(buf, 4, 4);
      let r1Val: ArrayBuffer = arr1.valueOf().buffer;
      let e1Val: ArrayBuffer = arr2.valueOf().buffer;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4500
     * @tc.name int8ArrayValueOfPart02Test045
     * @tc.desc Verify valueOf().buffer equals source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let r1Val: ArrayBuffer = arr.valueOf().buffer;
      let e1Val: ArrayBuffer = buf;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4600
     * @tc.name int8ArrayValueOfPart02Test046
     * @tc.desc Verify valueOf() subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let ref: Int8Array = arr.valueOf();
      let sub: Int8Array = ref.subarray(1, 3);
      sub[0] = 44;
      let r1Val: number = arr[1];
      let e1Val: int = 44;
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4700
     * @tc.name int8ArrayValueOfPart02Test047
     * @tc.desc Verify new Int8Array(4) valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4800
     * @tc.name int8ArrayValueOfPart02Test048
     * @tc.desc Verify valueOf() on from-created array returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3]);
      let arr: Int8Array = new Int8Array(src);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_4900
     * @tc.name int8ArrayValueOfPart02Test049
     * @tc.desc Verify new Int8Array(buf, 0, 4) valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_5000
     * @tc.name int8ArrayValueOfPart02Test050
     * @tc.desc Verify new Int8Array(buf, 2, 2) offset valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 2);
      let result: Int8Array = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_5100
     * @tc.name int8ArrayValueOfPart02Test051
     * @tc.desc Verify valueOf() returns equal references on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: Int8Array = arr.valueOf();
      let r2: Int8Array = arr.valueOf();
      expect(r1).assertEqual(arr);
      expect(r2).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_5200
     * @tc.name int8ArrayValueOfPart02Test052
     * @tc.desc Verify valueOf() returns each own this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int8Array = new Int8Array([1, 2, 3]);
      let arr2: Int8Array = new Int8Array([1, 2, 3]);
      let r1Val: Int8Array = arr1.valueOf();
      let e1Val: Int8Array = arr1;
      expect(r1Val).assertEqual(e1Val);
      let r2Val: Int8Array = arr2.valueOf();
      let e2Val: Int8Array = arr2;
      expect(r2Val).assertEqual(e2Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_5300
     * @tc.name int8ArrayValueOfPart02Test053
     * @tc.desc Verify valueOf() toString() toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -2, 3]);
      let r1Val: string = arr.valueOf().toString();
      let e1Val: string = arr.toString();
      expect(r1Val).assertEqual(e1Val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUE_OF_PART02_TEST_5400
     * @tc.name int8ArrayValueOfPart02Test054
     * @tc.desc Verify valueOf() join(',') join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValueOfPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1Val: string = arr.valueOf().join(',');
      let e1Val: string = arr.join(',');
      expect(r1Val).assertEqual(e1Val);
    });
  });
}
