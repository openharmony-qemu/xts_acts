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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

export default function GlobalIsSafeIntegerTest(): void {
  describe('GlobalIsSafeIntegerTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0100
     * @tc.name testIsSafeInteger001
     * @tc.desc Verify isSafeInteger with 1 number parameter returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0200
     * @tc.name testIsSafeInteger002
     * @tc.desc Verify isSafeInteger(9007199254740990) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(9007199254740990);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0300
     * @tc.name testIsSafeInteger003
     * @tc.desc Verify isSafeInteger(-9007199254740990) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-9007199254740990);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0400
     * @tc.name testIsSafeInteger004
     * @tc.desc Verify isSafeInteger(3.5) returns false for non-integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(3.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0500
     * @tc.name testIsSafeInteger005
     * @tc.desc Verify isSafeInteger(-2.7) returns false for non-integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-2.7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0600
     * @tc.name testIsSafeInteger006
     * @tc.desc Verify isSafeInteger(0.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0700
     * @tc.name testIsSafeInteger007
     * @tc.desc Verify isSafeInteger(-0.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0800
     * @tc.name testIsSafeInteger008
     * @tc.desc Verify isSafeInteger(Number.MAX_SAFE_INTEGER + 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MAX_SAFE_INTEGER + 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0900
     * @tc.name testIsSafeInteger009
     * @tc.desc Verify isSafeInteger(Number.MIN_SAFE_INTEGER - 1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MIN_SAFE_INTEGER - 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1000
     * @tc.name testIsSafeInteger010
     * @tc.desc Verify isSafeInteger(Number.MAX_SAFE_INTEGER - 1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MAX_SAFE_INTEGER - 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1100
     * @tc.name testIsSafeInteger011
     * @tc.desc Verify isSafeInteger(Number.MIN_SAFE_INTEGER + 1) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MIN_SAFE_INTEGER + 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1200
     * @tc.name testIsSafeInteger012
     * @tc.desc Verify isSafeInteger(Number.POSITIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1300
     * @tc.name testIsSafeInteger013
     * @tc.desc Verify isSafeInteger(Number.NEGATIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1400
     * @tc.name testIsSafeInteger014
     * @tc.desc Verify isSafeInteger(number 9007199254740992.0) returns false (2^53)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = 9007199254740992.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1500
     * @tc.name testIsSafeInteger015
     * @tc.desc Verify isSafeInteger(number 9007199254740994.0) returns false (2^53+2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = 9007199254740994.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1600
     * @tc.name testIsSafeInteger016
     * @tc.desc Verify isSafeInteger(int -10) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: int = -10;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1700
     * @tc.name testIsSafeInteger017
     * @tc.desc Verify isSafeInteger(int -2147483648) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: int = -2147483648;
      let result: boolean = isSafeInteger(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1800
     * @tc.name testIsSafeInteger018
     * @tc.desc Verify isSafeInteger(long 42) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = Int.toLong(42);
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1900
     * @tc.name testIsSafeInteger019
     * @tc.desc Verify isSafeInteger(long 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = Int.toLong(0);
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2000
     * @tc.name testIsSafeInteger020
     * @tc.desc Verify isSafeInteger(long -100) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = Int.toLong(-100);
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2100
     * @tc.name testIsSafeInteger021
     * @tc.desc Verify isSafeInteger(long 9007199254740991) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = 9007199254740991;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2200
     * @tc.name testIsSafeInteger022
     * @tc.desc Verify isSafeInteger(float 42.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = 42.0f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2300
     * @tc.name testIsSafeInteger023
     * @tc.desc Verify isSafeInteger(float 0.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = 0.0f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2400
     * @tc.name testIsSafeInteger024
     * @tc.desc Verify isSafeInteger(float 3.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = 3.5f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2500
     * @tc.name testIsSafeInteger025
     * @tc.desc Verify isSafeInteger(-9007199254740991) returns true for min safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-9007199254740991);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2600
     * @tc.name testIsSafeInteger026
     * @tc.desc Verify isSafeInteger(number -9007199254740992.0) returns false below min safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = -9007199254740992.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2700
     * @tc.name testIsSafeInteger027
     * @tc.desc Verify isSafeInteger(parseInt("9007199254740991")) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(parseInt("9007199254740991"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2800
     * @tc.name testIsSafeInteger028
     * @tc.desc Verify consecutive number boundary value switching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let safeValue1: number = 9007199254740990.0;
      let safeValue2: number = 9007199254740991.0;
      let unsafeValue: number = 9007199254740992.0;
      expect(isSafeInteger(safeValue1)).assertTrue();
      expect(isSafeInteger(safeValue2)).assertTrue();
      expect(isSafeInteger(unsafeValue)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_2900
     * @tc.name testIsSafeInteger029
     * @tc.desc Verify isSafeInteger(0.1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(0.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3000
     * @tc.name testIsSafeInteger030
     * @tc.desc Verify isSafeInteger(-0.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3100
     * @tc.name testIsSafeInteger031
     * @tc.desc Verify isSafeInteger(1e-10) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(1e-10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3200
     * @tc.name testIsSafeInteger032
     * @tc.desc Verify isSafeInteger(Number.MAX_VALUE) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3300
     * @tc.name testIsSafeInteger033
     * @tc.desc Verify isSafeInteger(Number.MIN_VALUE) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3400
     * @tc.name testIsSafeInteger034
     * @tc.desc Verify isSafeInteger(Number.EPSILON) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3500
     * @tc.name testIsSafeInteger035
     * @tc.desc Verify isSafeInteger(parseInt("9007199254740992")) returns false above safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseInt("9007199254740992");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3600
     * @tc.name testIsSafeInteger036
     * @tc.desc Verify isSafeInteger(long Int.MIN_VALUE) returns true for negative long boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: long = Int.toLong(Int.MIN_VALUE);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3700
     * @tc.name testIsSafeInteger037
     * @tc.desc Verify isSafeInteger returns true for safe integer value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3800
     * @tc.name testIsSafeInteger038
     * @tc.desc Verify isSafeInteger returns true for minimum safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MIN_SAFE_INTEGER;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_3900
     * @tc.name testIsSafeInteger039
     * @tc.desc Verify isSafeInteger returns true for below maximum safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 9007199254740990.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4000
     * @tc.name testIsSafeInteger040
     * @tc.desc Verify isSafeInteger returns true for above minimum safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -9007199254740990.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4100
     * @tc.name testIsSafeInteger041
     * @tc.desc Verify isSafeInteger returns false for positive fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 42.5;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4200
     * @tc.name testIsSafeInteger042
     * @tc.desc Verify isSafeInteger returns false for negative fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -42.5;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4300
     * @tc.name testIsSafeInteger043
     * @tc.desc Verify isSafeInteger returns false for positive infinity parsed from literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("Infinity");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4400
     * @tc.name testIsSafeInteger044
     * @tc.desc Verify isSafeInteger returns true for parseFloat trailing decimal integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42.");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4500
     * @tc.name testIsSafeInteger045
     * @tc.desc Verify isSafeInteger returns false for parseFloat leading decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".42");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4600
     * @tc.name testIsSafeInteger046
     * @tc.desc Verify isSafeInteger returns true for parseFloat exponent integer within safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.25e2");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4700
     * @tc.name testIsSafeInteger047
     * @tc.desc Verify isSafeInteger returns false for large finite integer outside safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 100000000000000000000.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4800
     * @tc.name testIsSafeInteger048
     * @tc.desc Verify isSafeInteger returns false for parseFloat decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".75");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_4900
     * @tc.name testIsSafeInteger049
     * @tc.desc Verify isSafeInteger returns true for parseFloat signed exponent integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e+02");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5000
     * @tc.name testIsSafeInteger050
     * @tc.desc Verify isSafeInteger returns false for parseFloat negative exponent fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-02");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5100
     * @tc.name testIsSafeInteger051
     * @tc.desc Verify isSafeInteger returns false for negative Number EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.EPSILON;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5200
     * @tc.name testIsSafeInteger052
     * @tc.desc Verify isSafeInteger returns false for negative Number MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MIN_VALUE;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5300
     * @tc.name testIsSafeInteger053
     * @tc.desc Verify isSafeInteger returns false for negative Number MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5400
     * @tc.name testIsSafeInteger054
     * @tc.desc Verify isSafeInteger returns false for zero divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0.0 / 0.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5500
     * @tc.name testIsSafeInteger055
     * @tc.desc Verify isSafeInteger returns false for finite divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / 0.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5600
     * @tc.name testIsSafeInteger056
     * @tc.desc Verify isSafeInteger returns false for parseFloat second decimal truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2.3");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5700
     * @tc.name testIsSafeInteger057
     * @tc.desc Verify isSafeInteger returns true for parseFloat comma truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42,5");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5800
     * @tc.name testIsSafeInteger058
     * @tc.desc Verify isSafeInteger returns false for parseFloat fraction underscore truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42.5_6");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_5900
     * @tc.name testIsSafeInteger059
     * @tc.desc Verify isSafeInteger returns true for parseFloat hex looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0x10");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6000
     * @tc.name testIsSafeInteger060
     * @tc.desc Verify isSafeInteger returns true for parseFloat binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0b10");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6100
     * @tc.name testIsSafeInteger061
     * @tc.desc Verify isSafeInteger returns true for parseInt default binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("0b1010");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6200
     * @tc.name testIsSafeInteger062
     * @tc.desc Verify isSafeInteger returns false for parseFloat huge exponent with suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("6.02e+23mol");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6300
     * @tc.name testIsSafeInteger063
     * @tc.desc Verify isSafeInteger returns false for parseFloat XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.5<script>");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6400
     * @tc.name testIsSafeInteger064
     * @tc.desc Verify isSafeInteger returns true for parseInt XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("15<script>", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6500
     * @tc.name testIsSafeInteger065
     * @tc.desc Verify isSafeInteger returns true for parseFloat positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+0.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6600
     * @tc.name testIsSafeInteger066
     * @tc.desc Verify isSafeInteger returns true for parseFloat negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-0.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6700
     * @tc.name testIsSafeInteger067
     * @tc.desc Verify isSafeInteger returns true for parseInt base 11 digit a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("a", 11);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6800
     * @tc.name testIsSafeInteger068
     * @tc.desc Verify isSafeInteger returns false for parseInt digit b outside base 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("b", 11);
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_6900
     * @tc.name testIsSafeInteger069
     * @tc.desc Verify isSafeInteger returns false for parseFloat long mantissa
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2345678901234567");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();

    });
  });
}
