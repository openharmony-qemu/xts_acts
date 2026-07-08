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


export default function IntlOverallTest(): void {
  describe('IntlOverallTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0100
     * @tc.name testOverall001
     * @tc.desc Verify intlLookUpLocale and intlBestFitLocale comparison with same input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = ["zh-CN", "en-US", "ja-JP"];
      let lookUpResult: string = Intl.intlLookUpLocale(tags);
      let bestFitResult: string = Intl.intlBestFitLocale(tags);
      expect(lookUpResult).assertEqual("en-US");
      expect(bestFitResult).assertEqual("zh-CN");
    });






    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0200
     * @tc.name testOverall002
     * @tc.desc Verify intlBestFitLocales with empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locales: string[] = Intl.intlBestFitLocales([]);
      expect(Array.isArray(locales)).assertTrue();
      expect(locales.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0300
     * @tc.name testOverall003
     * @tc.desc Verify intlLookUpLocales vs intlBestFitLocales comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = ["en-US", "zh-CN"];
      let lookUpResult: string[] = Intl.intlLookUpLocales(tags);
      let bestFitResult: string[] = Intl.intlBestFitLocales(tags);
      expect(Array.isArray(lookUpResult)).assertTrue();
      expect(Array.isArray(bestFitResult)).assertTrue();
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0400
     * @tc.name testOverall004
     * @tc.desc Verify intlLocalesToLanguageTags return each element is string type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("en-US");
      expect(tags.length).assertEqual(1);
      expect(tags[0]).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0500
     * @tc.name testOverall005
     * @tc.desc Verify Collator constructor with default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator();
      let result = collator.compare("a", "b");
      expect(typeof result === "int").assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0600
     * @tc.name testOverall006
     * @tc.desc Verify Collator constructor with specified locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator("en-US");
      let result = collator.compare("a", "b");
      expect(typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0700
     * @tc.name testOverall007
     * @tc.desc Verify Collator constructor with locale and options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator("en-US", { sensitivity: "base" });
      let result = collator.compare("a", "A");
      expect(typeof result === "int").assertTrue();
      expect(result === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0800
     * @tc.name testOverall008
     * @tc.desc Verify Collator compare method basic comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator("en-US");
      expect(collator.compare("apple", "banana") < 0).assertTrue();
      expect(collator.compare("banana", "apple") > 0).assertTrue();
      expect(collator.compare("apple", "apple") === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_0900
     * @tc.name testOverall009
     * @tc.desc Verify Collator compare method with Chinese characters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator("zh-CN");
      let result = collator.compare("中文", "测试");
      expect(typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1000
     * @tc.name testOverall010
     * @tc.desc Verify Collator compare with different sensitivity options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator1: Intl.Collator = new Intl.Collator("en-US", { sensitivity: "base" });
      let collator2: Intl.Collator = new Intl.Collator("en-US", { sensitivity: "case" });
      let result1 = collator1.compare("a", "A");
      let result2 = collator2.compare("a", "A");
      expect(typeof result1 === "int").assertTrue();
      expect(typeof result2 === "int").assertTrue();
      expect(result1 === 0).assertTrue();
      expect(result2 !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1100
     * @tc.name testOverall011
     * @tc.desc Verify Collator resolvedOptions returns correct options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator("en-US");
      let options = collator.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1200
     * @tc.name testOverall012
     * @tc.desc Verify DateTimeFormat constructor with specified locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US");
      let result = dtf.format(new Date(0));
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1300
     * @tc.name testOverall013
     * @tc.desc Verify DateTimeFormat constructor with locale and options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric",
        month: "long",
        day: "numeric"
      });
      let result = dtf.format(new Date(2024, 0, 1));
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1400
     * @tc.name testOverall014
     * @tc.desc Verify DateTimeFormat format method with Date objects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("zh-CN");
      let result1 = dtf.format(new Date(0));
      let result2 = dtf.format(new Date(2024, 5, 15));
      expect(result1.length > 0).assertTrue();
      expect(result2.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1500
     * @tc.name testOverall015
     * @tc.desc Verify DateTimeFormat formatToParts method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", {
        year: "numeric",
        month: "long",
        day: "numeric"
      });
      let parts = dtf.formatToParts(new Date(2024, 0, 1));
      expect(Array.isArray(parts)).assertTrue();
      expect(parts.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1600
     * @tc.name testOverall016
     * @tc.desc Verify DateTimeFormat formatRange method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US");
      let start: Date = new Date(2024, 0, 1);
      let end: Date = new Date(2024, 5, 15);
      let result = dtf.formatRange(start, end);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1700
     * @tc.name testOverall017
     * @tc.desc Verify DateTimeFormat resolvedOptions method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { year: "numeric" });
      let options = dtf.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
      expect(options.year).assertEqual("numeric");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1800
     * @tc.name testOverall018
     * @tc.desc Verify DateTimeFormat multi-locale formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let date: Date = new Date(2024, 0, 1);
      let dtfEN: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US");
      let dtfZH: Intl.DateTimeFormat = new Intl.DateTimeFormat("zh-CN");
      let dtfJA: Intl.DateTimeFormat = new Intl.DateTimeFormat("ja-JP");
      expect(dtfEN.format(date).length > 0).assertTrue();
      expect(dtfZH.format(date).length > 0).assertTrue();
      expect(dtfJA.format(date).length > 0).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_1900
     * @tc.name testOverall019
     * @tc.desc Verify DisplayNames constructor with language type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "language" });
      expect(names.of("zh")).assertEqual("Chinese");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2000
     * @tc.name testOverall020
     * @tc.desc Verify DisplayNames constructor with region type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "region" });
      expect(names.of("CN")).assertEqual("China");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2100
     * @tc.name testOverall021
     * @tc.desc Verify DisplayNames constructor with script type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "script" });
      expect(names.of("Hans")).assertEqual("Simplified");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2200
     * @tc.name testOverall022
     * @tc.desc Verify DisplayNames constructor with currency type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "currency" });
      expect(names.of("CNY")).assertEqual("Chinese Yuan");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2300
     * @tc.name testOverall023
     * @tc.desc Verify DisplayNames of method with multiple language codes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "language" });
      expect(names.of("zh")).assertEqual("Chinese");
      expect(names.of("ja")).assertEqual("Japanese");
      expect(names.of("fr")).assertEqual("French");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2400
     * @tc.name testOverall024
     * @tc.desc Verify DisplayNames resolvedOptions method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let names: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "language" });
      let options = names.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
      expect(options.type).assertEqual("language");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2500
     * @tc.name testOverall025
     * @tc.desc Verify ListFormat constructor with default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US");
      let result = lf.format(["red", "green", "blue"]);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2600
     * @tc.name testOverall026
     * @tc.desc Verify ListFormat constructor with conjunction type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US", { type: "conjunction" });
      let result = lf.format(["red", "green", "blue"]);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2700
     * @tc.name testOverall027
     * @tc.desc Verify ListFormat constructor with disjunction type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US", { type: "disjunction" });
      let result = lf.format(["red", "green", "blue"]);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2800
     * @tc.name testOverall028
     * @tc.desc Verify ListFormat constructor with unit type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US", { type: "unit" });
      let result = lf.format(["red", "green", "blue"]);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_2900
     * @tc.name testOverall029
     * @tc.desc Verify ListFormat format method with single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US");
      let result = lf.format(["red"]);
      expect(result.length > 0).assertTrue();
      expect(result).assertEqual("red");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3000
     * @tc.name testOverall030
     * @tc.desc Verify ListFormat format method with two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US");
      let result = lf.format(["red", "green"]);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3100
     * @tc.name testOverall031
     * @tc.desc Verify ListFormat formatToParts method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US");
      let parts = lf.formatToParts(["red", "green", "blue"]);
      expect(Array.isArray(parts)).assertTrue();
      expect(parts.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3200
     * @tc.name testOverall032
     * @tc.desc Verify ListFormat format method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US", { type: "conjunction" });
      let result = lf.format(["a", "b"]);
      expect(result.length > 0).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3300
     * @tc.name testOverall033
     * @tc.desc Verify Locale constructor with basic language tag
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US");
      expect(locale.language === "en").assertTrue();
      expect(locale.region === "US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3400
     * @tc.name testOverall034
     * @tc.desc Verify Locale constructor with tag and options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en", { region: "US" });
      expect(locale.region === "US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3500
     * @tc.name testOverall035
     * @tc.desc Verify Locale language property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-CN");
      expect(locale.language === "zh").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3600
     * @tc.name testOverall036
     * @tc.desc Verify Locale region property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US");
      expect(locale.region === "US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3700
     * @tc.name testOverall037
     * @tc.desc Verify Locale script property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
      expect(locale.script).assertEqual("Hans");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3800
     * @tc.name testOverall038
     * @tc.desc Verify Locale baseName property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
      expect(locale.baseName).assertEqual("zh-Hans-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_3900
     * @tc.name testOverall039
     * @tc.desc Verify Locale toString method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US");
      let str = locale.toString();
      expect(str.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4000
     * @tc.name testOverall040
     * @tc.desc Verify Locale maximize method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh");
      let maximized: Intl.Locale = locale.maximize();
      expect(maximized instanceof Intl.Locale).assertTrue();
      expect(maximized.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4100
     * @tc.name testOverall041
     * @tc.desc Verify Locale minimize method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-Hans-CN");
      let minimized: Intl.Locale = locale.minimize();
      expect(minimized instanceof Intl.Locale).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4200
     * @tc.name testOverall042
     * @tc.desc Verify NumberFormat constructor with default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat();
      let result = nf.format(1234.5);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4300
     * @tc.name testOverall043
     * @tc.desc Verify NumberFormat constructor with specified locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let result = nf.format(1234.5);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4400
     * @tc.name testOverall044
     * @tc.desc Verify NumberFormat constructor with locale and currency options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD"
      });
      let result = nf.format(1234.5);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4500
     * @tc.name testOverall045
     * @tc.desc Verify NumberFormat format method with integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let result = nf.format(1234567);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4600
     * @tc.name testOverall046
     * @tc.desc Verify NumberFormat format method with decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let result = nf.format(1234.567);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4700
     * @tc.name testOverall047
     * @tc.desc Verify NumberFormat format method with negative number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let result = nf.format(-1234.5);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4800
     * @tc.name testOverall048
     * @tc.desc Verify NumberFormat format method with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let result = nf.format(0);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_4900
     * @tc.name testOverall049
     * @tc.desc Verify NumberFormat formatToParts method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let parts = nf.formatToParts(1234.5);
      expect(Array.isArray(parts)).assertTrue();
      expect(parts.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5000
     * @tc.name testOverall050
     * @tc.desc Verify NumberFormat resolvedOptions method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });
      let options = nf.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
      expect(options.style).assertEqual("currency");
      expect(options.currency).assertEqual("USD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5100
     * @tc.name testOverall051
     * @tc.desc Verify NumberFormat multi-locale formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nfEN: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let nfDE: Intl.NumberFormat = new Intl.NumberFormat("de-DE");
      let nfZH: Intl.NumberFormat = new Intl.NumberFormat("zh-CN");
      expect(nfEN.format(1234.5).length > 0).assertTrue();
      expect(nfDE.format(1234.5).length > 0).assertTrue();
      expect(nfZH.format(1234.5).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5200
     * @tc.name testOverall052
     * @tc.desc Verify PluralRules constructor with specified locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US");
      let result = pr.select(1);
      expect(result === "one").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5300
     * @tc.name testOverall053
     * @tc.desc Verify PluralRules select with various English values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US");
      let result1 = pr.select(1);
      let result2 = pr.select(2);
      let result3 = pr.select(5);
      expect(result1 === "one").assertTrue();
      expect(result2 === "other").assertTrue();
      expect(result3 === "other").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5400
     * @tc.name testOverall054
     * @tc.desc Verify PluralRules select with Chinese values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("zh-CN");
      let result1 = pr.select(1);
      let result2 = pr.select(2);
      let result3 = pr.select(5);
      expect(result1 === "other").assertTrue();
      expect(result2 === "other").assertTrue();
      expect(result3 === "other").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5500
     * @tc.name testOverall055
     * @tc.desc Verify PluralRules select with decimal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US");
      let result1 = pr.select(0.5);
      let result2 = pr.select(1.5);
      let result3 = pr.select(2.7);
      expect(result1 === "other").assertTrue();
      expect(result2 === "other").assertTrue();
      expect(result3 === "other").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5600
     * @tc.name testOverall056
     * @tc.desc Verify PluralRules select with negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US");
      let result1 = pr.select(-1);
      let result2 = pr.select(-2);
      let result3 = pr.select(-5);
      expect(result1 === "one").assertTrue();
      expect(result2 === "other").assertTrue();
      expect(result3 === "other").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5700
     * @tc.name testOverall057
     * @tc.desc Verify PluralRules resolvedOptions method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US");
      let options = pr.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5800
     * @tc.name testOverall058
     * @tc.desc Verify RelativeTimeFormat constructor with default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      let result = rtf.format(-1, "day");
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_5900
     * @tc.name testOverall059
     * @tc.desc Verify all Intl function interfaces can be called
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testOverall059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r1: string = Intl.intlLookUpLocale("en-US");
      let r2: string = Intl.intlBestFitLocale("en-US");
      let r3: string[] = Intl.intlLookUpLocales(["en-US"]);
      let r4: string[] = Intl.intlBestFitLocales(["en-US"]);
      let r5: string[] = Intl.intlLocalesToLanguageTags("en-US");
      expect(r1).assertEqual("en-US");
      expect(r2).assertEqual("en-US");
      expect(Array.isArray(r3)).assertTrue();
      expect(Array.isArray(r4)).assertTrue();
      expect(Array.isArray(r5)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6000
     * @tc.name testOverall060
     * @tc.desc Verify RelativeTimeFormat constructor with locale and options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US", { numeric: "auto" });
      let result = rtf.format(-1, "day");
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6100
     * @tc.name testOverall061
     * @tc.desc Verify RelativeTimeFormat format with days
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      expect(typeof rtf.format(-1, "day") === "string").assertTrue();
      expect(typeof rtf.format(1, "day") === "string").assertTrue();
      expect(typeof rtf.format(-7, "day") === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6200
     * @tc.name testOverall062
     * @tc.desc Verify RelativeTimeFormat format with hours
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      expect(typeof rtf.format(-1, "hour") === "string").assertTrue();
      expect(typeof rtf.format(2, "hour") === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6300
     * @tc.name testOverall063
     * @tc.desc Verify RelativeTimeFormat format with minutes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      let result = rtf.format(-30, "minute");
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6400
     * @tc.name testOverall064
     * @tc.desc Verify RelativeTimeFormat format with months and years
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      expect(typeof rtf.format(-1, "month") === "string").assertTrue();
      expect(typeof rtf.format(1, "year") === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6500
     * @tc.name testOverall065
     * @tc.desc Verify RelativeTimeFormat formatToParts method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      let parts = rtf.formatToParts(-1, "day");
      expect(Array.isArray(parts)).assertTrue();
      expect(parts.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6600
     * @tc.name testOverall066
     * @tc.desc Verify RelativeTimeFormat resolvedOptions method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US", { numeric: "auto" });
      let options = rtf.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
      expect(options.numeric).assertEqual("auto");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6700
     * @tc.name testOverall067
     * @tc.desc Verify RelativeTimeFormat multi-locale formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtfEN: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      let rtfZH: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("zh-CN");
      expect(typeof rtfEN.format(-1, "day") === "string").assertTrue();
      expect(typeof rtfZH.format(-1, "day") === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6800
     * @tc.name testOverall068
     * @tc.desc Verify Segmenter constructor with default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US");
      let options = segmenter.resolvedOptions();
      expect(options.granularity).assertEqual("grapheme");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_6900
     * @tc.name testOverall069
     * @tc.desc Verify Segmenter constructor with word granularity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US", { granularity: "word" });
      let options = segmenter.resolvedOptions();
      expect(options.granularity === "word").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7000
     * @tc.name testOverall070
     * @tc.desc Verify Segmenter constructor with sentence granularity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US", { granularity: "sentence" });
      let options = segmenter.resolvedOptions();
      expect(options.granularity === "sentence").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7100
     * @tc.name testOverall071
     * @tc.desc Verify Segmenter constructor with grapheme granularity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US", { granularity: "grapheme" });
      let options = segmenter.resolvedOptions();
      expect(options.granularity === "grapheme").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7200
     * @tc.name testOverall072
     * @tc.desc Verify Segmenter segment method with English text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US", { granularity: "word" });
      let segments = segmenter.segment("Hello World");
      let words: string[] = [];
      for (let seg of segments) {
        words.push(seg.segment);
      }
      expect(words.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7300
     * @tc.name testOverall073
     * @tc.desc Verify Segmenter segment method with Chinese text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("zh-CN", { granularity: "word" });
      let segments = segmenter.segment("我今天去学校");
      let words: string[] = [];
      for (let seg of segments) {
        words.push(seg.segment);
      }
      expect(words.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7400
     * @tc.name testOverall074
     * @tc.desc Verify Segmenter segment method with sentence granularity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US", { granularity: "sentence" });
      let segments = segmenter.segment("Hello World. How are you?");
      let sentences: string[] = [];
      for (let seg of segments) {
        sentences.push(seg.segment);
      }
      expect(sentences.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7500
     * @tc.name testOverall075
     * @tc.desc Verify Segmenter resolvedOptions method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter("en-US", { granularity: "word" });
      let options = segmenter.resolvedOptions();
      expect(options.locale).assertEqual("en-US");
      expect(options.granularity).assertEqual("word");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7600
     * @tc.name testOverall076
     * @tc.desc Verify intlLookUpLocale result used with DateTimeFormat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let matchedLocale: string = Intl.intlLookUpLocale(["zh-CN", "en-US"]);
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat(matchedLocale);
      let result = dtf.format(new Date(0));
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7700
     * @tc.name testOverall077
     * @tc.desc Verify intlBestFitLocale result used with NumberFormat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let matchedLocale: string = Intl.intlBestFitLocale(["de-DE", "en-US"]);
      let nf: Intl.NumberFormat = new Intl.NumberFormat(matchedLocale);
      let result = nf.format(1234.5);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7800
     * @tc.name testOverall078
     * @tc.desc Verify Locale object used with DateTimeFormat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("ja-JP");
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale.toString());
      let result = dtf.format(new Date(0));
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_7900
     * @tc.name testOverall079
     * @tc.desc Verify Locale object used with NumberFormat
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-CN");
      let nf: Intl.NumberFormat = new Intl.NumberFormat(locale.toString());
      let result = nf.format(1234.5);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8000
     * @tc.name testOverall080
     * @tc.desc Verify Locale object used with Collator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US");
      let collator: Intl.Collator = new Intl.Collator(locale.toString());
      let result = collator.compare("a", "b");
      expect(typeof result === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8100
     * @tc.name testOverall081
     * @tc.desc Verify Locale object used with PluralRules
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US");
      let pr: Intl.PluralRules = new Intl.PluralRules(locale.toString());
      let result = pr.select(1);
      expect(result === "one").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8200
     * @tc.name testOverall082
     * @tc.desc Verify Locale objects converted to language tags
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale1: Intl.Locale = new Intl.Locale("en-US");
      let locale2: Intl.Locale = new Intl.Locale("zh-CN");
      let tags: string[] = Intl.intlLocalesToLanguageTags([locale1, locale2]);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8300
     * @tc.name testOverall083
     * @tc.desc Verify mixed string and Locale parameters converted to language tags
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let localeObj: Intl.Locale = new Intl.Locale("ja-JP");
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", localeObj, "fr-FR"]);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8400
     * @tc.name testOverall084
     * @tc.desc Verify all formatting classes constructed with same locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: string = "en-US";
      let collator: Intl.Collator = new Intl.Collator(locale);
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat(locale);
      let nf: Intl.NumberFormat = new Intl.NumberFormat(locale);
      let pr: Intl.PluralRules = new Intl.PluralRules(locale);
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat(locale);
      let lf: Intl.ListFormat = new Intl.ListFormat(locale);
      let dn: Intl.DisplayNames = new Intl.DisplayNames(locale, { type: "language" });
      expect(typeof collator.compare("a", "b") === "int").assertTrue();
      expect(typeof dtf.format(new Date(0)) === "string").assertTrue();
      expect(typeof rtf.format(-1, "day") === "string").assertTrue();
      expect(typeof lf.format(["a", "b"]) === "string").assertTrue();
      expect(dn.of("zh")).assertEqual("Chinese");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8500
     * @tc.name testOverall085
     * @tc.desc Verify multi-locale comparison of formatting results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locales: string[] = ["en-US", "zh-CN", "ja-JP", "de-DE", "fr-FR"];
      for (let loc of locales) {
        let nf: Intl.NumberFormat = new Intl.NumberFormat(loc);
        let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat(loc);
        expect(typeof dtf.format(new Date(0)) === "string").assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8600
     * @tc.name testOverall086
     * @tc.desc Verify BCP47LanguageTag used with function interfaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: Intl.BCP47LanguageTag[] = ["en-US", "zh-CN", "ja-JP"];
      let result: string[] = Intl.intlLookUpLocales(tags);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8700
     * @tc.name testOverall087
     * @tc.desc Verify LDMLPluralRule with PluralRules select return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules("en-US");
      let rule: Intl.LDMLPluralRule = pr.select(1);
      expect(rule).assertEqual("one");
      expect(pr.select(2)).assertEqual("other");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8800
     * @tc.name testOverall088
     * @tc.desc Verify DateTimeFormatPartTypes with formatToParts return values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat("en-US", { year: "numeric", month: "long", day: "numeric" });
      let parts = dtf.formatToParts(new Date(2024, 0, 1));
      expect(Array.isArray(parts)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_8900
     * @tc.name testOverall089
     * @tc.desc Verify NumberFormatPartTypes with formatToParts return values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat("en-US");
      let parts = nf.formatToParts(1234.5);
      expect(Array.isArray(parts)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9000
     * @tc.name testOverall090
     * @tc.desc Verify Intl namespace export functionality
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: string = Intl.intlLookUpLocale("en-US");
      expect(locale).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9100
     * @tc.name testOverall091
     * @tc.desc Verify Intl.Collator can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let collator: Intl.Collator = new Intl.Collator();
      expect(typeof collator.compare("a", "b") === "int").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9200
     * @tc.name testOverall092
     * @tc.desc Verify Intl.DateTimeFormat can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dtf: Intl.DateTimeFormat = new Intl.DateTimeFormat();
      expect(dtf.format(new Date()).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9300
     * @tc.name testOverall093
     * @tc.desc Verify Intl.DisplayNames can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dn: Intl.DisplayNames = new Intl.DisplayNames("en-US", { type: "language" });
      let dnResult = dn.of("zh");
      if (dnResult !== undefined) {
        expect(dnResult.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9400
     * @tc.name testOverall094
     * @tc.desc Verify Intl.ListFormat can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let lf: Intl.ListFormat = new Intl.ListFormat("en-US");
      expect(lf.format(["a", "b"]).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9500
     * @tc.name testOverall095
     * @tc.desc Verify Intl.Locale can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let loc: Intl.Locale = new Intl.Locale("en-US");
      let lang = loc.language;
      if (lang !== undefined) {
        expect(lang.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9600
     * @tc.name testOverall096
     * @tc.desc Verify Intl.NumberFormat can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nf: Intl.NumberFormat = new Intl.NumberFormat();
      expect(nf.format(123).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9700
     * @tc.name testOverall097
     * @tc.desc Verify Intl.PluralRules can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pr: Intl.PluralRules = new Intl.PluralRules();
      expect(pr.select(1).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9800
     * @tc.name testOverall098
     * @tc.desc Verify Intl.RelativeTimeFormat can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rtf: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat("en-US");
      expect(rtf.format(1, "day").length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_OVERALL_9900
     * @tc.name testOverall099
     * @tc.desc Verify Intl.Segmenter can be constructed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testOverall099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let seg: Intl.Segmenter = new Intl.Segmenter("en-US");
      let segments = seg.segment("hello");
      expect(segments !== undefined).assertTrue();
    });
  });
}


