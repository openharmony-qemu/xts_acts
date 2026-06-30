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

export default function GlobalParseFloatTest(): void {
  describe('GlobalParseFloatTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0010
     * @tc.name testParseFloat001
     * @tc.desc Verify parseFloat with 1 parameter parses "3.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("3.5");
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0020
     * @tc.name testParseFloat002
     * @tc.desc Verify parseFloat("-1.5") returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-1.5");
      expect(result).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0030
     * @tc.name testParseFloat003
     * @tc.desc Verify parseFloat("+3.14") returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("+3.14");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0040
     * @tc.name testParseFloat004
     * @tc.desc Verify parseFloat("1e10") returns 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e10");
      expect(result).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0050
     * @tc.name testParseFloat005
     * @tc.desc Verify parseFloat("1e-5") returns 0.00001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e-5");
      expect(result).assertEqual(0.00001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0060
     * @tc.name testParseFloat006
     * @tc.desc Verify parseFloat("2.5E3") returns 2500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("2.5E3");
      expect(result).assertEqual(2500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0070
     * @tc.name testParseFloat007
     * @tc.desc Verify parseFloat("0") returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("0");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0080
     * @tc.name testParseFloat008
     * @tc.desc Verify parseFloat("0.5") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("0.5");
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0090
     * @tc.name testParseFloat009
     * @tc.desc Verify parseFloat("") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0100
     * @tc.name testParseFloat010
     * @tc.desc Verify parseFloat("Infinity") returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("Infinity");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0110
     * @tc.name testParseFloat011
     * @tc.desc Verify parseFloat("-Infinity") returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-Infinity");
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0120
     * @tc.name testParseFloat012
     * @tc.desc Verify parseFloat("NaN") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("NaN");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0130
     * @tc.name testParseFloat013
     * @tc.desc Verify parseFloat("abc") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("abc");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0140
     * @tc.name testParseFloat014
     * @tc.desc Verify parseFloat("3.14abc") returns 3.14 truncating invalid part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("3.14abc");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0150
     * @tc.name testParseFloat015
     * @tc.desc Verify parseFloat("3.14.5") returns 3.14 truncating second decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("3.14.5");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0160
     * @tc.name testParseFloat016
     * @tc.desc Verify parseFloat(".5") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat(".5");
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0170
     * @tc.name testParseFloat017
     * @tc.desc Verify parseFloat("3.") returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("3.");
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0180
     * @tc.name testParseFloat018
     * @tc.desc Verify parseFloat(".") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat(".");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0190
     * @tc.name testParseFloat019
     * @tc.desc Verify parseFloat("@#$") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("@#$");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0200
     * @tc.name testParseFloat020
     * @tc.desc Verify parseFloat("42px") returns 42 truncating unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("42px");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0210
     * @tc.name testParseFloat021
     * @tc.desc Verify parseFloat("1.7976931348623157e+308") equals Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1.7976931348623157e+308");
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0220
     * @tc.name testParseFloat022
     * @tc.desc Verify parseFloat("5e-324") equals Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("5e-324");
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0230
     * @tc.name testParseFloat023
     * @tc.desc Verify parseFloat("9007199254740991") equals Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("9007199254740991");
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0240
     * @tc.name testParseFloat024
     * @tc.desc Verify parseFloat("-0") returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-0");
      expect(1 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0250
     * @tc.name testParseFloat025
     * @tc.desc Verify parseFloat("1e308") returns finite 1e308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e308");
      expect(result).assertEqual(1e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0260
     * @tc.name testParseFloat026
     * @tc.desc Verify parseFloat("abc3.14") returns NaN for prefix letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("abc3.14");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0270
     * @tc.name testParseFloat027
     * @tc.desc Verify parseFloat("0xFF") returns 0 (does not recognize hex)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("0xFF");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0280
     * @tc.name testParseFloat028
     * @tc.desc Verify parseFloat("\t\n  42") returns 42 ignoring mixed whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("\t\n  42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0290
     * @tc.name testParseFloat029
     * @tc.desc Verify parseFloat(".5.3") returns 0.5 truncating second decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat(".5.3");
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0300
     * @tc.name testParseFloat030
     * @tc.desc Verify parseFloat("-3.2e2") returns -320
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-3.2e2");
      expect(result).assertEqual(-320);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0310
     * @tc.name testParseFloat031
     * @tc.desc Verify parseFloat("1e-324") underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e-324");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0320
     * @tc.name testParseFloat032
     * @tc.desc Verify parseFloat("9007199254740993") exceeds MAX_SAFE_INTEGER and loses precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("9007199254740993");
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0330
     * @tc.name testParseFloat033
     * @tc.desc Verify parseFloat("-9007199254740991") equals Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-9007199254740991");
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0340
     * @tc.name testParseFloat034
     * @tc.desc Verify parseFloat in loop with multiple values returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let values: string[] = ["3.14", "42", "-1.5", "1e10"];
      let expected: number[] = [3.14, 42, -1.5, 1e10];
      for (let i = 0; i < values.length; i++) {
        let result: number = parseFloat(values[i]);
        expect(result).assertEqual(expected[i]);
      }
      let invalidValues: string[] = ["abc"];
      for (let i = 0; i < invalidValues.length; i++) {
        let result: number = parseFloat(invalidValues[i]);
        expect(isNaN(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0350
     * @tc.name testParseFloat035
     * @tc.desc Verify parseFloat("+1.25e2") parses signed exponent string to 125
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("+1.25e2");
      expect(result).assertEqual(125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0360
     * @tc.name testParseFloat036
     * @tc.desc Verify parseFloat("float_case_44") returns NaN for nonnumeric prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("float_case_44");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0370
     * @tc.name testParseFloat037
     * @tc.desc Verify parseFloat("47e1") parses exponent notation as 470
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("47e1");
      expect(result).assertEqual(470);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0380
     * @tc.name testParseFloat038
     * @tc.desc Verify parseFloat parses negative int boundary fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-2147483648.5");
      expect(result).assertEqual(-2147483648.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0390
     * @tc.name testParseFloat039
     * @tc.desc Verify parseFloat parses positive int boundary fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("2147483647.5");
      expect(result).assertEqual(2147483647.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0400
     * @tc.name testParseFloat040
     * @tc.desc Verify parseFloat parses positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("6.022e23");
      expect(result).assertEqual(6.022e23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0410
     * @tc.name testParseFloat041
     * @tc.desc Verify parseFloat parses uppercase positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("6.022E23");
      expect(result).assertEqual(6.022E23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0420
     * @tc.name testParseFloat042
     * @tc.desc Verify parseFloat parses negative mantissa exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-6.022e23");
      expect(result).assertEqual(-6.022e23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0430
     * @tc.name testParseFloat043
     * @tc.desc Verify parseFloat parses negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1.25e-3");
      expect(result).assertEqual(0.00125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0440
     * @tc.name testParseFloat044
     * @tc.desc Verify parseFloat parses trailing decimal before exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12.e2");
      expect(result).assertEqual(1200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0450
     * @tc.name testParseFloat045
     * @tc.desc Verify parseFloat stops at second decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12.34.56");
      expect(result).assertEqual(12.34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0460
     * @tc.name testParseFloat046
     * @tc.desc Verify parseFloat stops at incomplete exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12e");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0470
     * @tc.name testParseFloat047
     * @tc.desc Verify parseFloat stops at incomplete signed exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12e+");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0480
     * @tc.name testParseFloat048
     * @tc.desc Verify parseFloat stops at incomplete negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12e-");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0490
     * @tc.name testParseFloat049
     * @tc.desc Verify parseFloat does not parse hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("0x10");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0500
     * @tc.name testParseFloat050
     * @tc.desc Verify parseFloat overflows above maximum number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1.7976931348623159e+308");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0510
     * @tc.name testParseFloat051
     * @tc.desc Verify parseFloat underflows below negative maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-1.7976931348623159e+308");
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0520
     * @tc.name testParseFloat052
     * @tc.desc Verify parseFloat rounds half minimum tiny value to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("2.4703282292062327e-324");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0530
     * @tc.name testParseFloat053
     * @tc.desc Verify parseFloat parses signed zero exponent form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-0e5");
      expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0540
     * @tc.name testParseFloat054
     * @tc.desc Verify parseFloat parses positive signed zero exponent form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+0e5");
      expect(1.0 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0550
     * @tc.name testParseFloat055
     * @tc.desc Verify parseFloat truncates before alphabetic exponent marker without exponent digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("5eText");
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0560
     * @tc.name testParseFloat056
     * @tc.desc Verify parseFloat returns NaN for Arabic-Indic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("佟佗伲.佶");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0570
     * @tc.name testParseFloat057
     * @tc.desc Verify parseFloat returns NaN for Japanese text prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("銉嗐偣銉?23.5");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0580
     * @tc.name testParseFloat058
     * @tc.desc Verify parseFloat returns NaN for zero width space before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\u200B42.5");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0590
     * @tc.name testParseFloat059
     * @tc.desc Verify parseFloat returns NaN for Chinese text prefix before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("娴嬭瘯123.5");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0600
     * @tc.name testParseFloat060
     * @tc.desc Verify parseFloat returns NaN for lowercase infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("infinity");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0610
     * @tc.name testParseFloat061
     * @tc.desc Verify parseFloat returns NaN for uppercase INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("INFINITY");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0620
     * @tc.name testParseFloat062
     * @tc.desc Verify parseFloat parses leading tab before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\t3.5");
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0630
     * @tc.name testParseFloat063
     * @tc.desc Verify parseFloat parses carriage-return newline whitespace before number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\r\n-42.75");
      expect(result).assertEqual(-42.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0640
     * @tc.name testParseFloat064
     * @tc.desc Verify parseFloat parses signed fractional exponent form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+.75e+2");
      expect(result).assertEqual(75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0650
     * @tc.name testParseFloat065
     * @tc.desc Verify parseFloat parses negative fractional exponent form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-.5e2");
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0660
     * @tc.name testParseFloat066
     * @tc.desc Verify parseFloat parses nonbreaking space before number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\u00A042.5");
      expect(result).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0670
     * @tc.name testParseFloat067
     * @tc.desc Verify parseFloat parses signed positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+Infinity");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0680
     * @tc.name testParseFloat068
     * @tc.desc Verify parseFloat keeps infinity token before trailing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("InfinityText");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0690
     * @tc.name testParseFloat069
     * @tc.desc Verify parseFloat stops before numeric separator character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12_34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0700
     * @tc.name testParseFloat070
     * @tc.desc Verify parseFloat parses double precision integer boundary plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("9007199254740992");
      expect(result).assertEqual(9007199254740992);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0710
     * @tc.name testParseFloat071
     * @tc.desc Verify parseFloat parses form feed whitespace before number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\f5.5");
      expect(result).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0720
     * @tc.name testParseFloat072
     * @tc.desc Verify parseFloat parses leading zeros before decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("000123.4500");
      expect(result).assertEqual(123.45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0730
     * @tc.name testParseFloat073
     * @tc.desc Verify parseFloat parses negative tiny decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-.0001");
      expect(result).assertEqual(-0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0740
     * @tc.name testParseFloat074
     * @tc.desc Verify parseFloat parses positive tiny decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+.0001");
      expect(result).assertEqual(0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0750
     * @tc.name testParseFloat075
     * @tc.desc Verify parseFloat parses large positive exponent below overflow as finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("9.99e307");
      expect(isFinite(result)).assertTrue();
      expect(result > 9.98e307).assertTrue();
      expect(result < 1e308).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0760
     * @tc.name testParseFloat076
     * @tc.desc Verify parseFloat parses minimum normal double value string as positive finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("2.2250738585072014e-308");
      expect(isFinite(result)).assertTrue();
      expect(result > 0).assertTrue();
      expect(result < 1e-307).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0770
     * @tc.name testParseFloat077
     * @tc.desc Verify parseFloat truncates letters after exponent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("123e2abc");
      expect(result).assertEqual(12300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0780
     * @tc.name testParseFloat078
     * @tc.desc Verify parseFloat truncates suffix after negative exponent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("123e-2abc");
      expect(result).assertEqual(1.23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0790
     * @tc.name testParseFloat079
     * @tc.desc Verify parseFloat truncates after signed exponent digits before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("123e+2.5");
      expect(result).assertEqual(12300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0800
     * @tc.name testParseFloat080
     * @tc.desc Verify parseFloat parses trailing decimal point before exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1.e3");
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0810
     * @tc.name testParseFloat081
     * @tc.desc Verify parseFloat returns NaN for decimal point followed only by exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat(".e3");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0820
     * @tc.name testParseFloat082
     * @tc.desc Verify parseFloat truncates hexadecimal float notation at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("0x1.8p10");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0830
     * @tc.name testParseFloat083
     * @tc.desc Verify parseFloat parses decimal string with leading zero eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("08");
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0840
     * @tc.name testParseFloat084
     * @tc.desc Verify parseFloat parses decimal string with leading zero nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("09");
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0850
     * @tc.name testParseFloat085
     * @tc.desc Verify parseFloat parses negative infinity with trailing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-Infinityx");
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0860
     * @tc.name testParseFloat086
     * @tc.desc Verify parseFloat returns NaN for lowercase nan token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("nan");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0870
     * @tc.name testParseFloat087
     * @tc.desc Verify parseFloat returns NaN for plus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0880
     * @tc.name testParseFloat088
     * @tc.desc Verify parseFloat returns NaN for minus sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0890
     * @tc.name testParseFloat089
     * @tc.desc Verify parseFloat truncates at comma group separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1,234.5");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0900
     * @tc.name testParseFloat090
     * @tc.desc Verify parseFloat parses small fixed decimal value near expected magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("0.0000000000000000000000001");
      expect(isFinite(result)).assertTrue();
      expect(result > 9.99e-26).assertTrue();
      expect(result < 1.01e-25).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0910
     * @tc.name testParseFloat091
     * @tc.desc Verify parseFloat parses large integer string in double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("100000000000000000000");
      expect(result).assertEqual(1e20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0920
     * @tc.name testParseFloat092
     * @tc.desc Verify parseFloat parses CR whitespace before positive decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\r42.25");
      expect(result).assertEqual(42.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0930
     * @tc.name testParseFloat093
     * @tc.desc Verify parseFloat parses LF whitespace before negative decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\n-42.25");
      expect(result).assertEqual(-42.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0940
     * @tc.name testParseFloat094
     * @tc.desc Verify parseFloat parses tab and form feed whitespace before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\t\f7.75");
      expect(result).assertEqual(7.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0950
     * @tc.name testParseFloat095
     * @tc.desc Verify parseFloat stops at plus sign after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12+34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0960
     * @tc.name testParseFloat096
     * @tc.desc Verify parseFloat stops at minus sign after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12-34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0970
     * @tc.name testParseFloat097
     * @tc.desc Verify parseFloat stops at slash after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12/34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0980
     * @tc.name testParseFloat098
     * @tc.desc Verify parseFloat stops at colon after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12:34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0990
     * @tc.name testParseFloat099
     * @tc.desc Verify parseFloat parses exponent with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1e0003");
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1000
     * @tc.name testParseFloat100
     * @tc.desc Verify parseFloat parses negative exponent with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1e-0003");
      expect(result).assertEqual(0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1010
     * @tc.name testParseFloat101
     * @tc.desc Verify parseFloat parses positive exponent with leading plus and zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1e+0003");
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1020
     * @tc.name testParseFloat102
     * @tc.desc Verify parseFloat returns NaN for separated infinity token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("In finity");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1030
     * @tc.name testParseFloat103
     * @tc.desc Verify parseFloat returns NaN for leading underscore before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("_42");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1040
     * @tc.name testParseFloat104
     * @tc.desc Verify parseFloat returns NaN for fullwidth digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\uFF11\uFF12.\uFF13");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1050
     * @tc.name testParseFloat105
     * @tc.desc Verify parseFloat returns NaN for Arabic Indic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\u0661\u0662.\u0663");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1060
     * @tc.name testParseFloat106
     * @tc.desc Verify parseFloat parses numeric prefix before Chinese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("42\u6D4B\u8BD5");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1070
     * @tc.name testParseFloat107
     * @tc.desc Verify parseFloat parses numeric prefix before Japanese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("42\u30C6\u30B9\u30C8");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1080
     * @tc.name testParseFloat108
     * @tc.desc Verify parseFloat parses numeric prefix before emoji escape suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("42\uD83D\uDE00");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1090
     * @tc.name testParseFloat109
     * @tc.desc Verify parseFloat returns positive zero for positive underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1e-400");
      expect(1.0 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1100
     * @tc.name testParseFloat110
     * @tc.desc Verify parseFloat returns negative zero for negative underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-1e-400");
      expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

  });
}
