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

export default function DoubleParseIntTwoTest(): void {
  describe('DoubleParseIntTwoTest', (): void => {
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
     * @tc.number DBL_PARSE_INT_TWO_0100
     * @tc.name testDoubleParseIntTwo0001
     * @tc.desc Verify two required parameters parse correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("ff", 16);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_0500
     * @tc.name testDoubleParseIntTwo0005
     * @tc.desc Verify parsing decimal digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_0700
     * @tc.name testDoubleParseIntTwo0007
     * @tc.desc Verify parsing binary digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1010", 2);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_0800
     * @tc.name testDoubleParseIntTwo0008
     * @tc.desc Verify parsing octal digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("17", 8);
      expect(result).assertEqual(15.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_0900
     * @tc.name testDoubleParseIntTwo0009
     * @tc.desc Verify parsing base-36 string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("z", 36);
      expect(result).assertEqual(35.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1000
     * @tc.name testDoubleParseIntTwo0010
     * @tc.desc Verify parsing string with positive sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("+ff", 16);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1100
     * @tc.name testDoubleParseIntTwo0011
     * @tc.desc Verify parsing string with negative sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-ff", 16);
      expect(result).assertEqual(-255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1200
     * @tc.name testDoubleParseIntTwo0012
     * @tc.desc Verify parsing zero value string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("0", 10);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1300
     * @tc.name testDoubleParseIntTwo0013
     * @tc.desc Verify parsing string with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("000ff", 16);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1400
     * @tc.name testDoubleParseIntTwo0014
     * @tc.desc Verify parsing empty string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1500
     * @tc.name testDoubleParseIntTwo0015
     * @tc.desc Verify parsing space string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt(" ", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1600
     * @tc.name testDoubleParseIntTwo0016
     * @tc.desc Verify parsing zero-width space string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\u200B", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1700
     * @tc.name testDoubleParseIntTwo0017
     * @tc.desc Verify parsing tab character string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\t", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_1800
     * @tc.name testDoubleParseIntTwo0018
     * @tc.desc Verify parsing newline character string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\n", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2200
     * @tc.name testDoubleParseIntTwo0022
     * @tc.desc Verify parsing characters exceeding radix returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("g", 16);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2300
     * @tc.name testDoubleParseIntTwo0023
     * @tc.desc Verify parsing special symbol string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("!@#", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2400
     * @tc.name testDoubleParseIntTwo0024
     * @tc.desc Verify parsing XSS attack string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("<script>alert(1)</script>", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2600
     * @tc.name testDoubleParseIntTwo0026
     * @tc.desc Verify parsing Chinese character string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("中文", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2700
     * @tc.name testDoubleParseIntTwo0027
     * @tc.desc Verify parsing Unicode escape character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\u0061", 16);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2800
     * @tc.name testDoubleParseIntTwo0028
     * @tc.desc Verify parsing Japanese character string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("テスト", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_2900
     * @tc.name testDoubleParseIntTwo0029
     * @tc.desc Verify parsing Emoji string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("😀", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3000
     * @tc.name testDoubleParseIntTwo0030
     * @tc.desc Verify parsing illegal UTF-8 sequence string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\udc04", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3100
     * @tc.name testDoubleParseIntTwo0031
     * @tc.desc Verify radix 2 binary parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 2);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3200
     * @tc.name testDoubleParseIntTwo0032
     * @tc.desc Verify radix 8 octal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 8);
      expect(result).assertEqual(8.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3300
     * @tc.name testDoubleParseIntTwo0033
     * @tc.desc Verify radix 10 decimal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 10);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3400
     * @tc.name testDoubleParseIntTwo0034
     * @tc.desc Verify radix 16 hexadecimal parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 16);
      expect(result).assertEqual(16.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3500
     * @tc.name testDoubleParseIntTwo0035
     * @tc.desc Verify radix 36 maximum valid radix parsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 36);
      expect(result).assertEqual(36.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3600
     * @tc.name testDoubleParseIntTwo0036
     * @tc.desc Verify radix 0 treated as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3700
     * @tc.name testDoubleParseIntTwo0037
     * @tc.desc Verify radix 1 invalid minimum boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("1", 1);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3800
     * @tc.name testDoubleParseIntTwo0038
     * @tc.desc Verify radix 37 exceeding maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 37);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_3900
     * @tc.name testDoubleParseIntTwo0039
     * @tc.desc Verify negative radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", -1);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4000
     * @tc.name testDoubleParseIntTwo0040
     * @tc.desc Verify radix with int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", 2147483647);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4100
     * @tc.name testDoubleParseIntTwo0041
     * @tc.desc Verify radix with int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("10", -2147483648);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4200
     * @tc.name testDoubleParseIntTwo0042
     * @tc.desc Verify binary maximum 8-bit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("11111111", 2);
      expect(result).assertEqual(255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4300
     * @tc.name testDoubleParseIntTwo0043
     * @tc.desc Verify binary all-zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("00000000", 2);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4400
     * @tc.name testDoubleParseIntTwo0044
     * @tc.desc Verify octal three-digit maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("777", 8);
      expect(result).assertEqual(511.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4700
     * @tc.name testDoubleParseIntTwo0047
     * @tc.desc Verify decimal negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-123", 10);
      expect(result).assertEqual(-123.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_4900
     * @tc.name testDoubleParseIntTwo0049
     * @tc.desc Verify radix 0 negative value treated as decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-42", 0);
      expect(result).assertEqual(-42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_5000
     * @tc.name testDoubleParseIntTwo0050
     * @tc.desc Verify different radix parsing returns correct double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.parseInt("10", 2)).assertEqual(2.0);
      expect(Double.parseInt("10", 8)).assertEqual(8.0);
      expect(Double.parseInt("10", 10)).assertEqual(10.0);
      expect(Double.parseInt("10", 16)).assertEqual(16.0);
      expect(Double.parseInt("10", 36)).assertEqual(36.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_5500
     * @tc.name testDoubleParseIntTwo0055
     * @tc.desc Verify parsing zero returns 0.0 in all radixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Double.parseInt("0", 2)).assertEqual(0.0);
      expect(Double.parseInt("0", 8)).assertEqual(0.0);
      expect(Double.parseInt("0", 10)).assertEqual(0.0);
      expect(Double.parseInt("0", 16)).assertEqual(0.0);
      expect(Double.parseInt("0", 36)).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_5600
     * @tc.name testDoubleParseIntTwo0056
     * @tc.desc Verify decimal negative number returns correct negative double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-255", 10);
      expect(result).assertEqual(-255.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_5800
     * @tc.name testDoubleParseIntTwo0058
     * @tc.desc Verify unparseable string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("abc", 10);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_6000
     * @tc.name testDoubleParseIntTwo0060
     * @tc.desc Verify return type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42", 10);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_6200
     * @tc.name testDoubleParseIntTwo0062
     * @tc.desc Verify parsing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("7fffffff", 16);
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_6300
     * @tc.name testDoubleParseIntTwo0063
     * @tc.desc Verify base-36 maximum legal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("zzzzzz", 36);
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_6400
     * @tc.name testDoubleParseIntTwo0064
     * @tc.desc Verify hexadecimal maximum eight-digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("ffffffff", 16);
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_6500
     * @tc.name testDoubleParseIntTwo0065
     * @tc.desc Verify parsing positive zero returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("+0", 10);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_6600
     * @tc.name testDoubleParseIntTwo0066
     * @tc.desc Verify parsing negative zero returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("-0", 10);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_7000
     * @tc.name testDoubleParseIntTwo0070
     * @tc.desc Verify parseInt returns NaN for alphabetic string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("xyz");
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_7500
     * @tc.name testDoubleParseIntTwo0075
     * @tc.desc Verify parseInt with leading whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("\t42");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_7600
     * @tc.name testDoubleParseIntTwo0076
     * @tc.desc Verify parseInt with trailing non-digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Double.parseInt("42abc");
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_PARSE_INT_TWO_8000
     * @tc.name testDoubleParseIntTwo0080
     * @tc.desc Verify parseInt and parseIntCore return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleParseIntTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: double = Double.parseInt("ff", 16);
      let result2: double = Double.parseIntCore("ff", 16);
      expect(result1).assertEqual(result2);
    });
  });
}
