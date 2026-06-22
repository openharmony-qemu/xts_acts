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

export default function StringLinkTest(): void {
  describe('StringLinkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0100
     * @tc.name testLink001
     * @tc.desc Verify link() with 1 string argument returns <a href> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0200
     * @tc.name testLink002
     * @tc.desc Verify link() with URL containing encoded space preserves href
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("/docs/a%20b");
      expect(result).assertEqual('<a href="/docs/a%20b">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0300
     * @tc.name testLink003
     * @tc.desc Verify link() with http protocol URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("http://example.com");
      expect(result).assertEqual('<a href="http://example.com">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0400
     * @tc.name testLink004
     * @tc.desc Verify link() with https protocol URL and path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://secure.example.org/login");
      expect(result).assertEqual('<a href="https://secure.example.org/login">ArkTS</a>');
      expect(result.indexOf("secure.example.org")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0500
     * @tc.name testLink005
     * @tc.desc Verify link() with ftp protocol URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("ftp://files.example.com");
      expect(result).assertEqual('<a href="ftp://files.example.com">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0600
     * @tc.name testLink006
     * @tc.desc Verify link() with relative path URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("/about");
      expect(result).assertEqual('<a href="/about">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0700
     * @tc.name testLink007
     * @tc.desc Verify link() with anchor hash URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("#section1");
      expect(result).assertEqual('<a href="#section1">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0800
     * @tc.name testLink008
     * @tc.desc Verify link() with URL containing port number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("http://localhost:8080");
      expect(result).assertEqual('<a href="http://localhost:8080">ArkTS</a>');
      expect(result.indexOf(":8080")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_0900
     * @tc.name testLink009
     * @tc.desc Verify link() with URL containing query parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://example.com?name=test&age=20");
      expect(result).assertEqual('<a href="https://example.com?name=test&age=20">ArkTS</a>');
      expect(result.indexOf("name=test&age=20")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1000
     * @tc.name testLink010
     * @tc.desc Verify link() with URL containing fragment identifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://example.com/page#top");
      expect(result).assertEqual('<a href="https://example.com/page#top">ArkTS</a>');
      expect(result.indexOf("#top")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1100
     * @tc.name testLink011
     * @tc.desc Verify link() with empty string URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("");
      expect(result).assertEqual('<a href="">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1200
     * @tc.name testLink012
     * @tc.desc Verify link() with javascript: protocol URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("javascript:void(0)");
      expect(result).assertEqual('<a href="javascript:void(0)">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1300
     * @tc.name testLink013
     * @tc.desc Verify link() preserves mailto href scheme literally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Contact";
      let result: string = text.link("mailto:test@example.com");
      expect(result).assertEqual('<a href="mailto:test@example.com">Contact</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1400
     * @tc.name testLink014
     * @tc.desc Verify link() result format: starts with <a href= and ends with </a>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://example.com");
      expect(result.startsWith('<a href="')).assertTrue();
      let ends: boolean = result.endsWith("</a>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1500
     * @tc.name testLink015
     * @tc.desc Verify link() preserves original string content including special chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "<div>test</div>";
      let result: string = text.link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com"><div>test</div></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1600
     * @tc.name testLink016
     * @tc.desc Verify link() with empty string preserves empty content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "";
      let result: string = text.link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com"></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1700
     * @tc.name testLink017
     * @tc.desc Verify link() with Chinese original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "中文测试";
      let result: string = text.link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com">中文测试</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1800
     * @tc.name testLink018
     * @tc.desc Verify link() with emoji in original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀表情";
      let result: string = text.link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com">😀表情</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_1900
     * @tc.name testLink019
     * @tc.desc Verify link() multiple calls return different new strings, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result1: string = text.link("https://a.com");
      let result2: string = text.link("https://b.com");
      expect(text).assertEqual("ArkTS");
      expect(result1).assertEqual('<a href="https://a.com">ArkTS</a>');
      expect(result2).assertEqual('<a href="https://b.com">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2000
     * @tc.name testLink020
     * @tc.desc Verify link() with long URL string (10000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let longUrl: string = "https://example.com/" + "a".repeat(9980);
      let result: string = text.link(longUrl);
      expect(result.startsWith('<a href="')).assertTrue();
      let ends: boolean = result.endsWith("</a>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2100
     * @tc.name testLink021
     * @tc.desc Verify link() chained with toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://example.com").toUpperCase();
      expect(result).assertEqual('<A HREF="HTTPS://EXAMPLE.COM">ARKTS</A>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2200
     * @tc.name testLink022
     * @tc.desc Verify link() called twice produces nested <a> tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://a.com").link("https://b.com");
      expect(result).assertEqual('<a href="https://b.com"><a href="https://a.com">ArkTS</a></a>');
      expect(result.indexOf("b.com")).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2300
     * @tc.name testLink023
     * @tc.desc Verify link() chained with anchor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("https://example.com").anchor("top");
      expect(result).assertEqual('<a name="top"><a href="https://example.com">ArkTS</a></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2400
     * @tc.name testLink024
     * @tc.desc Verify link() chained with bold()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.bold().link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com"><b>ArkTS</b></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2500
     * @tc.name testLink025
     * @tc.desc Verify link() with carriage return \\r in url parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.link("url\rnewline");
      let starts: boolean = result.startsWith('<a href="');
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2600
     * @tc.name testLink026
     * @tc.desc Verify link() with emoji in text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com">😀</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2700
     * @tc.name testLink027
     * @tc.desc Verify link() result indexOf finds original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "findme";
      let result: string = text.link("https://example.com");
      let pos: int = result.indexOf("findme");
      expect(pos).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2800
     * @tc.name testLink028
     * @tc.desc Verify link() with mailto protocol URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "contact".link("mailto:test@example.com");
      expect(result).assertEqual('<a href="mailto:test@example.com">contact</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_2900
     * @tc.name testLink029
     * @tc.desc Verify link() with tel protocol URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "call".link("tel:+86-13800138000");
      expect(result).assertEqual('<a href="tel:+86-13800138000">call</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3000
     * @tc.name testLink030
     * @tc.desc Verify link() with bare domain URL without protocol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "site".link("example.com");
      expect(result).assertEqual('<a href="example.com">site</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3100
     * @tc.name testLink031
     * @tc.desc Verify link() preserves double-quote onclick injection in href without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".link("a\" onclick=\"alert(1)\"");
      expect(result).assertEqual('<a href="a" onclick="alert(1)"">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3200
     * @tc.name testLink032
     * @tc.desc Verify link() with ISO 8859-1 Latin accented content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com">café</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3300
     * @tc.name testLink033
     * @tc.desc Verify link() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".link("#section");
      expect(result).assertEqual('<a href="#section">ﾊﾝｶｸ</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3400
     * @tc.name testLink034
     * @tc.desc Verify link() preserves tag-closing script injection in href without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "safe".link('a"><script>alert(1)</script>');
      expect(result).assertEqual('<a href="a"><script>alert(1)</script>">safe</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3500
     * @tc.name testLink035
     * @tc.desc Verify link() does NOT modify the original content string (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.link("https://example.com");
      expect(original).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3600
     * @tc.name testLink036
     * @tc.desc Verify link() with dynamic url and content variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Dynamic";
      let url: string = "/dynamic/path";
      let result: string = text.link(url);
      expect(result).assertEqual('<a href="/dynamic/path">Dynamic</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3700
     * @tc.name testLink037
     * @tc.desc Verify link() preserves NUL byte inside href parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".link("safe\0url");
      expect(result.charCodeAt(13)).assertEqual(0);
      expect(result).assertEqual('<a href="safe\0url">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3800
     * @tc.name testLink038
     * @tc.desc Verify link() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".link("https://example.com");
      expect(result).assertEqual('<a href="https://example.com">Hi 世界 😀</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_3900
     * @tc.name testLink039
     * @tc.desc Verify link() handles overlong UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xc0\\x81");
      let result: string = source.link("https://example.com");
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_4000
     * @tc.name testLink040
     * @tc.desc Verify link() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.link("https://example.com");
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_4100
     * @tc.name testLink041
     * @tc.desc Verify Link handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.link("https://example.com?q=<script>");
      expect(result).assertEqual("<a href=\"https://example.com?q=<script>\">" + source.toString() + "</a>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK_4200
     * @tc.name testLink042
     * @tc.desc Verify Link handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLink042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.link("https://example.com/lang");
      expect(result).assertEqual("<a href=\"https://example.com/lang\">" + source.toString() + "</a>");
    });
  });
}
