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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../../Util.test';

export default function StringTrimStartTest(): void {
  describe('StringTrimStartTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0100
     * @tc.name testTrimStart001
     * @tc.desc Verify trimStart() removes leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ArkTS  ");
      let result: string = str.trimStart();
      expect(result).assertEqual("ArkTS  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0200
     * @tc.name testTrimStart002
     * @tc.desc Verify trimStart() removes leading tab and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t\nArkTS");
      let result: string = str.trimStart();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0300
     * @tc.name testTrimStart003
     * @tc.desc Verify trimStart() removes leading carriage-return and form-feed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\r\fdata");
      let result: string = str.trimStart();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0400
     * @tc.name testTrimStart004
     * @tc.desc Verify trimStart() and trimLeft() produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t ArkTS");
      let r1: string = str.trimStart();
      let r2: string = str.trimLeft();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0500
     * @tc.name testTrimStart005
     * @tc.desc Verify trimStart() does NOT change string when whitespace is only at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Hello World");
      let result: string = str.trimStart();
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0600
     * @tc.name testTrimStart006
     * @tc.desc Verify trimStart() does NOT change string with no whitespace at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("clean");
      let result: string = str.trimStart();
      expect(result).assertEqual("clean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0700
     * @tc.name testTrimStart007
     * @tc.desc Verify trimStart() on CJK text with leading whitespace removes only leading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  中文测试");
      let result: string = str.trimStart();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0800
     * @tc.name testTrimStart008
     * @tc.desc Verify trimStart() on GBK text with leading tab removes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t中文测试");
      let result: string = str.trimStart();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0900
     * @tc.name testTrimStart009
     * @tc.desc Verify trimStart() on emoji text with leading spaces removes only leading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  😀🎉");
      let result: string = str.trimStart();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1000
     * @tc.name testTrimStart010
     * @tc.desc Verify trimStart() on ISO 8859-1 Latin accented text with leading tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\tcafé");
      let result: string = str.trimStart();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1100
     * @tc.name testTrimStart011
     * @tc.desc Verify trimStart() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: string = str.trimStart();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1200
     * @tc.name testTrimStart012
     * @tc.desc Verify trimStart() on all-whitespace string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   \t   ");
      let result: string = str.trimStart();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1300
     * @tc.name testTrimStart013
     * @tc.desc Verify trimStart() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  data");
      let result: string = text.trimStart();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1400
     * @tc.name testTrimStart014
     * @tc.desc Verify trimStart() removes full-width space U+3000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fws: string = String.fromCharCode(0x3000);
      const text = new String(fws + fws + "abc");
      let result: string = text.trimStart();
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1500
     * @tc.name testTrimStart015
     * @tc.desc Verify trimStart() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let result: string = text.trimStart();
      expect(text.toString()).assertEqual("  hello");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1600
     * @tc.name testTrimStart016
     * @tc.desc Verify trimStart() called twice returns same as once (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let once: string = text.trimStart();
      let once2: string = text.trimStart();
      const text1 = new String(once2);
      let twice: string = text1.trimStart();
      expect(twice).assertEqual(once);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1700
     * @tc.name testTrimStart017
     * @tc.desc Verify trimStart() + trimEnd() equals trim()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let fullTrim: string = text.trim();
      let stepTrim: string = text.trimStart().trimEnd();
      expect(stepTrim).assertEqual(fullTrim);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1800
     * @tc.name testTrimStart018
     * @tc.desc Verify trimStart() chained with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let result: string = text.trimStart().toUpperCase().toString();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1900
     * @tc.name testTrimStart019
     * @tc.desc Verify trimStart() on all-whitespace string returns empty deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t \n \r");
      let result: string = text.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2000
     * @tc.name testTrimStart020
     * @tc.desc Verify trimStart() with large number of leading whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String(" ".repeat(100) + "data");
      let result: string = text.trimStart();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2100
     * @tc.name testTrimStart021
     * @tc.desc Verify trimStart() preserves trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trimStart();
      expect(result).assertEqual("hello  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2200
     * @tc.name testTrimStart022
     * @tc.desc Verify trimStart removes leading Unicode BOM before XML text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\uFEFF<root/>");
      let result: string = text.trimStart();
      expect(result).assertEqual("<root/>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2300
     * @tc.name testTrimStart023
     * @tc.desc Verify trimStart preserves trailing tab when only left side is trimmed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\tID\t");
      let result: string = text.trimStart();
      expect(result).assertEqual("ID\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2400
     * @tc.name testTrimStart024
     * @tc.desc Verify trimStart removes leading CRLF before protocol status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\r\nOK");
      let result: string = text.trimStart();
      expect(result).assertEqual("OK");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2500
     * @tc.name testTrimStart025
     * @tc.desc Verify trimStart preserves zero-width space because it is not whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\u200Bvalue");
      let result: string = text.trimStart();
      expect(result).assertEqual("\u200Bvalue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2600
     * @tc.name testTrimStart026
     * @tc.desc Verify trimStart removes leading blanks before phone number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  13800138000");
      let result: string = text.trimStart();
      expect(result).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2700
     * @tc.name testTrimStart027
     * @tc.desc Verify trimStart preserves trailing spaces in date field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  2026-03-05  ");
      let result: string = text.trimStart();
      expect(result).assertEqual("2026-03-05  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2800
     * @tc.name testTrimStart028
     * @tc.desc Verify trimStart handles leading form-feed before email
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\ftest@example.com");
      let result: string = text.trimStart();
      expect(result).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2900
     * @tc.name testTrimStart029
     * @tc.desc Verify trimStart preserves internal newline after leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  A\nB");
      let result: string = text.trimStart();
      expect(result).assertEqual("A\nB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_3000
     * @tc.name testTrimStart030
     * @tc.desc Verify trimStart removes leading spaces before Japanese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  \u30C6\u30B9\u30C8");
      let result: string = text.trimStart();
      expect(result).assertEqual("\u30C6\u30B9\u30C8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_3100
     * @tc.name testTrimStart031
     * @tc.desc Verify trimStart() handles isolated low surrogate U+DC04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uDC04");
      let result: string = source.trimStart();
      expect(result).assertEqual("\uDC04");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_3200
     * @tc.name testTrimStart032
     * @tc.desc Verify TrimStart handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = ("  " + source).trimStart();
      expect(result).assertEqual(source.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_3300
     * @tc.name testTrimStart033
     * @tc.desc Verify TrimStart handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = ("  " + source).trimStart();
      expect(result).assertEqual(source.toString());
    });
  });
}
