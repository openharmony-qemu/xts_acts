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
interface LocaleTestObject{
  name:string;
  age:number;
}
export default function IntlIntlBestFitLocalesTest(): void {
  describe('IntlIntlBestFitLocalesTest',  (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0010
     * @tc.name testIntlBestFitLocales001
     * @tc.desc Verify intlBestFitLocales with various BCP47 locale tags
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let locales: string[] = ["en-US", "zh-CN", "ja-JP", "fr-FR", "de-DE", "ko-KR", "es-ES", "pt-BR", "ru-RU", "ar-SA"];
      for (let locale of locales) {
        let result: string[] = Intl.intlBestFitLocales(locale);
        expect(Array.isArray(result)).assertTrue();
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(locale);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0020
     * @tc.name testIntlBestFitLocales002
     * @tc.desc Verify intlBestFitLocales with short tag "en" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales("en");
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("en");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0030
     * @tc.name testIntlBestFitLocales003
     * @tc.desc Verify intlBestFitLocales with script tag "zh-Hans-CN" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales("zh-Hans-CN");
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("zh-Hans-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0040
     * @tc.name testIntlBestFitLocales004
     * @tc.desc Verify intlBestFitLocales with Unicode extension tag "en-US-u-ca-gregory" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales("en-US-u-ca-gregory");
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("en-US-u-ca-gregory");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0050
     * @tc.name testIntlBestFitLocales005
     * @tc.desc Verify intlBestFitLocales with number extension tag "en-US-u-nu-latn" returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales("en-US-u-nu-latn");
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("en-US-u-nu-latn");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0060
     * @tc.name testIntlBestFitLocales006
     * @tc.desc Verify intlBestFitLocales with XSS string throws error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("<script>alert(1)</script>");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0070
     * @tc.name testIntlBestFitLocales007
     * @tc.desc Verify intlBestFitLocales with Arabic string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("العربية");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0080
     * @tc.name testIntlBestFitLocales008
     * @tc.desc Verify intlBestFitLocales with Cyrillic string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("русский");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0090
     * @tc.name testIntlBestFitLocales009
     * @tc.desc Verify intlBestFitLocales with zero-width space "\u200B" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("\u200B");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0100
     * @tc.name testIntlBestFitLocales010
     * @tc.desc Verify intlBestFitLocales with very long string handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let longStr: string = "en-US-".repeat(2000);
        Intl.intlBestFitLocales(longStr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0110
     * @tc.name testIntlBestFitLocales011
     * @tc.desc Verify intlBestFitLocales with lone surrogate "\udc04" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("\udc04");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0120
     * @tc.name testIntlBestFitLocales012
     * @tc.desc Verify intlBestFitLocales with invalid UTF-8 byte "\xe4" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("\xe4");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0130
     * @tc.name testIntlBestFitLocales013
     * @tc.desc Verify intlBestFitLocales with overlong encoding "\xc0\x81" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlBestFitLocales("\xc0\x81");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0140
     * @tc.name testIntlBestFitLocales014
     * @tc.desc Verify intlBestFitLocales with array ["en-US", "zh-CN"] returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales(["en-US", "zh-CN"]);
      result = Intl.intlBestFitLocales(["ja-JP"]);
      result = Intl.intlBestFitLocales(["en-US", "zh-CN", "ja-JP", "fr-FR"]);
      result = Intl.intlBestFitLocales(["en-US", "zh-Hans-CN", "ja-JP", "ko-KR", "de-DE"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0150
     * @tc.name testIntlBestFitLocales015
     * @tc.desc Verify intlBestFitLocales with empty array returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales([]);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0160
     * @tc.name testIntlBestFitLocales016
     * @tc.desc Verify intlBestFitLocales with single element array ["en-US"] returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales(["en-US"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0170
     * @tc.name testIntlBestFitLocales017
     * @tc.desc Verify intlBestFitLocales with 100+ element array returns non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let tags: string[] = [];
      for (let i = 0; i < 100; i++) {
        tags.push("en-US");
      }
      let result: string[] = Intl.intlBestFitLocales(tags);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0180
     * @tc.name testIntlBestFitLocales018
     * @tc.desc Verify intlBestFitLocales returns Array for single tag input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales("en-US");
      expect(Array.isArray(result)).assertTrue();
      result = Intl.intlBestFitLocales(["en-US", "zh-CN"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
      result = Intl.intlBestFitLocales(["en-US"]);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0190
     * @tc.name testIntlBestFitLocales019
     * @tc.desc Verify intlBestFitLocales and intlLookUpLocales both return non-null for same input, and result is Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bestFitResult: string[] = Intl.intlBestFitLocales(["en-US", "zh-CN"]);
      let lookUpResult: string[] = Intl.intlLookUpLocales(["en-US", "zh-CN"]);
      let result: string[] = Intl.intlBestFitLocales([]);
      expect(Array.isArray(result)).assertTrue();
      expect(bestFitResult[0]).assertEqual("en-US");
      expect(lookUpResult[0]).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0200
     * @tc.name testIntlBestFitLocales020
     * @tc.desc Verify intlBestFitLocales return array elements are string type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales(["en-US", "zh-CN"]);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
      for (let i = 0; i < result.length; i++) {
        expect(typeof result[i] === "string").assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0210
     * @tc.name testIntlBestFitLocales021
     * @tc.desc Verify intlBestFitLocales returns Array type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string[] = Intl.intlBestFitLocales(["en-US", "zh-CN", "ja-JP"]);
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0220
     * @tc.name testIntlBestFitLocales022
     * @tc.desc Verify intlBestFitLocales throws ClassCastError for object parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let obj:LocaleTestObject={name:"111",age:20}
        Intl.intlBestFitLocales(String(obj));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0230
     * @tc.name testIntlBestFitLocales023
     * @tc.desc Verify intlBestFitLocales try-catch with null input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: string[] = Intl.intlBestFitLocales(String(null));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0240
     * @tc.name testIntlBestFitLocales024
     * @tc.desc Verify intlBestFitLocales try-catch with undefined input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: string[] = Intl.intlBestFitLocales(String(undefined));
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0250
     * @tc.name testIntlBestFitLocales025
     * @tc.desc Verify intlBestFitLocales with number parameter throws error ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let numVal: number = 111;
        let result: string[] = Intl.intlBestFitLocales(numVal as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0260
     * @tc.name testIntlBestFitLocales026
     * @tc.desc Verify intlBestFitLocales with pure number string throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: string[] = Intl.intlBestFitLocales("12345");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0270
     * @tc.name testIntlBestFitLocales027
     * @tc.desc Verify intlBestFitLocales with path traversal input throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: string[] = Intl.intlBestFitLocales("../");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_BEST_FIT_LOCALES_0280
     * @tc.name testIntlBestFitLocales028
     * @tc.desc Verify intlBestFitLocales with null byte input throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlBestFitLocales028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: string[] = Intl.intlBestFitLocales("\0");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });
  });
}


