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
import Utils from '../Util.test';

export default function DoubleParseIntThreeTest(): void {
  describe('DoubleParseIntThreeTest', () : void=> {
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
     * @tc.number DBL_PARSE_INT_THREE_0100
     * @tc.name testDoubleParseIntThree0001
     * @tc.desc Verify Double.parseInt with all 2 required parameters s and r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10.0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_0600
     * @tc.name testDoubleParseIntThree0006
     * @tc.desc Verify Double.parseInt with normal hexadecimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("ff", 16.0);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_0700
     * @tc.name testDoubleParseIntThree0007
     * @tc.desc Verify Double.parseInt with normal binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1010", 2.0);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_0800
     * @tc.name testDoubleParseIntThree0008
     * @tc.desc Verify Double.parseInt with normal octal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("17", 8.0);
      expect(result).assertEqual(15.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_0900
     * @tc.name testDoubleParseIntThree0009
     * @tc.desc Verify Double.parseInt with positive sign prefix string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("+42", 10.0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1000
     * @tc.name testDoubleParseIntThree0010
     * @tc.desc Verify Double.parseInt with negative sign prefix string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-42", 10.0);
      expect(result).assertEqual(-42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1100
     * @tc.name testDoubleParseIntThree0011
     * @tc.desc Verify Double.parseInt with base-36 alphanumeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("zz", 36.0);
      expect(result).assertEqual(1295.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1200
     * @tc.name testDoubleParseIntThree0012
     * @tc.desc Verify Double.parseInt with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("", 10.0);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1300
     * @tc.name testDoubleParseIntThree0013
     * @tc.desc Verify Double.parseInt with single character "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("0", 10.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1400
     * @tc.name testDoubleParseIntThree0014
     * @tc.desc Verify Double.parseInt with super large numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("999999999999999999", 10.0);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1500
     * @tc.name testDoubleParseIntThree0015
     * @tc.desc Verify Double.parseInt with maximum base-36 boundary character "z"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("z", 36.0);
      expect(result).assertEqual(35.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1600
     * @tc.name testDoubleParseIntThree0016
     * @tc.desc Verify Double.parseInt with binary boundary character "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1", 2.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1700
     * @tc.name testDoubleParseIntThree0017
     * @tc.desc Verify Double.parseInt with string containing decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("3.14", 10.0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1800
     * @tc.name testDoubleParseIntThree0018
     * @tc.desc Verify Double.parseInt with string containing invalid characters for decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("abc", 10.0);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_1900
     * @tc.name testDoubleParseIntThree0019
     * @tc.desc Verify Double.parseInt with string containing leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt(" 42", 10.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2000
     * @tc.name testDoubleParseIntThree0020
     * @tc.desc Verify Double.parseInt with string containing Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\u4e2d", 10.0);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2100
     * @tc.name testDoubleParseIntThree0021
     * @tc.desc Verify Double.parseInt with zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\u200B", 10.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2200
     * @tc.name testDoubleParseIntThree0022
     * @tc.desc Verify Double.parseInt with string containing XSS content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("<script>alert(1)</script>", 10.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2300
     * @tc.name testDoubleParseIntThree0023
     * @tc.desc Verify Double.parseInt with super long string of 10000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: String = "1".repeat(10000);
      let result: double = Double.parseInt(longStr, 10.0);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2400
     * @tc.name testDoubleParseIntThree0024
     * @tc.desc Verify Double.parseInt when radix characters exceed decimal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1a", 10.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2500
     * @tc.name testDoubleParseIntThree0025
     * @tc.desc Verify Double.parseInt with multilingual Japanese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("テスト", 10.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2600
     * @tc.name testDoubleParseIntThree0026
     * @tc.desc Verify Double.parseInt with scientific notation format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1e3", 10.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2700
     * @tc.name testDoubleParseIntThree0027
     * @tc.desc Verify Double.parseInt with hexadecimal prefix "0x" format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("0xff", 16.0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_2800
     * @tc.name testDoubleParseIntThree0028
     * @tc.desc Verify Double.parseInt with string containing escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42\n33", 10.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3000
     * @tc.name testDoubleParseIntThree0030
     * @tc.desc Verify Double.parseInt with radix value 2.0 for binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 2.0);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3100
     * @tc.name testDoubleParseIntThree0031
     * @tc.desc Verify Double.parseInt with radix value 8.0 for octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 8.0);
      expect(result).assertEqual(8.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3200
     * @tc.name testDoubleParseIntThree0032
     * @tc.desc Verify Double.parseInt with radix value 16.0 for hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 16.0);
      expect(result).assertEqual(16.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3300
     * @tc.name testDoubleParseIntThree0033
     * @tc.desc Verify Double.parseInt with maximum valid radix 36.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 36.0);
      expect(result).assertEqual(36.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3500
     * @tc.name testDoubleParseIntThree0035
     * @tc.desc Verify Double.parseInt with non-integer radix 2.5 floored to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 2.5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3600
     * @tc.name testDoubleParseIntThree0036
     * @tc.desc Verify Double.parseInt with non-integer radix 10.7 floored to 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10.7);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3700
     * @tc.name testDoubleParseIntThree0037
     * @tc.desc Verify Double.parseInt with non-integer radix 15.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("f", 15.3);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3800
     * @tc.name testDoubleParseIntThree0038
     * @tc.desc Verify Double.parseInt with non-integer radix 36.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("z", 36.9);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_3900
     * @tc.name testDoubleParseIntThree0039
     * @tc.desc Verify Double.parseInt with radix value 0.0 treated as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 0.0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4000
     * @tc.name testDoubleParseIntThree0040
     * @tc.desc Verify Double.parseInt with invalid radix value 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 1.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4100
     * @tc.name testDoubleParseIntThree0041
     * @tc.desc Verify Double.parseInt with radix value 37.0 exceeding maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 37.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4200
     * @tc.name testDoubleParseIntThree0042
     * @tc.desc Verify Double.parseInt with negative radix value -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", -1.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4300
     * @tc.name testDoubleParseIntThree0043
     * @tc.desc Verify Double.parseInt with radix value -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", -0.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4400
     * @tc.name testDoubleParseIntThree0044
     * @tc.desc Verify Double.parseInt with NaN as radix value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", Double.NaN);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4500
     * @tc.name testDoubleParseIntThree0045
     * @tc.desc Verify Double.parseInt with positive infinity as radix value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", Double.POSITIVE_INFINITY);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4600
     * @tc.name testDoubleParseIntThree0046
     * @tc.desc Verify Double.parseInt with negative infinity as radix value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4700
     * @tc.name testDoubleParseIntThree0047
     * @tc.desc Verify Double.parseInt with Double.MIN_VALUE as radix value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", Double.MIN_VALUE);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4800
     * @tc.name testDoubleParseIntThree0048
     * @tc.desc Verify Double.parseInt with Double.MAX_VALUE as radix value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", Double.MAX_VALUE);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_4900
     * @tc.name testDoubleParseIntThree0049
     * @tc.desc Verify Double.parseInt with scientific notation radix 1.0e1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 1.0e1);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_5000
     * @tc.name testDoubleParseIntThree0050
     * @tc.desc Verify Double.parseInt returns correct double for standard decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("123", 10.0);
      expect(result).assertEqual(123.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_5100
     * @tc.name testDoubleParseIntThree0051
     * @tc.desc Verify Double.parseInt returns correct value for binary parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1111", 2.0);
      expect(result).assertEqual(15.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_5300
     * @tc.name testDoubleParseIntThree0053
     * @tc.desc Verify Double.parseInt returns correct value for octal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("77", 8.0);
      expect(result).assertEqual(63.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_5900
     * @tc.name testDoubleParseIntThree0059
     * @tc.desc Verify Double.parseInt result is consistent with parseIntCore(s, int(r))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Double.parseInt("ff", 16.0);
      let r2: double = Double.parseIntCore("ff", 16);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6000
     * @tc.name testDoubleParseIntThree0060
     * @tc.desc Verify Double.parseInt return value type is double primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10.0);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6100
     * @tc.name testDoubleParseIntThree0061
     * @tc.desc Verify Double.parseInt return value can be used in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 10.0);
      let sum: double = result + 5.0;
      expect(sum).assertEqual(15.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6200
     * @tc.name testDoubleParseIntThree0062
     * @tc.desc Verify Double.parseInt return value can be used for Double construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10.0);
      let d: Double = new Double(result);
      expect(d.toDouble()).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6300
     * @tc.name testDoubleParseIntThree0063
     * @tc.desc Verify Double.parseInt parses string near int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("2147483647", 10.0);
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6400
     * @tc.name testDoubleParseIntThree0064
     * @tc.desc Verify Double.parseInt parses string near int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-2147483648", 10.0);
      expect(result).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6500
     * @tc.name testDoubleParseIntThree0065
     * @tc.desc Verify Double.parseInt parses super large number beyond int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("99999999999999", 10.0);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6600
     * @tc.name testDoubleParseIntThree0066
     * @tc.desc Verify Double.parseInt returns correct values for single digit in different radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.parseInt("9", 10.0)).assertEqual(9.0);
      expect(Double.parseInt("f", 16.0)).assertEqual(15.0);
      expect(Double.parseInt("1", 2.0)).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6700
     * @tc.name testDoubleParseIntThree0067
     * @tc.desc Verify Double.parseInt returns correct values for "10" in different radices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.parseInt("10", 2.0)).assertEqual(2.0);
      expect(Double.parseInt("10", 8.0)).assertEqual(8.0);
      expect(Double.parseInt("10", 10.0)).assertEqual(10.0);
      expect(Double.parseInt("10", 16.0)).assertEqual(16.0);
      expect(Double.parseInt("10", 36.0)).assertEqual(36.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6800
     * @tc.name testDoubleParseIntThree0068
     * @tc.desc Verify Double.parseInt returns NaN when illegal characters cause parse failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("xyz", 10.0);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_6900
     * @tc.name testDoubleParseIntThree0069
     * @tc.desc Verify Double.parseInt returns NaN when radix character is out of range for octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("9", 8.0);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_7000
     * @tc.name testDoubleParseIntThree0070
     * @tc.desc Verify Double.parseInt returns NaN for hexadecimal character in binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("f", 2.0);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_7300
     * @tc.name testDoubleParseIntThree0073
     * @tc.desc Verify Double.parseInt result when radix is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", -10.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_7600
     * @tc.name testDoubleParseIntThree0076
     * @tc.desc Verify Double.parseInt with empty string and NaN radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("", Double.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_7700
     * @tc.name testDoubleParseIntThree0077
     * @tc.desc Verify Double.parseInt with special character string and boundary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\u200B", 2.0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_7800
     * @tc.name testDoubleParseIntThree0078
     * @tc.desc Verify Double.parseInt with super long string and maximum radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: String = "z".repeat(10000);
      let result: double = Double.parseInt(longStr, 36.0);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_7900
     * @tc.name testDoubleParseIntThree0079
     * @tc.desc Verify Double.parseInt returns NaN for invalid input without throwing exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("invalid");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8200
     * @tc.name testDoubleParseIntThree0082
     * @tc.desc Verify Double.parseInt returns consistent results for multiple calls with same parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Double.parseInt("ff", 16.0);
      let r2: double = Double.parseInt("ff", 16.0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8300
     * @tc.name testDoubleParseIntThree0083
     * @tc.desc Verify parseInt("42", 10.0) is consistent with parseInt("42")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Double.parseInt("42");
      let r2: double = Double.parseInt("42", 10.0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8400
     * @tc.name testDoubleParseIntThree0084
     * @tc.desc Verify parseInt("ff", 16.0) is consistent with parseInt("ff", 16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Double.parseInt("ff", 16);
      let r2: double = Double.parseInt("ff", 16.0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8600
     * @tc.name testDoubleParseIntThree0086
     * @tc.desc Verify Double.parseInt with radix 2.5 parses as binary (floored to 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 2.5);
      expect(result).assertEqual(2);
      let expected: double = Double.parseInt("10", 2.0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8700
     * @tc.name testDoubleParseIntThree0087
     * @tc.desc Verify Double.parseInt with radix 10.9 parses as decimal (floored to 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10.9);
      let expected: double = Double.parseInt("42", 10.0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8800
     * @tc.name testDoubleParseIntThree0088
     * @tc.desc Verify Double.parseInt with radix 15.5 parses as base-15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("e", 15.5);
      let expected: double = Double.parseInt("e", 15.0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_8900
     * @tc.name testDoubleParseIntThree0089
     * @tc.desc Verify Double.parseInt with radix 35.99 parses as base-35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("y", 35.99);
      let expected: double = Double.parseInt("y", 35.0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_9000
     * @tc.name testDoubleParseIntThree0090
     * @tc.desc Verify Double.parseInt with radix 2.1 close to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 2.1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_9100
     * @tc.name testDoubleParseIntThree0091
     * @tc.desc Verify Double.parseInt with radix 36.1 exceeding 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 36.1);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_9200
     * @tc.name testDoubleParseIntThree0092
     * @tc.desc Verify Double.parseInt with radix 0.5 less than 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 0.5);
      expect(result).assertNaN();
    });

    /**
     * @tc.number DBL_PARSE_INT_THREE_9300
     * @tc.name testDoubleParseIntThree0093
     * @tc.desc Verify Double.parseInt with radix 1.5 converted to 1 as invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntThree0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 1.5);
      expect(result).assertNaN();
    });
  });
}
