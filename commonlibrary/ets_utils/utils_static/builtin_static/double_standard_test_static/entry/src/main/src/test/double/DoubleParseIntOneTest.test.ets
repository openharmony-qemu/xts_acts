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
import Utils from '../Util.test';

export default function DoubleParseIntOneTest(): void {
  describe('DoubleParseIntOneTest', (): void => {
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
     * @tc.number DBL_PARSE_INT_ONE_0100
     * @tc.name testDoubleParseIntOne0001
     * @tc.desc Verify parseInt with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_0300
     * @tc.name testDoubleParseIntOne0003
     * @tc.desc Verify parseInt parses negative integer string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-42");
      expect(result).assertEqual(-42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_0600
     * @tc.name testDoubleParseIntOne0006
     * @tc.desc Verify parseInt with zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("0");
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_0700
     * @tc.name testDoubleParseIntOne0007
     * @tc.desc Verify parseInt with plus sign prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("+42");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_0800
     * @tc.name testDoubleParseIntOne0008
     * @tc.desc Verify parseInt with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("0042");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_0900
     * @tc.name testDoubleParseIntOne0009
     * @tc.desc Verify parseInt with large integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("999999999999");
      expect(result).assertEqual(999999999999.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1000
     * @tc.name testDoubleParseIntOne0010
     * @tc.desc Verify parseInt with minimum positive integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1");
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1100
     * @tc.name testDoubleParseIntOne0011
     * @tc.desc Verify parseInt with minimum negative integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-1");
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1200
     * @tc.name testDoubleParseIntOne0012
     * @tc.desc Verify parseInt with MAX_SAFE_INTEGER string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxSafe: double = Double.MAX_SAFE_INTEGER;
      let result: double = Double.parseInt(maxSafe.toString());
      expect(result).assertEqual(maxSafe);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1300
     * @tc.name testDoubleParseIntOne0013
     * @tc.desc Verify parseInt with MIN_SAFE_INTEGER string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minSafe: double = Double.MIN_SAFE_INTEGER;
      let result: double = Double.parseInt(minSafe.toString());
      expect(result).assertEqual(minSafe);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1400
     * @tc.name testDoubleParseIntOne0014
     * @tc.desc Verify parseInt with string exceeding safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("9007199254740993");
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1500
     * @tc.name testDoubleParseIntOne0015
     * @tc.desc Verify parseInt returns NaN for empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1600
     * @tc.name testDoubleParseIntOne0016
     * @tc.desc Verify parseInt returns NaN for whitespace-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("   ");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_1700
     * @tc.name testDoubleParseIntOne0017
     * @tc.desc Verify parseInt returns NaN for zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\u200B");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2000
     * @tc.name testDoubleParseIntOne0020
     * @tc.desc Verify parseInt returns NaN for alphabetic string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("abc");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2100
     * @tc.name testDoubleParseIntOne0021
     * @tc.desc Verify parseInt returns NaN for float string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("3.14");
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2200
     * @tc.name testDoubleParseIntOne0022
     * @tc.desc Verify parseInt parses scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("100000");
      expect(result).assertEqual(100000.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2300
     * @tc.name testDoubleParseIntOne0023
     * @tc.desc Verify parseInt parses hexadecimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("0xFF");
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2400
     * @tc.name testDoubleParseIntOne0024
     * @tc.desc Verify parseInt returns NaN for octal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("63");
      expect(result).assertEqual(63.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2500
     * @tc.name testDoubleParseIntOne0025
     * @tc.desc Verify parseInt parses binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10");
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2600
     * @tc.name testDoubleParseIntOne0026
     * @tc.desc Verify parseInt returns NaN for special character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("!@#$%");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_2700
     * @tc.name testDoubleParseIntOne0027
     * @tc.desc Verify parseInt returns NaN for XSS string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("<script>alert(1)</script>");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3000
     * @tc.name testDoubleParseIntOne0030
     * @tc.desc Verify parseInt returns NaN for string with newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\n42");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3100
     * @tc.name testDoubleParseIntOne0031
     * @tc.desc Verify parseInt returns NaN for Infinity string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("Infinity");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3200
     * @tc.name testDoubleParseIntOne0032
     * @tc.desc Verify parseInt returns NaN for NaN string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("NaN");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3300
     * @tc.name testDoubleParseIntOne0033
     * @tc.desc Verify parseInt returns NaN for Chinese numeral string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("四十二");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3400
     * @tc.name testDoubleParseIntOne0034
     * @tc.desc Verify parseInt returns NaN for Japanese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("テスト");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3500
     * @tc.name testDoubleParseIntOne0035
     * @tc.desc Verify parseInt returns NaN for emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("😀123");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3600
     * @tc.name testDoubleParseIntOne0036
     * @tc.desc Verify parseInt returns NaN for invalid UTF-8 sequence string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\udc04");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3700
     * @tc.name testDoubleParseIntOne0037
     * @tc.desc Verify parseInt with very long digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1000000");
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3800
     * @tc.name testDoubleParseIntOne0038
     * @tc.desc Verify parseInt returns NaN for string with surrounding spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("  42  ");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_3900
     * @tc.name testDoubleParseIntOne0039
     * @tc.desc Verify parseInt returns correct double for positive integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42");
      expect(result).assertEqual(42.0);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4200
     * @tc.name testDoubleParseIntOne0042
     * @tc.desc Verify parseInt returns correct double for large integer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1234567890");
      expect(result).assertEqual(1234567890.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4400
     * @tc.name testDoubleParseIntOne0044
     * @tc.desc Verify parseInt returns 0.0 for plus zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("+0");
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4500
     * @tc.name testDoubleParseIntOne0045
     * @tc.desc Verify parseInt returns 0.0 for minus zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-0");
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4600
     * @tc.name testDoubleParseIntOne0046
     * @tc.desc Verify parseInt return type is double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42");
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4700
     * @tc.name testDoubleParseIntOne0047
     * @tc.desc Verify parseInt return value is not Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42");
      expect(result === 42.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4800
     * @tc.name testDoubleParseIntOne0048
     * @tc.desc Verify parseInt return value can be used in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42");
      let sum: double = result + 1.0;
      expect(sum).assertEqual(43.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_4900
     * @tc.name testDoubleParseIntOne0049
     * @tc.desc Verify parseInt returns MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxSafeStr: String = Double.MAX_SAFE_INTEGER.toString();
      let result: double = Double.parseInt(maxSafeStr);
      expect(result).assertEqual(Double.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_5000
     * @tc.name testDoubleParseIntOne0050
     * @tc.desc Verify parseInt returns MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minSafeStr: String = Double.MIN_SAFE_INTEGER.toString();
      let result: double = Double.parseInt(minSafeStr);
      expect(result).assertEqual(Double.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_5200
     * @tc.name testDoubleParseIntOne0052
     * @tc.desc Verify parseInt vs parseFloat comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parseIntResult: double = Double.parseInt("42");
      let parseFloatResult: double = Double.parseFloat("42.0");
      expect(parseIntResult).assertEqual(parseFloatResult);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_5700
     * @tc.name testDoubleParseIntOne0057
     * @tc.desc Verify parseInt returns NaN for special character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("@#$%");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_5900
     * @tc.name testDoubleParseIntOne0059
     * @tc.desc Verify parseInt with mixed digit-letter string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("abc42");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_6200
     * @tc.name testDoubleParseIntOne0062
     * @tc.desc Verify single-parameter parseInt equals double-parameter with radix 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: double = Double.parseInt("42");
      let result2: double = Double.parseInt("42", 10);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_PARSE_INT_ONE_6300
     * @tc.name testDoubleParseIntOne0063
     * @tc.desc Verify single-parameter parseInt does not support hexadecimal while double-parameter does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntOne0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: double = Double.parseInt("ff");
      expect(Double.isNaN(result1)).assertTrue();
      let result2: double = Double.parseInt("ff", 16);
      expect(result2).assertEqual(255.0);
    });
  });
}
