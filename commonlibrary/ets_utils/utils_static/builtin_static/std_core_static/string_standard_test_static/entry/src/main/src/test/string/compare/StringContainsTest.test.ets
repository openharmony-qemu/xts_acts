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

export default function StringContainsTest(): void {
  describe('StringContainsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0100
     * @tc.name testContains001
     * @tc.desc Verify contains() returns true for contained substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1 = new String("ArkTS");
      let inc: boolean = text1.contains(new String("rk"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0200
     * @tc.name testContains002
     * @tc.desc Verify contains() returns false for non-contained substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text2 = new String("ArkTS");
      let inc: boolean = text2.contains(new String("XYZ"), 0);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0300
     * @tc.name testContains003
     * @tc.desc Verify contains() with position parameter starts search at index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text3 = new String("ABAB");
      let inc: boolean = text3.contains(new String("AB"), 2);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0400
     * @tc.name testContains004
     * @tc.desc Verify contains() with empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text4 = new String("ArkTS");
      let inc: boolean = text4.contains(new String(""), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0500
     * @tc.name testContains005
     * @tc.desc Verify contains() with C0 control carriage-return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text5 = new String("a\rb");
      let inc: boolean = text5.contains(new String("\r"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0600
     * @tc.name testContains006
     * @tc.desc Verify contains() with Unicode supplementary plane emoji substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text6 = new String("hello😀world");
      let inc: boolean = text6.contains(new String("😀"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0700
     * @tc.name testContains007
     * @tc.desc Verify contains() with CJK Unicode BMP Chinese substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text7 = new String("你好世界");
      let inc: boolean = text7.contains(new String("世界"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0800
     * @tc.name testContains008
     * @tc.desc Verify contains() with position beyond match returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text8 = new String("hello");
      let inc: boolean = text8.contains(new String("he"), 3);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0900
     * @tc.name testContains009
     * @tc.desc Verify contains() with whitespace substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text9 = new String("hello world");
      let inc: boolean = text9.contains(new String(" "), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1000
     * @tc.name testContains010
     * @tc.desc Verify contains() with C0 control tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text10 = new String("a\tb");
      let inc: boolean = text10.contains(new String("\t"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1100
     * @tc.name testContains011
     * @tc.desc Verify contains() detects a query parameter in a URL-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = new String("https://example.com/search?q=arkts&page=1");
      let inc: boolean = text.contains(new String("q=arkts"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1200
     * @tc.name testContains012
     * @tc.desc Verify contains() checks a filename extension at the suffix position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("report.final.csv");
      let start: int = text.length - 4;
      let inc: boolean = text.contains(new String(".csv"), start);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1300
     * @tc.name testContains013
     * @tc.desc Verify contains() with ISO 8859-1 Latin precomposed accented characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café latte");
      let inc: boolean = text.contains(new String("fé"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1400
     * @tc.name testContains014
     * @tc.desc Verify contains() with C0 control NUL character in middle of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\0b");
      let inc: boolean = text.contains(new String("\0"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1500
     * @tc.name testContains015
     * @tc.desc Verify contains() with newline C0 control character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2");
      let inc: boolean = text.contains(new String("\n"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1600
     * @tc.name testContains016
     * @tc.desc Verify contains() with search string equal to the entire text returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      let inc: boolean = text.contains(new String("OpenHarmony"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1700
     * @tc.name testContains017
     * @tc.desc Verify contains() with position equal to length returns false for non-empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let inc: boolean = text.contains(new String("c"), 3);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1800
     * @tc.name testContains018
     * @tc.desc Verify contains() with dynamic search string and position variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let search: string = "Script";
      let pos: int = 4;
      let inc: boolean = text.contains(new String(search), pos);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1900
     * @tc.name testContains019
     * @tc.desc Verify contains() finds text from explicit start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let inc: boolean = text.contains(new String("Hello"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2000
     * @tc.name testContains020
     * @tc.desc Verify contains() with empty search and position greater than length returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let inc: boolean = text.contains(new String(""), 10);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2100
     * @tc.name testContains021
     * @tc.desc Verify contains() with search string longer than source returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let inc: boolean = text.contains(new String("Hello World"), 0);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2200
     * @tc.name testContains022
     * @tc.desc Verify contains() with empty source and empty search returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let inc: boolean = text.contains(new String(""), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2300
     * @tc.name testContains023
     * @tc.desc Verify contains() with empty source and non-empty search returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let inc: boolean = text.contains(new String("a"), 0);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2400
     * @tc.name testContains024
     * @tc.desc Verify contains() is case-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Blue Whale");
      expect(text.contains(new String("blue"), 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2500
     * @tc.name testContains025
     * @tc.desc Verify contains() case-insensitive via toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Blue Whale");
      let lower: string = text.toLowerCase();
      const text11 = new String(lower);
      let inc: boolean = text11.contains(new String("blue"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2600
     * @tc.name testContains026
     * @tc.desc Verify contains() with orphan high surrogate in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\uD800b");
      let inc: boolean = text.contains(new String("\uD800"), 0);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2700
     * @tc.name testContains027
     * @tc.desc Verify contains() distinguishes whole permission token from partial token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("role:admin;scope:read_write;status:active");
      let wholeToken: boolean = text.contains(new String("scope:read_write"), 0);
      let partialToken: boolean = text.contains(new String("scope:write_only"), 0);
      expect(wholeToken).assertTrue();
      expect(partialToken).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2800
     * @tc.name testContains028
     * @tc.desc Verify contains() result changes after case normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Error: Disk Full");
      let direct: boolean = text.contains(new String("disk"), 0);
      let normalized: string = text.toLowerCase().toString();
      const normalizedText = new String(normalized);
      let afterNormalize: boolean = normalizedText.contains(new String("disk"), 0);
      expect(direct).assertFalse();
      expect(afterNormalize).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2900
     * @tc.name testContains029
     * @tc.desc Verify contains() returns false for absent String value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let search = new String("XYZ");
      let result: boolean = text.contains(search, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_3000
     * @tc.name testContains030
     * @tc.desc Verify contains() with empty String value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let search = new String("");
      let result: boolean = text.contains(search, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_3100
     * @tc.name testContains031
     * @tc.desc Verify contains() finds C0 control character wrapped as String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\0b");
      let search = new String("\0");
      let result: boolean = text.contains(search, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_3200
     * @tc.name testContains032
     * @tc.desc Verify contains() detects mixed RTL and CJK substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("prefix-\u05D0\u05D1-\u4E2D\u6587-\u0627\u0644");
      let present = new String("\u05D0\u05D1-\u4E2D\u6587");
      let absent = new String("\u4E2D\u6587-\u05D0\u05D1");
      expect(text.contains(present, 0)).assertTrue();
      expect(text.contains(absent, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_3300
     * @tc.name testContains033
     * @tc.desc Verify contains() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: boolean = source.contains(new String("\uFFFD"), 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_3400
     * @tc.name testContains034
     * @tc.desc Verify Contains handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.contains(new String("\u6D4B\u8BD5 \u5206\u5272\u7B26"), 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_3500
     * @tc.name testContains035
     * @tc.desc Verify Contains handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.contains(new String("АБВГД"), 0);
      expect(result).assertTrue();
    });
  });
}
