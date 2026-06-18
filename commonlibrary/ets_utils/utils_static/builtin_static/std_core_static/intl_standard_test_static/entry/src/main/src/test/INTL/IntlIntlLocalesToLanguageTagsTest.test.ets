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

import { describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
export default function IntlIntlLocalesToLanguageTagsTest(): void {
  describe('IntlIntlLocalesToLanguageTagsTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0010
     * @tc.name testIntlLocalesToLanguageTags001
     * @tc.desc Verify intlLocalesToLanguageTags with "zh-CN" returns first element "zh-CN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("zh-CN");
      expect(tags[0] === "zh-CN").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0020
     * @tc.name testIntlLocalesToLanguageTags002
     * @tc.desc Verify intlLocalesToLanguageTags with "ja-JP" returns first element "ja-JP"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("ja-JP");
      expect(tags[0] === "ja-JP").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0030
     * @tc.name testIntlLocalesToLanguageTags003
     * @tc.desc Verify intlLocalesToLanguageTags with "fr-FR" returns first element "fr-FR"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("fr-FR");
      expect(tags[0] === "fr-FR").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0040
     * @tc.name testIntlLocalesToLanguageTags004
     * @tc.desc Verify intlLocalesToLanguageTags with "de-DE" returns first element "de-DE"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("de-DE");
      expect(tags[0] === "de-DE").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0050
     * @tc.name testIntlLocalesToLanguageTags005
     * @tc.desc Verify intlLocalesToLanguageTags with "ko-KR" returns first element "ko-KR"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("ko-KR");
      expect(tags[0] === "ko-KR").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0060
     * @tc.name testIntlLocalesToLanguageTags006
     * @tc.desc Verify intlLocalesToLanguageTags with empty string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0070
     * @tc.name testIntlLocalesToLanguageTags007
     * @tc.desc Verify intlLocalesToLanguageTags with short tag "en" returns first element "en"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("en");
      expect(tags[0] === "en").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0080
     * @tc.name testIntlLocalesToLanguageTags008
     * @tc.desc Verify intlLocalesToLanguageTags with script tag "zh-Hans-CN" returns first element "zh-Hans-CN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("zh-Hans-CN");
      expect(tags[0] === "zh-Hans-CN").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0090
     * @tc.name testIntlLocalesToLanguageTags009
     * @tc.desc Verify intlLocalesToLanguageTags with XSS string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("<script>alert(1)</script>");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0100
     * @tc.name testIntlLocalesToLanguageTags010
     * @tc.desc Verify intlLocalesToLanguageTags with Japanese text handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("日本語");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0110
     * @tc.name testIntlLocalesToLanguageTags011
     * @tc.desc Verify intlLocalesToLanguageTags with zero-width space handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("\u200B");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0120
     * @tc.name testIntlLocalesToLanguageTags012
     * @tc.desc Verify intlLocalesToLanguageTags with lone surrogate handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("\udc04");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0130
     * @tc.name testIntlLocalesToLanguageTags013
     * @tc.desc Verify intlLocalesToLanguageTags with new Intl.Locale("en-US") returns "en-US"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US");
      let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
      expect(tags[0] === "en-US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0140
     * @tc.name testIntlLocalesToLanguageTags014
     * @tc.desc Verify intlLocalesToLanguageTags with new Intl.Locale("zh-CN") returns "zh-CN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-CN");
      let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
      expect(tags[0] === "zh-CN").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0150
     * @tc.name testIntlLocalesToLanguageTags015
     * @tc.desc Verify intlLocalesToLanguageTags with new Intl.Locale("ja-JP") returns "ja-JP"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("ja-JP");
      let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
      expect(tags[0] === "ja-JP").assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0160
     * @tc.name testIntlLocalesToLanguageTags016
     * @tc.desc Verify intlLocalesToLanguageTags with Locale with numberingSystem option returns array with length > 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("zh-CN", { numberingSystem: "latn" });
      let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
      expect(tags.length).assertEqual(1);
      expect(tags[0]).assertEqual("zh-CN-u-nu-latn");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0170
     * @tc.name testIntlLocalesToLanguageTags017
     * @tc.desc Verify intlLocalesToLanguageTags with empty Locale constructor handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let locale: Intl.Locale = new Intl.Locale("");
        let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0180
     * @tc.name testIntlLocalesToLanguageTags018
     * @tc.desc Verify intlLocalesToLanguageTags with string array ["en-US", "zh-CN"] returns correct length and elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", "zh-CN"]);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags.length >= 2).assertTrue();
      expect(tags.length === 2).assertTrue();
      expect(tags[0] === "en-US").assertTrue();
      expect(tags[1] === "zh-CN").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0190
     * @tc.name testIntlLocalesToLanguageTags019
     * @tc.desc Verify intlLocalesToLanguageTags with Locale object array returns correct elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale1: Intl.Locale = new Intl.Locale("ja-JP");
      let locale2: Intl.Locale = new Intl.Locale("en-US");
      let tags: string[] = Intl.intlLocalesToLanguageTags([locale1, locale2]);
      expect(tags.length === 2).assertTrue();
      expect(tags[0] === "ja-JP").assertTrue();
      expect(tags[1] === "en-US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0200
     * @tc.name testIntlLocalesToLanguageTags020
     * @tc.desc Verify intlLocalesToLanguageTags with mixed string and Locale array returns correct elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", new Intl.Locale("zh-CN")]);
      expect(tags.length === 2).assertTrue();
      expect(tags[0] === "en-US").assertTrue();
      expect(tags[1] === "zh-CN").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0210
     * @tc.name testIntlLocalesToLanguageTags021
     * @tc.desc Verify intlLocalesToLanguageTags with LocalesArgument mixed array returns correct length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let languageTag: string = "en-US";
      let locale: Intl.Locale = new Intl.Locale("ja-JP");
      let locales: Intl.LocalesArgument = [languageTag, locale];
      let tags: string[] = Intl.intlLocalesToLanguageTags(locales);
      expect(tags.length === 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0220
     * @tc.name testIntlLocalesToLanguageTags022
     * @tc.desc Verify intlLocalesToLanguageTags with single element array returns correct length and element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US"]);
      expect(tags.length === 1).assertTrue();
      expect(tags[0] === "en-US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0230
     * @tc.name testIntlLocalesToLanguageTags023
     * @tc.desc Verify intlLocalesToLanguageTags with single Locale element array returns correct element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags([new Intl.Locale("fr-FR")]);
      expect(tags.length === 1).assertTrue();
      expect(tags[0] === "fr-FR").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0240
     * @tc.name testIntlLocalesToLanguageTags024
     * @tc.desc Verify intlLocalesToLanguageTags with 100-element array returns correct length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bigArray: string[] = [];
      let tags: string[] = ["en-US", "zh-CN", "ja-JP", "fr-FR", "de-DE", "ko-KR", "es-ES", "pt-BR", "ru-RU", "it-IT"];
      for (let i = 0; i < 10; i++) {
        for (let j = 0; j < tags.length; j++) {
          bigArray.push(tags[j]);
        }
      }
      let result: string[] = Intl.intlLocalesToLanguageTags(bigArray);
      expect(result.length === 100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0250
     * @tc.name testIntlLocalesToLanguageTags025
     * @tc.desc Verify intlLocalesToLanguageTags with string returns Array and string element type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("en-US");
      expect(Array.isArray(tags)).assertTrue();
      expect(tags[0] === "en-US").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0260
     * @tc.name testIntlLocalesToLanguageTags026
     * @tc.desc Verify intlLocalesToLanguageTags with Locale object returns Array of string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("ja-JP");
      let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags[0] === "ja-JP").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0270
     * @tc.name testIntlLocalesToLanguageTags027
     * @tc.desc Verify intlLocalesToLanguageTags with array returns correct length and elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", "zh-CN", "ja-JP"]);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags.length === 3).assertTrue();
      expect(tags[0] === "en-US").assertTrue();
      expect(tags[1] === "zh-CN").assertTrue();
      expect(tags[2] === "ja-JP").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0280
     * @tc.name testIntlLocalesToLanguageTags028
     * @tc.desc Verify intlLocalesToLanguageTags with mixed array returns Array of string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", new Intl.Locale("zh-CN"), new Intl.Locale("ja-JP")]);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0290
     * @tc.name testIntlLocalesToLanguageTags029
     * @tc.desc Verify intlLocalesToLanguageTags with array containing invalid tags returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["xx-YY"]);
      expect(Array.isArray(tags)).assertTrue();
      expect(tags.length).assertEqual(1);
      expect(tags[0]).assertEqual("xx-YY");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0300
     * @tc.name testIntlLocalesToLanguageTags030
     * @tc.desc Verify intlLocalesToLanguageTags with script tag returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("zh-Hans-CN");
      expect(tags.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0310
     * @tc.name testIntlLocalesToLanguageTags031
     * @tc.desc Verify intlLocalesToLanguageTags with language-only tag returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("en");
      expect(tags.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0320
     * @tc.name testIntlLocalesToLanguageTags032
     * @tc.desc Verify intlLocalesToLanguageTags with various input types all return Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags1: string[] = Intl.intlLocalesToLanguageTags("en-US");
      expect(Array.isArray(tags1)).assertTrue();
      let tags2: string[] = Intl.intlLocalesToLanguageTags(new Intl.Locale("zh-CN"));
      expect(Array.isArray(tags2)).assertTrue();
      let tags3: string[] = Intl.intlLocalesToLanguageTags(["en-US"]);
      expect(Array.isArray(tags3)).assertTrue();
      let tags4: string[] = Intl.intlLocalesToLanguageTags(undefined);
      expect(Array.isArray(tags4)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0330
     * @tc.name testIntlLocalesToLanguageTags033
     * @tc.desc Verify intlLocalesToLanguageTags return array elements are all string type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", new Intl.Locale("zh-CN"), "ja-JP"]);
      for (let i = 0; i < tags.length; i++) {
        expect(typeof tags[i] === "string").assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0340
     * @tc.name testIntlLocalesToLanguageTags034
     * @tc.desc Verify intlLocalesToLanguageTags returns expected language tags
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags1: string[] = Intl.intlLocalesToLanguageTags("en-US");
      let tags2: string[] = Intl.intlLocalesToLanguageTags(new Intl.Locale("zh-CN"));
      let defaultLocale: string = new Intl.DateTimeFormat().resolvedOptions().locale;
      expect(tags1[0]).assertEqual("en-US");
      expect(tags2[0]).assertEqual("zh-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0350
     * @tc.name testIntlLocalesToLanguageTags035
     * @tc.desc Verify intlLocalesToLanguageTags returned array is mutable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags("en-US");
      let originalLength: number = tags.length;
      tags.push("test");
      expect(tags.length === originalLength + 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0360
     * @tc.name testIntlLocalesToLanguageTags036
     * @tc.desc Verify intlLocalesToLanguageTags with large Locale array returns correct length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locales: Intl.Locale[] = [];
      let tags: string[] = ["en-US", "zh-CN", "ja-JP", "fr-FR", "de-DE"];
      for (let i = 0; i < 20; i++) {
        for (let j = 0; j < tags.length; j++) {
          locales.push(new Intl.Locale(tags[j]));
        }
      }
      let result: string[] = Intl.intlLocalesToLanguageTags(locales);
      expect(result.length === 100).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0370
     * @tc.name testIntlLocalesToLanguageTags037
     * @tc.desc Verify intlLocalesToLanguageTags with mixed array preserves order and content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let input: (string | Intl.Locale)[] = ["en-US", new Intl.Locale("zh-CN"), "ja-JP", new Intl.Locale("fr-FR")];
      let result: string[] = Intl.intlLocalesToLanguageTags(input);
      expect(result.length === 4).assertTrue();
      expect(result[0] === "en-US").assertTrue();
      expect(result[1] === "zh-CN").assertTrue();
      expect(result[2] === "ja-JP").assertTrue();
      expect(result[3] === "fr-FR").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0380
     * @tc.name testIntlLocalesToLanguageTags038
     * @tc.desc Verify intlLocalesToLanguageTags various parameter types return correct lengths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r1: string[] = Intl.intlLocalesToLanguageTags("en-US");
      expect(r1.length === 1).assertTrue();
      let r2: string[] = Intl.intlLocalesToLanguageTags(new Intl.Locale("zh-CN"));
      expect(r2.length === 1).assertTrue();
      let r3: string[] = Intl.intlLocalesToLanguageTags(["en-US", "zh-CN"]);
      expect(r3.length === 2).assertTrue();
      let empty3: string[] = [];
      let r4: string[] = Intl.intlLocalesToLanguageTags(empty3);
      expect(r4.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0390
     * @tc.name testIntlLocalesToLanguageTags039
     * @tc.desc Verify intlLocalesToLanguageTags with duplicate tags returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", "en-US", "zh-CN"]);
      expect(Array.isArray(tags)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0400
     * @tc.name testIntlLocalesToLanguageTags040
     * @tc.desc Verify intlLocalesToLanguageTags with Locale with calendar and numberingSystem options returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locale: Intl.Locale = new Intl.Locale("en-US", { calendar: "gregory", numberingSystem: "latn" });
      let tags: string[] = Intl.intlLocalesToLanguageTags(locale);
      expect(tags.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0410
     * @tc.name testIntlLocalesToLanguageTags041
     * @tc.desc Verify intlLocalesToLanguageTags with string input returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let tags: string[] = Intl.intlLocalesToLanguageTags("en-US");
        expect(tags.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0420
     * @tc.name testIntlLocalesToLanguageTags042
     * @tc.desc Verify intlLocalesToLanguageTags with nested array handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let nested: string[][] = [["en-US"]];
        let tags: string[] = Intl.intlLocalesToLanguageTags(nested  as (string | Intl.Locale)[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0430
     * @tc.name testIntlLocalesToLanguageTags043
     * @tc.desc Verify intlLocalesToLanguageTags with path traversal "../" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("../");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0440
     * @tc.name testIntlLocalesToLanguageTags044
     * @tc.desc Verify intlLocalesToLanguageTags with null byte "\0" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags("\0");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0450
     * @tc.name testIntlLocalesToLanguageTags045
     * @tc.desc Verify intlLocalesToLanguageTags with null as Locale throws error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags(null  as Intl.Locale);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0460
     * @tc.name testIntlLocalesToLanguageTags046
     * @tc.desc Verify intlLocalesToLanguageTags with array containing null element throws error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags(["en-US", null as string]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0470
     * @tc.name testIntlLocalesToLanguageTags047
     * @tc.desc Verify intlLocalesToLanguageTags with record cast to string throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let numVal: Record<string, string> = { "123": "value" };
        let tags: string[] = Intl.intlLocalesToLanguageTags(numVal as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOCALES_TO_LANGUAGE_TAGS_0480
     * @tc.name testIntlLocalesToLanguageTags048
     * @tc.desc Verify intlLocalesToLanguageTags block executes on error scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLocalesToLanguageTags048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let tags: string[] = Intl.intlLocalesToLanguageTags(null as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });
  });
}
