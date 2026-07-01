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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function GlobalIsFiniteTest(): void {
  describe('GlobalIsFiniteTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0010
     * @tc.name testIsFinite001
     * @tc.desc Verify isFinite with 1 number parameter returns true for 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(42.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0020
     * @tc.name testIsFinite002
     * @tc.desc Verify isFinite(42) returns true for positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0030
     * @tc.name testIsFinite003
     * @tc.desc Verify isFinite(3.14) returns true for positive float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(3.14);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0040
     * @tc.name testIsFinite004
     * @tc.desc Verify isFinite(0) returns true for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0050
     * @tc.name testIsFinite005
     * @tc.desc Verify isFinite(-1) returns true for negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0060
     * @tc.name testIsFinite006
     * @tc.desc Verify isFinite(0.0) returns true for zero as float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0070
     * @tc.name testIsFinite007
     * @tc.desc Verify isFinite(NaN) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("NaN"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0080
     * @tc.name testIsFinite008
     * @tc.desc Verify isFinite(Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0090
     * @tc.name testIsFinite009
     * @tc.desc Verify isFinite(-Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("-Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0100
     * @tc.name testIsFinite010
     * @tc.desc Verify isFinite(Number.MAX_VALUE) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0110
     * @tc.name testIsFinite011
     * @tc.desc Verify isFinite(Number.MIN_VALUE) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0120
     * @tc.name testIsFinite012
     * @tc.desc Verify isFinite(Number.MAX_SAFE_INTEGER) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0130
     * @tc.name testIsFinite013
     * @tc.desc Verify isFinite(Number.MIN_SAFE_INTEGER) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0140
     * @tc.name testIsFinite014
     * @tc.desc Verify isFinite(byte 10) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 10;
      let result: boolean = isFinite(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0150
     * @tc.name testIsFinite015
     * @tc.desc Verify isFinite(byte 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 0;
      let result: boolean = isFinite(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0160
     * @tc.name testIsFinite016
     * @tc.desc Verify isFinite(byte 127) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 127;
      let result: boolean = isFinite(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0170
     * @tc.name testIsFinite017
     * @tc.desc Verify isFinite(byte -128) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = -128;
      let result: boolean = isFinite(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0180
     * @tc.name testIsFinite018
     * @tc.desc Verify isFinite(short 1000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 1000;
      let result: boolean = isFinite(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0190
     * @tc.name testIsFinite019
     * @tc.desc Verify isFinite(short 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 0;
      let result: boolean = isFinite(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0200
     * @tc.name testIsFinite020
     * @tc.desc Verify isFinite(short 32767) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 32767;
      let result: boolean = isFinite(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0210
     * @tc.name testIsFinite021
     * @tc.desc Verify isFinite(short -32768) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = -32768;
      let result: boolean = isFinite(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0220
     * @tc.name testIsFinite022
     * @tc.desc Verify isFinite(int 100000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 100000;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0230
     * @tc.name testIsFinite023
     * @tc.desc Verify isFinite(int 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 0;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0240
     * @tc.name testIsFinite024
     * @tc.desc Verify isFinite(int 2147483647) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 2147483647;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0250
     * @tc.name testIsFinite025
     * @tc.desc Verify isFinite(int -2147483648) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = -2147483648;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0260
     * @tc.name testIsFinite026
     * @tc.desc Verify isFinite(long 100000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(100000);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0270
     * @tc.name testIsFinite027
     * @tc.desc Verify isFinite(long 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(0);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0280
     * @tc.name testIsFinite028
     * @tc.desc Verify isFinite(long large positive) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MAX_VALUE);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0290
     * @tc.name testIsFinite029
     * @tc.desc Verify isFinite(long large negative) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MIN_VALUE);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0300
     * @tc.name testIsFinite030
     * @tc.desc Verify isFinite(float 3.14) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 3.14f;
      let result: boolean = isFinite(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0310
     * @tc.name testIsFinite031
     * @tc.desc Verify isFinite(float 0.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 0.0f;
      let result: boolean = isFinite(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0320
     * @tc.name testIsFinite032
     * @tc.desc Verify isFinite(Number.EPSILON) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0330
     * @tc.name testIsFinite033
     * @tc.desc Verify isFinite(-0) returns true for negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(-0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0340
     * @tc.name testIsFinite034
     * @tc.desc Verify isFinite(parseFloat("1e309")) returns false for overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("1e309"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0350
     * @tc.name testIsFinite035
     * @tc.desc Verify isFinite(parseFloat("-1e309")) returns false for negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("-1e309"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0360
     * @tc.name testIsFinite036
     * @tc.desc Verify isFinite(parseInt("2147483647")) returns true for int max string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseInt("2147483647");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0370
     * @tc.name testIsFinite037
     * @tc.desc Verify isFinite returns true for parsed finite decimal 45.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseFloat("45.125");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0380
     * @tc.name testIsFinite038
     * @tc.desc Verify isFinite returns false for zero divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0.0 / 0.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0390
     * @tc.name testIsFinite039
     * @tc.desc Verify isFinite returns false for one divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / 0.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0400
     * @tc.name testIsFinite040
     * @tc.desc Verify isFinite returns false for negative one divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -1.0 / 0.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0410
     * @tc.name testIsFinite041
     * @tc.desc Verify isFinite returns false for overflow positive parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.7976931348623159e+308");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0420
     * @tc.name testIsFinite042
     * @tc.desc Verify isFinite returns false for overflow negative parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1.7976931348623159e+308");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0430
     * @tc.name testIsFinite043
     * @tc.desc Verify isFinite returns true for integer value -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -2;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0440
     * @tc.name testIsFinite044
     * @tc.desc Verify isFinite returns true for infinity reciprocal positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / parseFloat("Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0450
     * @tc.name testIsFinite045
     * @tc.desc Verify isFinite returns true for negative infinity reciprocal negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / parseFloat("-Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0460
     * @tc.name testIsFinite046
     * @tc.desc Verify isFinite returns false for infinity minus infinity result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("Infinity") - parseFloat("Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0470
     * @tc.name testIsFinite047
     * @tc.desc Verify isFinite returns true for parseFloat minimum positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("5e-324");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0480
     * @tc.name testIsFinite048
     * @tc.desc Verify isFinite returns true for parseFloat underflow to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-324");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0490
     * @tc.name testIsFinite049
     * @tc.desc Verify isFinite returns true for maximum finite parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.7976931348623157e+308");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0500
     * @tc.name testIsFinite050
     * @tc.desc Verify isFinite returns false for positive overflow from multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MAX_VALUE * 2.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0510
     * @tc.name testIsFinite051
     * @tc.desc Verify isFinite returns false for negative overflow from multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE * 2.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0520
     * @tc.name testIsFinite052
     * @tc.desc Verify isFinite returns true for parseInt safe boundary result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("9007199254740991", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0530
     * @tc.name testIsFinite053
     * @tc.desc Verify isFinite returns false for parseFloat zero width prefix result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\u200B42.5");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0540
     * @tc.name testIsFinite054
     * @tc.desc Verify isFinite returns false for parseFloat positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0550
     * @tc.name testIsFinite055
     * @tc.desc Verify isFinite returns false for parseFloat negative Infinity suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-Infinityms");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0560
     * @tc.name testIsFinite056
     * @tc.desc Verify isFinite returns false for Infinity minus Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.POSITIVE_INFINITY - Number.POSITIVE_INFINITY;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0570
     * @tc.name testIsFinite057
     * @tc.desc Verify isFinite returns true for negative Number MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0580
     * @tc.name testIsFinite058
     * @tc.desc Verify isFinite returns true for negative Number MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MIN_VALUE;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0590
     * @tc.name testIsFinite059
     * @tc.desc Verify isFinite returns true for negative Number EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.EPSILON;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0600
     * @tc.name testIsFinite060
     * @tc.desc Verify isFinite returns true for parseInt base 36 maximum digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("z", 36);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0610
     * @tc.name testIsFinite061
     * @tc.desc Verify isFinite returns true for parseInt safe integer minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-9007199254740991", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0620
     * @tc.name testIsFinite062
     * @tc.desc Verify isFinite returns true for parseFloat decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".75");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0630
     * @tc.name testIsFinite063
     * @tc.desc Verify isFinite returns true for parseFloat negative decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-.75");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0640
     * @tc.name testIsFinite064
     * @tc.desc Verify isFinite returns true for parseFloat signed exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e+02");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0650
     * @tc.name testIsFinite065
     * @tc.desc Verify isFinite returns true for parseFloat negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-02");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0660
     * @tc.name testIsFinite066
     * @tc.desc Verify isFinite returns true for parseFloat tab prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\t3.5");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0670
     * @tc.name testIsFinite067
     * @tc.desc Verify isFinite returns true for parseInt tab prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("\t42");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0680
     * @tc.name testIsFinite068
     * @tc.desc Verify isFinite returns false for parseFloat zero width prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\u200B3.5");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0690
     * @tc.name testIsFinite069
     * @tc.desc Verify isFinite returns false for parseInt zero width prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("\u200B42");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0700
     * @tc.name testIsFinite070
     * @tc.desc Verify isFinite returns false for parseFloat XSS tag prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("<script>1.5</script>");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0710
     * @tc.name testIsFinite071
     * @tc.desc Verify isFinite returns true for parseFloat XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.5<script>");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0720
     * @tc.name testIsFinite072
     * @tc.desc Verify isFinite returns true for parseInt XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("15<script>", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0730
     * @tc.name testIsFinite073
     * @tc.desc Verify isFinite returns false for parseInt invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("10", 37);
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0740
     * @tc.name testIsFinite074
     * @tc.desc Verify isFinite returns false for parseInt underscore prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("_123", 10);
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0750
     * @tc.name testIsFinite075
     * @tc.desc Verify isFinite returns false for parseFloat plus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0760
     * @tc.name testIsFinite076
     * @tc.desc Verify isFinite returns false for parseFloat minus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0770
     * @tc.name testIsFinite077
     * @tc.desc Verify isFinite returns false for parseFloat exponent marker only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("e10");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0780
     * @tc.name testIsFinite078
     * @tc.desc Verify isFinite returns true for parseFloat incomplete exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e+");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0790
     * @tc.name testIsFinite079
     * @tc.desc Verify isFinite returns true for parseFloat second decimal truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2.3");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0800
     * @tc.name testIsFinite080
     * @tc.desc Verify isFinite returns true for parseInt default binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("0b1010");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0810
     * @tc.name testIsFinite081
     * @tc.desc Verify isFinite returns true for parseFloat binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0b10");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0820
     * @tc.name testIsFinite082
     * @tc.desc Verify isFinite returns true for parseFloat hex looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0x10");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0830
     * @tc.name testIsFinite083
     * @tc.desc Verify isFinite returns false for parseFloat uppercase INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("INFINITY");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0840
     * @tc.name testIsFinite084
     * @tc.desc Verify isFinite returns false for parseFloat lowercase infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("infinity");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0850
     * @tc.name testIsFinite085
     * @tc.desc Verify isFinite returns true for Number safe max plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MAX_SAFE_INTEGER + 1;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0860
     * @tc.name testIsFinite086
     * @tc.desc Verify isFinite returns true for Number safe min minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MIN_SAFE_INTEGER - 1;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0870
     * @tc.name testIsFinite087
     * @tc.desc Verify isFinite returns true for parseFloat int maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("2147483647.0");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0880
     * @tc.name testIsFinite088
     * @tc.desc Verify isFinite returns true for parseFloat int minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-2147483648.0");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0890
     * @tc.name testIsFinite089
     * @tc.desc Verify isFinite returns true for parseInt int overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("2147483648", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0900
     * @tc.name testIsFinite090
     * @tc.desc Verify isFinite returns true for parseInt below int minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-2147483649", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();

    });
  });
}
