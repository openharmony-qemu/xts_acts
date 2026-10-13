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
import Utils from './../Util.test';

export default function int8ArraySlicePart02Test(): void {
  describe('Int8ArraySlicePart02Test', (): void => {
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
    const INT8_ZERO = 0;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_0100
     * @tc.name int8ArraySlicePart02Test001
     * @tc.desc Verify slice() copies all elements and is independent of original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice();
      let joinResult: string = result.join(',');
      let expectedJoin: string = '1,2,3,4,5';
      expect(joinResult).assertEqual(expectedJoin);
      expect(result).not().assertEqual(arr);
      result.$_set(0, 99);
      let orig0: number = arr.$_get(0);
      let expectedOrig: int = 1;
      expect(orig0).assertEqual(expectedOrig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_0300
     * @tc.name int8ArraySlicePart02Test003
     * @tc.desc Verify slice(0, 0) returns empty Int8Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 0);
      let resultLen: int = result.length;
      let expectedLen: int = 0;
      expect(resultLen).assertEqual(expectedLen);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_0400
     * @tc.name int8ArraySlicePart02Test004
     * @tc.desc Verify slice(0, 100) copies all five elements when end is out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 100);
      let bytesPerElement: int = result.BYTES_PER_ELEMENT;
      let expected1: int = 1;
      expect(bytesPerElement).assertEqual(expected1);
      let joinResult: string = result.join(',');
      let expectedJoin: string = '1,2,3,4,5';
      expect(joinResult).assertEqual(expectedJoin);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_0500
     * @tc.name int8ArraySlicePart02Test005
     * @tc.desc Verify slice(100, 200) begin out-of-bounds returns empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(100, 200);
      let bytesPerElement: int = result.BYTES_PER_ELEMENT;
      let expected1: int = 1;
      expect(bytesPerElement).assertEqual(expected1);
      let resultLen: int = result.length;
      let expectedLen: int = 0;
      expect(resultLen).assertEqual(expectedLen);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_1400
     * @tc.name int8ArraySlicePart02Test014
     * @tc.desc Verify slice(3, 1) start greater than end returns empty slice with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(3, 1);
      let sliceLength: int = result.length;
      let expected1: int = 0;
      expect(sliceLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_1500
     * @tc.name int8ArraySlicePart02Test015
     * @tc.desc Verify slice containing -128 boundary value element returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 1, 2]);
      let result: Int8Array = arr.slice(0, 1);
      let element0: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_1600
     * @tc.name int8ArraySlicePart02Test016
     * @tc.desc Verify slice containing 127 boundary value element returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 1, 2]);
      let result: Int8Array = arr.slice(0, 1);
      let element0: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_1700
     * @tc.name int8ArraySlicePart02Test017
     * @tc.desc Verify slice containing 0 element returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_ZERO, 1, 2]);
      let result: Int8Array = arr.slice(0, 1);
      let element0: number = result.$_get(0);
      let expected1: int = 0;
      expect(element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_1800
     * @tc.name int8ArraySlicePart02Test018
     * @tc.desc Verify slice of array with all identical elements returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7, 7]);
      let result: Int8Array = arr.slice(1, 3);
      let element0: number = result.$_get(0);
      let expected1: int = 7;
      expect(element0).assertEqual(expected1);
      let element1: number = result.$_get(1);
      let expected2: int = 7;
      expect(element1).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_1900
     * @tc.name int8ArraySlicePart02Test019
     * @tc.desc Verify slice containing truncated wrap-around value 200 rounds to -56 and returns correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([200, 1, 2]);
      let result: Int8Array = arr.slice(0, 1);
      let element0: number = result.$_get(0);
      let expected1: int = -56;
      expect(element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_2300
     * @tc.name int8ArraySlicePart02Test023
     * @tc.desc Verify slice(1, 3) return value byteOffset equals 0 indicating copy starts from new buffer origin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(1, 3);
      let byteOffsetValue: int = result.byteOffset;
      let expected1: int = 0;
      expect(byteOffsetValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_2400
     * @tc.name int8ArraySlicePart02Test024
     * @tc.desc Verify slice() return value byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice();
      let byteOffsetValue: int = result.byteOffset;
      let expected1: int = 0;
      expect(byteOffsetValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_2500
     * @tc.name int8ArraySlicePart02Test025
     * @tc.desc Verify slice(-2) negative index slice return value byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(-2);
      let byteOffsetValue: int = result.byteOffset;
      let expected1: int = 0;
      expect(byteOffsetValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_2600
     * @tc.name int8ArraySlicePart02Test026
     * @tc.desc Verify slice return value length equals byteLength since Int8Array has 1 byte per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 3);
      let sliceLength: int = result.length;
      let expected1: int = result.byteLength;
      expect(sliceLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_2700
     * @tc.name int8ArraySlicePart02Test027
     * @tc.desc Verify slice(-2) return value length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(-2);
      let sliceLength: int = result.length;
      let expected1: int = 2;
      expect(sliceLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_2800
     * @tc.name int8ArraySlicePart02Test028
     * @tc.desc Verify original array length unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let resultVal1: Int8Array = arr.slice();
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let arrLength: int = arr.length;
      let expected1: int = 5;
      expect(arrLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_3600
     * @tc.name int8ArraySlicePart02Test036
     * @tc.desc Verify original array elements remain unchanged after multiple slice calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let resultVal1: Int8Array = arr.slice();
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let resultVal2: Int8Array = arr.slice(1, 3);
      let expectedVal2: Int8Array = new Int8Array([2, 3]);
      expect(resultVal2.toString()).assertEqual(expectedVal2.toString());
      let resultVal3: Int8Array = arr.slice(0, 1);
      let expectedVal3: Int8Array = new Int8Array([1]);
      expect(resultVal3.toString()).assertEqual(expectedVal3.toString());
      let arrElement0: number = arr.$_get(0);
      let expected1: int = 1;
      expect(arrElement0).assertEqual(expected1);
      let arrElement4: number = arr.$_get(4);
      let expected2: int = 5;
      expect(arrElement4).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_3700
     * @tc.name int8ArraySlicePart02Test037
     * @tc.desc Verify original array buffer reference unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let bufBefore: ArrayBuffer = arr.buffer;
      let resultVal1: Int8Array = arr.slice();
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let arrBuffer: ArrayBuffer = arr.buffer;
      let expected1: ArrayBuffer = bufBefore;
      expect(arrBuffer).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_3800
     * @tc.name int8ArraySlicePart02Test038
     * @tc.desc Verify original array buffer.byteLength unchanged after slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let resultVal1: Int8Array = arr.slice();
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let arrBufferByteLength: int = arr.buffer.byteLength;
      let expected1: int = 5;
      expect(arrBufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4200
     * @tc.name int8ArraySlicePart02Test042
     * @tc.desc Verify slice().slice() chained copy equals original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice().slice();
      let bytesPerElement: int = result.BYTES_PER_ELEMENT;
      let expected1: int = 1;
      expect(bytesPerElement).assertEqual(expected1);
      let joinResult: string = result.join(',');
      let expectedJoin: string = '1,2,3,4,5';
      expect(joinResult).assertEqual(expectedJoin);
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4300
     * @tc.name int8ArraySlicePart02Test043
     * @tc.desc Verify slice(1).slice(1) chained return value is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(1).slice(1);
      let element0: number = result.$_get(0);
      let expected1: int = 3;
      expect(element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4400
     * @tc.name int8ArraySlicePart02Test044
     * @tc.desc Verify slice().slice().slice() triple chained length is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice().slice().slice();
      let sliceLength: int = result.length;
      let expected1: int = 5;
      expect(sliceLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4500
     * @tc.name int8ArraySlicePart02Test045
     * @tc.desc Verify slice(0, 3).slice(0, 1) chained return value is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 3).slice(0, 1);
      let element0: number = result.$_get(0);
      let expected1: int = 1;
      expect(element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4600
     * @tc.name int8ArraySlicePart02Test046
     * @tc.desc Verify slice(0, 3) copy buffer.byteLength equals slice length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 3);
      let bufferByteLength: int = result.buffer.byteLength;
      let expected1: int = 3;
      expect(bufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4700
     * @tc.name int8ArraySlicePart02Test047
     * @tc.desc Verify slice(1, 3) copy buffer.byteLength equals slice length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(1, 3);
      let bufferByteLength: int = result.buffer.byteLength;
      let expected1: int = 2;
      expect(bufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4800
     * @tc.name int8ArraySlicePart02Test048
     * @tc.desc Verify slice() copy buffer.byteLength equals original buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice();
      let bufferByteLength: int = result.buffer.byteLength;
      let expected1: int = arr.buffer.byteLength;
      expect(bufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_4900
     * @tc.name int8ArraySlicePart02Test049
     * @tc.desc Verify slice(0, 0) copy buffer.byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 0);
      let bufferByteLength: int = result.buffer.byteLength;
      let expected1: int = 0;
      expect(bufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_5000
     * @tc.name int8ArraySlicePart02Test050
     * @tc.desc Verify slice() copy buffer.byteLength equals original array byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice();
      let bufferByteLength: int = result.buffer.byteLength;
      let expectedByteLength: int = 5;
      expect(bufferByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_5100
     * @tc.name int8ArraySlicePart02Test051
     * @tc.desc Verify three slice calls produce mutually independent copies by cross-mutation checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r1: Int8Array = arr.slice();
      let r2: Int8Array = arr.slice();
      let r3: Int8Array = arr.slice();
      r1.$_set(0, 99);
      let r2Element0: number = r2.$_get(0);
      let expected1: int = 1;
      expect(r2Element0).assertEqual(expected1);
      r2.$_set(0, 88);
      let r3Element0: number = r3.$_get(0);
      let expected2: int = 1;
      expect(r3Element0).assertEqual(expected2);
      let r1Element0: number = r1.$_get(0);
      let expected3: int = 99;
      expect(r1Element0).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_5200
     * @tc.name int8ArraySlicePart02Test052
     * @tc.desc Verify slice copy buffer byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: Int8Array = arr.slice(0, 3);
      result.$_set(0, 99);
      let bufferByteLength: int = result.buffer.byteLength;
      let expected1: int = 3;
      expect(bufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_5300
     * @tc.name int8ArraySlicePart02Test053
     * @tc.desc Verify two slice(0, 3) calls produce independent copies by mutating one and checking other unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let r1: Int8Array = arr.slice(0, 3);
      let r2: Int8Array = arr.slice(0, 3);
      r1.$_set(0, 99);
      let r2Element0: number = r2.$_get(0);
      let expected1: int = 1;
      expect(r2Element0).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SLICE_PART02_5400
     * @tc.name int8ArraySlicePart02Test054
     * @tc.desc Verify slice copy byteOffset is still 0 when original array byteOffset is nonzero from offset buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySlicePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 5);
      let result: Int8Array = arr.slice();
      let byteOffsetValue: int = result.byteOffset;
      let expected1: int = 0;
      expect(byteOffsetValue).assertEqual(expected1);
    });
  });
}
