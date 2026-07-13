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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

export default function IntlSupplementalTest(): void {
  describe('IntlSupplementalTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0010
     * @tc.name testDateTimeFormatTimeZone001
     * @tc.desc Verify DateTimeFormat constructor with timeZone option "America/New_York"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZone001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York",
        year: "numeric", month: "long", day: "numeric",
        hour: "numeric", minute: "numeric"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 12, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0020
     * @tc.name testDateTimeFormatTimeZone002
     * @tc.desc Verify DateTimeFormat constructor with timeZone option "Asia/Shanghai"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZone002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "Asia/Shanghai",
        year: "numeric", month: "long", day: "numeric",
        hour: "numeric", minute: "numeric"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 12, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0030
     * @tc.name testDateTimeFormatTimeZone003
     * @tc.desc Verify DateTimeFormat constructor with timeZone option "UTC"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZone003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "UTC",
        year: "numeric", month: "long", day: "numeric"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0040
     * @tc.name testDateTimeFormatEra004
     * @tc.desc Verify DateTimeFormat with era option "short"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatEra004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric", month: "long", day: "numeric", era: "short"
      });
      let result: string = dtf.format(new Date(2024, 0, 1));
      expect(result).assertEqual("January 1, 2024 AD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0050
     * @tc.name testDateTimeFormatEra005
     * @tc.desc Verify DateTimeFormat with era option "long"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatEra005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric", month: "long", day: "numeric", era: "long"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0060
     * @tc.name testDateTimeFormatEra006
     * @tc.desc Verify DateTimeFormat with era option "narrow"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatEra006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric", month: "long", day: "numeric", era: "narrow"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0070
     * @tc.name testDateTimeFormatTimeZoneName007
     * @tc.desc Verify DateTimeFormat with timeZoneName option "short"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZoneName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York",
        timeZoneName: "short",
        year: "numeric", month: "long", day: "numeric"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0080
     * @tc.name testDateTimeFormatTimeZoneName008
     * @tc.desc Verify DateTimeFormat with timeZoneName option "long"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZoneName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York",
        timeZoneName: "long",
        year: "numeric", month: "long", day: "numeric"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0090
     * @tc.name testDateTimeFormatDayPeriod009
     * @tc.desc Verify DateTimeFormat with dayPeriod option "short"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatDayPeriod009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", dayPeriod: "short"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 14, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0100
     * @tc.name testDateTimeFormatDayPeriod010
     * @tc.desc Verify DateTimeFormat with dayPeriod option "long"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatDayPeriod010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", dayPeriod: "long"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 14, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0110
     * @tc.name testDateTimeFormatHourCycle011
     * @tc.desc Verify DateTimeFormat with hourCycle "h12"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatHourCycle011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", hourCycle: "h12"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 14, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0120
     * @tc.name testDateTimeFormatHourCycle012
     * @tc.desc Verify DateTimeFormat with hourCycle "h23"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatHourCycle012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", hourCycle: "h23"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 14, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0130
     * @tc.name testDateTimeFormatHourCycle013
     * @tc.desc Verify DateTimeFormat with hourCycle "h24"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatHourCycle013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", hourCycle: "h24"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 0, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0140
     * @tc.name testDateTimeFormatFractionalSecond014
     * @tc.desc Verify DateTimeFormat with fractionalSecondDigits option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatFractionalSecond014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", second: "numeric", fractionalSecondDigits: 3
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 14, 30, 45)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0150
     * @tc.name testNumberFormatSignDisplay015
     * @tc.desc Verify NumberFormat with signDisplay "always" shows sign for positive and negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatSignDisplay015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", { signDisplay: "always" });
      expect(nf.format(1234.5)).assertEqual("+1,234.5");
      expect(nf.format(-1234.5)).assertEqual("-1,234.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0160
     * @tc.name testNumberFormatSignDisplay016
     * @tc.desc Verify NumberFormat with signDisplay "exceptZero" omits sign for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatSignDisplay016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", { signDisplay: "exceptZero" });
      expect(nf.format(1234.5)).assertEqual("+1,234.5");
      expect(nf.format(0)).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0170
     * @tc.name testNumberFormatSignDisplay017
     * @tc.desc Verify NumberFormat with signDisplay "never" omits negative sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatSignDisplay017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", { signDisplay: "never" });
      expect(nf.format(-1234.5)).assertEqual("1,234.5");
      expect(nf.format(1234.5)).assertEqual("1,234.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0180
     * @tc.name testNumberFormatCurrencySign018
     * @tc.desc Verify NumberFormat with currencySign options "standard" and "accounting"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatCurrencySign018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nfAcc: Intl.NumberFormat = new Intl.NumberFormat("en-US", {
        style: "currency", currency: "USD", currencySign: "accounting"
      });
      let nfStd: Intl.NumberFormat = new Intl.NumberFormat("en-US", {
        style: "currency", currency: "USD", currencySign: "standard"
      });
      expect(nfAcc.format(-1234.5)).assertEqual("($1,234.50)");
      expect(nfStd.format(-1234.5)).assertEqual("-$1,234.50");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0190
     * @tc.name testCollatorCollation019
     * @tc.desc Verify Collator with collation option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCollatorCollation019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collator: Intl.Collator = new Intl.Collator("zh-CN", { collation: "pinyin" });
      expect(typeof collator.compare("á", "a") === "number").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0200
     * @tc.name testLocaleCollationProperty020
     * @tc.desc Verify Locale collation property from Unicode extension
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLocaleCollationProperty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let locale: Intl.Locale = new Intl.Locale("zh-CN-u-co-pinyin");
      expect(locale.collation).assertEqual("pinyin");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0210
     * @tc.name testDateTimeFormatCalendarOption021
     * @tc.desc Verify DateTimeFormat constructor with calendar option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatCalendarOption021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        calendar: "gregory",
        year: "numeric", month: "long", day: "numeric"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0220
     * @tc.name testDateTimeFormatNumberingSystem022
     * @tc.desc Verify DateTimeFormat constructor with numberingSystem option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatNumberingSystem022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric", month: "numeric", day: "numeric",
        numberingSystem: "latn"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0230
     * @tc.name testDateTimeFormatFormatRangeToParts023
     * @tc.desc Verify DateTimeFormat formatRangeToParts across year boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatFormatRangeToParts023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric", month: "long", day: "numeric"
      });
      let start: Date = new Date(2023, 11, 31);
      let end: Date = new Date(2024, 0, 2);
      let parts: Intl.DateTimeRangeFormatPart[] = dtf.formatRangeToParts(start, end);
      expect(Array.isArray(parts)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0240
     * @tc.name testDateTimeFormatFormatRangeToParts024
     * @tc.desc Verify DateTimeFormat formatRangeToParts with identical month across months
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatFormatRangeToParts024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric", month: "long", day: "numeric"
      });
      let start: Date = new Date(2024, 5, 5);
      let end: Date = new Date(2024, 8, 10);
      let parts: Intl.DateTimeRangeFormatPart[] = dtf.formatRangeToParts(start, end);
      expect(parts.some((part: Intl.DateTimeRangeFormatPart): boolean => part.source === "startRange")).assertTrue();
      expect(parts.some((part: Intl.DateTimeRangeFormatPart): boolean => part.source === "endRange")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0250
     * @tc.name testNumberFormatRangeWithCurrency025
     * @tc.desc Verify NumberFormat formatRange with currency style
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatRangeWithCurrency025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", {
        style: "currency", currency: "USD"
      });
      expect(typeof nf.formatRange(1.5, 100.75) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0260
     * @tc.name testNumberFormatRangeToPartsWithCurrency026
     * @tc.desc Verify NumberFormat formatRangeToParts returns parts array with currency style
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatRangeToPartsWithCurrency026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", {
        style: "currency", currency: "USD"
      });
      let parts: Intl.NumberRangeFormatPart[] = nf.formatRangeToParts(1.5, 100.75);
      expect(Array.isArray(parts)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0270
     * @tc.name testLocaleMaximizeMinimize027
     * @tc.desc Verify Locale maximize and minimize with zh-CN locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLocaleMaximizeMinimize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let locale: Intl.Locale = new Intl.Locale("zh-CN");
      let max: Intl.Locale = locale.maximize();
      expect(max.script).assertEqual("Hans");
      let min: Intl.Locale = max.minimize();
      expect(min instanceof Intl.Locale).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0280
     * @tc.name testDateTimeFormatTimeZoneNameOptions028
     * @tc.desc Verify DateTimeFormat with timeZoneName "shortOffset" and "longOffset"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZoneNameOptions028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortOff: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York", timeZoneName: "shortOffset",
        year: "numeric", month: "long", day: "numeric"
      });
      let longOff: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York", timeZoneName: "longOffset",
        year: "numeric", month: "long", day: "numeric"
      });
      expect(typeof shortOff.format(new Date(2024, 0, 1)) === "string").assertTrue();
      expect(typeof longOff.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0290
     * @tc.name testDateTimeFormatTimeZoneNameOptions029
     * @tc.desc Verify DateTimeFormat with timeZoneName "shortGeneric" and "longGeneric"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatTimeZoneNameOptions029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sGen: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York", timeZoneName: "shortGeneric",
        year: "numeric", month: "long", day: "numeric"
      });
      let lGen: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        timeZone: "America/New_York", timeZoneName: "longGeneric",
        year: "numeric", month: "long", day: "numeric"
      });
      expect(typeof sGen.format(new Date(2024, 0, 1)) === "string").assertTrue();
      expect(typeof lGen.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0300
     * @tc.name testDateTimeFormatDayPeriodNarrow030
     * @tc.desc Verify DateTimeFormat with dayPeriod option "narrow"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatDayPeriodNarrow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", dayPeriod: "narrow"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 14, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0310
     * @tc.name testDateTimeFormatHourCycleH11031
     * @tc.desc Verify DateTimeFormat with hourCycle "h11"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatHourCycleH11031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        hour: "numeric", minute: "numeric", hourCycle: "h11"
      });
      expect(typeof dtf.format(new Date(2024, 0, 1, 0, 0)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0320
     * @tc.name testCollatorConstructorLocaleArray032
     * @tc.desc Verify Collator constructor with locale array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCollatorConstructorLocaleArray032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collator: Intl.Collator = new Intl.Collator(["en-US", "zh-CN"]);
      expect(typeof collator.compare("a", "b") === "number").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0330
     * @tc.name testDisplayNamesScriptType033
     * @tc.desc Verify DisplayNames with script type for various script codes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDisplayNamesScriptType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "script" });
      expect(typeof names.of("Latn") === "string").assertTrue();
      expect(typeof names.of("Hans") === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0340
     * @tc.name testDisplayNamesFallback034
     * @tc.desc Verify DisplayNames with languageFallback option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDisplayNamesFallback034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", {
        type: "language", languageDisplay: "dialect"
      });
      expect(typeof names.of("zh") === "string").assertTrue();
      expect(typeof names.of("de") === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0350
     * @tc.name testRelativeTimeFormatNumericAuto035
     * @tc.desc Verify RelativeTimeFormat with numeric "auto" returns "yesterday" for -1 day
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testRelativeTimeFormatNumericAuto035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US", { numeric: "auto" });
      expect(rtf.format(-1, "day")).assertEqual("yesterday");
      expect(rtf.format(0, "day")).assertEqual("today");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0360
     * @tc.name testNumberFormatSignificantDigits036
     * @tc.desc Verify NumberFormat with minimumSignificantDigits and maximumSignificantDigits options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatSignificantDigits036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nfMin: Intl.NumberFormat = new Intl.NumberFormat("en-US", { minimumSignificantDigits: 3 });
      let nfMax: Intl.NumberFormat = new Intl.NumberFormat("en-US", { maximumSignificantDigits: 5 });
      expect(typeof nfMin.format(123.456) === "string").assertTrue();
      expect(typeof nfMax.format(123.456789) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0370
     * @tc.name testNumberFormatLocaleMatcher037
     * @tc.desc Verify NumberFormat constructor with localeMatcher options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNumberFormatLocaleMatcher037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nfLookup: Intl.NumberFormat = new Intl.NumberFormat("en-US", { localeMatcher: "lookup" });
      let nfBestFit: Intl.NumberFormat = new Intl.NumberFormat("en-US", { localeMatcher: "best fit" });
      expect(typeof nfLookup.format(1234.56) === "string").assertTrue();
      expect(typeof nfBestFit.format(1234.56) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0380
     * @tc.name testDateTimeFormatLocaleMatcher038
     * @tc.desc Verify DateTimeFormat constructor with localeMatcher and formatMatcher options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatLocaleMatcher038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtfLookup: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { localeMatcher: "lookup" });
      let dtfFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { formatMatcher: "basic" });
      expect(typeof dtfLookup.format(new Date(2024, 0, 1)) === "string").assertTrue();
      expect(typeof dtfFormat.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0390
     * @tc.name testDateTimeFormatWeekday039
     * @tc.desc Verify DateTimeFormat with weekday style options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testDateTimeFormatWeekday039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dtfLong: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { weekday: "long", year: "numeric", month: "long", day: "numeric" });
      let dtfShort: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { weekday: "short", year: "numeric", month: "long", day: "numeric" });
      let dtfNarrow: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { weekday: "narrow", year: "numeric", month: "long", day: "numeric" });
      expect(typeof dtfLong.format(new Date(2024, 0, 1)) === "string").assertTrue();
      expect(typeof dtfShort.format(new Date(2024, 0, 1)) === "string").assertTrue();
      expect(typeof dtfNarrow.format(new Date(2024, 0, 1)) === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0400
     * @tc.name testCollatorLocaleMatcher040
     * @tc.desc Verify Collator constructor with localeMatcher option
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCollatorLocaleMatcher040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cLookup: Intl.Collator = new Intl.Collator("en-US", { localeMatcher: "lookup" });
      let cBestFit: Intl.Collator = new Intl.Collator("en-US", { localeMatcher: "best fit" });
      expect(typeof cLookup.compare("a", "b") === "number").assertTrue();
      expect(typeof cBestFit.compare("a", "b") === "number").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_SUPPLEMENT_0410
     * @tc.name testPluralRulesDigitOptions041
     * @tc.desc Verify PluralRules constructor with minimumIntegerDigits and minimumFractionDigits options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testPluralRulesDigitOptions041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US", {
        minimumIntegerDigits: 2,
        minimumFractionDigits: 1
      });
      expect(typeof pr.select(1) === "string").assertTrue();
      expect(typeof pr.select(2) === "string").assertTrue();
    });

  });
}
