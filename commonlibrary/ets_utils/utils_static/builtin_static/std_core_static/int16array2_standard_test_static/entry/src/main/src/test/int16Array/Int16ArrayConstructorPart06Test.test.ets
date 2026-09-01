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
} from "../../../../hypium/index";
import Utils from "../Util.test";

export default function int16ArrayConstructorPart06Test(): void {
  describe("Int16ArrayConstructorPart06Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0100
     * @tc.name int16ArrayConstructorPart06Test001
     * @tc.desc Verify new Int16Array(FixedArray<number>) with single arg sets length from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0200
     * @tc.name int16ArrayConstructorPart06Test002
     * @tc.desc Verify new Int16Array(FixedArray<number>) empty source length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0300
     * @tc.name int16ArrayConstructorPart06Test003
     * @tc.desc Verify new Int16Array(FixedArray<number>) empty source byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0400
     * @tc.name int16ArrayConstructorPart06Test004
     * @tc.desc Verify new Int16Array(FixedArray<number>) [0.0] value stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0500
     * @tc.name int16ArrayConstructorPart06Test005
     * @tc.desc Verify new Int16Array(FixedArray<number>) [NaN] NaN coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [Number.NaN];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0600
     * @tc.name int16ArrayConstructorPart06Test006
     * @tc.desc Verify new Int16Array(FixedArray<number>) [Infinity] coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0700
     * @tc.name int16ArrayConstructorPart06Test007
     * @tc.desc Verify new Int16Array(FixedArray<number>) [-Infinity] coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [Number.NEGATIVE_INFINITY];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0800
     * @tc.name int16ArrayConstructorPart06Test008
     * @tc.desc Verify new Int16Array(FixedArray<number>) [-1.0, 0.0, 1.0] neg/zero/pos sequenceelement-wise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [-1.0, 0.0, 1.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__0900
     * @tc.name int16ArrayConstructorPart06Test009
     * @tc.desc Verify new Int16Array(FixedArray<number>) [3.3, 3.7, -2.3, -2.7] pos/neg float trunc mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [3.3, 3.7, -2.3, -2.7];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = -2;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = -2;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1000
     * @tc.name int16ArrayConstructorPart06Test010
     * @tc.desc Verify new Int16Array(FixedArray<number>) [0.1, -0.1, 32767.9, -32768.9] small and boundary float trunc mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0.1, -0.1, 32767.9, -32768.9];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = -32768;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1100
     * @tc.name int16ArrayConstructorPart06Test011
     * @tc.desc Verify new Int16Array(FixedArray<number>) [NaN, 0.0, 1.0] NaN coerce leaves neighbors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [Number.NaN, 0.0, 1.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1200
     * @tc.name int16ArrayConstructorPart06Test012
     * @tc.desc Verify new Int16Array(FixedArray<number>) [Infinity, -Infinity, 0.0] infinities coerce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, 0.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1300
     * @tc.name int16ArrayConstructorPart06Test013
     * @tc.desc Verify new Int16Array(FixedArray<number>) [1.0, -2.0, 3.0, -4.0] alternating signselement-wise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, -2.0, 3.0, -4.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = -4;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1400
     * @tc.name int16ArrayConstructorPart06Test014
     * @tc.desc Verify new Int16Array(FixedArray<number>) with 50 elements length equals 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [
          0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0,
          10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0,
          20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0,
          30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0,
          40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0
      ];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1500
     * @tc.name int16ArrayConstructorPart06Test015
     * @tc.desc Verify new Int16Array(FixedArray<number>) with 50 elements byteLength equals 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [
          0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0,
          10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0,
          20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0,
          30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0,
          40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0
      ];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.byteLength;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1600
     * @tc.name int16ArrayConstructorPart06Test016
     * @tc.desc Verify new Int16Array(FixedArray<number>) with 50 elements first and last values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [
          0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0,
          10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0,
          20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0,
          30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0,
          40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0
      ];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(49);
      let expected2: int = 49;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1700
     * @tc.name int16ArrayConstructorPart06Test017
     * @tc.desc Verify new Int16Array(FixedArray<number>) with 100 same values length and consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
          7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0
      ];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = 7;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(50);
      let expected3: int = 7;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(99);
      let expected4: int = 7;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1800
     * @tc.name int16ArrayConstructorPart06Test018
     * @tc.desc Verify new Int16Array(FixedArray<number> [1.0, 2.0]).length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__1900
     * @tc.name int16ArrayConstructorPart06Test019
     * @tc.desc Verify new Int16Array(FixedArray<number>) result.buffer.byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.buffer.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2000
     * @tc.name int16ArrayConstructorPart06Test020
     * @tc.desc Verify new Int16Array(FixedArray<number>) non-empty length matches source length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2100
     * @tc.name int16ArrayConstructorPart06Test021
     * @tc.desc Verify new Int16Array(FixedArray<number>) single-element length matches source length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [42.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2200
     * @tc.name int16ArrayConstructorPart06Test022
     * @tc.desc Verify new Int16Array(FixedArray<number>) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2300
     * @tc.name int16ArrayConstructorPart06Test023
     * @tc.desc Verify new Int16Array(FixedArray<number>) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2400
     * @tc.name int16ArrayConstructorPart06Test024
     * @tc.desc Verify new Int16Array(FixedArray<number>) byteOffset is 0 for root buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2500
     * @tc.name int16ArrayConstructorPart06Test025
     * @tc.desc Verify new Int16Array(FixedArray<number>) buffer.byteLength equals result.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.buffer.byteLength;
      let expected: number = result.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2600
     * @tc.name int16ArrayConstructorPart06Test026
     * @tc.desc Verify new Int16Array(FixedArray<number>) empty source has buffer with byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.buffer.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2700
     * @tc.name int16ArrayConstructorPart06Test027
     * @tc.desc Verify new Int16Array(FixedArray<number>) five-element sequence element-wise correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [-32768.0, -1.0, 0.0, 1.0, 32767.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = 1;
      expect(actual4).assertEqual(expected4);
      let actual5: number = result.$_get(4);
      let expected5: int = 32767;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2800
     * @tc.name int16ArrayConstructorPart06Test028
     * @tc.desc Verify new Int16Array(FixedArray<number>) mutating typed array does not change source FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [100.0, 200.0];
      let result: Int16Array = new Int16Array(src);
      result.$_set(0, 999);
      let actual: number = src[0];
      let expected: number = 100.0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__2900
     * @tc.name int16ArrayConstructorPart06Test029
     * @tc.desc Verify new Int16Array(FixedArray<number>) mutating last element does not change source FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      let result: Int16Array = new Int16Array(src);
      result.$_set(2, 888);
      let actual: number = src[2];
      let expected: number = 30.0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3000
     * @tc.name int16ArrayConstructorPart06Test030
     * @tc.desc Verify new Int16Array(FixedArray<number>) source FixedArray length unchanged after construct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = src.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3100
     * @tc.name int16ArrayConstructorPart06Test031
     * @tc.desc Verify new Int16Array(FixedArray<number>) source FixedArray elements unchanged after construct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = src[0];
      let expected: number = 10.0;
      expect(actual).assertEqual(expected);
      let actual2: number = src[1];
      let expected2: number = 20.0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = src[2];
      let expected3: number = 30.0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3200
     * @tc.name int16ArrayConstructorPart06Test032
     * @tc.desc Verify new Int16Array(FixedArray<number>) two instances from same source are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [50.0, 60.0];
      let arr1: Int16Array = new Int16Array(src);
      let arr2: Int16Array = new Int16Array(src);
      arr1.$_set(0, 777);
      let actual: number = arr2.$_get(0);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3300
     * @tc.name int16ArrayConstructorPart06Test033
     * @tc.desc Verify new Int16Array(FixedArray<number>) two instances from same source have distinct buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0];
      let arr1: Int16Array = new Int16Array(src);
      let arr2: Int16Array = new Int16Array(src);
      let actual: boolean = arr1.buffer === arr2.buffer;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3400
     * @tc.name int16ArrayConstructorPart06Test034
     * @tc.desc Verify new Int16Array(FixedArray<number>) allocates independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      let result: Int16Array = new Int16Array(src);
      let actual: int = result.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
      let actual2: int = result.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3500
     * @tc.name int16ArrayConstructorPart06Test035
     * @tc.desc Verify new Int16Array(FixedArray<number>) buffer mutation does not affect source FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [42.0];
      let result: Int16Array = new Int16Array(src);
      let view: Int16Array = new Int16Array(result.buffer, 0, 1);
      view.$_set(0, 999);
      let actual: number = src[0];
      let expected: number = 42.0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3600
     * @tc.name int16ArrayConstructorPart06Test036
     * @tc.desc Verify new Int16Array(FixedArray<number>) buffer is newly allocated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let src: FixedArray<number> = [1.0, 2.0];
      let result: Int16Array = new Int16Array(src);
      let actual: boolean = result.buffer === buf;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3700
     * @tc.name int16ArrayConstructorPart06Test037
     * @tc.desc Verify new Int16Array(FixedArray<number>) [32768.0, -32769.0, 65535.0, 65536.0] four overflow elements [32768.0, -32769.0, 65535.0, 65536.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [32768.0, -32769.0, 65535.0, 65536.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = -1;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3800
     * @tc.name int16ArrayConstructorPart06Test038
     * @tc.desc Verify new Int16Array(FixedArray<number>) [0.0, 32767.0, -32768.0, 0.0, 32767.0, -32768.0] with repeated boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0.0, 32767.0, -32768.0, 0.0, 32767.0, -32768.0];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = -32768;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
      let actual5: number = result.$_get(4);
      let expected5: int = 32767;
      expect(actual5).assertEqual(expected5);
      let actual6: number = result.$_get(5);
      let expected6: int = -32768;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__3900
     * @tc.name int16ArrayConstructorPart06Test039
     * @tc.desc Verify new Int16Array(FixedArray<number>) repeated constructs yield same converted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [5.0, 10.0, 15.0];
      let arr1: Int16Array = new Int16Array(src);
      let arr2: Int16Array = new Int16Array(src);
      let actual: number = arr1.$_get(1);
      let expected: number = arr2.$_get(1);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__4000
     * @tc.name int16ArrayConstructorPart06Test040
     * @tc.desc Verify new Int16Array(FixedArray<number>) result is mutable via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [0.0, 0.0];
      let result: Int16Array = new Int16Array(src);
      result.$_set(0, 12345);
      let actual: number = result.$_get(0);
      let expected: int = 12345;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART06__4100
     * @tc.name int16ArrayConstructorPart06Test041
     * @tc.desc Verify new Int16Array(FixedArray<number>) [NaN, 32767.0, 0.0, -32768.0, Infinity] specials and boundaries mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart06Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [Number.NaN, 32767.0, 0.0, -32768.0, Number.POSITIVE_INFINITY];
      let result: Int16Array = new Int16Array(src);
      let actual: number = result.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(1);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let actual3: number = result.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = result.$_get(3);
      let expected4: int = -32768;
      expect(actual4).assertEqual(expected4);
      let actual5: number = result.$_get(4);
      let expected5: int = 0;
      expect(actual5).assertEqual(expected5);
    });

  });
}
