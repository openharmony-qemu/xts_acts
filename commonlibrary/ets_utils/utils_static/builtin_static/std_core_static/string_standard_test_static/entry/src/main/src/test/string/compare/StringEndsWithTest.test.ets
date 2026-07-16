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
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringEndsWithTest(): void {
  describe('StringEndsWithTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0100
     * @tc.name testEndsWith001
     * @tc.desc Verify endsWith() returns true for matching ASCII suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1 = new String("ArkTS");
      let ends: boolean = text1.endsWith("TS");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0200
     * @tc.name testEndsWith002
     * @tc.desc Verify endsWith() returns false for non-matching ASCII prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text2 = new String("ArkTS");
      let ends: boolean = text2.endsWith("Ark");
      expect(ends).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0300
     * @tc.name testEndsWith003
     * @tc.desc Verify endsWith() with empty string suffix always returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text3 = new String("ArkTS");
      let ends: boolean = text3.endsWith("");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0400
     * @tc.name testEndsWith004
     * @tc.desc Verify endsWith() with Unicode supplementary plane emoji suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text4 = new String("hello😀");
      let ends: boolean = text4.endsWith("😀");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0500
     * @tc.name testEndsWith005
     * @tc.desc Verify endsWith() returns false when suffix is longer than string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text5 = new String("AB");
      let ends: boolean = text5.endsWith("ABC");
      expect(ends).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0600
     * @tc.name testEndsWith006
     * @tc.desc Verify endsWith() with CJK Unicode BMP Chinese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text6 = new String("你好世界");
      let ends: boolean = text6.endsWith("世界");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0700
     * @tc.name testEndsWith007
     * @tc.desc Verify endsWith() with suffix equal to entire string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text7 = new String("Hello");
      let ends: boolean = text7.endsWith("Hello");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0800
     * @tc.name testEndsWith008
     * @tc.desc Verify endsWith() with position parameter restricts the checked portion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text8 = new String("abcdef");
      let ends: boolean = text8.endsWith("cde", 5);
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_0900
     * @tc.name testEndsWith009
     * @tc.desc Verify endsWith() with position=0 returns false for non-empty suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text9 = new String("xyz");
      let ends: boolean = text9.endsWith("z", 1);
      expect(ends).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1000
     * @tc.name testEndsWith010
     * @tc.desc Verify endsWith() with C0 control carriage-return plus newline suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text10 = new String("line\r\n");
      let ends: boolean = text10.endsWith("\r\n");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1100
     * @tc.name testEndsWith011
     * @tc.desc Verify endsWith() with C0 control NUL character suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text11 = new String("data\0");
      let ends: boolean = text11.endsWith("\0");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1200
     * @tc.name testEndsWith012
     * @tc.desc Verify endsWith() with ISO 8859-1 Latin precomposed accented character suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text12 = new String("café");
      let ends: boolean = text12.endsWith("fé");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1300
     * @tc.name testEndsWith013
     * @tc.desc Verify endsWith() with GBK Chinese suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text13 = new String("中文测试");
      let ends: boolean = text13.endsWith("测试");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1400
     * @tc.name testEndsWith014
     * @tc.desc Verify endsWith() is case-sensitive returning false for different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text14 = new String("abcDEF");
      let ends: boolean = text14.endsWith("def");
      expect(ends).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1500
     * @tc.name testEndsWith015
     * @tc.desc Verify endsWith() with tab C0 control character suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text15 = new String("col1\tcol2\t");
      let ends: boolean = text15.endsWith("\t");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1600
     * @tc.name testEndsWith016
     * @tc.desc Verify endsWith() with dynamic suffix and position from variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      let suffix: string = "mony";
      let endPos: int = text.length;
      let ends: boolean = text.endsWith(suffix, endPos);
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1700
     * @tc.name testEndsWith017
     * @tc.desc Verify endsWith() for file extension check pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text16 = new String("document.pdf");
      let isPdf: boolean = text16.endsWith(".pdf");
      expect(isPdf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1800
     * @tc.name testEndsWith018
     * @tc.desc Verify endsWith() with empty source and empty suffix returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text17 = new String("");
      let ends: boolean = text17.endsWith("");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_1900
     * @tc.name testEndsWith019
     * @tc.desc Verify endsWith() with empty source and non-empty suffix returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text18 = new String("");
      let ends: boolean = text18.endsWith("a");
      expect(ends).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2000
     * @tc.name testEndsWith020
     * @tc.desc Verify case-insensitive endsWith via toLowerCase chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Readme.MD");
      let ends: boolean = text.toLowerCase().endsWith(".md");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2100
     * @tc.name testEndsWith021
     * @tc.desc Verify endsWith() after trimEnd for trailing whitespace check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello  ");
      let cleaned: string = text.trimEnd();
      let ends: boolean = cleaned.endsWith("o");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2200
     * @tc.name testEndsWith022
     * @tc.desc Verify endsWith() + lastIndexOf agree on suffix position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let suffix: string = "world";
      let ends: boolean = text.endsWith(suffix);
      let pos: int = text.lastIndexOf(suffix);
      let calcPos: int = text.length - suffix.length;
      expect(ends).assertTrue();
      expect(pos).assertEqual(calcPos);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2300
     * @tc.name testEndsWith023
     * @tc.desc Verify endsWith() + includes both find the suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      expect(text.endsWith("world")).assertTrue();
      expect(text.includes("world")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2400
     * @tc.name testEndsWith024
     * @tc.desc Verify endsWith() on result after replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.replace("world", "ArkTS");
      expect(result.endsWith("ArkTS")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2500
     * @tc.name testEndsWith025
     * @tc.desc Verify endsWith() with position restricts checked portion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      expect(text.endsWith("hello", 5)).assertTrue();
      expect(text.endsWith("world", 5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2600
     * @tc.name testEndsWith026
     * @tc.desc Verify endsWith() detects Unicode escape CJK suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Test\u4E2D\u6587");
      let result: boolean = text.endsWith("\u6587");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2700
     * @tc.name testEndsWith027
     * @tc.desc Verify endsWith() detects zero-width space suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hidden\u200B");
      let result: boolean = text.endsWith("\u200B");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2800
     * @tc.name testEndsWith028
     * @tc.desc Verify endsWith() detects date suffix in path-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("log-2026-03-05");
      let result: boolean = text.endsWith("2026-03-05");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_2900
     * @tc.name testEndsWith029
     * @tc.desc Verify endsWith() rejects hexadecimal suffix on binary-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0b1010");
      let result: boolean = text.endsWith("0x");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_3000
     * @tc.name testEndsWith030
     * @tc.desc Verify endsWith() detects CRLF line ending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Header: ok\r\n");
      let result: boolean = text.endsWith("\r\n");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_3100
     * @tc.name testEndsWith031
     * @tc.desc Verify endsWith() handles ISO-8859-1 question-mark garbled text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("????");
      let result: boolean = source.endsWith(source.toString());
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_3200
     * @tc.name testEndsWith032
     * @tc.desc Verify EndsWith handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.endsWith("\u8F6C\u4E49\u7B26");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH_3300
     * @tc.name testEndsWith033
     * @tc.desc Verify EndsWith handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEndsWith033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.endsWith("الاختبار");
      expect(result).assertTrue();
    });
  });
}
