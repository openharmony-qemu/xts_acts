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
export default function IntlIntlBestFitLocaleTest(): void {
  describe('IntlIntlBestFitLocaleTest', () => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0010
     * @tc.name testIntlBestFitLocale001
     * @tc.desc Verify intlBestFitLocale with various BCP47 locale tags
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testLocales: string[] = ["en-US", "zh-CN", "ja-JP", "fr-FR", "de-DE", "ko-KR", "es-ES", "pt-BR", "ru-RU", "ar-SA", "en", "zh-Hans-CN", "sr-Cyrl-RS"];
      for (let locale of testLocales) {
        let result: string = Intl.intlBestFitLocale(locale);
        expect(result).assertEqual(locale);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0020
     * @tc.name testIntlBestFitLocale002
     * @tc.desc Verify intlBestFitLocale with XSS string throws error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("<script>alert(1)</script>");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0030
     * @tc.name testIntlBestFitLocale003
     * @tc.desc Verify intlBestFitLocale with Japanese text "日本語" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("日本語");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0040
     * @tc.name testIntlBestFitLocale004
     * @tc.desc Verify intlBestFitLocale with Arabic text "العربية" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("العربية");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0050
     * @tc.name testIntlBestFitLocale005
     * @tc.desc Verify intlBestFitLocale with Cyrillic text "русский" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("русский");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0060
     * @tc.name testIntlBestFitLocale006
     * @tc.desc Verify intlBestFitLocale with zero-width space "\u200B" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("\u200B");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0070
     * @tc.name testIntlBestFitLocale007
     * @tc.desc Verify intlBestFitLocale with long string throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let longStr: string = "en-US-".repeat(100);
        Intl.intlBestFitLocale(longStr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0080
     * @tc.name testIntlBestFitLocale008
     * @tc.desc Verify intlBestFitLocale with lone surrogate "\udc04" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("\udc04");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0090
     * @tc.name testIntlBestFitLocale009
     * @tc.desc Verify intlBestFitLocale with invalid UTF-8 byte "\xe4" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("\xe4");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0100
     * @tc.name testIntlBestFitLocale010
     * @tc.desc Verify intlBestFitLocale with overlong encoding "\xc0\x81" throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("\xc0\x81");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0110
     * @tc.name testIntlBestFitLocale011
     * @tc.desc Verify intlBestFitLocale with various array inputs returns string result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: string = Intl.intlBestFitLocale(["en-US", "zh-CN"]);
      let result2: string = Intl.intlBestFitLocale(["ja-JP"]);
      let result3: string = Intl.intlBestFitLocale(["en-US", "zh-CN", "ja-JP", "fr-FR"]);
      let result4: string = Intl.intlBestFitLocale(["de-DE", "fr-FR", "es-ES"]);
      expect(result1).assertEqual("en-US");
      expect(result2).assertEqual("ja-JP");
      expect(result3).assertEqual("en-US");
      expect(result4).assertEqual("de-DE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0120
     * @tc.name testIntlBestFitLocale012
     * @tc.desc Verify intlBestFitLocale string vs single-element array results are consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1 = Intl.intlBestFitLocale("en-US");
      let result2 = Intl.intlBestFitLocale(["en-US"]);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0130
     * @tc.name testIntlBestFitLocale013
     * @tc.desc Verify intlBestFitLocale with array containing XSS string throws error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale(["<script>alert(1)</script>"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0140
     * @tc.name testIntlBestFitLocale014
     * @tc.desc Verify intlBestFitLocale returns matched strings for various inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: string = Intl.intlBestFitLocale("en-US");
      expect(result1).assertEqual("en-US");
      let result2: string = Intl.intlBestFitLocale(["zh-CN", "en-US", "ja-JP"]);
      expect(result2).assertEqual("zh-CN");
      let result3: string = Intl.intlBestFitLocale(["ko-KR"]);
      expect(result3).assertEqual("ko-KR");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0150
     * @tc.name testIntlBestFitLocale015
     * @tc.desc Verify intlBestFitLocale and intlLookUpLocale both return results with same input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bestFitResult1 = Intl.intlBestFitLocale(["en-US", "en-GB", "zh-CN"]);
      let lookUpResult1 = Intl.intlLookUpLocale(["en-US", "en-GB", "zh-CN"]);
      let bestFitResult2 = Intl.intlBestFitLocale(["en", "en-US", "en-GB"]);
      let lookUpResult2 = Intl.intlLookUpLocale(["en", "en-US", "en-GB"]);
      expect(bestFitResult1).assertEqual(lookUpResult1);
      expect(bestFitResult2).assertEqual(lookUpResult2);
      expect(bestFitResult1).assertEqual("en-US");
      expect(bestFitResult2).assertEqual("en");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0160
     * @tc.name testIntlBestFitLocale016
     * @tc.desc Verify intlBestFitLocale with no-match tag throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("xx-YY-ZZZ");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0170
     * @tc.name testIntlBestFitLocale017
     * @tc.desc Verify intlBestFitLocale returns non-null, non-undefined, non-empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlBestFitLocale("en-US");
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0180
     * @tc.name testIntlBestFitLocale018
     * @tc.desc Verify intlBestFitLocale with similar tags returns precise match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlBestFitLocale(["en-US", "en-GB", "en-AU"]);
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0190
     * @tc.name testIntlBestFitLocale019
     * @tc.desc Verify intlBestFitLocale with script tag returns precise match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlBestFitLocale("zh-Hans-CN");
      expect(result).assertEqual("zh-Hans-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0200
     * @tc.name testIntlBestFitLocale020
     * @tc.desc Verify intlBestFitLocale with language-only tag returns result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlBestFitLocale("zh");
      expect(result).assertEqual("zh");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0210
     * @tc.name testIntlBestFitLocale021
     * @tc.desc Verify intlBestFitLocale with different locale orders returns valid strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1 = Intl.intlBestFitLocale(["en-US", "zh-CN"]);
      let result2 = Intl.intlBestFitLocale(["zh-CN", "en-US"]);
      expect(result1).assertEqual("en-US");
      expect(result2).assertEqual("zh-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0220
     * @tc.name testIntlBestFitLocale022
     * @tc.desc Verify intlBestFitLocale with mixed valid and invalid tags throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale(["invalid-tag", "en-US"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0230
     * @tc.name testIntlBestFitLocale023
     * @tc.desc Verify intlBestFitLocale with numeric string throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("12345");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0240
     * @tc.name testIntlBestFitLocale024
     * @tc.desc Verify intlBestFitLocale with boolean string throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("true");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0250
     * @tc.name testIntlBestFitLocale025
     * @tc.desc Verify intlBestFitLocale with JSON string throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("{\"name\":\"str\",\"age\":20}");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0260
     * @tc.name testIntlBestFitLocale026
     * @tc.desc Verify intlBestFitLocale with undefined as string throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale(undefined as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0270
     * @tc.name testIntlBestFitLocale027
     * @tc.desc Verify intlBestFitLocale with 'NaN' string literal returns string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
  let strVal: string = "NaN";
  let result: string = Intl.intlBestFitLocale(strVal);
  expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0280
     * @tc.name testIntlBestFitLocale028
     * @tc.desc Verify intlBestFitLocale with path traversal input throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("../");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALE_0290
     * @tc.name testIntlBestFitLocale029
     * @tc.desc Verify intlBestFitLocale with null byte input throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocale029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocale("\0");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });
  });
}
