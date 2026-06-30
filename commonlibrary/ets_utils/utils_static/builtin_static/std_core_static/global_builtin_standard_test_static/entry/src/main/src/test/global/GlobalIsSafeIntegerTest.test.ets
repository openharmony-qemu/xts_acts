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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0010
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0020
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0030
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0040
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0050
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0060
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0070
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0080
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0090
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0110
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0120
     * @tc.name testIsSafeInteger012
     * @tc.desc Verify isSafeInteger(parseFloat("NaN")) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(parseFloat("NaN"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0130
     * @tc.name testIsSafeInteger013
     * @tc.desc Verify isSafeInteger(Number.POSITIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0140
     * @tc.name testIsSafeInteger014
     * @tc.desc Verify isSafeInteger(Number.NEGATIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0150
     * @tc.name testIsSafeInteger015
     * @tc.desc Verify isSafeInteger(number 9007199254740992.0) returns false (2^53)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = 9007199254740992.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0160
     * @tc.name testIsSafeInteger016
     * @tc.desc Verify isSafeInteger(number 9007199254740994.0) returns false (2^53+2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = 9007199254740994.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0170
     * @tc.name testIsSafeInteger017
     * @tc.desc Verify isSafeInteger(int 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: int = 0;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0180
     * @tc.name testIsSafeInteger018
     * @tc.desc Verify isSafeInteger(int -10) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: int = -10;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0190
     * @tc.name testIsSafeInteger019
     * @tc.desc Verify isSafeInteger(int -2147483648) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: int = -2147483648;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0200
     * @tc.name testIsSafeInteger020
     * @tc.desc Verify isSafeInteger(long 42) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = Int.toLong(42);
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0210
     * @tc.name testIsSafeInteger021
     * @tc.desc Verify isSafeInteger(long 0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = Int.toLong(0);
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0220
     * @tc.name testIsSafeInteger022
     * @tc.desc Verify isSafeInteger(long -100) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = Int.toLong(-100);
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0230
     * @tc.name testIsSafeInteger023
     * @tc.desc Verify isSafeInteger(long 9007199254740991) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: long = 9007199254740991;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0240
     * @tc.name testIsSafeInteger024
     * @tc.desc Verify isSafeInteger(float 42.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = 42.0f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0250
     * @tc.name testIsSafeInteger025
     * @tc.desc Verify isSafeInteger(float 0.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = 0.0f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0260
     * @tc.name testIsSafeInteger026
     * @tc.desc Verify isSafeInteger(float -1.0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = -1.0f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0270
     * @tc.name testIsSafeInteger027
     * @tc.desc Verify isSafeInteger(float 3.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let val: float = 3.5f;
      let result: boolean = isSafeInteger(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0280
     * @tc.name testIsSafeInteger028
     * @tc.desc Verify isSafeInteger(-9007199254740991) returns true for min safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-9007199254740991);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0290
     * @tc.name testIsSafeInteger029
     * @tc.desc Verify isSafeInteger(number -9007199254740992.0) returns false below min safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = -9007199254740992.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0300
     * @tc.name testIsSafeInteger030
     * @tc.desc Verify isSafeInteger(parseInt("9007199254740991")) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(parseInt("9007199254740991"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0310
     * @tc.name testIsSafeInteger031
     * @tc.desc Verify consecutive number boundary value switching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let safeValue1: number = 9007199254740990.0;
      let safeValue2: number = 9007199254740991.0;
      let unsafeValue: number = 9007199254740992.0;
      expect(isSafeInteger(safeValue1)).assertTrue();
      expect(isSafeInteger(safeValue2)).assertTrue();
      expect(isSafeInteger(unsafeValue)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0320
     * @tc.name testIsSafeInteger032
     * @tc.desc Verify isSafeInteger(0.1) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(0.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0330
     * @tc.name testIsSafeInteger033
     * @tc.desc Verify isSafeInteger(-0.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0340
     * @tc.name testIsSafeInteger034
     * @tc.desc Verify isSafeInteger(1e20) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(1e20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0350
     * @tc.name testIsSafeInteger035
     * @tc.desc Verify isSafeInteger(1e-10) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(1e-10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0360
     * @tc.name testIsSafeInteger036
     * @tc.desc Verify isSafeInteger(Number.MAX_VALUE) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0370
     * @tc.name testIsSafeInteger037
     * @tc.desc Verify isSafeInteger(Number.MIN_VALUE) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0380
     * @tc.name testIsSafeInteger038
     * @tc.desc Verify isSafeInteger(Number.EPSILON) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isSafeInteger(Number.EPSILON);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0390
     * @tc.name testIsSafeInteger039
     * @tc.desc Verify isSafeInteger(parseInt("9007199254740992")) returns false above safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: number = parseInt("9007199254740992");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0400
     * @tc.name testIsSafeInteger040
     * @tc.desc Verify isSafeInteger(long Int.MIN_VALUE) returns true for negative long boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: long = Int.toLong(Int.MIN_VALUE);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0410
     * @tc.name testIsSafeInteger041
     * @tc.desc Verify isSafeInteger returns true for safe integer value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0420
     * @tc.name testIsSafeInteger042
     * @tc.desc Verify isSafeInteger returns true for safe integer value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -1;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0430
     * @tc.name testIsSafeInteger043
     * @tc.desc Verify isSafeInteger returns true for maximum safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MAX_SAFE_INTEGER;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0440
     * @tc.name testIsSafeInteger044
     * @tc.desc Verify isSafeInteger returns true for minimum safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MIN_SAFE_INTEGER;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0450
     * @tc.name testIsSafeInteger045
     * @tc.desc Verify isSafeInteger returns true for below maximum safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 9007199254740990.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0460
     * @tc.name testIsSafeInteger046
     * @tc.desc Verify isSafeInteger returns true for above minimum safe boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -9007199254740990.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0470
     * @tc.name testIsSafeInteger047
     * @tc.desc Verify isSafeInteger returns false for positive fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 42.5;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0480
     * @tc.name testIsSafeInteger048
     * @tc.desc Verify isSafeInteger returns false for negative fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -42.5;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0490
     * @tc.name testIsSafeInteger049
     * @tc.desc Verify isSafeInteger returns false for positive infinity parsed from literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("Infinity");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0500
     * @tc.name testIsSafeInteger050
     * @tc.desc Verify isSafeInteger returns false for negative infinity parsed from literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-Infinity");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0510
     * @tc.name testIsSafeInteger051
     * @tc.desc Verify isSafeInteger returns true for parseFloat trailing decimal integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42.");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0520
     * @tc.name testIsSafeInteger052
     * @tc.desc Verify isSafeInteger returns false for parseFloat leading decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".42");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0530
     * @tc.name testIsSafeInteger053
     * @tc.desc Verify isSafeInteger returns true for parseFloat exponent integer within safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.25e2");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0540
     * @tc.name testIsSafeInteger054
     * @tc.desc Verify isSafeInteger returns false for parseFloat exponent integer outside safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("9.007199254740992e15");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0550
     * @tc.name testIsSafeInteger055
     * @tc.desc Verify isSafeInteger returns true for parseInt truncated suffix inside safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("9007199254740991abc", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0560
     * @tc.name testIsSafeInteger056
     * @tc.desc Verify isSafeInteger returns false for parseInt invalid first digit result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("2", 2);
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0570
     * @tc.name testIsSafeInteger057
     * @tc.desc Verify isSafeInteger returns true for negative zero parsed value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0580
     * @tc.name testIsSafeInteger058
     * @tc.desc Verify isSafeInteger returns true for underflow to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-324");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0590
     * @tc.name testIsSafeInteger059
     * @tc.desc Verify isSafeInteger returns false for large finite integer outside safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 100000000000000000000.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0600
     * @tc.name testIsSafeInteger060
     * @tc.desc Verify isSafeInteger returns true for byte minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: byte = -128;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0610
     * @tc.name testIsSafeInteger061
     * @tc.desc Verify isSafeInteger returns true for short maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: short = 32767;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0620
     * @tc.name testIsSafeInteger062
     * @tc.desc Verify isSafeInteger returns true for Int.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: int = Int.MIN_VALUE;
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0630
     * @tc.name testIsSafeInteger063
     * @tc.desc Verify isSafeInteger returns true for parseInt safe integer maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("9007199254740991", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0640
     * @tc.name testIsSafeInteger064
     * @tc.desc Verify isSafeInteger returns true for parseInt safe integer minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-9007199254740991", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0650
     * @tc.name testIsSafeInteger065
     * @tc.desc Verify isSafeInteger returns true for parseFloat maximum safe integer decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("9007199254740991.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0660
     * @tc.name testIsSafeInteger066
     * @tc.desc Verify isSafeInteger returns true for parseFloat minimum safe integer decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-9007199254740991.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0670
     * @tc.name testIsSafeInteger067
     * @tc.desc Verify isSafeInteger returns false for parseFloat maximum safe integer plus fractional suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("9007199254740991.5");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0680
     * @tc.name testIsSafeInteger068
     * @tc.desc Verify isSafeInteger returns false for parseFloat minimum safe integer minus fractional suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-9007199254740991.5");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0690
     * @tc.name testIsSafeInteger069
     * @tc.desc Verify isSafeInteger returns true for parseInt int overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("2147483648", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0700
     * @tc.name testIsSafeInteger070
     * @tc.desc Verify isSafeInteger returns true for parseInt below int minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-2147483649", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0710
     * @tc.name testIsSafeInteger071
     * @tc.desc Verify isSafeInteger returns true for parseFloat int maximum decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("2147483647.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0720
     * @tc.name testIsSafeInteger072
     * @tc.desc Verify isSafeInteger returns true for parseFloat int minimum decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-2147483648.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0730
     * @tc.name testIsSafeInteger073
     * @tc.desc Verify isSafeInteger returns false for parseFloat decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat(".75");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0740
     * @tc.name testIsSafeInteger074
     * @tc.desc Verify isSafeInteger returns false for parseFloat negative decimal without integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-.75");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0750
     * @tc.name testIsSafeInteger075
     * @tc.desc Verify isSafeInteger returns true for parseFloat signed exponent integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e+02");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0760
     * @tc.name testIsSafeInteger076
     * @tc.desc Verify isSafeInteger returns false for parseFloat negative exponent fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-02");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0770
     * @tc.name testIsSafeInteger077
     * @tc.desc Verify isSafeInteger returns false for parseFloat minimum positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("5e-324");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0780
     * @tc.name testIsSafeInteger078
     * @tc.desc Verify isSafeInteger returns false for parseFloat overflow positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e309");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0790
     * @tc.name testIsSafeInteger079
     * @tc.desc Verify isSafeInteger returns false for parseFloat overflow negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1e309");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0800
     * @tc.name testIsSafeInteger080
     * @tc.desc Verify isSafeInteger returns false for parseFloat lowercase infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("infinity");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0810
     * @tc.name testIsSafeInteger081
     * @tc.desc Verify isSafeInteger returns false for parseFloat plus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0820
     * @tc.name testIsSafeInteger082
     * @tc.desc Verify isSafeInteger returns true for parseInt binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("101101", 2);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0830
     * @tc.name testIsSafeInteger083
     * @tc.desc Verify isSafeInteger returns true for parseInt invalid binary digit truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("101201", 2);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0840
     * @tc.name testIsSafeInteger084
     * @tc.desc Verify isSafeInteger returns false for parseInt invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("10", 37);
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0850
     * @tc.name testIsSafeInteger085
     * @tc.desc Verify isSafeInteger returns false for parseInt underscore prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("_123", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0860
     * @tc.name testIsSafeInteger086
     * @tc.desc Verify isSafeInteger returns false for negative Number EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.EPSILON;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0870
     * @tc.name testIsSafeInteger087
     * @tc.desc Verify isSafeInteger returns false for negative Number MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MIN_VALUE;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0880
     * @tc.name testIsSafeInteger088
     * @tc.desc Verify isSafeInteger returns false for negative Number MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0890
     * @tc.name testIsSafeInteger089
     * @tc.desc Verify isSafeInteger returns false for zero divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0.0 / 0.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0900
     * @tc.name testIsSafeInteger090
     * @tc.desc Verify isSafeInteger returns false for finite divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 1.0 / 0.0;
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0910
     * @tc.name testIsSafeInteger091
     * @tc.desc Verify isSafeInteger returns true for parseInt base 36 maximum digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("z", 36);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0920
     * @tc.name testIsSafeInteger092
     * @tc.desc Verify isSafeInteger returns false for parseFloat second decimal truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2.3");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0930
     * @tc.name testIsSafeInteger093
     * @tc.desc Verify isSafeInteger returns true for parseFloat comma truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42,5");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0940
     * @tc.name testIsSafeInteger094
     * @tc.desc Verify isSafeInteger returns false for parseFloat fraction underscore truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42.5_6");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0950
     * @tc.name testIsSafeInteger095
     * @tc.desc Verify isSafeInteger returns true for parseFloat hex looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0x10");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0960
     * @tc.name testIsSafeInteger096
     * @tc.desc Verify isSafeInteger returns true for parseFloat binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0b10");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0970
     * @tc.name testIsSafeInteger097
     * @tc.desc Verify isSafeInteger returns true for parseInt default binary looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("0b1010");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0980
     * @tc.name testIsSafeInteger098
     * @tc.desc Verify isSafeInteger returns false for parseFloat huge exponent with suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("6.02e+23mol");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_0990
     * @tc.name testIsSafeInteger099
     * @tc.desc Verify isSafeInteger returns false for parseFloat XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.5<script>");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1000
     * @tc.name testIsSafeInteger100
     * @tc.desc Verify isSafeInteger returns true for parseInt XSS suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("15<script>", 10);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1010
     * @tc.name testIsSafeInteger101
     * @tc.desc Verify isSafeInteger returns true for parseFloat positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+0.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1020
     * @tc.name testIsSafeInteger102
     * @tc.desc Verify isSafeInteger returns true for parseFloat negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-0.0");
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1030
     * @tc.name testIsSafeInteger103
     * @tc.desc Verify isSafeInteger returns true for parseInt base 11 digit a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("a", 11);
      let result: boolean = isSafeInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1040
     * @tc.name testIsSafeInteger104
     * @tc.desc Verify isSafeInteger returns false for parseInt digit b outside base 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("b", 11);
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_SAFE_INTEGER_1050
     * @tc.name testIsSafeInteger105
     * @tc.desc Verify isSafeInteger returns false for parseFloat long mantissa
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsSafeInteger105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1.2345678901234567");
      let result: boolean = isSafeInteger(value);
      expect(result).assertFalse();

    });
  });
}
