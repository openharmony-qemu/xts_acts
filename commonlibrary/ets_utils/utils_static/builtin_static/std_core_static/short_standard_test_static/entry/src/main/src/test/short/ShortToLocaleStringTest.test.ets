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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

class UnsupportedLocaleOptions {
  style: string = "unsupported";
}

export default function shortToLocaleStringTest(): void {
  describe('ShortToLocaleStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0100
     * @tc.name testShortToLocaleString001
     * @tc.desc Verify toLocaleString with en-US locale returns comma-separated formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let result: String = value.toLocaleString("en-US");
      expect(result).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0200
     * @tc.name testShortToLocaleString002
     * @tc.desc Verify toLocaleString with de-DE locale returns dot-separated formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let result: String = value.toLocaleString("de-DE");
      expect(result).assertEqual("1.234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0300
     * @tc.name testShortToLocaleString003
     * @tc.desc Verify toLocaleString with zh-CN locale returns grouped numeric formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let result: String = value.toLocaleString("zh-CN");
      expect(result).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0400
     * @tc.name testShortToLocaleString004
     * @tc.desc Verify toLocaleString with ja-JP locale returns grouped numeric formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let result: String = value.toLocaleString("ja-JP");
      expect(result).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0500
     * @tc.name testShortToLocaleString005
     * @tc.desc Verify toLocaleString with empty options object behaves the same as the baseline locale formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let baselineResult: String = value.toLocaleString("en-US");
      let emptyOptions: object = {} as object;
      let emptyOptionsResult: String = value.toLocaleString("en-US", emptyOptions);
      expect(emptyOptionsResult).assertEqual(baselineResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0600
     * @tc.name testShortToLocaleString006
     * @tc.desc Verify toLocaleString with decimal style returns default decimal formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let result: String = value.toLocaleString("en-US", { style: "decimal" });
      expect(result).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0700
     * @tc.name testShortToLocaleString007
     * @tc.desc Verify toLocaleString with USD currency option includes dollar sign grouped digits and cents
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let currencyResult: String = value.toLocaleString("en-US", { style: "currency", currency: "USD" });
      let expectedCurrencyResult: String = new Intl.NumberFormat(
        "en-US",
        { style: "currency", currency: "USD" }
      ).format(1234);
      expect(currencyResult).assertEqual(expectedCurrencyResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0800
     * @tc.name testShortToLocaleString008
     * @tc.desc Verify toLocaleString with percent style returns percent formatted output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(12 as short);
      let result: String = value.toLocaleString("en-US", { style: "percent" });
      expect(result).assertEqual("1,200%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0900
     * @tc.name testShortToLocaleString009
     * @tc.desc Verify toLocaleString with minimumFractionDigits preserves at least two fraction digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(50 as short);
      let result: String = value.toLocaleString("en-US", { minimumFractionDigits: 2 });
      expect(result).assertEqual("50.00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1000
     * @tc.name testShortToLocaleString010
     * @tc.desc Verify toLocaleString with useGrouping false returns ungrouped digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let result: String = value.toLocaleString("en-US", { useGrouping: false });
      expect(result).assertEqual("1234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1100
     * @tc.name testShortToLocaleString011
     * @tc.desc Verify toLocaleString with en-US USD currency output includes symbol grouped digits and cents
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(2500 as short);
      let currencyResult: String = value.toLocaleString("en-US", { style: "currency", currency: "USD" });
      let expectedCurrencyResult: String = new Intl.NumberFormat(
        "en-US",
        { style: "currency", currency: "USD" }
      ).format(2500);
      expect(currencyResult).assertEqual(expectedCurrencyResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1200
     * @tc.name testShortToLocaleString012
     * @tc.desc Verify toLocaleString with de-DE EUR currency output includes German grouped digits and currency symbol
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(2500 as short);
      let currencyResult: String = value.toLocaleString("de-DE", { style: "currency", currency: "EUR" });
      let expectedCurrencyResult: String = new Intl.NumberFormat(
        "de-DE",
        { style: "currency", currency: "EUR" }
      ).format(2500);
      expect(currencyResult).assertEqual(expectedCurrencyResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1300
     * @tc.name testShortToLocaleString013
     * @tc.desc Verify toLocaleString with zh-CN percent output includes scaled percent digits and sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(25 as short);
      let percentResult: String = value.toLocaleString("zh-CN", { style: "percent" });
      let expectedPercentResult: String = new Intl.NumberFormat(
        "zh-CN",
        { style: "percent" }
      ).format(25);
      expect(percentResult).assertEqual(expectedPercentResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1400
     * @tc.name testShortToLocaleString014
     * @tc.desc Verify toLocaleString with boundary short values returns exact locale formatted strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boundaryValues: short[] = [
        Short.MIN_VALUE,
        Short.MAX_VALUE
      ];
      let expectedValues: String[] = [
        "-32,768",
        "32,767"
      ];
      let caseCount: int = 2;
      for (let index: int = 0; index < caseCount; index++) {
        let result: String = new Short(boundaryValues[index]).toLocaleString("en-US");
        expect(result).assertEqual(expectedValues[index]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1500
     * @tc.name testShortToLocaleString015
     * @tc.desc Verify toLocaleString with a valid short value returns the exact en-US formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(100 as short);
      let result: String = value.toLocaleString("en-US");
      expect(result).assertEqual("100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1600
     * @tc.name testShortToLocaleString016
     * @tc.desc Verify toLocaleString returns the exact formatted string for each supported locale in a locale matrix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(100 as short);
      let locales: string[] = ["en-US", "de-DE", "zh-CN", "ja-JP"];
      let caseCount: int = locales.length;
      for (let index: int = 0; index < caseCount; index++) {
        let result: String = value.toLocaleString(locales[index]);
        expect(result).assertEqual("100");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1700
     * @tc.name testShortToLocaleString017
     * @tc.desc Verify toLocaleString preserves the numeric value across locale formatting outputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let resultEn: String = value.toLocaleString("en-US");
      let resultDe: String = value.toLocaleString("de-DE");
      let resultZh: String = value.toLocaleString("zh-CN");
      expect(resultEn).assertEqual("1,234");
      expect(resultDe).assertEqual("1.234");
      expect(resultZh).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1800
     * @tc.name testShortToLocaleString018
     * @tc.desc Verify toLocaleString with a negative short value returns the exact formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short((-1234) as short);
      let result: String = value.toLocaleString("en-US");
      expect(result).assertEqual("-1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1900
     * @tc.name testShortToLocaleString019
     * @tc.desc Verify toLocaleString with zero short value returns locale formatted zero string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(0 as short);
      let result: String = value.toLocaleString("en-US");
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2000
     * @tc.name testShortToLocaleString020
     * @tc.desc Verify toLocaleString throws RangeError for an invalid locale string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(100 as short);
      try {
        value.toLocaleString("invalid_locale_string!");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2100
     * @tc.name testShortToLocaleString021
     * @tc.desc Verify toLocaleString throws RangeError for an empty locale string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(100 as short);
      try {
        value.toLocaleString("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2200
     * @tc.name testShortToLocaleString022
     * @tc.desc Verify toLocaleString throws RangeError when currency style is used without a currency field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(100 as short);
      try {
        value.toLocaleString("en-US", { style: "currency" });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2300
     * @tc.name testShortToLocaleString023
     * @tc.desc Verify toLocaleString ignores unsupported style object options and returns the baseline formatted result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(100 as short);
      let unsupportedStyleOptions: object = new UnsupportedLocaleOptions();
      let baselineResult: String = value.toLocaleString("en-US");
      let ignoredOptionsResult: String = value.toLocaleString("en-US", unsupportedStyleOptions);
      expect(ignoredOptionsResult).assertEqual(baselineResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2400
     * @tc.name testShortToLocaleString024
     * @tc.desc Verify toLocaleString is idempotent across repeated calls with the same locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let firstResult: String = value.toLocaleString("en-US");
      let secondResult: String = value.toLocaleString("en-US");
      let thirdResult: String = value.toLocaleString("en-US");
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
      expect(firstResult).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2500
     * @tc.name testShortToLocaleString025
     * @tc.desc Verify toLocaleString is idempotent across repeated calls with the same locale and options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(999 as short);
      let firstResult: String = value.toLocaleString("en-US", { style: "decimal", useGrouping: false });
      let secondResult: String = value.toLocaleString("en-US", { style: "decimal", useGrouping: false });
      let thirdResult: String = value.toLocaleString("en-US", { style: "decimal", useGrouping: false });
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
      expect(firstResult).assertEqual("999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2600
     * @tc.name testShortToLocaleString026
     * @tc.desc Verify toLocaleString is independently idempotent for each locale on the same instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(5000 as short);
      let enFirstResult: String = value.toLocaleString("en-US");
      let enSecondResult: String = value.toLocaleString("en-US");
      let deFirstResult: String = value.toLocaleString("de-DE");
      let deSecondResult: String = value.toLocaleString("de-DE");
      expect(enFirstResult).assertEqual(enSecondResult);
      expect(deFirstResult).assertEqual(deSecondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2700
     * @tc.name testShortToLocaleString027
     * @tc.desc Verify toLocaleString returns consistent results across distinct Short instances with the same numeric value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstValue: Short = new Short(256 as short);
      let secondValue: Short = new Short(256 as short);
      let thirdValue: Short = new Short(256 as short);
      let firstResult: String = firstValue.toLocaleString("en-US");
      let secondResult: String = secondValue.toLocaleString("en-US");
      let thirdResult: String = thirdValue.toLocaleString("en-US");
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
      expect(firstResult).assertEqual("256");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2800
     * @tc.name testShortToLocaleString028
     * @tc.desc Verify toLocaleString does not mutate the underlying short value across multiple locale calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(777 as short);
      let beforeValue: short = value.toShort();
      let enResult: String = value.toLocaleString("en-US");
      let deResult: String = value.toLocaleString("de-DE");
      let zhResult: String = value.toLocaleString("zh-CN");
      let afterValue: short = value.toShort();
      expect(beforeValue).assertEqual(afterValue);
      expect(enResult).assertEqual("777");
      expect(deResult).assertEqual("777");
      expect(zhResult).assertEqual("777");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_2900
     * @tc.name testShortToLocaleString029
     * @tc.desc Verify toLocaleString override complies with Intl.NumberFormat contract for grouping control behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1000 as short);
      let resultNoGroup: String = value.toLocaleString("en-US", { useGrouping: false });
      let resultWithGroup: String = value.toLocaleString("en-US");
      expect(resultNoGroup).assertEqual("1000");
      expect(resultWithGroup).assertEqual("1,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_3000
     * @tc.name testShortToLocaleString030
     * @tc.desc Verify toLocaleString with undefined options behaves identically to omitted options parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let resultOmit: String = value.toLocaleString("en-US");
      let resultUndefined: String = value.toLocaleString("en-US", undefined);
      expect(resultOmit).assertEqual(resultUndefined);
      expect(resultOmit).assertEqual("1,234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_3100
     * @tc.name testShortToLocaleString031
     * @tc.desc Verify toLocaleString with both parameters omitted behaves identically to explicit undefined arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(1234 as short);
      let resultNoArgs: String = value.toLocaleString();
      let resultExplicit: String = value.toLocaleString(undefined, undefined);
      expect(resultNoArgs).assertEqual(resultExplicit);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_3200
     * @tc.name testShortToLocaleString032
     * @tc.desc Verify toLocaleString is idempotent across repeated calls with no arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(555 as short);
      let firstResult: String = value.toLocaleString();
      let secondResult: String = value.toLocaleString();
      let thirdResult: String = value.toLocaleString();
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_3300
     * @tc.name testShortToLocaleString033
     * @tc.desc Verify toLocaleString ignores the same plain object options consistently across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: Short = new Short(666 as short);
      let unsupportedOptions: object = new UnsupportedLocaleOptions();
      let baselineResult: String = value.toLocaleString("de-DE");
      let firstResult: String = value.toLocaleString("de-DE", unsupportedOptions);
      let secondResult: String = value.toLocaleString("de-DE", unsupportedOptions);
      let thirdResult: String = value.toLocaleString("de-DE", unsupportedOptions);
      expect(firstResult).assertEqual(baselineResult);
      expect(secondResult).assertEqual(firstResult);
      expect(thirdResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_3400
     * @tc.name testShortToLocaleString034
     * @tc.desc Verify toLocaleString with de-DE locale formats short boundary and adjacent values exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boundaryValues: short[] = [
        Short.MIN_VALUE,
        Short.MAX_VALUE,
        (-32767) as short,
        32766 as short
      ];
      let expectedValues: String[] = [
        "-32.768",
        "32.767",
        "-32.767",
        "32.766"
      ];
      let caseCount: int = boundaryValues.length;
      for (let index: int = 0; index < caseCount; index++) {
        let actualResult: String = new Short(boundaryValues[index]).toLocaleString("de-DE");
        expect(actualResult).assertEqual(expectedValues[index]);
      }
    });
  });
}
