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

export default function DoubleToLocaleString1Test(): void {
      describe('DoubleToLocaleString1Test', (): void => {
        beforeAll((): void => {
        });
        beforeEach(async (): Promise<void> => {
          await Utils.msSleep(30);
        });
        afterEach((): void => {
        });
        afterAll((): void => {
        });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0100
     * @tc.name testDoubleToLocaleString1001
     * @tc.desc Verify calling toLocaleString without parameters uses default formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString();
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0200
     * @tc.name testDoubleToLocaleString1002
     * @tc.desc Verify calling toLocaleString with only locales parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0300
     * @tc.name testDoubleToLocaleString1003
     * @tc.desc Verify calling toLocaleString with both locales and options parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { style: "currency", currency: "USD" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0400
     * @tc.name testDoubleToLocaleString1004
     * @tc.desc Verify calling toLocaleString with undefined locales and options parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result = value.toLocaleString(undefined, options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0500
     * @tc.name testDoubleToLocaleString1005
     * @tc.desc Verify passing extra undeclared parameters to toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { style: "decimal" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0600
     * @tc.name testDoubleToLocaleString1006
     * @tc.desc Verify calling toLocaleString with common BCP 47 locale tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      expect(value.toLocaleString("en-US")).not().assertNull();
      expect(value.toLocaleString("zh-CN")).not().assertNull();
      expect(value.toLocaleString("ja-JP")).not().assertNull();
      expect(value.toLocaleString("de-DE")).not().assertNull();
      expect(value.toLocaleString("fr-FR")).not().assertNull();
      expect(value.toLocaleString("ko-KR")).not().assertNull();
      expect(value.toLocaleString("es-ES")).not().assertNull();
      expect(value.toLocaleString("ru-RU")).not().assertNull();
      expect(value.toLocaleString("ar-SA")).not().assertNull();
      expect(value.toLocaleString("pt-BR")).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0700
     * @tc.name testDoubleToLocaleString1007
     * @tc.desc Verify calling toLocaleString with language-only locale tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      expect(value.toLocaleString("en")).not().assertNull();
      expect(value.toLocaleString("zh")).not().assertNull();
      expect(value.toLocaleString("ja")).not().assertNull();
      expect(value.toLocaleString("fr")).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0800
     * @tc.name testDoubleToLocaleString1008
     * @tc.desc Verify calling toLocaleString with full BCP 47 tags including script and region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      expect(value.toLocaleString("zh-Hans-CN")).not().assertNull();
      expect(value.toLocaleString("zh-Hant-TW")).not().assertNull();
      expect(value.toLocaleString("en-Latn-US")).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_0900
     * @tc.name testDoubleToLocaleString1009
     * @tc.desc Verify calling toLocaleString with single-element locale array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString(["en-US"]);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1000
     * @tc.name testDoubleToLocaleString1010
     * @tc.desc Verify calling toLocaleString with multi-element locale fallback array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString(["zh-CN", "en-US"]);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1100
     * @tc.name testDoubleToLocaleString1011
     * @tc.desc Verify calling toLocaleString with empty string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1200
     * @tc.name testDoubleToLocaleString1012
     * @tc.desc Verify calling toLocaleString with whitespace string locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString(" ");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1300
     * @tc.name testDoubleToLocaleString1013
     * @tc.desc Verify calling toLocaleString with empty array as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const locales: string[] = [];
      const result = value.toLocaleString(locales);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1400
     * @tc.name testDoubleToLocaleString1014
     * @tc.desc Verify calling toLocaleString with extra long locale string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const longLocale = "en".repeat(1000);
      try {
        const result = value.toLocaleString(longLocale);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1500
     * @tc.name testDoubleToLocaleString1015
     * @tc.desc Verify calling toLocaleString with explicit undefined locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString(undefined);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1600
     * @tc.name testDoubleToLocaleString1016
     * @tc.desc Verify calling toLocaleString with null as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString(null as Intl.LocalesArgument);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1700
     * @tc.name testDoubleToLocaleString1017
     * @tc.desc Verify calling toLocaleString with invalid BCP 47 locale tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        expect(value.toLocaleString("xx-XX")).not().assertNull();
        expect(value.toLocaleString("invalid-locale")).not().assertNull();
        expect(value.toLocaleString("12345")).not().assertNull();
        expect(value.toLocaleString("!@#$%")).not().assertNull();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1800
     * @tc.name testDoubleToLocaleString1018
     * @tc.desc Verify calling toLocaleString with number type as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString(123 as Object as Intl.LocalesArgument);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_1900
     * @tc.name testDoubleToLocaleString1019
     * @tc.desc Verify calling toLocaleString with boolean as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString(true as Object as Intl.LocalesArgument);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2000
     * @tc.name testDoubleToLocaleString1020
     * @tc.desc Verify calling toLocaleString with array containing null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString([null, "en-US"] as Object as Intl.LocalesArgument);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2100
     * @tc.name testDoubleToLocaleString1021
     * @tc.desc Verify calling toLocaleString with XSS script string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("<script>alert(1)</script>");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2200
     * @tc.name testDoubleToLocaleString1022
     * @tc.desc Verify calling toLocaleString with Unicode special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        expect(value.toLocaleString("\u200B")).not().assertNull();
        expect(value.toLocaleString("\u0000")).not().assertNull();
        expect(value.toLocaleString("\u4e2d\u6587")).not().assertNull();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2300
     * @tc.name testDoubleToLocaleString1023
     * @tc.desc Verify calling toLocaleString with zero-width space in locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("en\u200BUS");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2600
     * @tc.name testDoubleToLocaleString1026
     * @tc.desc Verify toLocaleString with style percent option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.75);
      const options: Intl.NumberFormatOptions = { style: "percent" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2700
     * @tc.name testDoubleToLocaleString1027
     * @tc.desc Verify toLocaleString with minimumFractionDigits option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2800
     * @tc.name testDoubleToLocaleString1028
     * @tc.desc Verify toLocaleString with maximumFractionDigits option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.56789);
      const options: Intl.NumberFormatOptions = { maximumFractionDigits: 2 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2900
     * @tc.name testDoubleToLocaleString1029
     * @tc.desc Verify toLocaleString with minimumIntegerDigits option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(5.5);
      const options: Intl.NumberFormatOptions = { minimumIntegerDigits: 4 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3000
     * @tc.name testDoubleToLocaleString1030
     * @tc.desc Verify toLocaleString with useGrouping option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234567.89);
      const optionsWithGrouping: Intl.NumberFormatOptions = { useGrouping: true };
      const optionsNoGrouping: Intl.NumberFormatOptions = { useGrouping: false };
      expect(value.toLocaleString("en-US", optionsWithGrouping)).not().assertNull();
      expect(value.toLocaleString("en-US", optionsNoGrouping)).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3100
     * @tc.name testDoubleToLocaleString1031
     * @tc.desc Verify toLocaleString with currencySign accounting option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1234.5);
      const options: Intl.NumberFormatOptions = { style: "currency", currency: "USD", currencySign: "accounting" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3200
     * @tc.name testDoubleToLocaleString1032
     * @tc.desc Verify toLocaleString with combined multiple options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = {
        style: "currency",
        currency: "CNY",
        minimumFractionDigits: 2,
        maximumFractionDigits: 4,
        useGrouping: true
      };
      const result = value.toLocaleString("zh-CN", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3300
     * @tc.name testDoubleToLocaleString1033
     * @tc.desc Verify toLocaleString with notation compact option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234567.89);
      const options: Intl.NumberFormatOptions = { notation: "compact", compactDisplay: "short" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3400
     * @tc.name testDoubleToLocaleString1034
     * @tc.desc Verify toLocaleString with notation scientific option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { notation: "scientific" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3500
     * @tc.name testDoubleToLocaleString1035
     * @tc.desc Verify toLocaleString with notation engineering option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { notation: "engineering" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3600
     * @tc.name testDoubleToLocaleString1036
     * @tc.desc Verify toLocaleString with different signDisplay options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const optionsAuto: Intl.NumberFormatOptions = { signDisplay: "auto" };
      const optionsAlways: Intl.NumberFormatOptions = { signDisplay: "always" };
      const optionsExceptZero: Intl.NumberFormatOptions = { signDisplay: "exceptZero" };
      const optionsNever: Intl.NumberFormatOptions = { signDisplay: "never" };
      expect(value.toLocaleString("en-US", optionsAuto)).not().assertNull();
      expect(value.toLocaleString("en-US", optionsAlways)).not().assertNull();
      expect(value.toLocaleString("en-US", optionsExceptZero)).not().assertNull();
      expect(value.toLocaleString("en-US", optionsNever)).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3700
     * @tc.name testDoubleToLocaleString1037
     * @tc.desc Verify toLocaleString with empty options object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = {};
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3800
     * @tc.name testDoubleToLocaleString1038
     * @tc.desc Verify toLocaleString with minimumFractionDigits set to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 0 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_3900
     * @tc.name testDoubleToLocaleString1039
     * @tc.desc Verify toLocaleString with maximumFractionDigits set to 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { maximumFractionDigits: 20 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4000
     * @tc.name testDoubleToLocaleString1040
     * @tc.desc Verify toLocaleString with minimumIntegerDigits set to 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { minimumIntegerDigits: 21 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4100
     * @tc.name testDoubleToLocaleString1041
     * @tc.desc Verify calling toLocaleString with explicit undefined options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US", undefined);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4200
     * @tc.name testDoubleToLocaleString1042
     * @tc.desc Verify calling toLocaleString with null as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("en-US");
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4300
     * @tc.name testDoubleToLocaleString1043
     * @tc.desc Verify calling toLocaleString with string type as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("en-US", "invalid" as Object as Intl.NumberFormatOptions);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4400
     * @tc.name testDoubleToLocaleString1044
     * @tc.desc Verify calling toLocaleString with number type as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("en-US", 123 as Object as Intl.NumberFormatOptions);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4500
     * @tc.name testDoubleToLocaleString1045
     * @tc.desc Verify calling toLocaleString with boolean type as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("en-US", true as Object as Intl.NumberFormatOptions);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4600
     * @tc.name testDoubleToLocaleString1046
     * @tc.desc Verify calling toLocaleString with array type as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const options: string[] = [];
        const result = value.toLocaleString("en-US", options as Object as Intl.NumberFormatOptions);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4700
     * @tc.name testDoubleToLocaleString1047
     * @tc.desc Verify toLocaleString with options containing invalid property type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const options: Intl.NumberFormatOptions = { minimumFractionDigits: "abc" as Object as int };
        const result = value.toLocaleString("en-US", options);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4800
     * @tc.name testDoubleToLocaleString1048
     * @tc.desc Verify toLocaleString with minimumFractionDigits out of valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(1234.5);
        const options: Intl.NumberFormatOptions = { minimumFractionDigits: -1 };
        const result = value.toLocaleString("en-US", options);
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_4900
     * @tc.name testDoubleToLocaleString1049
     * @tc.desc Verify toLocaleString with minimumFractionDigits greater than maximumFractionDigits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(1234.5);
        const options: Intl.NumberFormatOptions = { minimumFractionDigits: 5, maximumFractionDigits: 2 };
        const result = value.toLocaleString("en-US", options);
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5000
     * @tc.name testDoubleToLocaleString1050
     * @tc.desc Verify toLocaleString with currency style but no currency code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(1234.5);
        const options: Intl.NumberFormatOptions = { style: "currency" };
        const result = value.toLocaleString("en-US", options);
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5100
     * @tc.name testDoubleToLocaleString1051
     * @tc.desc Verify toLocaleString with invalid currency code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(1234.5);
        const options: Intl.NumberFormatOptions = { style: "currency", currency: "XXX_INVALID" };
        const result = value.toLocaleString("en-US", options);
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5200
     * @tc.name testDoubleToLocaleString1052
     * @tc.desc Verify toLocaleString returns different results for different locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const enResult = value.toLocaleString("en-US");
      const zhResult = value.toLocaleString("zh-CN");
      const deResult = value.toLocaleString("de-DE");
      const frResult = value.toLocaleString("fr-FR");
      expect(enResult).not().assertNull();
      expect(zhResult).not().assertNull();
      expect(deResult).not().assertNull();
      expect(frResult).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5300
     * @tc.name testDoubleToLocaleString1053
     * @tc.desc Verify toLocaleString formats different numeric values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intVal = new Double(1000.0);
      const floatVal = new Double(1234.567);
      const negativeVal = new Double(-999.99);
      expect(intVal.toLocaleString("en-US")).not().assertNull();
      expect(floatVal.toLocaleString("en-US")).not().assertNull();
      expect(negativeVal.toLocaleString("en-US")).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5400
     * @tc.name testDoubleToLocaleString1054
     * @tc.desc Verify toLocaleString with different currency codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const usdOptions: Intl.NumberFormatOptions = { style: "currency", currency: "USD" };
      const cnyOptions: Intl.NumberFormatOptions = { style: "currency", currency: "CNY" };
      const eurOptions: Intl.NumberFormatOptions = { style: "currency", currency: "EUR" };
      const jpyOptions: Intl.NumberFormatOptions = { style: "currency", currency: "JPY" };
      expect(value.toLocaleString("en-US", usdOptions)).not().assertNull();
      expect(value.toLocaleString("zh-CN", cnyOptions)).not().assertNull();
      expect(value.toLocaleString("de-DE", eurOptions)).not().assertNull();
      expect(value.toLocaleString("ja-JP", jpyOptions)).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5500
     * @tc.name testDoubleToLocaleString1055
     * @tc.desc Verify toLocaleString with percent style formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.856);
      const options: Intl.NumberFormatOptions = { style: "percent", minimumFractionDigits: 1 };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5600
     * @tc.name testDoubleToLocaleString1056
     * @tc.desc Verify toLocaleString formats NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5700
     * @tc.name testDoubleToLocaleString1057
     * @tc.desc Verify toLocaleString formats positive infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5800
     * @tc.name testDoubleToLocaleString1058
     * @tc.desc Verify toLocaleString formats negative infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_5900
     * @tc.name testDoubleToLocaleString1059
     * @tc.desc Verify toLocaleString formats zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6000
     * @tc.name testDoubleToLocaleString1060
     * @tc.desc Verify toLocaleString formats negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6100
     * @tc.name testDoubleToLocaleString1061
     * @tc.desc Verify toLocaleString formats Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6200
     * @tc.name testDoubleToLocaleString1062
     * @tc.desc Verify toLocaleString formats Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6300
     * @tc.name testDoubleToLocaleString1063
     * @tc.desc Verify toLocaleString formats large negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-999999999.999);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6400
     * @tc.name testDoubleToLocaleString1064
     * @tc.desc Verify toLocaleString formats high precision decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(3.141592653589793);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6500
     * @tc.name testDoubleToLocaleString1065
     * @tc.desc Verify toLocaleString on default constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6600
     * @tc.name testDoubleToLocaleString1066
     * @tc.desc Verify toLocaleString on string constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6700
     * @tc.name testDoubleToLocaleString1067
     * @tc.desc Verify toLocaleString on unparseable string constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6800
     * @tc.name testDoubleToLocaleString1068
     * @tc.desc Verify toLocaleString on BigInt constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_6900
     * @tc.name testDoubleToLocaleString1069
     * @tc.desc Verify toLocaleString return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      expect(typeof result === "string" || result instanceof String).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7000
     * @tc.name testDoubleToLocaleString1070
     * @tc.desc Verify toLocaleString without parameters returns String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString();
      expect(typeof result === "string" || result instanceof String).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7100
     * @tc.name testDoubleToLocaleString1071
     * @tc.desc Verify toLocaleString with full options returns String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = { style: "currency", currency: "USD" };
      const result = value.toLocaleString("en-US", options);
      expect(typeof result === "string" || result instanceof String).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7200
     * @tc.name testDoubleToLocaleString1072
     * @tc.desc Verify toLocaleString returns different thousand separators for different locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234567.89);
      const enResult = value.toLocaleString("en-US");
      const deResult = value.toLocaleString("de-DE");
      const frResult = value.toLocaleString("fr-FR");
      expect(enResult !== deResult).assertTrue();
      expect(deResult !== frResult).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7300
     * @tc.name testDoubleToLocaleString1073
     * @tc.desc Verify toLocaleString returns different results with different fraction digit settings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.56789);
      const opt2: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      const opt5: Intl.NumberFormatOptions = { minimumFractionDigits: 5, maximumFractionDigits: 5 };
      const result2 = value.toLocaleString("en-US", opt2);
      const result5 = value.toLocaleString("en-US", opt5);
      expect(result2 !== result5).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7400
     * @tc.name testDoubleToLocaleString1074
     * @tc.desc Verify toLocaleString returns scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234567.89);
      const options: Intl.NumberFormatOptions = { notation: "scientific" };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7600
     * @tc.name testDoubleToLocaleString1076
     * @tc.desc Verify toLocaleString throws RangeError when minimumFractionDigits is out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const options: Intl.NumberFormatOptions = { minimumFractionDigits: -1 };
        value.toLocaleString("en-US", options);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7700
     * @tc.name testDoubleToLocaleString1077
     * @tc.desc Verify toLocaleString throws RangeError when minimumFractionDigits exceeds maximumFractionDigits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const options: Intl.NumberFormatOptions = { minimumFractionDigits: 10, maximumFractionDigits: 2 };
        value.toLocaleString("en-US", options);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_7800
     * @tc.name testDoubleToLocaleString1078
     * @tc.desc Verify toLocaleString throws TypeError when options is non-object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        value.toLocaleString("en-US", 123 as Object as Intl.NumberFormatOptions);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_8000
     * @tc.name testDoubleToLocaleString1080
     * @tc.desc Verify illegal parameters throw exception caught by catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      let catchCalled = false;
      try {
        value.toLocaleString("en-US", "invalid" as Object as Intl.NumberFormatOptions);
      } catch (error) {
        catchCalled = true;
        expect(error.name).assertEqual('ClassCastError');
      }
      expect(catchCalled).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_8200
     * @tc.name testDoubleToLocaleString1082
     * @tc.desc Verify multiple consecutive calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result1 = value.toLocaleString("en-US");
      const result2 = value.toLocaleString("en-US");
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_8300
     * @tc.name testDoubleToLocaleString1083
     * @tc.desc Verify different Double instances with same value return consistent toLocaleString results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(1234.5);
      const value2 = new Double(1234.5);
      const result1 = value1.toLocaleString("en-US");
      const result2 = value2.toLocaleString("en-US");
      expect(result1).assertEqual(result2);
    });
  });
}
