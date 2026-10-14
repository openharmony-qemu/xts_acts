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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0700
     * @tc.name testIsFinite007
     * @tc.desc Verify isFinite(-Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("-Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0800
     * @tc.name testIsFinite008
     * @tc.desc Verify isFinite(Number.MAX_SAFE_INTEGER) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_0900
     * @tc.name testIsFinite009
     * @tc.desc Verify isFinite(Number.MIN_SAFE_INTEGER) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1000
     * @tc.name testIsFinite010
     * @tc.desc Verify isFinite(byte 10) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 10;
      let result: boolean = isFinite(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1100
     * @tc.name testIsFinite011
     * @tc.desc Verify isFinite(short 1000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 1000;
      let result: boolean = isFinite(s);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1200
     * @tc.name testIsFinite012
     * @tc.desc Verify isFinite(int 100000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 100000;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1300
     * @tc.name testIsFinite013
     * @tc.desc Verify isFinite(int 2147483647) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 2147483647;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1400
     * @tc.name testIsFinite014
     * @tc.desc Verify isFinite(int -2147483648) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = -2147483648;
      let result: boolean = isFinite(i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1500
     * @tc.name testIsFinite015
     * @tc.desc Verify isFinite(long 100000) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(100000);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1600
     * @tc.name testIsFinite016
     * @tc.desc Verify isFinite(long 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(0);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1700
     * @tc.name testIsFinite017
     * @tc.desc Verify isFinite(long large positive) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MAX_VALUE);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1800
     * @tc.name testIsFinite018
     * @tc.desc Verify isFinite(long large negative) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MIN_VALUE);
      let result: boolean = isFinite(l);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_1900
     * @tc.name testIsFinite019
     * @tc.desc Verify isFinite(float 3.14) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 3.14f;
      let result: boolean = isFinite(f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2000
     * @tc.name testIsFinite020
     * @tc.desc Verify isFinite(Number.EPSILON) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(Number.EPSILON);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2100
     * @tc.name testIsFinite021
     * @tc.desc Verify isFinite(-0) returns true for negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(-0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2200
     * @tc.name testIsFinite022
     * @tc.desc Verify isFinite(parseFloat("1e309")) returns false for overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("1e309"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2300
     * @tc.name testIsFinite023
     * @tc.desc Verify isFinite(parseFloat("-1e309")) returns false for negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isFinite(parseFloat("-1e309"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2400
     * @tc.name testIsFinite024
     * @tc.desc Verify isFinite(parseInt("2147483647")) returns true for int max string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseInt("2147483647");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2500
     * @tc.name testIsFinite025
     * @tc.desc Verify isFinite returns true for parsed finite decimal 45.125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseFloat("45.125");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2600
     * @tc.name testIsFinite026
     * @tc.desc Verify isFinite returns false for negative one divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -1.0 / 0.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2700
     * @tc.name testIsFinite027
     * @tc.desc Verify isFinite returns false for overflow positive parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.7976931348623159e+308");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2800
     * @tc.name testIsFinite028
     * @tc.desc Verify isFinite returns false for overflow negative parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1.7976931348623159e+308");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_2900
     * @tc.name testIsFinite029
     * @tc.desc Verify isFinite returns true for integer value -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -2;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3000
     * @tc.name testIsFinite030
     * @tc.desc Verify isFinite returns true for infinity reciprocal positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / parseFloat("Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3100
     * @tc.name testIsFinite031
     * @tc.desc Verify isFinite returns true for negative infinity reciprocal negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / parseFloat("-Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3200
     * @tc.name testIsFinite032
     * @tc.desc Verify isFinite returns false for infinity minus infinity result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("Infinity") - parseFloat("Infinity");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3300
     * @tc.name testIsFinite033
     * @tc.desc Verify isFinite returns true for parseFloat minimum positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("5e-324");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3400
     * @tc.name testIsFinite034
     * @tc.desc Verify isFinite returns true for parseFloat underflow to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-324");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3500
     * @tc.name testIsFinite035
     * @tc.desc Verify isFinite returns true for maximum finite parsed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.7976931348623157e+308");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3600
     * @tc.name testIsFinite036
     * @tc.desc Verify isFinite returns false for positive overflow from multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MAX_VALUE * 2.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3700
     * @tc.name testIsFinite037
     * @tc.desc Verify isFinite returns false for negative overflow from multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE * 2.0;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3800
     * @tc.name testIsFinite038
     * @tc.desc Verify isFinite returns true for parseInt safe boundary result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("9007199254740991", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_3900
     * @tc.name testIsFinite039
     * @tc.desc Verify isFinite returns false for parseFloat zero width prefix result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\u200B42.5");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4000
     * @tc.name testIsFinite040
     * @tc.desc Verify isFinite returns false for parseFloat negative Infinity suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-Infinityms");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4100
     * @tc.name testIsFinite041
     * @tc.desc Verify isFinite returns false for Infinity minus Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.POSITIVE_INFINITY - Number.POSITIVE_INFINITY;
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4200
     * @tc.name testIsFinite042
     * @tc.desc Verify isFinite returns true for negative Number MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4300
     * @tc.name testIsFinite043
     * @tc.desc Verify isFinite returns true for negative Number MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MIN_VALUE;
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4400
     * @tc.name testIsFinite044
     * @tc.desc Verify isFinite returns true for parseInt base 36 maximum digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("z", 36);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4500
     * @tc.name testIsFinite045
     * @tc.desc Verify isFinite returns true for parseInt safe integer minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-9007199254740991", 10);
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4600
     * @tc.name testIsFinite046
     * @tc.desc Verify isFinite returns true for parseFloat signed exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e+02");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4700
     * @tc.name testIsFinite047
     * @tc.desc Verify isFinite returns true for parseFloat negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-02");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4800
     * @tc.name testIsFinite048
     * @tc.desc Verify isFinite returns true for parseFloat tab prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\t3.5");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_4900
     * @tc.name testIsFinite049
     * @tc.desc Verify isFinite returns true for parseInt tab prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("\t42");
      let result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_5000
     * @tc.name testIsFinite050
     * @tc.desc Verify isFinite returns false for parseFloat zero width prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\u200B3.5");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_5100
     * @tc.name testIsFinite051
     * @tc.desc Verify isFinite returns false for parseInt zero width prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("\u200B42");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_5200
     * @tc.name testIsFinite052
     * @tc.desc Verify isFinite returns false for parseFloat minus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_FINITE_5300
     * @tc.name testIsFinite053
     * @tc.desc Verify isFinite returns false for parseFloat lowercase infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsFinite053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("infinity");
      let result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

  });
}
