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

export default function GlobalIsNaNTest(): void {
  describe('GlobalIsNaNTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0010
     * @tc.name testIsNaN001
     * @tc.desc Verify isNaN(42) returns false for positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(42);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0020
     * @tc.name testIsNaN002
     * @tc.desc Verify isNaN(3.14) returns false for float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0030
     * @tc.name testIsNaN003
     * @tc.desc Verify isNaN(0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0040
     * @tc.name testIsNaN004
     * @tc.desc Verify isNaN(-1) returns false for negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(-1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0050
     * @tc.name testIsNaN005
     * @tc.desc Verify isNaN(Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(parseFloat("Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0060
     * @tc.name testIsNaN006
     * @tc.desc Verify isNaN(-Infinity) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(parseFloat("-Infinity"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0070
     * @tc.name testIsNaN007
     * @tc.desc Verify isNaN(Number.MAX_VALUE) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(Number.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0080
     * @tc.name testIsNaN008
     * @tc.desc Verify isNaN(Number.MIN_VALUE) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(Number.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0090
     * @tc.name testIsNaN009
     * @tc.desc Verify isNaN(Number.MAX_SAFE_INTEGER) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(Number.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0100
     * @tc.name testIsNaN010
     * @tc.desc Verify isNaN(Number.MIN_SAFE_INTEGER) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(Number.MIN_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0110
     * @tc.name testIsNaN011
     * @tc.desc Verify isNaN(-0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(-0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0120
     * @tc.name testIsNaN012
     * @tc.desc Verify isNaN(byte 10) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 10;
      let result: boolean = isNaN(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0130
     * @tc.name testIsNaN013
     * @tc.desc Verify isNaN(byte -128) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = -128;
      let result: boolean = isNaN(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0140
     * @tc.name testIsNaN014
     * @tc.desc Verify isNaN(byte 127) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 127;
      let result: boolean = isNaN(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0150
     * @tc.name testIsNaN015
     * @tc.desc Verify isNaN(byte 0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: byte = 0;
      let result: boolean = isNaN(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0160
     * @tc.name testIsNaN016
     * @tc.desc Verify isNaN(short 1000) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 1000;
      let result: boolean = isNaN(s);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0170
     * @tc.name testIsNaN017
     * @tc.desc Verify isNaN(short -32768) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = -32768;
      let result: boolean = isNaN(s);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0180
     * @tc.name testIsNaN018
     * @tc.desc Verify isNaN(short 32767) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 32767;
      let result: boolean = isNaN(s);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0190
     * @tc.name testIsNaN019
     * @tc.desc Verify isNaN(short 0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: short = 0;
      let result: boolean = isNaN(s);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0200
     * @tc.name testIsNaN020
     * @tc.desc Verify isNaN(int 100000) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 100000;
      let result: boolean = isNaN(i);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0210
     * @tc.name testIsNaN021
     * @tc.desc Verify isNaN(int -2147483648) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = -2147483648;
      let result: boolean = isNaN(i);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0220
     * @tc.name testIsNaN022
     * @tc.desc Verify isNaN(int 2147483647) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 2147483647;
      let result: boolean = isNaN(i);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0230
     * @tc.name testIsNaN023
     * @tc.desc Verify isNaN(int 0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let i: int = 0;
      let result: boolean = isNaN(i);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0240
     * @tc.name testIsNaN024
     * @tc.desc Verify isNaN(long 100000) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(100000);
      let result: boolean = isNaN(l);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0250
     * @tc.name testIsNaN025
     * @tc.desc Verify isNaN(long 0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(0);
      let result: boolean = isNaN(l);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0260
     * @tc.name testIsNaN026
     * @tc.desc Verify isNaN(long large positive) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MAX_VALUE);
      let result: boolean = isNaN(l);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0270
     * @tc.name testIsNaN027
     * @tc.desc Verify isNaN(long large negative) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let l: long = Int.toLong(Int.MIN_VALUE);
      let result: boolean = isNaN(l);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0280
     * @tc.name testIsNaN028
     * @tc.desc Verify isNaN(float 3.14) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 3.14f;
      let result: boolean = isNaN(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0290
     * @tc.name testIsNaN029
     * @tc.desc Verify isNaN(float 0.0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = 0.0f;
      let result: boolean = isNaN(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0300
     * @tc.name testIsNaN030
     * @tc.desc Verify isNaN(float -1.5) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: float = -1.5f;
      let result: boolean = isNaN(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0310
     * @tc.name testIsNaN031
     * @tc.desc Verify isNaN(Number.POSITIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0320
     * @tc.name testIsNaN032
     * @tc.desc Verify isNaN(Number.NEGATIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(Number.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0330
     * @tc.name testIsNaN033
     * @tc.desc Verify isNaN(+0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(+0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0340
     * @tc.name testIsNaN034
     * @tc.desc Verify isNaN(parseFloat("abc")) returns true for unparseable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = isNaN(parseFloat("abc"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0350
     * @tc.name testIsNaN035
     * @tc.desc Verify isNaN returns false for finite float value 42.5f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let value: float = 42.5f;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0360
     * @tc.name testIsNaN036
     * @tc.desc Verify isNaN returns true for zero divided by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0.0 / 0.0;
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0370
     * @tc.name testIsNaN037
     * @tc.desc Verify isNaN returns true for parseFloat Chinese prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("娑擃厽鏋?.5");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0380
     * @tc.name testIsNaN038
     * @tc.desc Verify isNaN returns true for parseFloat emoji prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("棣冩3.5");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0390
     * @tc.name testIsNaN039
     * @tc.desc Verify isNaN returns true for parseFloat XSS tag prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("<script>1.5</script>");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0400
     * @tc.name testIsNaN040
     * @tc.desc Verify isNaN returns false for Number EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.EPSILON;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0410
     * @tc.name testIsNaN041
     * @tc.desc Verify isNaN returns true for Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.NaN;
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0420
     * @tc.name testIsNaN042
     * @tc.desc Verify isNaN returns true for parseInt with invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("1", 37);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0430
     * @tc.name testIsNaN043
     * @tc.desc Verify isNaN returns false for parseInt with numeric prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("123abc", 10);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0440
     * @tc.name testIsNaN044
     * @tc.desc Verify isNaN returns false for negative Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MIN_VALUE;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0450
     * @tc.name testIsNaN045
     * @tc.desc Verify isNaN returns false for parseFloat with nonbreaking space prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\u00A042.5");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0460
     * @tc.name testIsNaN046
     * @tc.desc Verify isNaN returns false for parseFloat with trailing unit text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("12.5px");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0470
     * @tc.name testIsNaN047
     * @tc.desc Verify isNaN returns true for parseFloat with double plus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("++1");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0480
     * @tc.name testIsNaN048
     * @tc.desc Verify isNaN returns true for parseFloat with double minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("--1");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0490
     * @tc.name testIsNaN049
     * @tc.desc Verify isNaN returns true for parseFloat with mixed plus minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+-1");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0500
     * @tc.name testIsNaN050
     * @tc.desc Verify isNaN returns true for parseFloat with mixed minus plus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-+1");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0510
     * @tc.name testIsNaN051
     * @tc.desc Verify isNaN returns true for parseFloat with exponent marker prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("e10");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0520
     * @tc.name testIsNaN052
     * @tc.desc Verify isNaN returns true for parseFloat with signed exponent marker prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+e10");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0530
     * @tc.name testIsNaN053
     * @tc.desc Verify isNaN returns true for parseFloat with negative exponent marker prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-e10");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0540
     * @tc.name testIsNaN054
     * @tc.desc Verify isNaN returns true for parseFloat with fullwidth decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\uFF11\uFF12.\uFF13");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0550
     * @tc.name testIsNaN055
     * @tc.desc Verify isNaN returns true for parseFloat with Arabic Indic decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("\u0661\u0662.\u0663");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0560
     * @tc.name testIsNaN056
     * @tc.desc Verify isNaN returns true for parseInt with plus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("+", 10);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0570
     * @tc.name testIsNaN057
     * @tc.desc Verify isNaN returns true for parseInt with minus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("-", 10);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0580
     * @tc.name testIsNaN058
     * @tc.desc Verify isNaN returns true for parseInt with hexadecimal prefix only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("0x");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0590
     * @tc.name testIsNaN059
     * @tc.desc Verify isNaN returns false for parseInt truncating invalid hexadecimal prefix digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("0xG");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0600
     * @tc.name testIsNaN060
     * @tc.desc Verify isNaN returns true for parseInt with invalid binary first digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("2", 2);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0610
     * @tc.name testIsNaN061
     * @tc.desc Verify isNaN returns true for parseInt with invalid octal first digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("8", 8);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0620
     * @tc.name testIsNaN062
     * @tc.desc Verify isNaN returns true for parseInt with alphabet outside radix 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("g", 16);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0630
     * @tc.name testIsNaN063
     * @tc.desc Verify isNaN returns true for parseInt with fullwidth hexadecimal digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("\uFF26", 16);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0640
     * @tc.name testIsNaN064
     * @tc.desc Verify isNaN returns true for parseFloat with isolated decimal point and sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+.");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0650
     * @tc.name testIsNaN065
     * @tc.desc Verify isNaN returns true for parseFloat with negative isolated decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-.");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0660
     * @tc.name testIsNaN066
     * @tc.desc Verify isNaN returns true for parseFloat with empty exponent after sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+e");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0670
     * @tc.name testIsNaN067
     * @tc.desc Verify isNaN returns true for parseFloat with negative empty exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-e");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0680
     * @tc.name testIsNaN068
     * @tc.desc Verify isNaN returns true for parseInt with base 36 fullwidth digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("\uFF3A", 36);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0690
     * @tc.name testIsNaN069
     * @tc.desc Verify isNaN returns true for parseInt with decimal point prefix in radix 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt(".f", 16);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0700
     * @tc.name testIsNaN070
     * @tc.desc Verify isNaN returns true for parseFloat with currency prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("$12.5");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0710
     * @tc.name testIsNaN071
     * @tc.desc Verify isNaN returns true for parseInt with currency prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("$12", 10);
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0720
     * @tc.name testIsNaN072
     * @tc.desc Verify isNaN returns true for parseFloat with underscore prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("_12");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0730
     * @tc.name testIsNaN073
     * @tc.desc Verify isNaN returns false for parseFloat stopping at underscore after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1_2");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0740
     * @tc.name testIsNaN074
     * @tc.desc Verify isNaN returns false for parseInt stopping at hyphen after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("1-2", 10);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0750
     * @tc.name testIsNaN075
     * @tc.desc Verify isNaN returns false for parseInt stopping at plus after digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("1+2", 10);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0760
     * @tc.name testIsNaN076
     * @tc.desc Verify isNaN returns false for parseFloat with hexadecimal prefix parsed as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0x1p2");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0770
     * @tc.name testIsNaN077
     * @tc.desc Verify isNaN returns false for parseFloat with binary prefix parsed as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0b101");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0780
     * @tc.name testIsNaN078
     * @tc.desc Verify isNaN returns false for parseFloat with octal prefix parsed as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("0o77");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0790
     * @tc.name testIsNaN079
     * @tc.desc Verify isNaN returns false for parseFloat with trailing exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("99e");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0800
     * @tc.name testIsNaN080
     * @tc.desc Verify isNaN returns false for parseFloat with trailing signed exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("99e+");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0810
     * @tc.name testIsNaN081
     * @tc.desc Verify isNaN returns false for parseFloat with trailing negative exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("99e-");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0820
     * @tc.name testIsNaN082
     * @tc.desc Verify isNaN returns false for parseFloat with comma after integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1,234.5");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0830
     * @tc.name testIsNaN083
     * @tc.desc Verify isNaN returns false for parseInt with comma after integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("1,234", 10);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0840
     * @tc.name testIsNaN084
     * @tc.desc Verify isNaN returns false for parseInt with uppercase digit in radix 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("G", 17);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0850
     * @tc.name testIsNaN085
     * @tc.desc Verify isNaN returns false for parseInt with lowercase digit in radix 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("g", 17);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0860
     * @tc.name testIsNaN086
     * @tc.desc Verify isNaN returns false for parseFloat with positive overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e309");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0870
     * @tc.name testIsNaN087
     * @tc.desc Verify isNaN returns false for parseFloat with negative overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1e309");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0880
     * @tc.name testIsNaN088
     * @tc.desc Verify isNaN returns false for parseFloat with positive underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("1e-400");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0890
     * @tc.name testIsNaN089
     * @tc.desc Verify isNaN returns false for parseFloat with negative underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-1e-400");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0900
     * @tc.name testIsNaN090
     * @tc.desc Verify isNaN returns false for parseInt with radix from positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("10", Number.POSITIVE_INFINITY);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0910
     * @tc.name testIsNaN091
     * @tc.desc Verify isNaN returns false for parseInt with radix from negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("10", Number.NEGATIVE_INFINITY);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0920
     * @tc.name testIsNaN092
     * @tc.desc Verify isNaN returns false for Number.MAX_VALUE divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.MAX_VALUE / 2.0;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0930
     * @tc.name testIsNaN093
     * @tc.desc Verify isNaN returns false for negative Number.MAX_VALUE divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.MAX_VALUE / 2.0;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0940
     * @tc.name testIsNaN094
     * @tc.desc Verify isNaN returns false for Number.EPSILON divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = Number.EPSILON / 2.0;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0950
     * @tc.name testIsNaN095
     * @tc.desc Verify isNaN returns false for negative Number.EPSILON divided by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = -Number.EPSILON / 2.0;
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0960
     * @tc.name testIsNaN096
     * @tc.desc Verify isNaN returns false for parseFloat signed zero with text suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("-0text");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0970
     * @tc.name testIsNaN097
     * @tc.desc Verify isNaN returns false for parseFloat positive signed zero with text suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("+0text");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0980
     * @tc.name testIsNaN098
     * @tc.desc Verify isNaN returns false for parseInt with large base 36 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseInt("zzzz", 36);
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_0990
     * @tc.name testIsNaN099
     * @tc.desc Verify isNaN returns false for parseFloat with numeric prefix before Chinese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("42\u6D4B\u8BD5");
      let result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_IS_NAN_1000
     * @tc.name testIsNaN100
     * @tc.desc Verify isNaN returns true for parseFloat with letter prefix before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsNaN100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = parseFloat("value42");
      let result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

  });
}
