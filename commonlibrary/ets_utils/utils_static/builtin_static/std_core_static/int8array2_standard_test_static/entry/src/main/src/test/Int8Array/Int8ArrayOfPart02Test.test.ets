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

export default function int8ArrayOfPart02Test(): void {
  describe('Int8ArrayOfPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0100
     * @tc.name int8ArrayOfPart02Test001
     * @tc.desc Verify of(0.0) single parameter returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(0.0);
      let elementCount: int = result.length;
      let expected1: int = 1;
      expect(elementCount).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0200
     * @tc.name int8ArrayOfPart02Test002
     * @tc.desc Verify of(0.0, 0.0) two parameters returns length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(0.0, 0.0);
      let elementCount: int = result.length;
      let expected1: int = 2;
      expect(elementCount).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0300
     * @tc.name int8ArrayOfPart02Test003
     * @tc.desc Verify of with 16 parameters preserves length and head/tail order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(
        11.0,
        12.0,
        13.0,
        14.0,
        15.0,
        16.0,
        17.0,
        18.0,
        19.0,
        20.0,
        21.0,
        22.0,
        23.0,
        24.0,
        25.0,
        26.0,
      );
      let elementCount: int = result.length;
      let expected1: int = 16;
      expect(elementCount).assertEqual(expected1);
      let firstElement: number = result.$_get(0);
      let expected2: int = 11;
      expect(firstElement).assertEqual(expected2);
      let elementAt15: number = result.$_get(15);
      let expected3: int = 26;
      expect(elementAt15).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0400
     * @tc.name int8ArrayOfPart02Test004
     * @tc.desc Verify of(7.0, 8.0, 9.0) ascending input writes sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(7.0, 8.0, 9.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = 7;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: int = 8;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = 9;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0500
     * @tc.name int8ArrayOfPart02Test005
     * @tc.desc Verify of(-128.0) minimum value preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-128.0);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0600
     * @tc.name int8ArrayOfPart02Test006
     * @tc.desc Verify of(127.0) maximum value preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(127.0);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_0700
     * @tc.name int8ArrayOfPart02Test007
     * @tc.desc Verify of(-1.0) negative unit preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-1.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = -1;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1200
     * @tc.name int8ArrayOfPart02Test012
     * @tc.desc Verify of(129.0) wraps to -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(129.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = -127;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1300
     * @tc.name int8ArrayOfPart02Test013
     * @tc.desc Verify of(-256.0) full negative cycle wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-256.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1400
     * @tc.name int8ArrayOfPart02Test014
     * @tc.desc Verify of(1.9) truncates toward zero to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.9);
      let firstElement: number = result.$_get(0);
      let expected1: int = 1;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1500
     * @tc.name int8ArrayOfPart02Test015
     * @tc.desc Verify of(-1.9) truncates toward zero to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-1.9);
      let firstElement: number = result.$_get(0);
      let expected1: int = -1;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1600
     * @tc.name int8ArrayOfPart02Test016
     * @tc.desc Verify of(-0.5) negative fraction truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-0.5);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1700
     * @tc.name int8ArrayOfPart02Test017
     * @tc.desc Verify of(127.9) in-range float truncates to 127 without wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(127.9);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1800
     * @tc.name int8ArrayOfPart02Test018
     * @tc.desc Verify of(-128.9) in-range negative float truncates to -128 without wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-128.9);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_1900
     * @tc.name int8ArrayOfPart02Test019
     * @tc.desc Verify of(128.9) truncates to 128 then wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(128.9);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2000
     * @tc.name int8ArrayOfPart02Test020
     * @tc.desc Verify of(0.1 + 0.2) float arithmetic result truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(0.1 + 0.2);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2100
     * @tc.name int8ArrayOfPart02Test021
     * @tc.desc Verify of(Number.NaN) converts Number.NaN to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(Number.NaN);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2200
     * @tc.name int8ArrayOfPart02Test022
     * @tc.desc Verify of(Number.POSITIVE_INFINITY) converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(Number.POSITIVE_INFINITY);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2300
     * @tc.name int8ArrayOfPart02Test023
     * @tc.desc Verify of(Number.NEGATIVE_INFINITY) converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(Number.NEGATIVE_INFINITY);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2400
     * @tc.name int8ArrayOfPart02Test024
     * @tc.desc Verify of(-0.0) negative zero converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-0.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2500
     * @tc.name int8ArrayOfPart02Test025
     * @tc.desc Verify of(127.0, -128.0, 0.0) bounds and zero mixed conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(127.0, -128.0, 0.0);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = 0;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2600
     * @tc.name int8ArrayOfPart02Test026
     * @tc.desc Verify of(128.0, Number.NaN, Number.POSITIVE_INFINITY) wrap/Number.NaN/infinity mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(128.0, Number.NaN, Number.POSITIVE_INFINITY);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: int = 0;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = 0;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2700
     * @tc.name int8ArrayOfPart02Test027
     * @tc.desc Verify of(1.9, 255.0, -1.9) float truncate, integer wrap, negative float truncate mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.9, 255.0, -1.9);
      let firstElement: number = result.$_get(0);
      let expected1: int = 1;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: int = -1;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = -1;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2800
     * @tc.name int8ArrayOfPart02Test028
     * @tc.desc Verify of(256.0, -256.0, Number.NaN) three special values all convert to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(256.0, -256.0, Number.NaN);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: int = 0;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = 0;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_2900
     * @tc.name int8ArrayOfPart02Test029
     * @tc.desc Verify of(0.0, -0.0, 0.5, -0.5) zero family four elements all convert to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(0.0, -0.0, 0.5, -0.5);
      let elementCount: int = result.length;
      let expected1: int = 4;
      expect(elementCount).assertEqual(expected1);
      let firstElement: number = result.$_get(0);
      let expected2: int = 0;
      expect(firstElement).assertEqual(expected2);
      let fourthElement: number = result.$_get(3);
      let expected3: int = 0;
      expect(fourthElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3000
     * @tc.name int8ArrayOfPart02Test030
     * @tc.desc Verify of(127.0, 127.0, 127.0) repeated maximum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(127.0, 127.0, 127.0);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: number = INT8_MAX;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3100
     * @tc.name int8ArrayOfPart02Test031
     * @tc.desc Verify of(255.0 + 1) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(255.0 + 1);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3200
     * @tc.name int8ArrayOfPart02Test032
     * @tc.desc Verify of(255.0 - 1) wraps to -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(255.0 - 1);
      let firstElement: number = result.$_get(0);
      let expected1: int = -2;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3300
     * @tc.name int8ArrayOfPart02Test033
     * @tc.desc Verify of(1.0, 2.0, 3.0) return value name is 'Int8Array'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let actualName: string = result.name;
      let expectedName: string = 'Int8Array';
      expect(actualName).assertEqual(expectedName);
      let r1: string = result.join(',');
      let e1: string = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3400
     * @tc.name int8ArrayOfPart02Test034
     * @tc.desc Verify of(1.0, 2.0, 3.0) return value length equals parameter count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let elementCount: int = result.length;
      let expected1: int = 3;
      expect(elementCount).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3500
     * @tc.name int8ArrayOfPart02Test035
     * @tc.desc Verify of(1.0, 2.0, 3.0) byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let byteOffsetValue: int = result.byteOffset;
      let expected1: int = 0;
      expect(byteOffsetValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3600
     * @tc.name int8ArrayOfPart02Test036
     * @tc.desc Verify of(1.0, 2.0, 3.0) buffer is viewable as new Int8Array with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let view: Int8Array = new Int8Array(result.buffer);
      let viewLen: int = view.length;
      let expected1: int = 3;
      expect(viewLen).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3700
     * @tc.name int8ArrayOfPart02Test037
     * @tc.desc Verify of(1.0, 2.0, 3.0) buffer.byteLength equals element count 3 without overallocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let bufferByteLength: int = result.buffer.byteLength;
      let expected1: int = 3;
      expect(bufferByteLength).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3800
     * @tc.name int8ArrayOfPart02Test038
     * @tc.desc Verify of(1.0, 2.0, 3.0) first element via $_get(0) is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = 1;
      expect(firstElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_3900
     * @tc.name int8ArrayOfPart02Test039
     * @tc.desc Verify of(1.0, 2.0, 3.0) last element via $_get(2) is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let thirdElement: number = result.$_get(2);
      let expected1: int = 3;
      expect(thirdElement).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4000
     * @tc.name int8ArrayOfPart02Test040
     * @tc.desc Verify of(1.0, 2.0, 3.0) toString is comma-separated '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let textValue: string = result.toString();
      let expected1: string = '1,2,3';
      expect(textValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4100
     * @tc.name int8ArrayOfPart02Test041
     * @tc.desc Verify of(1.0, 2.0, 3.0) join with custom separator '|' produces '1|2|3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let joinedText: string = result.join('|');
      let expected1: string = '1|2|3';
      expect(joinedText).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4200
     * @tc.name int8ArrayOfPart02Test042
     * @tc.desc Verify of() empty array toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of();
      let textValue: string = result.toString();
      let expected1: string = '';
      expect(textValue).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4300
     * @tc.name int8ArrayOfPart02Test043
     * @tc.desc Verify result of of with doubles supports slice returning length two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let sliced: Int8Array = result.slice(0, 2);
      let slicedLength: int = sliced.length;
      let expected1: int = 2;
      expect(slicedLength).assertEqual(expected1);
      let secondElement: number = sliced.$_get(1);
      let expected2: int = 2;
      expect(secondElement).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4400
     * @tc.name int8ArrayOfPart02Test044
     * @tc.desc Verify result of of with doubles supports subarray shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let view: Int8Array = result.subarray(1);
      let viewLength: int = view.length;
      let expected1: int = 2;
      expect(viewLength).assertEqual(expected1);
      let firstElement: number = view.$_get(0);
      let expected2: int = 2;
      expect(firstElement).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4500
     * @tc.name int8ArrayOfPart02Test045
     * @tc.desc Verify result of of supports reverse in place returning itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let reversed: Int8Array = result.reverse();
      let firstElement: number = reversed.$_get(0);
      let expected1: int = 3;
      expect(firstElement).assertEqual(expected1);
      let thirdElement: number = reversed.$_get(2);
      let expected2: int = 1;
      expect(thirdElement).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4600
     * @tc.name int8ArrayOfPart02Test046
     * @tc.desc Verify return value supports indexOf locating element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let foundIndex: number = result.indexOf(2.0);
      let expected1: int = 1;
      expect(foundIndex).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4700
     * @tc.name int8ArrayOfPart02Test047
     * @tc.desc Verify result of of includes existing element returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let hasTarget: boolean = result.includes(3.0);
      expect(hasTarget).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_4800
     * @tc.name int8ArrayOfPart02Test048
     * @tc.desc Verify result of of includes missing element returning false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(1.0, 2.0, 3.0);
      let hasTarget: boolean = result.includes(99.0);
      expect(hasTarget).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_5000
     * @tc.name int8ArrayOfPart02Test050
     * @tc.desc Verify of(0.0, 128.0, 0.0) middle element wrap does not contaminate adjacent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(0.0, 128.0, 0.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = 0;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = 0;
      expect(thirdElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_5100
     * @tc.name int8ArrayOfPart02Test051
     * @tc.desc Verify of(255.0, 256.0, 128.0, -129.0, 0.0) five element wrap chain each independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(255.0, 256.0, 128.0, -129.0, 0.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = -1;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: int = 0;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: number = INT8_MIN;
      expect(thirdElement).assertEqual(expected3);
      let fourthElement: number = result.$_get(3);
      let expected4: number = INT8_MAX;
      expect(fourthElement).assertEqual(expected4);
      let fifthElement: number = result.$_get(4);
      let expected5: int = 0;
      expect(fifthElement).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_5200
     * @tc.name int8ArrayOfPart02Test052
     * @tc.desc Verify of(127.0, 128.0) max adjacent to overflow preserved vs wrapped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(127.0, 128.0);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MAX;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: number = INT8_MIN;
      expect(secondElement).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_5300
     * @tc.name int8ArrayOfPart02Test053
     * @tc.desc Verify of(-128.0, -129.0) min adjacent to underflow preserved vs wrapped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(-128.0, -129.0);
      let firstElement: number = result.$_get(0);
      let expected1: number = INT8_MIN;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: number = INT8_MAX;
      expect(secondElement).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_5400
     * @tc.name int8ArrayOfPart02Test054
     * @tc.desc Verify of(256.0, 256.0) two wrap values both truncate to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(256.0, 256.0);
      let elementCount: int = result.length;
      let expected1: int = 2;
      expect(elementCount).assertEqual(expected1);
      let firstElement: number = result.$_get(0);
      let expected2: int = 0;
      expect(firstElement).assertEqual(expected2);
      let secondElement: number = result.$_get(1);
      let expected3: int = 0;
      expect(secondElement).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART02_5500
     * @tc.name int8ArrayOfPart02Test055
     * @tc.desc Verify of(255.0, 255.0, 255.0) three wrap values all wrap to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of(255.0, 255.0, 255.0);
      let firstElement: number = result.$_get(0);
      let expected1: int = -1;
      expect(firstElement).assertEqual(expected1);
      let secondElement: number = result.$_get(1);
      let expected2: int = -1;
      expect(secondElement).assertEqual(expected2);
      let thirdElement: number = result.$_get(2);
      let expected3: int = -1;
      expect(thirdElement).assertEqual(expected3);
    });
  });
}
