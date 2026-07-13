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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function GlobalIsIntegerTest(): void {
  describe('GlobalIsIntegerTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0010
     * @tc.name testIsInteger001
     * @tc.desc Verify isInteger(42) returns true for positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0020
     * @tc.name testIsInteger002
     * @tc.desc Verify isInteger(3.5) returns false for non-integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(3.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0030
     * @tc.name testIsInteger003
     * @tc.desc Verify isInteger(0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0040
     * @tc.name testIsInteger004
     * @tc.desc Verify isInteger(-1) returns true for negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0050
     * @tc.name testIsInteger005
     * @tc.desc Verify isInteger(Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(parseFloat("Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0060
     * @tc.name testIsInteger006
     * @tc.desc Verify isInteger(-Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(parseFloat("-Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0070
     * @tc.name testIsInteger007
     * @tc.desc Verify isInteger(42.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(42.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0080
     * @tc.name testIsInteger008
     * @tc.desc Verify isInteger(Number.MAX_SAFE_INTEGER) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0090
     * @tc.name testIsInteger009
     * @tc.desc Verify isInteger(Number.MIN_SAFE_INTEGER) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(Number.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0100
     * @tc.name testIsInteger010
     * @tc.desc Verify isInteger(0.0000001) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(0.0000001);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0110
     * @tc.name testIsInteger011
     * @tc.desc Verify isInteger(Number.MAX_VALUE) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(Number.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0120
     * @tc.name testIsInteger012
     * @tc.desc Verify isInteger(Number.EPSILON) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(Number.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0130
     * @tc.name testIsInteger013
     * @tc.desc Verify isInteger(byte 10) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 10;
      let result: boolean = isInteger(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0140
     * @tc.name testIsInteger014
     * @tc.desc Verify isInteger(byte -128) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = -128;
      let result: boolean = isInteger(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0150
     * @tc.name testIsInteger015
     * @tc.desc Verify isInteger(byte 127) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 127;
      let result: boolean = isInteger(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0160
     * @tc.name testIsInteger016
     * @tc.desc Verify isInteger(byte 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 0;
      let result: boolean = isInteger(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0170
     * @tc.name testIsInteger017
     * @tc.desc Verify isInteger(short 1000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 1000;
      let result: boolean = isInteger(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0180
     * @tc.name testIsInteger018
     * @tc.desc Verify isInteger(short -32768) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = -32768;
      let result: boolean = isInteger(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0190
     * @tc.name testIsInteger019
     * @tc.desc Verify isInteger(short 32767) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 32767;
      let result: boolean = isInteger(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0200
     * @tc.name testIsInteger020
     * @tc.desc Verify isInteger(short 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 0;
      let result: boolean = isInteger(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0210
     * @tc.name testIsInteger021
     * @tc.desc Verify isInteger(int 100000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 100000;
      let result: boolean = isInteger(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0220
     * @tc.name testIsInteger022
     * @tc.desc Verify isInteger(int -2147483648) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = -2147483648;
      let result: boolean = isInteger(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0230
     * @tc.name testIsInteger023
     * @tc.desc Verify isInteger(int 2147483647) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 2147483647;
      let result: boolean = isInteger(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0240
     * @tc.name testIsInteger024
     * @tc.desc Verify isInteger(int 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 0;
      let result: boolean = isInteger(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0250
     * @tc.name testIsInteger025
     * @tc.desc Verify isInteger(long 100000000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(100000000);
      let result: boolean = isInteger(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0260
     * @tc.name testIsInteger026
     * @tc.desc Verify isInteger(long 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(0);
      let result: boolean = isInteger(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0270
     * @tc.name testIsInteger027
     * @tc.desc Verify isInteger(long large positive) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MAX_VALUE);
      let result: boolean = isInteger(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0280
     * @tc.name testIsInteger028
     * @tc.desc Verify isInteger(long large negative) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MIN_VALUE);
      let result: boolean = isInteger(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0290
     * @tc.name testIsInteger029
     * @tc.desc Verify isInteger(float 42.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 42.0f;
      let result: boolean = isInteger(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0300
     * @tc.name testIsInteger030
     * @tc.desc Verify isInteger(float 3.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 3.5f;
      let result: boolean = isInteger(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0310
     * @tc.name testIsInteger031
     * @tc.desc Verify isInteger(float 0.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 0.0f;
      let result: boolean = isInteger(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0320
     * @tc.name testIsInteger032
     * @tc.desc Verify isInteger(float -1.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = -1.5f;
      let result: boolean = isInteger(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0330
     * @tc.name testIsInteger033
     * @tc.desc Verify isInteger(number NaN) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: number = parseFloat("NaN");
      let result: boolean = isInteger(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0340
     * @tc.name testIsInteger034
     * @tc.desc Verify isInteger(-3.5) returns false for negative non-integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isInteger(-3.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0350
     * @tc.name testIsInteger035
     * @tc.desc Verify isInteger(parseInt("-2147483648")) returns true for int min string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseInt("-2147483648");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0360
     * @tc.name testIsInteger036
     * @tc.desc Verify isInteger returns false for fractional number 40.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = 40.5;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0370
     * @tc.name testIsInteger037
     * @tc.desc Verify isInteger returns false for zero divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0.0 / 0.0;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0380
     * @tc.name testIsInteger038
     * @tc.desc Verify isInteger returns false for one divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / 0.0;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0390
     * @tc.name testIsInteger039
     * @tc.desc Verify isInteger returns false for negative one divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -1.0 / 0.0;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0400
     * @tc.name testIsInteger040
     * @tc.desc Verify isInteger returns false for overflow positive parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.7976931348623159e+308");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0410
     * @tc.name testIsInteger041
     * @tc.desc Verify isInteger returns false for overflow negative parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1.7976931348623159e+308");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0420
     * @tc.name testIsInteger042
     * @tc.desc Verify isInteger returns true for integer value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1;
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0430
     * @tc.name testIsInteger043
     * @tc.desc Verify isInteger returns true for integer value -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -2;
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0440
     * @tc.name testIsInteger044
     * @tc.desc Verify isInteger returns false for decimal value 0.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0.125;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0450
     * @tc.name testIsInteger045
     * @tc.desc Verify isInteger returns false for decimal value -0.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -0.125;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0460
     * @tc.name testIsInteger046
     * @tc.desc Verify isInteger returns true for parseFloat trailing decimal integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42.");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0470
     * @tc.name testIsInteger047
     * @tc.desc Verify isInteger returns false for parseFloat leading decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".42");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0480
     * @tc.name testIsInteger048
     * @tc.desc Verify isInteger returns true for parseFloat exponent integer result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.25e2");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0490
     * @tc.name testIsInteger049
     * @tc.desc Verify isInteger returns false for parseFloat negative exponent fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.25e-1");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0500
     * @tc.name testIsInteger050
     * @tc.desc Verify isInteger returns true for parseInt truncated suffix result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("99 bottles", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0510
     * @tc.name testIsInteger051
     * @tc.desc Verify isInteger returns false for parseInt invalid radix result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("2", 2);
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0520
     * @tc.name testIsInteger052
     * @tc.desc Verify isInteger returns true for negative zero parsed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-0");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0530
     * @tc.name testIsInteger053
     * @tc.desc Verify isInteger returns true for minimum positive underflow to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-324");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0540
     * @tc.name testIsInteger054
     * @tc.desc Verify isInteger returns false for minimum positive nonzero number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MIN_VALUE;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0550
     * @tc.name testIsInteger055
     * @tc.desc Verify isInteger returns true for large finite integer magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 100000000000000000000.0;
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0560
     * @tc.name testIsInteger056
     * @tc.desc Verify isInteger returns false for parseFloat decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".75");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0570
     * @tc.name testIsInteger057
     * @tc.desc Verify isInteger returns false for parseFloat negative decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-.75");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0580
     * @tc.name testIsInteger058
     * @tc.desc Verify isInteger returns true for parseFloat signed exponent integer result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e+02");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0590
     * @tc.name testIsInteger059
     * @tc.desc Verify isInteger returns false for parseFloat negative exponent fraction result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-02");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0600
     * @tc.name testIsInteger060
     * @tc.desc Verify isInteger returns false for parseFloat second decimal truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2.3");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0610
     * @tc.name testIsInteger061
     * @tc.desc Verify isInteger returns true for parseFloat underflow to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-325");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0620
     * @tc.name testIsInteger062
     * @tc.desc Verify isInteger returns false for parseFloat minimum positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("5e-324");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0630
     * @tc.name testIsInteger063
     * @tc.desc Verify isInteger returns false for parseFloat overflow positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e309");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0640
     * @tc.name testIsInteger064
     * @tc.desc Verify isInteger returns false for parseFloat overflow negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1e309");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0650
     * @tc.name testIsInteger065
     * @tc.desc Verify isInteger returns false for parseFloat lowercase infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("infinity");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0660
     * @tc.name testIsInteger066
     * @tc.desc Verify isInteger returns false for parseFloat plus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0670
     * @tc.name testIsInteger067
     * @tc.desc Verify isInteger returns true for parseInt binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("101101", 2);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0680
     * @tc.name testIsInteger068
     * @tc.desc Verify isInteger returns true for parseInt invalid binary digit truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("101201", 2);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0690
     * @tc.name testIsInteger069
     * @tc.desc Verify isInteger returns false for parseInt invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("10", 37);
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0700
     * @tc.name testIsInteger070
     * @tc.desc Verify isInteger returns false for parseInt underscore prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("_123", 10);
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0710
     * @tc.name testIsInteger071
     * @tc.desc Verify isInteger returns true for parseInt comma truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("123,456", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0720
     * @tc.name testIsInteger072
     * @tc.desc Verify isInteger returns true for parseFloat comma truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42,5");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0730
     * @tc.name testIsInteger073
     * @tc.desc Verify isInteger returns false for parseFloat fraction underscore truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42.5_6");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0740
     * @tc.name testIsInteger074
     * @tc.desc Verify isInteger returns true for parseInt safe integer maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("9007199254740991", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0750
     * @tc.name testIsInteger075
     * @tc.desc Verify isInteger returns true for parseInt safe integer minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-9007199254740991", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0760
     * @tc.name testIsInteger076
     * @tc.desc Verify isInteger returns true for Number safe max plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MAX_SAFE_INTEGER + 1;
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0770
     * @tc.name testIsInteger077
     * @tc.desc Verify isInteger returns true for Number safe min minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MIN_SAFE_INTEGER - 1;
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0780
     * @tc.name testIsInteger078
     * @tc.desc Verify isInteger returns false for negative Number EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.EPSILON;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0790
     * @tc.name testIsInteger079
     * @tc.desc Verify isInteger returns false for negative Number MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MIN_VALUE;
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0800
     * @tc.name testIsInteger080
     * @tc.desc Verify isInteger returns true for negative Number MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE;
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0810
     * @tc.name testIsInteger081
     * @tc.desc Verify isInteger returns false for parseFloat XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.5<script>");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0820
     * @tc.name testIsInteger082
     * @tc.desc Verify isInteger returns true for parseInt XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("15<script>", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0830
     * @tc.name testIsInteger083
     * @tc.desc Verify isInteger returns true for parseFloat int maximum decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("2147483647.0");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0840
     * @tc.name testIsInteger084
     * @tc.desc Verify isInteger returns true for parseFloat int minimum decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-2147483648.0");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0850
     * @tc.name testIsInteger085
     * @tc.desc Verify isInteger returns true for parseInt int overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("2147483648", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0860
     * @tc.name testIsInteger086
     * @tc.desc Verify isInteger returns true for parseInt below int minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-2147483649", 10);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0870
     * @tc.name testIsInteger087
     * @tc.desc Verify isInteger returns true for parseFloat binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0b10");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0880
     * @tc.name testIsInteger088
     * @tc.desc Verify isInteger returns true for parseFloat hex looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0x10");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0890
     * @tc.name testIsInteger089
     * @tc.desc Verify isInteger returns false for parseFloat long mantissa
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2345678901234567");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0900
     * @tc.name testIsInteger090
     * @tc.desc Verify isInteger returns true for parseFloat huge exponent with suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("6.02e+23mol");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0910
     * @tc.name testIsInteger091
     * @tc.desc Verify isInteger returns true for parseInt base 11 digit a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("a", 11);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0920
     * @tc.name testIsInteger092
     * @tc.desc Verify isInteger returns false for parseInt digit b outside base 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("b", 11);
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0930
     * @tc.name testIsInteger093
     * @tc.desc Verify isInteger returns true for parseInt base 20 digit j
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("j", 20);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0940
     * @tc.name testIsInteger094
     * @tc.desc Verify isInteger returns false for parseInt digit k outside base 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("k", 20);
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0950
     * @tc.name testIsInteger095
     * @tc.desc Verify isInteger returns true for parseInt base 35 digit y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("y", 35);
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0960
     * @tc.name testIsInteger096
     * @tc.desc Verify isInteger returns false for parseInt digit z outside base 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("z", 35);
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0970
     * @tc.name testIsInteger097
     * @tc.desc Verify isInteger returns false for parseFloat Japanese suffix truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("3.5\u30C6\u30B9\u30C8");
      let result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0980
     * @tc.name testIsInteger098
     * @tc.desc Verify isInteger returns true for parseInt Japanese suffix truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("42\u30C6\u30B9\u30C8");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_INTEGER_0990
     * @tc.name testIsInteger099
     * @tc.desc Verify isInteger returns true for parseFloat negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsInteger099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-0.0");
      let result: boolean = isInteger(value);
      expect(result).assertTrue();
    });
  });
}
