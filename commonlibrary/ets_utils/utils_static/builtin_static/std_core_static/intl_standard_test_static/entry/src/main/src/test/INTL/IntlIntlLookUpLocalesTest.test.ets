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
interface testIntlLookUpLocales057{
  name:string,
  age:number
}
export default function IntlIntlLookUpLocalesTest(): void {
  describe('IntlIntlLookUpLocalesTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0010
     * @tc.name testIntlLookUpLocales001
     * @tc.desc Verify intlLookUpLocales with "en-US" returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("en-US");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0020
     * @tc.name testIntlLookUpLocales002
     * @tc.desc Verify intlLookUpLocales with "zh-CN" returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("zh-CN");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0030
     * @tc.name testIntlLookUpLocales003
     * @tc.desc Verify intlLookUpLocales with "ja-JP" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("ja-JP");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0040
     * @tc.name testIntlLookUpLocales004
     * @tc.desc Verify intlLookUpLocales with "fr-FR" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("fr-FR");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0050
     * @tc.name testIntlLookUpLocales005
     * @tc.desc Verify intlLookUpLocales with "de-DE" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("de-DE");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0060
     * @tc.name testIntlLookUpLocales006
     * @tc.desc Verify intlLookUpLocales with "ko-KR" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("ko-KR");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0070
     * @tc.name testIntlLookUpLocales007
     * @tc.desc Verify intlLookUpLocales with "es-ES" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("es-ES");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0080
     * @tc.name testIntlLookUpLocales008
     * @tc.desc Verify intlLookUpLocales with "pt-BR" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("pt-BR");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0090
     * @tc.name testIntlLookUpLocales009
     * @tc.desc Verify intlLookUpLocales with "ru-RU" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("ru-RU");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0100
     * @tc.name testIntlLookUpLocales010
     * @tc.desc Verify intlLookUpLocales with "ar-SA" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("ar-SA");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0110
     * @tc.name testIntlLookUpLocales011
     * @tc.desc Verify intlLookUpLocales with "it-IT" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("it-IT");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0120
     * @tc.name testIntlLookUpLocales012
     * @tc.desc Verify intlLookUpLocales with "nl-NL" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("nl-NL");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0130
     * @tc.name testIntlLookUpLocales013
     * @tc.desc Verify intlLookUpLocales with empty string locale handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0140
     * @tc.name testIntlLookUpLocales014
     * @tc.desc Verify intlLookUpLocales with short tag "en" returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("en");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0150
     * @tc.name testIntlLookUpLocales015
     * @tc.desc Verify intlLookUpLocales with script tag "zh-Hans-CN" returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("zh-Hans-CN");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0160
     * @tc.name testIntlLookUpLocales016
     * @tc.desc Verify intlLookUpLocales with Unicode extension "en-US-u-ca-gregory" returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("en-US-u-ca-gregory");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0170
     * @tc.name testIntlLookUpLocales017
     * @tc.desc Verify intlLookUpLocales with script tag "sr-Cyrl-RS" returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("sr-Cyrl-RS");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0180
     * @tc.name testIntlLookUpLocales018
     * @tc.desc Verify intlLookUpLocales with invalid tag "xx-YY" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("xx-YY");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0190
     * @tc.name testIntlLookUpLocales019
     * @tc.desc Verify intlLookUpLocales with XSS string throws error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("<script>alert(1)</script>");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0200
     * @tc.name testIntlLookUpLocales020
     * @tc.desc Verify intlLookUpLocales with Japanese text handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("日本語");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0210
     * @tc.name testIntlLookUpLocales021
     * @tc.desc Verify intlLookUpLocales with Arabic text handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("العربية");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0220
     * @tc.name testIntlLookUpLocales022
     * @tc.desc Verify intlLookUpLocales with Cyrillic text handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("русский");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0230
     * @tc.name testIntlLookUpLocales023
     * @tc.desc Verify intlLookUpLocales with zero-width space handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("\u200B");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0240
     * @tc.name testIntlLookUpLocales024
     * @tc.desc Verify intlLookUpLocales with mixed characters handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("Test 测试");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0250
     * @tc.name testIntlLookUpLocales025
     * @tc.desc Verify intlLookUpLocales with very long string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longTag: string = "en-".repeat(500) + "US";
      try {
        Intl.intlLookUpLocales(longTag);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0260
     * @tc.name testIntlLookUpLocales026
     * @tc.desc Verify intlLookUpLocales with invalid locale string "\xe4" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("\xe4");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0270
     * @tc.name testIntlLookUpLocales027
     * @tc.desc Verify intlLookUpLocales with mixed invalid locale string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("\xe4\x3f\xad");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0280
     * @tc.name testIntlLookUpLocales028
     * @tc.desc Verify intlLookUpLocales with invalid locale string "\xc0\x81" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("\xc0\x81");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0290
     * @tc.name testIntlLookUpLocales029
     * @tc.desc Verify intlLookUpLocales with invalid tag returns Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales("xx-ZZ");
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0300
     * @tc.name testIntlLookUpLocales030
     * @tc.desc Verify intlLookUpLocales with array ["en-US", "zh-CN"] returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["en-US", "zh-CN"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("en-US");
      expect(result[1]).assertEqual("zh-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0310
     * @tc.name testIntlLookUpLocales031
     * @tc.desc Verify intlLookUpLocales with single element array ["ja-JP"] returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["ja-JP"]);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0320
     * @tc.name testIntlLookUpLocales032
     * @tc.desc Verify intlLookUpLocales with multi-element array returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["en-US", "zh-CN", "ja-JP", "fr-FR", "de-DE"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("en-US");
      expect(result[4]).assertEqual("de-DE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0330
     * @tc.name testIntlLookUpLocales033
     * @tc.desc Verify intlLookUpLocales with single element array ["en-US"] returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["en-US"]);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0340
     * @tc.name testIntlLookUpLocales034
     * @tc.desc Verify intlLookUpLocales with array containing empty string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales([""]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0350
     * @tc.name testIntlLookUpLocales035
     * @tc.desc Verify intlLookUpLocales with array containing XSS string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales(["<script>"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0360
     * @tc.name testIntlLookUpLocales036
     * @tc.desc Verify intlLookUpLocales with 100+ element array returns non-null Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = [];
      for (let i = 0; i < 150; i++) {
        tags.push("en-US-" + i.toString());
      }
      try {
        Intl.intlLookUpLocales(tags);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0370
     * @tc.name testIntlLookUpLocales037
     * @tc.desc Verify intlLookUpLocales with large valid tag array returns Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = ["en-US", "zh-CN", "ja-JP", "fr-FR", "de-DE", "ko-KR", "es-ES", "pt-BR", "ru-RU", "ar-SA"];
      let result: string[] = Intl.intlLookUpLocales(tags);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(tags.length);
      expect(result[0]).assertEqual("en-US");
      expect(result[9]).assertEqual("ar-SA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0380
     * @tc.name testIntlLookUpLocales038
     * @tc.desc Verify intlLookUpLocales with multi-tag array returns Array with string elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["en-US", "zh-CN"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("en-US");
      expect(result[1]).assertEqual("zh-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0390
     * @tc.name testIntlLookUpLocales039
     * @tc.desc Verify intlLookUpLocales returns non-empty string elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["en-US", "zh-CN", "ja-JP"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("en-US");
      expect(result[1]).assertEqual("zh-CN");
      expect(result[2]).assertEqual("ja-JP");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0400
     * @tc.name testIntlLookUpLocales040
     * @tc.desc Verify intlLookUpLocales order for different input orders
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: string[] = Intl.intlLookUpLocales(["en-US", "zh-CN"]);
      let result2: string[] = Intl.intlLookUpLocales(["zh-CN", "en-US"]);
      expect(Array.isArray(result1)).assertTrue();
      expect(Array.isArray(result2)).assertTrue();
      expect(result1.length).assertEqual(2);
      expect(result2.length).assertEqual(2);
      expect(result1[0]).assertEqual("en-US");
      expect(result2[0]).assertEqual("zh-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0410
     * @tc.name testIntlLookUpLocales041
     * @tc.desc Verify intlLookUpLocales with duplicate tags returns Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlLookUpLocales(["en-US", "en-US", "zh-CN"]);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0430
     * @tc.name testIntlLookUpLocales043
     * @tc.desc Verify intlLookUpLocales with array containing undefined throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales([String(undefined)]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0440
     * @tc.name testIntlLookUpLocales044
     * @tc.desc Verify intlLookUpLocales with path traversal "../" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("../");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0450
     * @tc.name testIntlLookUpLocales045
     * @tc.desc Verify intlLookUpLocales with null byte "\0" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales("\0");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0460
     * @tc.name testIntlLookUpLocales046
     * @tc.desc Verify intlLookUpLocales with number parameter type error throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let numVal: testIntlLookUpLocales057 = { name:"222",age:23 };
        Intl.intlLookUpLocales(String(numVal));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALES_0470
     * @tc.name testIntlLookUpLocales047
     * @tc.desc Verify intlLookUpLocales with object parameter type error throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocales047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocales({} as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

  });
}


