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

export default function StringSubTest(): void {
  describe('StringSubTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0100
     * @tc.name testSub001
     * @tc.desc Verify sub() with no arguments returns <sub> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".sub();
      expect(result).assertEqual("<sub>ArkTS</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0200
     * @tc.name testSub002
     * @tc.desc Verify sub() on trim result wraps trimmed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trimmed: string = "  sub  ".trim();
      let result: string = trimmed.sub();
      expect(result).assertEqual("<sub>sub</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0300
     * @tc.name testSub003
     * @tc.desc Verify sub() result starts with <sub> and ends with </sub>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".sub();
      let starts: boolean = result.startsWith("<sub>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</sub>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0400
     * @tc.name testSub004
     * @tc.desc Verify sub() preserves original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello World".sub();
      expect(result).assertEqual("<sub>Hello World</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0500
     * @tc.name testSub005
     * @tc.desc Verify sub() wraps a chemical formula digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "2".sub();
      expect(result).assertEqual("<sub>2</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0600
     * @tc.name testSub006
     * @tc.desc Verify sub() wraps a variable suffix exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "n+1".sub();
      expect(result).assertEqual("<sub>n+1</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0700
     * @tc.name testSub007
     * @tc.desc Verify sub() with empty string returns <sub></sub>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".sub();
      expect(result).assertEqual("<sub></sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0800
     * @tc.name testSub008
     * @tc.desc Verify sub() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".sub();
      expect(result).assertEqual("<sub>A</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_0900
     * @tc.name testSub009
     * @tc.desc Verify sub() with HTML special characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<div>".sub();
      expect(result).assertEqual("<sub><div></sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1000
     * @tc.name testSub010
     * @tc.desc Verify sub() preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".sub();
      expect(r1).assertEqual("<sub>line1\nline2</sub>");
      let r2: string = "col1\tcol2".sub();
      expect(r2).assertEqual("<sub>col1\tcol2</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1100
     * @tc.name testSub011
     * @tc.desc Verify sub() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".sub();
      expect(result).assertEqual("<sub>你好世界</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1200
     * @tc.name testSub012
     * @tc.desc Verify sub() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀🎉".sub();
      expect(result).assertEqual("<sub>😀🎉</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1300
     * @tc.name testSub013
     * @tc.desc Verify sub() with long string (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(1000);
      let result: string = longStr.sub();
      let starts: boolean = result.startsWith("<sub>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</sub>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1400
     * @tc.name testSub014
     * @tc.desc Verify sub() called twice produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "text".sub();
      let result: string = r1.sub();
      expect(result).assertEqual("<sub><sub>text</sub></sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1500
     * @tc.name testSub015
     * @tc.desc Verify sub() chained with bold()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "text".sub();
      let result: string = r1.bold();
      expect(result).assertEqual("<b><sub>text</sub></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1600
     * @tc.name testSub016
     * @tc.desc Verify sub() chained with sup()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "text".sub();
      let result: string = r1.sup();
      expect(result).assertEqual("<sup><sub>text</sub></sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1700
     * @tc.name testSub017
     * @tc.desc Verify sub() chained with fontsize()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "text".sub();
      let result: string = r1.fontsize(5);
      expect(result).assertEqual('<font size="5"><sub>text</sub></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1800
     * @tc.name testSub018
     * @tc.desc Verify sub() chained with toString() returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "text".sub();
      let result: string = r1.toString();
      expect(result).assertEqual("<sub>text</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_1900
     * @tc.name testSub019
     * @tc.desc Verify sub() result length correctness via property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "text".sub();
      expect(r1.length).assertEqual("<sub>text</sub>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2000
     * @tc.name testSub020
     * @tc.desc Verify sub() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.sub();
      expect(result).assertEqual("<sub>a\rb</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2100
     * @tc.name testSub021
     * @tc.desc Verify sub() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.sub();
      expect(result).assertEqual("<sub>😀</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2200
     * @tc.name testSub022
     * @tc.desc Verify sub() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.sub();
      expect(result).assertEqual("<sub>ＦＷ</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2300
     * @tc.name testSub023
     * @tc.desc Verify sub() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.sub();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<sub>ArkTS</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2400
     * @tc.name testSub024
     * @tc.desc Verify sub() with ISO 8859-1 Latin accented content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".sub();
      expect(result).assertEqual("<sub>café</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2500
     * @tc.name testSub025
     * @tc.desc Verify sub() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".sub();
      expect(result).assertEqual("<sub>ﾊﾝｶｸ</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2600
     * @tc.name testSub026
     * @tc.desc Verify sub() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".sub();
      expect(result).assertEqual("<sub>中文测试</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2700
     * @tc.name testSub027
     * @tc.desc Verify sub() chained with replace() strips tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".sub();
      let result: string = r1.replace("<sub>", "").replace("</sub>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2800
     * @tc.name testSub028
     * @tc.desc Verify sub() with NUL character \\0 in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".sub();
      let starts: boolean = result.startsWith("<sub>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_2900
     * @tc.name testSub029
     * @tc.desc Verify sub() with backslash in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "H\\O".sub();
      expect(result).assertEqual("<sub>H\\O</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_3000
     * @tc.name testSub030
     * @tc.desc Verify sub() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "H₂O 水 😀".sub();
      expect(result).assertEqual("<sub>H₂O 水 😀</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_3100
     * @tc.name testSub031
     * @tc.desc Verify sub() handles GBK-to-UTF8 garbled text spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("æµè¯");
      let result: string = source.sub();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_3200
     * @tc.name testSub032
     * @tc.desc Verify sub() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.sub();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_3300
     * @tc.name testSub033
     * @tc.desc Verify Sub handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.sub();
      expect(result).assertEqual("<sub>" + source.toString() + "</sub>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB_3400
     * @tc.name testSub034
     * @tc.desc Verify Sub handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSub034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.sub();
      expect(result).assertEqual("<sub>" + source.toString() + "</sub>");
    });
  });
}
