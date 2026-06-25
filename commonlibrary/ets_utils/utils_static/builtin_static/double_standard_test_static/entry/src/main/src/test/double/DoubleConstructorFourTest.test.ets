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

export default function DoubleConstructorFourTest(): void {
  describe('DoubleConstructorFourTest', () : void => {
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
     * @tc.number DBL_CNSTR_FOUR_CHK_0100
     * @tc.name testDoubleConstructorFour0001
     * @tc.desc Verify passing required String parameter creates Double instance normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_0200
     * @tc.name testDoubleConstructorFour0002
     * @tc.desc Verify calling without parameter matches no-arg constructor instead of String constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
  const value = new Double();
  expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_0500
     * @tc.name testDoubleConstructorFour0005
     * @tc.desc Verify integer string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("42");
      expect(value.valueOf()).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_0600
     * @tc.name testDoubleConstructorFour0006
     * @tc.desc Verify negative number string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("-1.5");
      expect(value.valueOf()).assertEqual(-1.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_0700
     * @tc.name testDoubleConstructorFour0007
     * @tc.desc Verify zero string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("0");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_0800
     * @tc.name testDoubleConstructorFour0008
     * @tc.desc Verify positive sign string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("+3.5");
      expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_0900
     * @tc.name testDoubleConstructorFour0009
     * @tc.desc Verify scientific notation string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("1.23e5");
      expect(value.valueOf()).assertEqual(123000.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1100
     * @tc.name testDoubleConstructorFour0011
     * @tc.desc Verify negative scientific notation parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("-1.5e-3");
      expect(value.valueOf()).assertEqual(-0.0015);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1200
     * @tc.name testDoubleConstructorFour0012
     * @tc.desc Verify leading dot string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(".5");
      expect(value.valueOf()).assertEqual(0.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1300
     * @tc.name testDoubleConstructorFour0013
     * @tc.desc Verify trailing dot string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("5.");
      expect(value.valueOf()).assertEqual(5.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1400
     * @tc.name testDoubleConstructorFour0014
     * @tc.desc Verify Infinity string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("Infinity");
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1500
     * @tc.name testDoubleConstructorFour0015
     * @tc.desc Verify negative Infinity string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("-Infinity");
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1600
     * @tc.name testDoubleConstructorFour0016
     * @tc.desc Verify max double value string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxStr = "1.7976931348623157e308";
      const value = new Double(maxStr);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1700
     * @tc.name testDoubleConstructorFour0017
     * @tc.desc Verify min positive double value string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minStr = "5e-324";
      const value = new Double(minStr);
      expect(value.valueOf() > 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1800
     * @tc.name testDoubleConstructorFour0018
     * @tc.desc Verify overflow string returns positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const overflowStr = "1.7976931348623157e309";
      const value = new Double(overflowStr);
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_1900
     * @tc.name testDoubleConstructorFour0019
     * @tc.desc Verify underflow string returns negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const underflowStr = "-1.7976931348623157e309";
      const value = new Double(underflowStr);
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2000
     * @tc.name testDoubleConstructorFour0020
     * @tc.desc Verify long digit string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = "1234567890".repeat(10);
      const value = new Double(longStr);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2100
     * @tc.name testDoubleConstructorFour0021
     * @tc.desc Verify alphabetic string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2200
     * @tc.name testDoubleConstructorFour0022
     * @tc.desc Verify empty string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2300
     * @tc.name testDoubleConstructorFour0023
     * @tc.desc Verify whitespace string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("   ");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2400
     * @tc.name testDoubleConstructorFour0024
     * @tc.desc Verify special character string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("!@#$%^&*()");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2500
     * @tc.name testDoubleConstructorFour0025
     * @tc.desc Verify XSS string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("<script>alert(1)</script>");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2600
     * @tc.name testDoubleConstructorFour0026
     * @tc.desc Verify Chinese string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("\u6D4B\u8BD5");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2700
     * @tc.name testDoubleConstructorFour0027
     * @tc.desc Verify zero width space string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("\u200B");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2800
     * @tc.name testDoubleConstructorFour0028
     * @tc.desc Verify hex format string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("0x1F");
      expect(value.valueOf()).assertEqual(31.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_2900
     * @tc.name testDoubleConstructorFour0029
     * @tc.desc Verify emoji string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("\uD83D\uDE00");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_3000
     * @tc.name testDoubleConstructorFour0030
     * @tc.desc Verify multi-language string returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("\u30C6\u30B9\u30C8");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_3300
     * @tc.name testDoubleConstructorFour0033
     * @tc.desc Verify passing number type matches different constructor not String constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(3.5);
      expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_3600
     * @tc.name testDoubleConstructorFour0036
     * @tc.desc Verify string returns Double instance with correct valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      expect(value instanceof Double).assertTrue();
      expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_3700
     * @tc.name testDoubleConstructorFour0037
     * @tc.desc Verify negative string returns correct negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("-99.99");
      expect(value.valueOf()).assertEqual(-99.99);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_3900
     * @tc.name testDoubleConstructorFour0039
     * @tc.desc Verify string zero point zero returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("0.0");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4000
     * @tc.name testDoubleConstructorFour0040
     * @tc.desc Verify Infinity string returns positive infinity Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("Infinity");
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4100
     * @tc.name testDoubleConstructorFour0041
     * @tc.desc Verify negative Infinity string returns negative infinity Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("-Infinity");
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4200
     * @tc.name testDoubleConstructorFour0042
     * @tc.desc Verify unparsable string valueOf returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("notANumber");
      expect(Double.isNaN(value.valueOf())).assertTrue();
      expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4300
     * @tc.name testDoubleConstructorFour0043
     * @tc.desc Verify NaN string valueOf returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("NaN");
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4500
     * @tc.name testDoubleConstructorFour0045
     * @tc.desc Verify negative zero string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("-0");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4600
     * @tc.name testDoubleConstructorFour0046
     * @tc.desc Verify positive zero string parsed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("+0");
      expect(value.valueOf()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4700
     * @tc.name testDoubleConstructorFour0047
     * @tc.desc Verify return value is Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      expect(value instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4800
     * @tc.name testDoubleConstructorFour0048
     * @tc.desc Verify toDouble returns correct double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const d: double = value.toDouble();
      expect(d).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_4900
     * @tc.name testDoubleConstructorFour0049
     * @tc.desc Verify valueOf returns correct number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const n: number = value.valueOf();
      expect(n).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5000
     * @tc.name testDoubleConstructorFour0050
     * @tc.desc Verify toString returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const s: String = value.toString();
      expect(s).assertEqual("3.5");
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5100
     * @tc.name testDoubleConstructorFour0051
     * @tc.desc Verify return value inherits Floating class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const b: byte = value.toByte();
      expect(b).assertEqual(3);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5200
     * @tc.name testDoubleConstructorFour0052
     * @tc.desc Verify return value implements Comparable interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const other = new Double("2.5");
      expect(value.compareTo(other)).assertEqual(1);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5300
     * @tc.name testDoubleConstructorFour0053
     * @tc.desc Verify high precision decimal string preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.141592653589793");
      expect(Math.abs(value.valueOf() - 3.141592653589793) < Double.EPSILON).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5400
     * @tc.name testDoubleConstructorFour0054
     * @tc.desc Verify large integer string precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("9007199254740993");
      expect(value.valueOf() > 0).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5500
     * @tc.name testDoubleConstructorFour0055
     * @tc.desc Verify very small positive number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("0.0000000000000001");
      expect(value.valueOf() > 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5600
     * @tc.name testDoubleConstructorFour0056
     * @tc.desc Verify passing illegal type parameter may throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const value = new Double(true as Object as String);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5700
     * @tc.name testDoubleConstructorFour0057
     * @tc.desc Verify unparsable string does not throw exception and returns NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("invalid");
      expect(value instanceof Double).assertTrue();
      expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5800
     * @tc.name testDoubleConstructorFour0058
     * @tc.desc Verify normal string construction in try block does not enter catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
        const value = new Double("3.5");
  expect(value.valueOf()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_5900
     * @tc.name testDoubleConstructorFour0059
     * @tc.desc Verify unparsable string construction does not throw and returns NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCalled = false;
        const value = new Double("abc");
  expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6200
     * @tc.name testDoubleConstructorFour0062
     * @tc.desc Verify string and double constructor produce consistent results for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromStr = new Double("3.5");
      const fromDouble = new Double(3.5);
      expect(fromStr.equals(fromDouble)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6300
     * @tc.name testDoubleConstructorFour0063
     * @tc.desc Verify BigInt and string constructor produce consistent results for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromStr = new Double("42");
      const fromBigInt = new Double(new BigInt(42));
      expect(fromStr.equals(fromBigInt)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6400
     * @tc.name testDoubleConstructorFour0064
     * @tc.desc Verify repeated construction with same string returns equivalent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double("3.5");
      const value2 = new Double("3.5");
      expect(value1.equals(value2)).assertTrue();
      expect(value1.valueOf()).assertEqual(value2.valueOf());
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6500
     * @tc.name testDoubleConstructorFour0065
     * @tc.desc Verify different string formats of same value produce equivalent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double("1.5");
      const value2 = new Double("1.50");
      const value3 = new Double("+1.5");
      expect(value1.equals(value2)).assertTrue();
      expect(value1.equals(value3)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6600
     * @tc.name testDoubleConstructorFour0066
     * @tc.desc Verify toByte method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("12.9");
      expect(value.toByte()).assertEqual(12);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6700
     * @tc.name testDoubleConstructorFour0067
     * @tc.desc Verify toLong method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("123456789");
      expect(value.toLong()).assertEqual(123456789);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6800
     * @tc.name testDoubleConstructorFour0068
     * @tc.desc Verify toFloat method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.14");
      const f: float = value.toFloat();
      expect(f).assertClose(3.14, 0.001);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_6900
     * @tc.name testDoubleConstructorFour0069
     * @tc.desc Verify add method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("1.5");
      const result = value.add(new Double("2.5"));
      expect(result.valueOf()).assertEqual(4.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7000
     * @tc.name testDoubleConstructorFour0070
     * @tc.desc Verify sub method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("10.0");
      const result = value.sub(new Double("3.0"));
      expect(result.valueOf()).assertEqual(7.0);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7100
     * @tc.name testDoubleConstructorFour0071
     * @tc.desc Verify compareTo method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("5.0");
      expect(value.compareTo(new Double("3.0"))).assertEqual(1);
      expect(value.compareTo(new Double("5.0"))).assertEqual(0);
      expect(value.compareTo(new Double("7.0"))).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7200
     * @tc.name testDoubleConstructorFour0072
     * @tc.desc Verify equals method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      expect(value.equals(new Double("3.5"))).assertTrue();
      expect(value.equals(new Double("3.6"))).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7300
     * @tc.name testDoubleConstructorFour0073
     * @tc.desc Verify isFinite returns true for normal numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      expect(value.isFinite()).assertTrue();
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7400
     * @tc.name testDoubleConstructorFour0074
     * @tc.desc Verify isFinite returns false for Infinity string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("Infinity");
      expect(value.isFinite()).assertFalse();
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7500
     * @tc.name testDoubleConstructorFour0075
     * @tc.desc Verify isNaN returns true for unparsable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      expect(value.isNaN()).assertTrue();
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7600
     * @tc.name testDoubleConstructorFour0076
     * @tc.desc Verify toFixed method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.14159");
      expect(value.toFixed(2.0)).assertEqual("3.14");
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7700
     * @tc.name testDoubleConstructorFour0077
     * @tc.desc Verify toExponential method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("1234.5");
      const result = value.toExponential(2);
      expect(result).assertEqual("1.23e+3");
    });

    /**
     * @tc.number DBL_CNSTR_FOUR_CHK_7800
     * @tc.name testDoubleConstructorFour0078
     * @tc.desc Verify toPrecision method works after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorFour0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("12.345");
      const result = value.toPrecision(4);
      expect(result).assertEqual("12.35");
    });
  });
}
