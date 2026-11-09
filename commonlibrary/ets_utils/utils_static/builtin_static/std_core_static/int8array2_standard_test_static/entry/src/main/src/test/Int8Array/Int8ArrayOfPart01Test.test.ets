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

export default function int8ArrayOfPart01Test(): void {
  describe('Int8ArrayOfPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0100
     * @tc.name int8ArrayOfPart01Test001
     * @tc.desc Verify of() with no argument returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of();
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0200
     * @tc.name int8ArrayOfPart01Test002
     * @tc.desc Verify of(single byte) returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      let result: Int8Array = Int8Array.of(a);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0300
     * @tc.name int8ArrayOfPart01Test003
     * @tc.desc Verify of(two bytes) returns length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0400
     * @tc.name int8ArrayOfPart01Test004
     * @tc.desc Verify of(three bytes) returns length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -1;
      const b: byte = 0;
      const c: byte = 1;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0500
     * @tc.name int8ArrayOfPart01Test005
     * @tc.desc Verify of(four bytes) returns length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = -1;
      const c: byte = 1;
      const d: byte = 127;
      let result: Int8Array = Int8Array.of(a, b, c, d);
      let actualLength: int = result.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0600
     * @tc.name int8ArrayOfPart01Test006
     * @tc.desc Verify of(five bytes) returns length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = -1;
      const c: byte = 0;
      const d: byte = 1;
      const e: byte = 127;
      let result: Int8Array = Int8Array.of(a, b, c, d, e);
      let actualLength: int = result.length;
      let expectedLength: int = 5;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0700
     * @tc.name int8ArrayOfPart01Test007
     * @tc.desc Verify of(eight alternating extremes) returns length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: byte = -128;
      const max: byte = 127;
      let result: Int8Array = Int8Array.of(min, max, min, max, min, max, min, max);
      let actualLength: int = result.length;
      let expectedLength: int = 8;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0800
     * @tc.name int8ArrayOfPart01Test008
     * @tc.desc Verify of(byte -128) then get(0) equals -128 (minimum)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -128;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_0900
     * @tc.name int8ArrayOfPart01Test009
     * @tc.desc Verify of(byte 127) then get(0) equals 127 (maximum)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1000
     * @tc.name int8ArrayOfPart01Test010
     * @tc.desc Verify of(byte 0) then get(0) equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1100
     * @tc.name int8ArrayOfPart01Test011
     * @tc.desc Verify of(byte -1) then get(0) equals -1 (negative unit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -1;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1200
     * @tc.name int8ArrayOfPart01Test012
     * @tc.desc Verify of(byte 1) then get(0) equals 1 (positive unit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1300
     * @tc.name int8ArrayOfPart01Test013
     * @tc.desc Verify of(-128, 127) first element is -128 (dual extremes order preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1400
     * @tc.name int8ArrayOfPart01Test014
     * @tc.desc Verify of(127, -128) first element is 127 (reverse order dual extremes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 127;
      const b: byte = -128;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1500
     * @tc.name int8ArrayOfPart01Test015
     * @tc.desc Verify of(-128, -128, 127, 127) length is 4 (repeated extremes preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: byte = -128;
      const max: byte = 127;
      let result: Int8Array = Int8Array.of(min, min, max, max);
      let actualLength: int = result.length;
      let expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1600
     * @tc.name int8ArrayOfPart01Test016
     * @tc.desc Verify of(127, 0, -128) middle element is 0 (three-element middle value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 127;
      const b: byte = 0;
      const c: byte = -128;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualValue: number = result.$_get(1);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1700
     * @tc.name int8ArrayOfPart01Test017
     * @tc.desc Verify of(0, 0) second element is 0 (repeated zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 0;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(1);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1800
     * @tc.name int8ArrayOfPart01Test018
     * @tc.desc Verify of(127, 127, 127) length is 3 (three MAX repeats)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      let result: Int8Array = Int8Array.of(v, v, v);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_1900
     * @tc.name int8ArrayOfPart01Test019
     * @tc.desc Verify of(-128, -128, -128) length is 3 (three MIN repeats)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -128;
      let result: Int8Array = Int8Array.of(v, v, v);
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2000
     * @tc.name int8ArrayOfPart01Test020
     * @tc.desc Verify of(byte 128) truncates to -128 (overflow+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 128;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2100
     * @tc.name int8ArrayOfPart01Test021
     * @tc.desc Verify of(byte -129) truncates to 127 (underflow-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = -129;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2200
     * @tc.name int8ArrayOfPart01Test022
     * @tc.desc Verify of(byte 255) truncates to -1 (uint8 max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 255;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2300
     * @tc.name int8ArrayOfPart01Test023
     * @tc.desc Verify of(byte 256) truncates to 0 (complete wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 256;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2400
     * @tc.name int8ArrayOfPart01Test024
     * @tc.desc Verify of(byte -256) truncates to 0 (negative complete wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = -256;
      let result: Int8Array = Int8Array.of(v);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2500
     * @tc.name int8ArrayOfPart01Test025
     * @tc.desc Verify of(128, -129) first element truncates to -128 (paired truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 128;
      const b: number = -129;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2600
     * @tc.name int8ArrayOfPart01Test026
     * @tc.desc Verify of(255, 256) first element truncates to -1 (mixed wrap types)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 255;
      const b: number = 256;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2700
     * @tc.name int8ArrayOfPart01Test027
     * @tc.desc Verify of(200, -200) first element truncates to -56 (symmetric truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 200;
      const b: number = -200;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = -56;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2800
     * @tc.name int8ArrayOfPart01Test028
     * @tc.desc Verify of(128, 0, 255) first element truncates to -128 (truncation mixed with valid)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 128;
      const b: number = 0;
      const c: number = 255;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_2900
     * @tc.name int8ArrayOfPart01Test029
     * @tc.desc Verify of(127, 128) second element truncates to -128 (boundary crossing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 127;
      const b: number = 128;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue: number = result.$_get(1);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3000
     * @tc.name int8ArrayOfPart01Test030
     * @tc.desc Verify of(128) length is 1 (truncation does not affect length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 128;
      let result: Int8Array = Int8Array.of(v);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3100
     * @tc.name int8ArrayOfPart01Test031
     * @tc.desc Verify of(128, 256) byteLength is 2 (truncation does not affect byte length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = 128;
      const b: number = 256;
      let result: Int8Array = Int8Array.of(a, b);
      let actualByteLength: int = result.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3200
     * @tc.name int8ArrayOfPart01Test032
     * @tc.desc Verify of(255) truncation keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 255;
      let result: Int8Array = Int8Array.of(v);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3300
     * @tc.name int8ArrayOfPart01Test033
     * @tc.desc Verify of(MIN, 128, MAX, -129) second element truncates to -128 (boundary and truncation mixed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = -128;
      const b: number = 128;
      const c: number = 127;
      const d: number = -129;
      let result: Int8Array = Int8Array.of(a, b, c, d);
      let actualValue: number = result.$_get(1);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3400
     * @tc.name int8ArrayOfPart01Test034
     * @tc.desc Verify of(MIN, 128, MAX, -129) fourth element truncates to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = -128;
      const b: number = 128;
      const c: number = 127;
      const d: number = -129;
      let result: Int8Array = Int8Array.of(a, b, c, d);
      let actualValue: number = result.$_get(3);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3500
     * @tc.name int8ArrayOfPart01Test035
     * @tc.desc Verify of(1, 2) returns length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualLength: int = result.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3600
     * @tc.name int8ArrayOfPart01Test036
     * @tc.desc Verify of(1, 2) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualByteOffset: int = result.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3700
     * @tc.name int8ArrayOfPart01Test037
     * @tc.desc Verify of(1, 2) buffer.byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualByteLength: int = result.buffer.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3800
     * @tc.name int8ArrayOfPart01Test038
     * @tc.desc Verify of(-128, 127) byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let actualByteLength: int = result.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_3900
     * @tc.name int8ArrayOfPart01Test039
     * @tc.desc Verify of(1) buffer.byteLength equals 1 (single element buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      let result: Int8Array = Int8Array.of(v);
      let actualByteLength: int = result.buffer.byteLength;
      let expectedByteLength: int = 1;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4000
     * @tc.name int8ArrayOfPart01Test040
     * @tc.desc Verify of() buffer.byteLength equals 0 (empty array buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of();
      let actualByteLength: int = result.buffer.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4100
     * @tc.name int8ArrayOfPart01Test041
     * @tc.desc Verify of(-1, 1) at(0) returns first element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -1;
      const b: byte = 1;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue = result.at(0);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4200
     * @tc.name int8ArrayOfPart01Test042
     * @tc.desc Verify of(-128, 127) at(-1) returns last element 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let actualValue = result.at(-1);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4300
     * @tc.name int8ArrayOfPart01Test043
     * @tc.desc Verify of(0, 1, -1) at(length-1) returns last element -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      const c: byte = -1;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualValue = result.at(result.length - 1);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4400
     * @tc.name int8ArrayOfPart01Test044
     * @tc.desc Verify of(1, 2) at(length) out-of-bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      expect(result.at(result.length)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4500
     * @tc.name int8ArrayOfPart01Test045
     * @tc.desc Verify of(1, 2) at(-length-1) negative out-of-bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      expect(result.at(-result.length - 1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4600
     * @tc.name int8ArrayOfPart01Test046
     * @tc.desc Verify of(1) at(0) equals 1 (single element positive index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      let result: Int8Array = Int8Array.of(v);
      let actualValue = result.at(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4700
     * @tc.name int8ArrayOfPart01Test047
     * @tc.desc Verify of(-1) at(-1) equals -1 (single element negative index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -1;
      let result: Int8Array = Int8Array.of(v);
      let actualValue = result.at(-1);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4800
     * @tc.name int8ArrayOfPart01Test048
     * @tc.desc Verify of(0, 1, -1, 127, -128) at(3) equals 127 (5-element middle index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      const c: byte = -1;
      const d: byte = 127;
      const e: byte = -128;
      let result: Int8Array = Int8Array.of(a, b, c, d, e);
      let actualValue = result.at(3);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_4900
     * @tc.name int8ArrayOfPart01Test049
     * @tc.desc Verify of(0, 1, -1, 127, -128) at(-2) equals 127 (5-element negative index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      const c: byte = -1;
      const d: byte = 127;
      const e: byte = -128;
      let result: Int8Array = Int8Array.of(a, b, c, d, e);
      let actualValue = result.at(-2);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5000
     * @tc.name int8ArrayOfPart01Test050
     * @tc.desc Verify of(1, 2) join(',') equals '1,2' (default comma separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualStr: string = result.join(',');
      let expectedStr: string = '1,2';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5100
     * @tc.name int8ArrayOfPart01Test051
     * @tc.desc Verify of(1, 2) join('') equals '12' (empty separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualStr: string = result.join('');
      let expectedStr: string = '12';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5200
     * @tc.name int8ArrayOfPart01Test052
     * @tc.desc Verify of(0, 1, -1) join('-') equals '0-1--1' (custom separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      const c: byte = -1;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualStr: string = result.join('-');
      let expectedStr: string = '0-1--1';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5300
     * @tc.name int8ArrayOfPart01Test053
     * @tc.desc Verify of(1, 2) toString() equals '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualStr: string = result.toString();
      let expectedStr: string = '1,2';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5400
     * @tc.name int8ArrayOfPart01Test054
     * @tc.desc Verify of(127, 0) join(',') equals '127,0' (MAX value string representation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 127;
      const b: byte = 0;
      let result: Int8Array = Int8Array.of(a, b);
      let actualStr: string = result.join(',');
      let expectedStr: string = '127,0';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5500
     * @tc.name int8ArrayOfPart01Test055
     * @tc.desc Verify of(v) after modification source byte variable unchanged (value type independence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      let result: Int8Array = Int8Array.of(v);
      result.$_set(0, INT8_MIN);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
      expect(v).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5600
     * @tc.name int8ArrayOfPart01Test056
     * @tc.desc Verify of(single byte) result is mutable (set then get verification)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      let result: Int8Array = Int8Array.of(a);
      result.$_set(0, INT8_MAX);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5700
     * @tc.name int8ArrayOfPart01Test057
     * @tc.desc Verify of(0, 1) for-of iteration count is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      let result: Int8Array = Int8Array.of(a, b);
      let count: int = 0;
      for (const _ of result) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5800
     * @tc.name int8ArrayOfPart01Test058
     * @tc.desc Verify of(-128, 127) keys() last index is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let lastKey: number = -1;
      for (const k of result.keys()) {
        lastKey = k;
      }
      expect(lastKey).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_5900
     * @tc.name int8ArrayOfPart01Test059
     * @tc.desc Verify of(0, 1, -1) entries() last index is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      const c: byte = -1;
      let result: Int8Array = Int8Array.of(a, b, c);
      let lastIdx: number = -1;
      for (const entry of result.entries()) {
        lastIdx = entry[0];
      }
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6000
     * @tc.name int8ArrayOfPart01Test060
     * @tc.desc Verify of(-1, 1) values() last value is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -1;
      const b: byte = 1;
      let result: Int8Array = Int8Array.of(a, b);
      let lastVal: number = 0;
      for (const v of result.values()) {
        lastVal = v;
      }
      expect(lastVal).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6100
     * @tc.name int8ArrayOfPart01Test061
     * @tc.desc Verify of(5 boundary values) first element is -128 (order preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = -1;
      const c: byte = 0;
      const d: byte = 1;
      const e: byte = 127;
      let result: Int8Array = Int8Array.of(a, b, c, d, e);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6200
     * @tc.name int8ArrayOfPart01Test062
     * @tc.desc Verify of(5 boundary values) last element is 127 (order preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = -1;
      const c: byte = 0;
      const d: byte = 1;
      const e: byte = 127;
      let result: Int8Array = Int8Array.of(a, b, c, d, e);
      let actualValue: number = result.$_get(4);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6300
     * @tc.name int8ArrayOfPart01Test063
     * @tc.desc Verify of(MAX, MIN, MAX, MIN) third element is 127 (alternating pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min: byte = -128;
      const max: byte = 127;
      let result: Int8Array = Int8Array.of(max, min, max, min);
      let actualValue: number = result.$_get(2);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6400
     * @tc.name int8ArrayOfPart01Test064
     * @tc.desc Verify of(MIN, 0, MAX) middle element is 0 (three-element middle value order)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 0;
      const c: byte = 127;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualValue: number = result.$_get(1);
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6500
     * @tc.name int8ArrayOfPart01Test065
     * @tc.desc Verify of() empty array join('') equals empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of();
      let actualStr: string = result.join('');
      let expectedStr: string = '';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6600
     * @tc.name int8ArrayOfPart01Test066
     * @tc.desc Verify of() empty array join(',') equals empty string (separator does not affect empty array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.of();
      let actualStr: string = result.join(',');
      let expectedStr: string = '';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6700
     * @tc.name int8ArrayOfPart01Test067
     * @tc.desc Verify of(single byte) join(',') equals '1' (single element no separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      let result: Int8Array = Int8Array.of(v);
      let actualStr: string = result.join(',');
      let expectedStr: string = '1';
      expect(actualStr).assertEqual(expectedStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6800
     * @tc.name int8ArrayOfPart01Test068
     * @tc.desc Verify of(single byte) at(0) equals at(-1) (single element positive equals negative index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      let result: Int8Array = Int8Array.of(v);
      let actualValue = result.at(0);
      let expectedValue = result.at(-1);
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_6900
     * @tc.name int8ArrayOfPart01Test069
     * @tc.desc Verify of(1, 2) indexOf(1) equals 0 (first element lookup)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualIndex: int = result.indexOf(1);
      let expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7000
     * @tc.name int8ArrayOfPart01Test070
     * @tc.desc Verify of(1, 2) includes(2) is true (element existence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let actualBool: boolean = result.includes(2);
      expect(actualBool).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7100
     * @tc.name int8ArrayOfPart01Test071
     * @tc.desc Verify of(1, 2) slice(0, 1).get(0) equals 1 (slice value correct)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let sliced: Int8Array = result.slice(0, 1);
      let actualValue: number = sliced.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7200
     * @tc.name int8ArrayOfPart01Test072
     * @tc.desc Verify of(1, 2) slice(1, 2).length equals 1 (slice length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let sliced: Int8Array = result.slice(1, 2);
      let actualLength: int = sliced.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7300
     * @tc.name int8ArrayOfPart01Test073
     * @tc.desc Verify of(-128, 127, 0) indexOf(127) equals 1 (middle element lookup)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      const c: byte = 0;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualIndex: int = result.indexOf(127);
      let expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7400
     * @tc.name int8ArrayOfPart01Test074
     * @tc.desc Verify of(0, 127) indexOf(127) equals 1 (MAX value lookup)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let actualIndex: int = result.indexOf(127);
      let expectedIndex: int = 1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7500
     * @tc.name int8ArrayOfPart01Test075
     * @tc.desc Verify of(0, 127) indexOf(-128) equals -1 (MIN not found)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let actualIndex: int = result.indexOf(-128);
      let expectedIndex: int = -1;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7600
     * @tc.name int8ArrayOfPart01Test076
     * @tc.desc Verify of(0, 1, -1) includes(-128) is false (MIN does not exist)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 0;
      const b: byte = 1;
      const c: byte = -1;
      let result: Int8Array = Int8Array.of(a, b, c);
      let actualBool: boolean = result.includes(-128);
      expect(actualBool).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7700
     * @tc.name int8ArrayOfPart01Test077
     * @tc.desc Verify of(-128, 127) slice(0).length equals 2 (full slice)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let result: Int8Array = Int8Array.of(a, b);
      let copy: Int8Array = result.slice(0);
      let actualLength: int = copy.length;
      let expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7800
     * @tc.name int8ArrayOfPart01Test078
     * @tc.desc Verify of result as set() source values correctly copied to target array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let src: Int8Array = Int8Array.of(a, b);
      let target: Int8Array = new Int8Array(2);
      target.set(src);
      let actualValue: number = target.$_get(1);
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_7900
     * @tc.name int8ArrayOfPart01Test079
     * @tc.desc Verify of result as from() source creates independent copy (modifying source does not affect copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = -128;
      const b: byte = 127;
      let src: Int8Array = Int8Array.of(a, b);
      let copy: Int8Array = Int8Array.from(src);
      src.$_set(0, 0);
      let actualValue: number = copy.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_8000
     * @tc.name int8ArrayOfPart01Test080
     * @tc.desc Verify of result subarray shares buffer (modifying view affects original array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      let result: Int8Array = Int8Array.of(a, b, c);
      let view: Int8Array = result.subarray(0, 2);
      view.$_set(0, INT8_MIN);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_8100
     * @tc.name int8ArrayOfPart01Test081
     * @tc.desc Verify of result reverse() in-place modification (modifying reverse return affects original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let reversed: Int8Array = result.reverse();
      reversed.$_set(0, INT8_MIN);
      let actualValue: number = result.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_OF_PART01_TEST_8200
     * @tc.name int8ArrayOfPart01Test082
     * @tc.desc Verify of result valueOf() returns self (modifying valueOf result affects original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayOfPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      let result: Int8Array = Int8Array.of(a, b);
      let same: Int8Array = result.valueOf();
      same.$_set(0, -1);
      let actualValue: number = result.$_get(0);
      let expectedValue: int = -1;
      expect(actualValue).assertEqual(expectedValue);
    });
  });
}
