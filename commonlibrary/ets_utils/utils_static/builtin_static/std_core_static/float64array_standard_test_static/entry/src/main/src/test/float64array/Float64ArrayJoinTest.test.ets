'use static'
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function float64ArrayJoinTest(): void {
  describe('Float64ArrayJoinTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0100
     * @tc.name testFloat64ArrayJoin001
     * @tc.desc Verify join with no parameter defaults to comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result: string = arr.join();
      const expectVal = "0.5,1.5,0.25";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0200
     * @tc.name testFloat64ArrayJoin002
     * @tc.desc Verify join with boxed String variable separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const sep: String = "|";
      const result: string = arr.join(sep);
      const expectVal = "-2147483648|-1|0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0300
     * @tc.name testFloat64ArrayJoin003
     * @tc.desc Verify join with primitive string variable separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const sep: string = "|";
      const result: string = arr.join(sep);
      const expectVal = "0.1|9007199254740991|0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0400
     * @tc.name testFloat64ArrayJoin004
     * @tc.desc Verify join with inferred-type variable separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const sep = "-";
      const result: string = arr.join(sep);
      const expectVal = "0.5-1.5-0.25";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0500
     * @tc.name testFloat64ArrayJoin005
     * @tc.desc Verify join on single-element array returns just that element as string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const result: string = arr.join(";");
      const expectVal = "-32768";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0600
     * @tc.name testFloat64ArrayJoin006
     * @tc.desc Verify join on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result: string = arr.join();
      const expectVal = "";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0700
     * @tc.name testFloat64ArrayJoin007
     * @tc.desc Verify join on two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      const result: string = arr.join("&");
      const expectVal = "-2147483648&-1";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0800
     * @tc.name testFloat64ArrayJoin008
     * @tc.desc Verify join on five-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result: string = arr.join(",");
      const expectVal = "0.1,9007199254740991,0,3.141592653589793,-1e-100";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_0900
     * @tc.name testFloat64ArrayJoin009
     * @tc.desc Verify join returns consistent results on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result1: string = arr.join(",");
      const result2: string = arr.join(",");
      const expectVal = result2;
      expect(result1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1000
     * @tc.name testFloat64ArrayJoin010
     * @tc.desc Verify join with different separators produces different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result1: string = arr.join(",");
      const result2: string = arr.join("|");
      const expectVal = "-2147483648,-1,0";
      expect(result1).assertEqual(expectVal);
      const expectVal2 = "-2147483648|-1|0";
      expect(result2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1100
     * @tc.name testFloat64ArrayJoin011
     * @tc.desc Verify join with SQL injection-like separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result: string = arr.join("'; DROP TABLE--");
      const expectVal = "-2147483648'; DROP TABLE---1'; DROP TABLE--0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1200
     * @tc.name testFloat64ArrayJoin012
     * @tc.desc Verify join with SQL injection single quote separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValue20: number = 0x20;
      const arr = Float64Array.of(hexValue10, hexValue20, hexValue10);
      const result: string = arr.join("1' OR '1'='1");
      const expectVal = "161' OR '1'='1321' OR '1'='116";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1300
     * @tc.name testFloat64ArrayJoin013
     * @tc.desc Verify join with math plus operator separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0o10, 0o20, 0o10);
      const result: string = arr.join(" + ");
      const expectVal = "8 + 16 + 8";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1400
     * @tc.name testFloat64ArrayJoin014
     * @tc.desc Verify join with math equals operator separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue10: number = 0b10;
      const binaryValue100: number = 0b100;
      const arr = Float64Array.of(binaryValue10, binaryValue100, binaryValue10);
      const result: string = arr.join(" = ");
      const expectVal = "2 = 4 = 2";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1500
     * @tc.name testFloat64ArrayJoin015
     * @tc.desc Verify join with bidirectional arrow separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result: string = arr.join(" <-> ");
      const expectVal = "0 <-> 0 <-> 0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1600
     * @tc.name testFloat64ArrayJoin016
     * @tc.desc Verify join on ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result: string = arr.join(";");
      const expectVal = "0.5;1.5;0.25;0.125;0.0625";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1700
     * @tc.name testFloat64ArrayJoin017
     * @tc.desc Verify join on descending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue);
      const result: string = arr.join("!");
      const expectVal = "-32768!-128!0!127!32767";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1800
     * @tc.name testFloat64ArrayJoin018
     * @tc.desc Verify join on alternating positive-negative array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      const result: string = arr.join("?");
      const expectVal = "-2147483648?-1?0?1?2147483647";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_1900
     * @tc.name testFloat64ArrayJoin019
     * @tc.desc Verify join on symmetric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tinyNegativeValue: number = -1e-100;
      const piValue: number = 3.141592653589793;
      const zeroValue: number = 0;
      const arr = Float64Array.of(tinyNegativeValue, piValue, zeroValue, piValue, tinyNegativeValue);
      const result: string = arr.join(",");
      const expectVal = "-1e-100,3.141592653589793,0,3.141592653589793,-1e-100";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2000
     * @tc.name testFloat64ArrayJoin020
     * @tc.desc Verify join NaN and Infinity with pipe separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue);
      const result: string = arr.join("|");
      const expectVal = "-32768|-128|0|127";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2100
     * @tc.name testFloat64ArrayJoin021
     * @tc.desc Verify join MAX_SAFE_INTEGER and MIN_SAFE_INTEGER with pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result: string = arr.join("|");
      const expectVal = "0.1|9007199254740991|0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2200
     * @tc.name testFloat64ArrayJoin022
     * @tc.desc Verify join hex octal binary literals with pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const binaryValue100: number = 0b100;
      const arr = Float64Array.of(hexValue10, 0o20, binaryValue100);
      const result: string = arr.join("|");
      const expectVal = "16|16|4";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2300
     * @tc.name testFloat64ArrayJoin023
     * @tc.desc Verify join NaN NaN NaN produces repeated NaN string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const result: string = arr.join(",");
      const expectVal = "0.25,0.25,0.25";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2400
     * @tc.name testFloat64ArrayJoin024
     * @tc.desc Verify join on array constructed with new Float64Array(N) and set values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(3);
      arr.$_set(0, onePointZero);
      arr.$_set(1, twoPointZero);
      arr.$_set(2, threePointZero);
      const result: string = arr.join(",");
      const expectVal = "1,2,3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2500
     * @tc.name testFloat64ArrayJoin025
     * @tc.desc Verify test case behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = values.join();
      const expectVal = "-2147483648,-1,0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2600
     * @tc.name testFloat64ArrayJoin026
     * @tc.desc Verify join single element returns its string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const values = Float64Array.of(pointFive);
      const result = values.join("-");
      const expectVal = "0.5";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2700
     * @tc.name testFloat64ArrayJoin027
     * @tc.desc Verify join with maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const threeValue: number = 3;
      const values = Float64Array.of(pointFive);
      const result = values.join("");
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2800
     * @tc.name testFloat64ArrayJoin028
     * @tc.desc Verify join with left-to-right mark separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const arr = Float64Array.of(hexValueFF, hexValueAA, hexValue55);
      const s: string = arr.join("\u200E");
      const actVal1 = s.includes("\u200E");
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_2900
     * @tc.name testFloat64ArrayJoin029
     * @tc.desc Verify join with right-to-left mark separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue1111: number = 0b1111;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010, binaryValue1111);
      const s: string = arr.join("\u200F");
      const actVal2 = s.includes("\u200F");
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3000
     * @tc.name testFloat64ArrayJoin030
     * @tc.desc Verify join with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(nanValue, onePointFive, pointTwoFive);
      const result: string = arr.join("^");
      const expectVal = "NaN^1.5^0.25";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3100
     * @tc.name testFloat64ArrayJoin031
     * @tc.desc Verify join with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(positiveInfinity, -positiveInfinity, zeroPointZero);
      const result: string = arr.join(",");
      const expectVal = "Infinity,-Infinity,0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3200
     * @tc.name testFloat64ArrayJoin032
     * @tc.desc Verify join with multiple NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue, nanValue, nanValue);
      const result: string = arr.join(",");
      const expectVal = "NaN,NaN,NaN";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3300
     * @tc.name testFloat64ArrayJoin033
     * @tc.desc Verify join with NaN, Infinity and -Infinity mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const positiveInfinity: number = Infinity;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(nanValue, positiveInfinity, -positiveInfinity, onePointZero);
      const result: string = arr.join(",");
      const expectVal = "NaN,Infinity,-Infinity,1";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3400
     * @tc.name testFloat64ArrayJoin034
     * @tc.desc Verify join with -0.0 and +0.0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(negativeZero, zeroPointZero, onePointZero);
      const result: string = arr.join("'");
      const expectVal = "0'0'1";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3500
     * @tc.name testFloat64ArrayJoin035
     * @tc.desc Verify join with Double.MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = Double.MAX_VALUE;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(doubleMaxValue, onePointZero, twoPointZero);
      const result: string = arr.join(",");
      const expectVal = "1.7976931348623157e+308,1,2";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3600
     * @tc.name testFloat64ArrayJoin036
     * @tc.desc Verify join with Double.MIN_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(doubleMinValue, onePointZero, twoPointZero);
      const result: string = arr.join(",");
      const expectVal = "5e-324,1,2";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3700
     * @tc.name testFloat64ArrayJoin037
     * @tc.desc Verify join with space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const result: string = arr.join(" ");
      const expectVal = "10 20 30";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3800
     * @tc.name testFloat64ArrayJoin038
     * @tc.desc Verify join with multi-character separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join(" -> ");
      const expectVal = "1 -> 2 -> 3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_3900
     * @tc.name testFloat64ArrayJoin039
     * @tc.desc Verify join with dot separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join(".");
      const expectVal = "1.2.3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4000
     * @tc.name testFloat64ArrayJoin040
     * @tc.desc Verify join with Chinese comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(100.0, 200.0, 300.0);
      const result: string = arr.join("，");
      const expectVal = "100，200，300";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4100
     * @tc.name testFloat64ArrayJoin041
     * @tc.desc Verify join with empty string separator on multi-element array concatenates all digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("");
      const expectVal = "123";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4200
     * @tc.name testFloat64ArrayJoin042
     * @tc.desc Verify join with colon separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(8.0, 16.0, 32.0);
      const result: string = arr.join(":");
      const expectVal = "8:16:32";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4300
     * @tc.name testFloat64ArrayJoin043
     * @tc.desc Verify join on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const view = arr.subarray(1, 4);
      const result: string = view.join(",");
      const expectVal = "2,3,4";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4400
     * @tc.name testFloat64ArrayJoin044
     * @tc.desc Verify join on slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0, 40.0);
      const sliced = arr.slice(0, 2);
      const result: string = sliced.join("|");
      const expectVal = "10|20";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4500
     * @tc.name testFloat64ArrayJoin045
     * @tc.desc Verify join on large array of 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i * 1.0);
      }
      const result: string = arr.join(",");
      const parts: string[] = result.split(",");
      expect(parts.length).assertEqual(100);
      expect(parts[0]).assertEqual("0");
      expect(parts[99]).assertEqual("99");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4600
     * @tc.name testFloat64ArrayJoin046
     * @tc.desc Verify join result used in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const joined: string = arr.join("+");
      const expression: string = joined + "=" + "6";
      const expectVal = "1+2+3=6";
      expect(expression).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4700
     * @tc.name testFloat64ArrayJoin047
     * @tc.desc Verify join with negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(negativeZero, negativeZero);
      const result: string = arr.join(",");
      const expectVal = "0,0";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4800
     * @tc.name testFloat64ArrayJoin048
     * @tc.desc Verify join with scientific notation elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0e10, 2.0e-10, 3.0e5);
      const result: string = arr.join(",");
      const expectVal = "10000000000,2e-10,300000";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_4900
     * @tc.name testFloat64ArrayJoin049
     * @tc.desc Verify join with newline separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("\n");
      const expected: string[] = result.split("\n");
      expect(expected.length).assertEqual(3);
      expect(expected[0]).assertEqual("1");
      expect(expected[1]).assertEqual("2");
      expect(expected[2]).assertEqual("3");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5000
     * @tc.name testFloat64ArrayJoin050
     * @tc.desc Verify join with tab separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("\t");
      const expectVal = "1\t2\t3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5100
     * @tc.name testFloat64ArrayJoin051
     * @tc.desc Verify join with carriage return separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const result: string = arr.join("\r");
      const parts: string[] = result.split("\r");
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual("10");
      expect(parts[1]).assertEqual("20");
      expect(parts[2]).assertEqual("30");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5200
     * @tc.name testFloat64ArrayJoin052
     * @tc.desc Verify join with CRLF separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(100.0, 200.0, 300.0);
      const result: string = arr.join("\r\n");
      const parts: string[] = result.split("\r\n");
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual("100");
      expect(parts[1]).assertEqual("200");
      expect(parts[2]).assertEqual("300");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5300
     * @tc.name testFloat64ArrayJoin053
     * @tc.desc Verify join with zero-width space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(5.0, 10.0, 15.0);
      const result: string = arr.join("\u200B");
      const expectVal = "5\u200B10\u200B15";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5400
     * @tc.name testFloat64ArrayJoin054
     * @tc.desc Verify join with special characters combination separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("!@#$%^&*()");
      const expectVal = "1!@#$%^&*()2!@#$%^&*()3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5500
     * @tc.name testFloat64ArrayJoin055
     * @tc.desc Verify join with tilde separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("~");
      const expectVal = "1~2~3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5600
     * @tc.name testFloat64ArrayJoin056
     * @tc.desc Verify join with null separator throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.join(null as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5700
     * @tc.name testFloat64ArrayJoin057
     * @tc.desc Verify join with undefined separator throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      try {
        arr.join(undefined as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5800
     * @tc.name testFloat64ArrayJoin058
     * @tc.desc Verify join with @ separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const result: string = arr.join("@");
      const expectVal = "10@20@30";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_5900
     * @tc.name testFloat64ArrayJoin059
     * @tc.desc Verify join with % separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(100.0, 200.0, 300.0);
      const result: string = arr.join("%");
      const expectVal = "100%200%300";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6000
     * @tc.name testFloat64ArrayJoin060
     * @tc.desc Verify join with * separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(5.0, 10.0, 15.0);
      const result: string = arr.join("*");
      const expectVal = "5*10*15";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6100
     * @tc.name testFloat64ArrayJoin061
     * @tc.desc Verify join with ( separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("(");
      const expectVal = "1(2(3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6200
     * @tc.name testFloat64ArrayJoin062
     * @tc.desc Verify join with ) separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join(")");
      const expectVal = "1)2)3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6300
     * @tc.name testFloat64ArrayJoin063
     * @tc.desc Verify join with / separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(7.0, 14.0, 21.0);
      const result: string = arr.join("/");
      const expectVal = "7/14/21";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6400
     * @tc.name testFloat64ArrayJoin064
     * @tc.desc Verify join with > separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join(">");
      const expectVal = "1>2>3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6500
     * @tc.name testFloat64ArrayJoin065
     * @tc.desc Verify join with < separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("<");
      const expectVal = "1<2<3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6600
     * @tc.name testFloat64ArrayJoin066
     * @tc.desc Verify join with { separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("{");
      const expectVal = "1{2{3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6700
     * @tc.name testFloat64ArrayJoin067
     * @tc.desc Verify join with } separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("}");
      const expectVal = "1}2}3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6800
     * @tc.name testFloat64ArrayJoin068
     * @tc.desc Verify join with [ separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("[");
      const expectVal = "1[2[3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_6900
     * @tc.name testFloat64ArrayJoin069
     * @tc.desc Verify join with ] separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("]");
      const expectVal = "1]2]3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7000
     * @tc.name testFloat64ArrayJoin070
     * @tc.desc Verify join with Chinese question mark separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("？");
      const expectVal = "1？2？3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7100
     * @tc.name testFloat64ArrayJoin071
     * @tc.desc Verify join with Chinese exclamation mark separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const result: string = arr.join("！");
      const expectVal = "10！20！30";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7200
     * @tc.name testFloat64ArrayJoin072
     * @tc.desc Verify join with Chinese colon separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(100.0, 200.0, 300.0);
      const result: string = arr.join("：");
      const expectVal = "100：200：300";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7300
     * @tc.name testFloat64ArrayJoin073
     * @tc.desc Verify join with Chinese semicolon separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(5.0, 10.0, 15.0);
      const result: string = arr.join("；");
      const expectVal = "5；10；15";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7400
     * @tc.name testFloat64ArrayJoin074
     * @tc.desc Verify join with Chinese period separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("。");
      const expectVal = "1。2。3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7500
     * @tc.name testFloat64ArrayJoin075
     * @tc.desc Verify join with Chinese middle dot separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(3.0, 6.0, 9.0);
      const result: string = arr.join("·");
      const expectVal = "3·6·9";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7600
     * @tc.name testFloat64ArrayJoin076
     * @tc.desc Verify join with Chinese book title marks separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("《");
      const expectVal = "1《2《3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7700
     * @tc.name testFloat64ArrayJoin077
     * @tc.desc Verify join with Chinese ellipsis separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const result: string = arr.join("……");
      const expectVal = "1……2……3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7800
     * @tc.name testFloat64ArrayJoin078
     * @tc.desc Verify join with Chinese text and newline mixed separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0);
      const sep: string = "测试\n换行";
      const result: string = arr.join(sep);
      const expectVal = "1测试\n换行2测试\n换行3";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_7900
     * @tc.name testFloat64ArrayJoin079
     * @tc.desc Verify join with Chinese text and CRLF mixed separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const sep: string = "测试\r\n回车换行";
      const result: string = arr.join(sep);
      const expectVal = "10测试\r\n回车换行20测试\r\n回车换行30";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_JOIN_8000
     * @tc.name testFloat64ArrayJoin080
     * @tc.desc Verify join with Chinese text and backslash mixed separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayJoin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(100.0, 200.0, 300.0);
      const result: string = arr.join("测试\\转义符");
      const expectVal = "100测试\\转义符200测试\\转义符300";
      expect(result).assertEqual(expectVal);
    })

  })
}
