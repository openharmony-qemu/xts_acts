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
import Utils from '../Util.test';

export default function DoubleParseFloatTest(): void {
  describe('DoubleParseFloatTest', (): void => {
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
     * @tc.number DBL_PARSE_FLOAT_CHK_0100
     * @tc.name testDoubleParseFloat0001
     * @tc.desc Verify parseFloat with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("3.5");
      expect(result).assertEqual(3.5);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_0500
     * @tc.name testDoubleParseFloat0005
     * @tc.desc Verify parseFloat with integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("42");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_0600
     * @tc.name testDoubleParseFloat0006
     * @tc.desc Verify parseFloat with negative sign string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("-7.25");
      expect(result).assertEqual(-7.25);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_0700
     * @tc.name testDoubleParseFloat0007
     * @tc.desc Verify parseFloat with positive sign string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("+12.5");
      expect(result).assertEqual(12.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_0800
     * @tc.name testDoubleParseFloat0008
     * @tc.desc Verify parseFloat with zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("0");
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_0900
     * @tc.name testDoubleParseFloat0009
     * @tc.desc Verify parseFloat with negative zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("-0");
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1000
     * @tc.name testDoubleParseFloat0010
     * @tc.desc Verify parseFloat with Infinity string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("Infinity");
      expect(Double.isFinite(result)).assertEqual(false);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1100
     * @tc.name testDoubleParseFloat0011
     * @tc.desc Verify parseFloat with negative Infinity string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("-Infinity");
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1200
     * @tc.name testDoubleParseFloat0012
     * @tc.desc Verify parseFloat with scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.5e3");
      expect(result).assertEqual(1500.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1300
     * @tc.name testDoubleParseFloat0013
     * @tc.desc Verify parseFloat with uppercase E scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("2.5E2");
      expect(result).assertEqual(250.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1400
     * @tc.name testDoubleParseFloat0014
     * @tc.desc Verify parseFloat with negative exponent scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.0e-3");
      expect(result).assertEqual(0.001);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1500
     * @tc.name testDoubleParseFloat0015
     * @tc.desc Verify parseFloat with near MAX_VALUE string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.7976931348623157E308");
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1600
     * @tc.name testDoubleParseFloat0016
     * @tc.desc Verify parseFloat with near MIN_VALUE string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("5E-324");
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1700
     * @tc.name testDoubleParseFloat0017
     * @tc.desc Verify parseFloat with very long digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("123456789012345678901234567890.123456789");
      expect(Double.isFinite(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1800
     * @tc.name testDoubleParseFloat0018
     * @tc.desc Verify parseFloat with overflow string returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.0e309");
      expect(Double.isFinite(result)).assertEqual(false);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_1900
     * @tc.name testDoubleParseFloat0019
     * @tc.desc Verify parseFloat returns NaN for empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2000
     * @tc.name testDoubleParseFloat0020
     * @tc.desc Verify parseFloat returns NaN for whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("   ");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2100
     * @tc.name testDoubleParseFloat0021
     * @tc.desc Verify parseFloat returns NaN for non-numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("abc");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2200
     * @tc.name testDoubleParseFloat0022
     * @tc.desc Verify parseFloat with mixed alphanumeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("12abc34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2300
     * @tc.name testDoubleParseFloat0023
     * @tc.desc Verify parseFloat with zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("\u200B3.5");
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2400
     * @tc.name testDoubleParseFloat0024
     * @tc.desc Verify parseFloat returns NaN for special character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("!@#$%");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2500
     * @tc.name testDoubleParseFloat0025
     * @tc.desc Verify parseFloat returns NaN for XSS attack string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("<script>alert(1)</script>");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2600
     * @tc.name testDoubleParseFloat0026
     * @tc.desc Verify parseFloat returns NaN for Chinese character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("测试");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2700
     * @tc.name testDoubleParseFloat0027
     * @tc.desc Verify parseFloat returns NaN for multilingual string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("テスト");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2800
     * @tc.name testDoubleParseFloat0028
     * @tc.desc Verify parseFloat with decimal point only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat(".");
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_2900
     * @tc.name testDoubleParseFloat0029
     * @tc.desc Verify parseFloat with multiple decimal points string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.2.3");
      expect(result).assertEqual(1.2);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3000
     * @tc.name testDoubleParseFloat0030
     * @tc.desc Verify parseFloat with leading space numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("  3.5");
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3100
     * @tc.name testDoubleParseFloat0031
     * @tc.desc Verify parseFloat with leading zero numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("007.5");
      expect(result).assertEqual(7.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3200
     * @tc.name testDoubleParseFloat0032
     * @tc.desc Verify parseFloat returns NaN for NaN string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("NaN");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3400
     * @tc.name testDoubleParseFloat0034
     * @tc.desc Verify parseFloat with emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("😀123");
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3500
     * @tc.name testDoubleParseFloat0035
     * @tc.desc Verify parseFloat with super long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: String = "3.5";
      for (let i = 0; i < 10000; i++) {
        longStr = longStr + "0";
      }
      let result: double = Double.parseFloat(longStr);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3600
     * @tc.name testDoubleParseFloat0036
     * @tc.desc Verify parseFloat with hex format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("0x10");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3700
     * @tc.name testDoubleParseFloat0037
     * @tc.desc Verify parseFloat returns correct double value for decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("3.14");
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3800
     * @tc.name testDoubleParseFloat0038
     * @tc.desc Verify parseFloat returns double value for integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("100");
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_3900
     * @tc.name testDoubleParseFloat0039
     * @tc.desc Verify parseFloat returns negative double for negative string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("-99.99");
      expect(result).assertEqual(-99.99);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4100
     * @tc.name testDoubleParseFloat0041
     * @tc.desc Verify parseFloat returns positive infinity for Infinity string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("Infinity");
      expect(result > Double.MAX_VALUE).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4200
     * @tc.name testDoubleParseFloat0042
     * @tc.desc Verify parseFloat returns correct value for scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.5e10");
      expect(result).assertEqual(15000000000.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4300
     * @tc.name testDoubleParseFloat0043
     * @tc.desc Verify parseFloat returns NaN when unable to parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("not_a_number");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4500
     * @tc.name testDoubleParseFloat0045
     * @tc.desc Verify parseFloat returns positive infinity for overflow string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.7976931348623157E309");
      expect(Double.isFinite(result)).assertEqual(false);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4600
     * @tc.name testDoubleParseFloat0046
     * @tc.desc Verify parseFloat returns double type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("3.5");
      expect(result).assertEqual(3.5);
      expect(typeof result === 'number').assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4700
     * @tc.name testDoubleParseFloat0047
     * @tc.desc Verify parseFloat result can be used in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("2.5");
      let sum: double = result + 1.0;
      expect(sum).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4800
     * @tc.name testDoubleParseFloat0048
     * @tc.desc Verify parseFloat result can be used in Double constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("7.25");
      let d = new Double(result);
      expect(d.valueOf()).assertEqual(7.25);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_4900
     * @tc.name testDoubleParseFloat0049
     * @tc.desc Verify parseFloat returns value near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1.7976931348623157E308");
      expect(Double.isFinite(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_5000
     * @tc.name testDoubleParseFloat0050
     * @tc.desc Verify parseFloat returns value near MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("1e-100");
      expect(Double.isFinite(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_5100
     * @tc.name testDoubleParseFloat0051
     * @tc.desc Verify parseFloat returns safe integer boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("9007199254740991");
      expect(Double.isSafeInteger(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_5300
     * @tc.name testDoubleParseFloat0053
     * @tc.desc Verify parseFloat returns NaN for pure letter string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("hello");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_5400
     * @tc.name testDoubleParseFloat0054
     * @tc.desc Verify parseFloat returns NaN for special symbol string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("@#$%");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_5600
     * @tc.name testDoubleParseFloat0056
     * @tc.desc Verify parseFloat returns NaN without exception for invalid string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("invalid");
      expect(Double.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_5900
     * @tc.name testDoubleParseFloat0059
     * @tc.desc Verify multiple parseFloat calls are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Double.parseFloat("1.1");
      let r2: double = Double.parseFloat("2.2");
      expect(r1).assertEqual(1.1);
      expect(r2).assertEqual(2.2);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_6000
     * @tc.name testDoubleParseFloat0060
     * @tc.desc Verify native method can be called without instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("42.0");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_6100
     * @tc.name testDoubleParseFloat0061
     * @tc.desc Verify parseFloat matches documentation example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseFloat("3.5");
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_6200
     * @tc.name testDoubleParseFloat0062
     * @tc.desc Verify parseFloat parses decimal while parseInt only parses integer part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatResult: double = Double.parseFloat("3.5");
      let intResult: double = Double.parseInt("3.5");
      expect(floatResult).assertEqual(3.5);
      expect(intResult).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_PARSE_FLOAT_CHK_6300
     * @tc.name testDoubleParseFloat0063
     * @tc.desc Verify parseFloat returns double primitive while constructor returns Double boxed type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseFloat0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatResult: double = Double.parseFloat("3.5");
      let ctorResult = new Double("3.5");
      expect(floatResult).assertEqual(ctorResult.valueOf());
    });
  });
}
