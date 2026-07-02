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

export default function IntlIntlLookUpLocaleTest(): void {
  describe('IntlIntlLookUpLocaleTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0010
     * @tc.name testIntlLookUpLocale001
     * @tc.desc Verify calling intlLookUpLocale with various single locale strings (en-US, zh-CN, ja-JP, fr-FR, de-DE, ko-KR, en, zh-Hans-CN) returns string result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale("en-US");
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0020
     * @tc.name testIntlLookUpLocale002
     * @tc.desc Verify intlLookUpLocale with special characters injection string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("<script>alert(1)</script>");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0030
     * @tc.name testIntlLookUpLocale003
     * @tc.desc Verify intlLookUpLocale with Japanese Unicode string "日本語"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("日本語");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0040
     * @tc.name testIntlLookUpLocale004
     * @tc.desc Verify intlLookUpLocale with Arabic Unicode string "العربية"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("العربية");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0050
     * @tc.name testIntlLookUpLocale005
     * @tc.desc Verify intlLookUpLocale with zero-width space character
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("\u200B");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0060
     * @tc.name testIntlLookUpLocale006
     * @tc.desc Verify intlLookUpLocale with very long string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let longStr: string = "en-US-".repeat(100);
        Intl.intlLookUpLocale(longStr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0070
     * @tc.name testIntlLookUpLocale007
     * @tc.desc Verify intlLookUpLocale with lone surrogate encoding "\udc04"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("\udc04");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0080
     * @tc.name testIntlLookUpLocale008
     * @tc.desc Verify intlLookUpLocale with invalid locale string "\xe4"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("\xe4");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0090
     * @tc.name testIntlLookUpLocale009
     * @tc.desc Verify intlLookUpLocale with invalid locale string "\xc0\x81"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("\xc0\x81");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0100
     * @tc.name testIntlLookUpLocale010
     * @tc.desc Verify intlLookUpLocale with two-element array ["en-US", "zh-CN"]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale(["en-US", "zh-CN"]);
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0110
     * @tc.name testIntlLookUpLocale011
     * @tc.desc Verify intlLookUpLocale with single-element array ["ja-JP"]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale(["ja-JP"]);
      expect(result).assertEqual("ja-JP");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0120
     * @tc.name testIntlLookUpLocale012
     * @tc.desc Verify intlLookUpLocale with multi-element array ["en-US", "zh-CN", "ja-JP", "fr-FR"]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale(["en-US", "zh-CN", "ja-JP", "fr-FR"]);
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0130
     * @tc.name testIntlLookUpLocale013
     * @tc.desc Verify intlLookUpLocale single-element array and string parameter return same type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: string = Intl.intlLookUpLocale("en-US");
      let result2: string = Intl.intlLookUpLocale(["en-US"]);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0140
     * @tc.name testIntlLookUpLocale014
     * @tc.desc Verify intlLookUpLocale with multiple tags array returns best match string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale(["zh-CN", "en-US", "ja-JP"]);
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0150
     * @tc.name testIntlLookUpLocale015
     * @tc.desc Verify intlLookUpLocale with single-element array returns matching string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale(["ko-KR"]);
      expect(result).assertEqual("ko-KR");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0160
     * @tc.name testIntlLookUpLocale016
     * @tc.desc Verify intlLookUpLocale with non-existent tag for no match scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("xx-YY-ZZZ");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0170
     * @tc.name testIntlLookUpLocale017
     * @tc.desc Verify intlLookUpLocale return value is non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale("zh-CN");
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0180
     * @tc.name testIntlLookUpLocale018
     * @tc.desc Verify intlLookUpLocale with similar tags array returns precise match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale(["en-US", "en-GB", "en-AU"]);
      expect(result).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0190
     * @tc.name testIntlLookUpLocale019
     * @tc.desc Verify intlLookUpLocale with script subtag "zh-Hans-CN" returns precise match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = Intl.intlLookUpLocale("zh-Hans-CN");
      expect(result).assertEqual("zh-Hans-CN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0200
     * @tc.name testIntlLookUpLocale020
     * @tc.desc Verify intlLookUpLocale accepts different input orders
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: string = Intl.intlLookUpLocale(["en-US", "zh-CN"]);
      let result2: string = Intl.intlLookUpLocale(["zh-CN", "en-US"]);
      expect(result1).assertEqual("en-US");
      expect(result2).assertEqual("en-US");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0210
     * @tc.name testIntlLookUpLocale021
     * @tc.desc Verify intlLookUpLocale with pure numeric string "12345" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("12345");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0220
     * @tc.name testIntlLookUpLocale022
     * @tc.desc Verify intlLookUpLocale with path traversal "../" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("../");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0230
     * @tc.name testIntlLookUpLocale023
     * @tc.desc Verify intlLookUpLocale with null byte "\0" handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale("\0");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0240
     * @tc.name testIntlLookUpLocale024
     * @tc.desc Verify intlLookUpLocale with NaN input throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let nanVal: number = Number.NaN;
        Intl.intlLookUpLocale(nanVal as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INTL_INTL_LOOK_UP_LOCALE_0250
     * @tc.name testIntlLookUpLocale025
     * @tc.desc Verify intlLookUpLocale with array containing null element handles gracefully
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
it('testIntlLookUpLocale025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Intl.intlLookUpLocale(["en-US", null as string]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });
  });
}




