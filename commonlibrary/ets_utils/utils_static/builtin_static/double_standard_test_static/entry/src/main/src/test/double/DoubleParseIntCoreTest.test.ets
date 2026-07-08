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

export default function DoubleParseIntCoreTest(): void {
  describe('DoubleParseIntCoreTest', (): void => {
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
     * @tc.number DBL_PARSE_INT_CORE_0100
     * @tc.name testDoubleParseIntCore0001
     * @tc.desc Verify parseIntCore with both required parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("ff", 16);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_0300
     * @tc.name testDoubleParseIntCore0003
     * @tc.desc Verify parseIntCore returns expected value for normal parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 10);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_0500
     * @tc.name testDoubleParseIntCore0005
     * @tc.desc Verify parseIntCore with decimal digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("123", 10);
      expect(result).assertEqual(123.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_0900
     * @tc.name testDoubleParseIntCore0009
     * @tc.desc Verify parseIntCore with binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("1010", 2);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1000
     * @tc.name testDoubleParseIntCore0010
     * @tc.desc Verify parseIntCore with octal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("17", 8);
      expect(result).assertEqual(15.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1100
     * @tc.name testDoubleParseIntCore0011
     * @tc.desc Verify parseIntCore with base-36 string using letter z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("z", 36);
      expect(result).assertEqual(35.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1200
     * @tc.name testDoubleParseIntCore0012
     * @tc.desc Verify parseIntCore with plus sign prefix string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("+ff", 16);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1300
     * @tc.name testDoubleParseIntCore0013
     * @tc.desc Verify parseIntCore with minus sign prefix string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("-ff", 16);
      expect(result).assertEqual(-255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1400
     * @tc.name testDoubleParseIntCore0014
     * @tc.desc Verify parseIntCore with zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("0", 10);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1500
     * @tc.name testDoubleParseIntCore0015
     * @tc.desc Verify parseIntCore with leading zeros string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("000ff", 16);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1600
     * @tc.name testDoubleParseIntCore0016
     * @tc.desc Verify parseIntCore with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("a", 16);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1700
     * @tc.name testDoubleParseIntCore0017
     * @tc.desc Verify parseIntCore with large value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("7fffffff", 16);
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1800
     * @tc.name testDoubleParseIntCore0018
     * @tc.desc Verify parseIntCore with empty string returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("", 10);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_1900
     * @tc.name testDoubleParseIntCore0019
     * @tc.desc Verify parseIntCore with single space string returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore(" ", 10);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2000
     * @tc.name testDoubleParseIntCore0020
     * @tc.desc Verify parseIntCore with zero-width space returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("\u200B", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2100
     * @tc.name testDoubleParseIntCore0021
     * @tc.desc Verify parseIntCore with tab character returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("\t", 10);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2200
     * @tc.name testDoubleParseIntCore0022
     * @tc.desc Verify parseIntCore with newline character returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("\n", 10);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2300
     * @tc.name testDoubleParseIntCore0023
     * @tc.desc Verify parseIntCore with 1000-character long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: String = "1".repeat(1000);
      let result: double = Double.parseIntCore(longStr, 10);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2400
     * @tc.name testDoubleParseIntCore0024
     * @tc.desc Verify parseIntCore returns NaN for invalid radix character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("g", 16);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2500
     * @tc.name testDoubleParseIntCore0025
     * @tc.desc Verify parseIntCore returns NaN for special character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("!@#", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2600
     * @tc.name testDoubleParseIntCore0026
     * @tc.desc Verify parseIntCore returns NaN for XSS string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("<script>alert(1)</script>", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2700
     * @tc.name testDoubleParseIntCore0027
     * @tc.desc Verify parseIntCore with decimal point string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("12.5", 10);
      expect(result).assertEqual(12.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2800
     * @tc.name testDoubleParseIntCore0028
     * @tc.desc Verify parseIntCore returns NaN for Chinese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("中文", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_2900
     * @tc.name testDoubleParseIntCore0029
     * @tc.desc Verify parseIntCore with Unicode encoded character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("\u0061", 16);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3000
     * @tc.name testDoubleParseIntCore0030
     * @tc.desc Verify parseIntCore returns NaN for Japanese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("テスト", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3100
     * @tc.name testDoubleParseIntCore0031
     * @tc.desc Verify parseIntCore returns NaN for emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("😀", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3200
     * @tc.name testDoubleParseIntCore0032
     * @tc.desc Verify parseIntCore returns NaN for invalid UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("\udc04", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3300
     * @tc.name testDoubleParseIntCore0033
     * @tc.desc Verify parseIntCore with radix 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 2);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3400
     * @tc.name testDoubleParseIntCore0034
     * @tc.desc Verify parseIntCore with radix 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 8);
      expect(result).assertEqual(8.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3600
     * @tc.name testDoubleParseIntCore0036
     * @tc.desc Verify parseIntCore with radix 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 16);
      expect(result).assertEqual(16.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3700
     * @tc.name testDoubleParseIntCore0037
     * @tc.desc Verify parseIntCore with radix 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 36);
      expect(result).assertEqual(36.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3800
     * @tc.name testDoubleParseIntCore0038
     * @tc.desc Verify parseIntCore with radix 0 treated as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 0);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_3900
     * @tc.name testDoubleParseIntCore0039
     * @tc.desc Verify parseIntCore with minimum valid radix 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("1", 2);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4100
     * @tc.name testDoubleParseIntCore0041
     * @tc.desc Verify parseIntCore with radix 1 below valid range returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("1", 1);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4200
     * @tc.name testDoubleParseIntCore0042
     * @tc.desc Verify parseIntCore with radix 37 above valid range returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 37);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4300
     * @tc.name testDoubleParseIntCore0043
     * @tc.desc Verify parseIntCore with negative radix returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", -1);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4400
     * @tc.name testDoubleParseIntCore0044
     * @tc.desc Verify parseIntCore with int max value radix returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 2147483647);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4500
     * @tc.name testDoubleParseIntCore0045
     * @tc.desc Verify parseIntCore with int min value radix returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", -2147483648);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4600
     * @tc.name testDoubleParseIntCore0046
     * @tc.desc Verify parseIntCore with 8-bit all-ones binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("11111111", 2);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4700
     * @tc.name testDoubleParseIntCore0047
     * @tc.desc Verify parseIntCore with 8-bit all-zeros binary string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("00000000", 2);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4800
     * @tc.name testDoubleParseIntCore0048
     * @tc.desc Verify parseIntCore with typical octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("777", 8);
      expect(result).assertEqual(511.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_4900
     * @tc.name testDoubleParseIntCore0049
     * @tc.desc Verify parseIntCore with 8-digit all-f hexadecimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("ffffffff", 16);
      expect(result).assertEqual(4294967295.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_5100
     * @tc.name testDoubleParseIntCore0051
     * @tc.desc Verify parseIntCore with negative decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("-123", 10);
      expect(result).assertEqual(-123.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_5300
     * @tc.name testDoubleParseIntCore0053
     * @tc.desc Verify parseIntCore with radix 0 parses negative number as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("-42", 0);
      expect(result).assertEqual(-42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_5400
     * @tc.name testDoubleParseIntCore0054
     * @tc.desc Verify parseIntCore parses same string in different radixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.parseIntCore("10", 2)).assertEqual(2.0);
      expect(Double.parseIntCore("10", 8)).assertEqual(8.0);
      expect(Double.parseIntCore("10", 10)).assertEqual(10.0);
      expect(Double.parseIntCore("10", 16)).assertEqual(16.0);
      expect(Double.parseIntCore("10", 36)).assertEqual(36.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_5600
     * @tc.name testDoubleParseIntCore0056
     * @tc.desc Verify parseIntCore with invalid char for radix 2 returns NaN or zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("2", 2);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_5700
     * @tc.name testDoubleParseIntCore0057
     * @tc.desc Verify parseIntCore with max valid char for radix 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("f", 16);
      expect(result).assertEqual(15.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_6000
     * @tc.name testDoubleParseIntCore0060
     * @tc.desc Verify parseIntCore returns correct double for decimal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("42", 10);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_6300
     * @tc.name testDoubleParseIntCore0063
     * @tc.desc Verify parseIntCore with radix 0 returns correct double as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("42", 0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_6500
     * @tc.name testDoubleParseIntCore0065
     * @tc.desc Verify parseIntCore returns 0.0 for zero string in all radixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.parseIntCore("0", 2)).assertEqual(0.0);
      expect(Double.parseIntCore("0", 8)).assertEqual(0.0);
      expect(Double.parseIntCore("0", 16)).assertEqual(0.0);
      expect(Double.parseIntCore("0", 36)).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_6600
     * @tc.name testDoubleParseIntCore0066
     * @tc.desc Verify parseIntCore returns negative for minus sign string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("-255", 10);
      expect(result).assertEqual(-255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_6800
     * @tc.name testDoubleParseIntCore0068
     * @tc.desc Verify parseIntCore returns NaN for unparseable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("abc", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7000
     * @tc.name testDoubleParseIntCore0070
     * @tc.desc Verify parseIntCore return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("42", 10);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7100
     * @tc.name testDoubleParseIntCore0071
     * @tc.desc Verify parseIntCore return value can be used in arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 16);
      expect(result + 1.0).assertEqual(17.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7200
     * @tc.name testDoubleParseIntCore0072
     * @tc.desc Verify parseIntCore return value can wrap in Double constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("ff", 16);
      let wrapped = new Double(result);
      expect(wrapped.toDouble()).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7300
     * @tc.name testDoubleParseIntCore0073
     * @tc.desc Verify parseIntCore returns correct double for large value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("7fffffffffffffff", 16);
      expect(result).assertEqual(9223372036854775807.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7400
     * @tc.name testDoubleParseIntCore0074
     * @tc.desc Verify parseIntCore with base-36 large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("zzzzzz", 36);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7500
     * @tc.name testDoubleParseIntCore0075
     * @tc.desc Verify parseIntCore returns double exceeding int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("ffffffff", 16);
      expect(result).assertEqual(4294967295.0);
      expect(result > 2147483647.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7600
     * @tc.name testDoubleParseIntCore0076
     * @tc.desc Verify parseIntCore with plus zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("+0", 10);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7700
     * @tc.name testDoubleParseIntCore0077
     * @tc.desc Verify parseIntCore with minus zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("-0", 10);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_7800
     * @tc.name testDoubleParseIntCore0078
     * @tc.desc Verify parseIntCore with radix 1 catches exception or returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("10", 1);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_8100
     * @tc.name testDoubleParseIntCore0081
     * @tc.desc Verify parseIntCore catches exception for invalid radix character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("xyz", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_8200
     * @tc.name testDoubleParseIntCore0082
     * @tc.desc Verify parseIntCore catches exception for special character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("!@#$%", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_8300
     * @tc.name testDoubleParseIntCore0083
     * @tc.desc Verify parseIntCore catches exception for int max value radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("1", 2147483647);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_8400
     * @tc.name testDoubleParseIntCore0084
     * @tc.desc Verify parseIntCore catches exception for int min value radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("1", -2147483648);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_8600
     * @tc.name testDoubleParseIntCore0086
     * @tc.desc Verify parseIntCore catches exception for null character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("\0", 10);
      expect(Double.isNaN(result) || result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_8900
     * @tc.name testDoubleParseIntCore0089
     * @tc.desc Verify parseIntCore does not depend on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(1.0);
      let result: double = Double.parseIntCore("10", 10);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9100
     * @tc.name testDoubleParseIntCore0091
     * @tc.desc Verify native method returns consistent results across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: double = Double.parseIntCore("ff", 16);
      let result2: double = Double.parseIntCore("ff", 16);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9200
     * @tc.name testDoubleParseIntCore0092
     * @tc.desc Verify native method stability with 1000 consecutive calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        let result: double = Double.parseIntCore("ff", 16);
        expect(result).assertEqual(255.0);
      }
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9300
     * @tc.name testDoubleParseIntCore0093
     * @tc.desc Verify parseIntCore converts hexadecimal color value to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("FF0000", 16);
      expect(result).assertEqual(16711680.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9400
     * @tc.name testDoubleParseIntCore0094
     * @tc.desc Verify parseIntCore parses octal permission value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("755", 8);
      expect(result).assertEqual(493.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9500
     * @tc.name testDoubleParseIntCore0095
     * @tc.desc Verify parseIntCore parses decimal IP address segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("192", 10);
      expect(result).assertEqual(192.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9600
     * @tc.name testDoubleParseIntCore0096
     * @tc.desc Verify parseIntCore with radix 0 equals radix 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result0: double = Double.parseIntCore("123", 0);
      let result10: double = Double.parseIntCore("123", 10);
      expect(result0).assertEqual(result10);
      expect(result0).assertEqual(123.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9700
     * @tc.name testDoubleParseIntCore0097
     * @tc.desc Verify parseIntCore with radix 0 parses negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("-100", 0);
      expect(result).assertEqual(-100.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_CORE_9800
     * @tc.name testDoubleParseIntCore0098
     * @tc.desc Verify parseIntCore with radix 0 parses zero string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntCore0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseIntCore("0", 0);
      expect(result).assertEqual(0.0);
    });
  });
}
