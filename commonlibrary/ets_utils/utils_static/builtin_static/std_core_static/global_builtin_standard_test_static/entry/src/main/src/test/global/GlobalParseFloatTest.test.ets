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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0100
     * @tc.name testParseFloat001
     * @tc.desc Verify parseFloat("-1.5") returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-1.5");
      expect(result).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0200
     * @tc.name testParseFloat002
     * @tc.desc Verify parseFloat("1e10") returns 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e10");
      expect(result).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0300
     * @tc.name testParseFloat003
     * @tc.desc Verify parseFloat("2.5E3") returns 2500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("2.5E3");
      expect(result).assertEqual(2500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0400
     * @tc.name testParseFloat004
     * @tc.desc Verify parseFloat("0.5") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("0.5");
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0500
     * @tc.name testParseFloat005
     * @tc.desc Verify parseFloat("-Infinity") returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-Infinity");
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0600
     * @tc.name testParseFloat006
     * @tc.desc Verify parseFloat("3.14abc") returns 3.14 truncating invalid part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("3.14abc");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0700
     * @tc.name testParseFloat007
     * @tc.desc Verify parseFloat("3.14.5") returns 3.14 truncating second decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("3.14.5");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0800
     * @tc.name testParseFloat008
     * @tc.desc Verify parseFloat(".5") returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat(".5");
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_0900
     * @tc.name testParseFloat009
     * @tc.desc Verify parseFloat("@#$") returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("@#$");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1000
     * @tc.name testParseFloat010
     * @tc.desc Verify parseFloat("5e-324") equals Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("5e-324");
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1100
     * @tc.name testParseFloat011
     * @tc.desc Verify parseFloat("9007199254740991") equals Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("9007199254740991");
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1200
     * @tc.name testParseFloat012
     * @tc.desc Verify parseFloat("-0") returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-0");
      expect(1 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1300
     * @tc.name testParseFloat013
     * @tc.desc Verify parseFloat("1e308") returns finite 1e308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("1e308");
      expect(result).assertEqual(1e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1400
     * @tc.name testParseFloat014
     * @tc.desc Verify parseFloat("abc3.14") returns NaN for prefix letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("abc3.14");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1500
     * @tc.name testParseFloat015
     * @tc.desc Verify parseFloat("\t\n  42") returns 42 ignoring mixed whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("\t\n  42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1600
     * @tc.name testParseFloat016
     * @tc.desc Verify parseFloat("-9007199254740991") equals Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("-9007199254740991");
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1700
     * @tc.name testParseFloat017
     * @tc.desc Verify parseFloat in loop with multiple values returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1800
     * @tc.name testParseFloat018
     * @tc.desc Verify parseFloat("float_case_44") returns NaN for nonnumeric prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = parseFloat("float_case_44");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_1900
     * @tc.name testParseFloat019
     * @tc.desc Verify parseFloat parses negative int boundary fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-2147483648.5");
      expect(result).assertEqual(-2147483648.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2000
     * @tc.name testParseFloat020
     * @tc.desc Verify parseFloat parses positive int boundary fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("2147483647.5");
      expect(result).assertEqual(2147483647.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2100
     * @tc.name testParseFloat021
     * @tc.desc Verify parseFloat parses uppercase positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("6.022E23");
      expect(result).assertEqual(6.022E23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2200
     * @tc.name testParseFloat022
     * @tc.desc Verify parseFloat parses negative mantissa exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-6.022e23");
      expect(result).assertEqual(-6.022e23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2300
     * @tc.name testParseFloat023
     * @tc.desc Verify parseFloat parses negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1.25e-3");
      expect(result).assertEqual(0.00125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2400
     * @tc.name testParseFloat024
     * @tc.desc Verify parseFloat stops at second decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12.34.56");
      expect(result).assertEqual(12.34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2500
     * @tc.name testParseFloat025
     * @tc.desc Verify parseFloat stops at incomplete exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12e");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2600
     * @tc.name testParseFloat026
     * @tc.desc Verify parseFloat does not parse hexadecimal prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("0x10");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2700
     * @tc.name testParseFloat027
     * @tc.desc Verify parseFloat overflows above maximum number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1.7976931348623159e+308");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2800
     * @tc.name testParseFloat028
     * @tc.desc Verify parseFloat underflows below negative maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-1.7976931348623159e+308");
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_2900
     * @tc.name testParseFloat029
     * @tc.desc Verify parseFloat rounds half minimum tiny value to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("2.4703282292062327e-324");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3000
     * @tc.name testParseFloat030
     * @tc.desc Verify parseFloat parses signed zero exponent form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-0e5");
      expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3100
     * @tc.name testParseFloat031
     * @tc.desc Verify parseFloat parses positive signed zero exponent form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+0e5");
      expect(1.0 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3200
     * @tc.name testParseFloat032
     * @tc.desc Verify parseFloat returns NaN for Arabic-Indic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("佟佗伲.佶");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3300
     * @tc.name testParseFloat033
     * @tc.desc Verify parseFloat returns NaN for Japanese text prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("銉嗐偣銉?23.5");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3400
     * @tc.name testParseFloat034
     * @tc.desc Verify parseFloat returns NaN for zero width space before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\u200B42.5");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3500
     * @tc.name testParseFloat035
     * @tc.desc Verify parseFloat returns NaN for Chinese text prefix before digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("娴嬭瘯123.5");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3600
     * @tc.name testParseFloat036
     * @tc.desc Verify parseFloat returns NaN for lowercase infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("infinity");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3700
     * @tc.name testParseFloat037
     * @tc.desc Verify parseFloat returns NaN for uppercase INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("INFINITY");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3800
     * @tc.name testParseFloat038
     * @tc.desc Verify parseFloat parses leading tab before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\t3.5");
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_3900
     * @tc.name testParseFloat039
     * @tc.desc Verify parseFloat parses carriage-return newline whitespace before number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\r\n-42.75");
      expect(result).assertEqual(-42.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4000
     * @tc.name testParseFloat040
     * @tc.desc Verify parseFloat parses nonbreaking space before number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\u00A042.5");
      expect(result).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4100
     * @tc.name testParseFloat041
     * @tc.desc Verify parseFloat parses signed positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+Infinity");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4200
     * @tc.name testParseFloat042
     * @tc.desc Verify parseFloat keeps infinity token before trailing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("InfinityText");
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4300
     * @tc.name testParseFloat043
     * @tc.desc Verify parseFloat stops before numeric separator character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12_34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4400
     * @tc.name testParseFloat044
     * @tc.desc Verify parseFloat parses double precision integer boundary plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("9007199254740992");
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4500
     * @tc.name testParseFloat045
     * @tc.desc Verify parseFloat parses positive tiny decimal fraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("+.0001");
      expect(result).assertEqual(0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4600
     * @tc.name testParseFloat046
     * @tc.desc Verify parseFloat parses large positive exponent below overflow as finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("9.99e307");
      expect(isFinite(result)).assertTrue();
      expect(result > 9.98e307).assertTrue();
      expect(result < 1e308).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4700
     * @tc.name testParseFloat047
     * @tc.desc Verify parseFloat parses minimum normal double value string as positive finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("2.2250738585072014e-308");
      expect(isFinite(result)).assertTrue();
      expect(result > 0).assertTrue();
      expect(result < 1e-307).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4800
     * @tc.name testParseFloat048
     * @tc.desc Verify parseFloat truncates letters after exponent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("123e2abc");
      expect(result).assertEqual(12300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_4900
     * @tc.name testParseFloat049
     * @tc.desc Verify parseFloat truncates suffix after negative exponent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("123e-2abc");
      expect(result).assertEqual(1.23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5000
     * @tc.name testParseFloat050
     * @tc.desc Verify parseFloat truncates after signed exponent digits before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("123e+2.5");
      expect(result).assertEqual(12300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5100
     * @tc.name testParseFloat051
     * @tc.desc Verify parseFloat parses trailing decimal point before exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1.e3");
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5200
     * @tc.name testParseFloat052
     * @tc.desc Verify parseFloat returns NaN for decimal point followed only by exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat(".e3");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5300
     * @tc.name testParseFloat053
     * @tc.desc Verify parseFloat parses decimal string with leading zero nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("09");
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5400
     * @tc.name testParseFloat054
     * @tc.desc Verify parseFloat parses negative infinity with trailing text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-Infinityx");
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5500
     * @tc.name testParseFloat055
     * @tc.desc Verify parseFloat returns NaN for lowercase nan token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("nan");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5600
     * @tc.name testParseFloat056
     * @tc.desc Verify parseFloat truncates at comma group separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1,234.5");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5700
     * @tc.name testParseFloat057
     * @tc.desc Verify parseFloat parses small fixed decimal value near expected magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("0.0000000000000000000000001");
      expect(isFinite(result)).assertTrue();
      expect(result > 9.99e-26).assertTrue();
      expect(result < 1.01e-25).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5800
     * @tc.name testParseFloat058
     * @tc.desc Verify parseFloat parses large integer string in double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("100000000000000000000");
      expect(result).assertEqual(1e20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_5900
     * @tc.name testParseFloat059
     * @tc.desc Verify parseFloat parses tab and form feed whitespace before decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("\t\f7.75");
      expect(result).assertEqual(7.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6000
     * @tc.name testParseFloat060
     * @tc.desc Verify parseFloat stops at minus sign after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12-34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6100
     * @tc.name testParseFloat061
     * @tc.desc Verify parseFloat stops at slash after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12/34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6200
     * @tc.name testParseFloat062
     * @tc.desc Verify parseFloat stops at colon after integer prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("12:34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6300
     * @tc.name testParseFloat063
     * @tc.desc Verify parseFloat parses positive exponent with leading plus and zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1e+0003");
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6400
     * @tc.name testParseFloat064
     * @tc.desc Verify parseFloat returns NaN for separated infinity token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("In finity");
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6500
     * @tc.name testParseFloat065
     * @tc.desc Verify parseFloat parses numeric prefix before Chinese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("42\u6D4B\u8BD5");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6600
     * @tc.name testParseFloat066
     * @tc.desc Verify parseFloat parses numeric prefix before Japanese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("42\u30C6\u30B9\u30C8");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6700
     * @tc.name testParseFloat067
     * @tc.desc Verify parseFloat parses numeric prefix before emoji escape suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("42\uD83D\uDE00");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6800
     * @tc.name testParseFloat068
     * @tc.desc Verify parseFloat returns positive zero for positive underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("1e-400");
      expect(1.0 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSE_FLOAT_6900
     * @tc.name testParseFloat069
     * @tc.desc Verify parseFloat returns negative zero for negative underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testParseFloat069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat("-1e-400");
      expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

  });
}
