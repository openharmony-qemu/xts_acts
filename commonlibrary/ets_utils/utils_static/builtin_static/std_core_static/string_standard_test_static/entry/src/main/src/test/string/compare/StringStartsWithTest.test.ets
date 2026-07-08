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

export default function StringStartsWithTest(): void {
  describe('StringStartsWithTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0100
     * @tc.name testStartsWith001
     * @tc.desc Verify startsWith() returns true for matching prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let starts: boolean = text.startsWith("Ark");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0200
     * @tc.name testStartsWith002
     * @tc.desc Verify startsWith() returns false for non-matching suffix at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let starts: boolean = text.startsWith("TS");
      expect(starts).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0300
     * @tc.name testStartsWith003
     * @tc.desc Verify startsWith() with empty prefix always returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let starts: boolean = text.startsWith("");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0400
     * @tc.name testStartsWith004
     * @tc.desc Verify startsWith() with emoji prefix returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀hello");
      let starts: boolean = text.startsWith("😀");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0500
     * @tc.name testStartsWith005
     * @tc.desc Verify startsWith() returns false when prefix is longer than string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let starts: boolean = text.startsWith("ABC");
      expect(starts).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0600
     * @tc.name testStartsWith006
     * @tc.desc Verify startsWith() with CJK Unicode BMP prefix returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      let starts: boolean = text.startsWith("你好");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0700
     * @tc.name testStartsWith007
     * @tc.desc Verify startsWith() with prefix equal to entire string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let starts: boolean = text.startsWith("Hello");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0800
     * @tc.name testStartsWith008
     * @tc.desc Verify startsWith() with position parameter checks from that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let starts: boolean = text.startsWith("cd", 2);
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_0900
     * @tc.name testStartsWith009
     * @tc.desc Verify startsWith() is case-sensitive returning false for different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HelloWorld");
      let starts: boolean = text.startsWith("hello");
      expect(starts).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1000
     * @tc.name testStartsWith010
     * @tc.desc Verify startsWith() with GBK Chinese text returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let starts: boolean = text.startsWith("中文");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1100
     * @tc.name testStartsWith011
     * @tc.desc Verify startsWith() with C0 control newline prefix returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n\rtext");
      let starts: boolean = text.startsWith("\n");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1200
     * @tc.name testStartsWith012
     * @tc.desc Verify startsWith() with dynamic prefix and position variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let prefix: string = "Type";
      let pos: int = 0;
      let starts: boolean = text.startsWith(prefix, pos);
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1300
     * @tc.name testStartsWith013
     * @tc.desc Verify startsWith() with empty source and empty prefix returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1 = new String("");
      let starts: boolean = text1.startsWith("");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1400
     * @tc.name testStartsWith014
     * @tc.desc Verify startsWith() with empty source and non-empty prefix returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text2 = new String("");
      let starts: boolean = text2.startsWith("a");
      expect(starts).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1500
     * @tc.name testStartsWith015
     * @tc.desc Verify startsWith() with position greater than length returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let starts: boolean = text.startsWith("He", 10);
      expect(starts).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1600
     * @tc.name testStartsWith016
     * @tc.desc Verify case-insensitive startsWith via toLowerCase chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("README.md");
      let starts: boolean = text.toLowerCase().startsWith("readme");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1700
     * @tc.name testStartsWith017
     * @tc.desc Verify startsWith() after trimStart for leading whitespace handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let cleaned: string = text.trimStart();
      let starts: boolean = cleaned.startsWith("he");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1800
     * @tc.name testStartsWith018
     * @tc.desc Verify startsWith() checks URL protocol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const url = new String("https://example.com");
      expect(url.startsWith("https://")).assertTrue();
      expect(url.startsWith("http://")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_1900
     * @tc.name testStartsWith019
     * @tc.desc Verify startsWith() checks absolute file path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const path = new String("/usr/local/bin");
      expect(path.startsWith("/")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2000
     * @tc.name testStartsWith020
     * @tc.desc Verify startsWith() checks command line flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arg = new String("--verbose");
      expect(arg.startsWith("--")).assertTrue();
      expect(arg.startsWith("-")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2100
     * @tc.name testStartsWith021
     * @tc.desc Verify startsWith() checks Markdown heading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const line = new String("# Heading");
      expect(line.startsWith("#")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2200
     * @tc.name testStartsWith022
     * @tc.desc Verify startsWith() checks JSON string start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const json = new String("{\"name\":\"John\"}");
      expect(json.startsWith("{")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2300
     * @tc.name testStartsWith023
     * @tc.desc Verify startsWith() + indexOf alignment when startsWith is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let pos: int = text.indexOf("World");
      expect(text.startsWith("World", pos)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2400
     * @tc.name testStartsWith024
     * @tc.desc Verify startsWith() used in ternary expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let result: string = text.startsWith("Hello") ? "YES" : "NO";
      expect(result).assertEqual("YES");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2500
     * @tc.name testStartsWith025
     * @tc.desc Verify startsWith() on very long string fast fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(100000));
      expect(text.startsWith("a")).assertTrue();
      expect(text.startsWith("b")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2600
     * @tc.name testStartsWith026
     * @tc.desc Verify includes() is true when startsWith() is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      expect(text.startsWith("Hello")).assertTrue();
      expect(text.includes("Hello")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2700
     * @tc.name testStartsWith027
     * @tc.desc Verify startsWith() detects Unicode escape CJK prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587Test");
      let result: boolean = text.startsWith("\u4E2D");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2800
     * @tc.name testStartsWith028
     * @tc.desc Verify startsWith() detects zero-width space prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u200Bhidden");
      let result: boolean = text.startsWith("\u200B");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_2900
     * @tc.name testStartsWith029
     * @tc.desc Verify startsWith() rejects phone prefix on email string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: boolean = text.startsWith("138");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_3000
     * @tc.name testStartsWith030
     * @tc.desc Verify startsWith() detects hexadecimal prefix in token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: boolean = text.startsWith("0x");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_3100
     * @tc.name testStartsWith031
     * @tc.desc Verify startsWith() handles illegal UTF-8 single-byte spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4");
      let result: boolean = source.startsWith("\\x");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_3200
     * @tc.name testStartsWith032
     * @tc.desc Verify StartsWith handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.startsWith("!@#$%^&*()");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH_3300
     * @tc.name testStartsWith033
     * @tc.desc Verify StartsWith handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStartsWith033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.startsWith("テスト");
      expect(result).assertTrue();
    });
  });
}
