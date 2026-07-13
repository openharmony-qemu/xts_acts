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

export default function StringBigTest(): void {
  describe('StringBigTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0100
     * @tc.name testBig001
     * @tc.desc Verify big() with no arguments returns <big> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello".big();
      expect(result).assertEqual("<big>hello</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0200
     * @tc.name testBig002
     * @tc.desc Verify big() tags are properly matched (open/close pair)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "abc".big();
      expect(result).assertEqual("<big>abc</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0300
     * @tc.name testBig003
     * @tc.desc Verify big() preserves pure ASCII content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello".big();
      expect(result).assertEqual("<big>Hello</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0400
     * @tc.name testBig004
     * @tc.desc Verify big() preserves content with spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello World".big();
      expect(result).assertEqual("<big>Hello World</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0500
     * @tc.name testBig005
     * @tc.desc Verify big() preserves a semantic version token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "v1.2.3".big();
      expect(result).assertEqual("<big>v1.2.3</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0600
     * @tc.name testBig006
     * @tc.desc Verify big() preserves punctuation marks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello,world!".big();
      expect(result).assertEqual("<big>hello,world!</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0700
     * @tc.name testBig007
     * @tc.desc Verify big() preserves newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "line1\nline2".big();
      expect(result).assertEqual("<big>line1\nline2</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0800
     * @tc.name testBig008
     * @tc.desc Verify big() preserves tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\tb".big();
      expect(result).assertEqual("<big>a\tb</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_0900
     * @tc.name testBig009
     * @tc.desc Verify big() preserves leading and trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "  hello  ".big();
      expect(result).assertEqual("<big>  hello  </big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1000
     * @tc.name testBig010
     * @tc.desc Verify big() preserves a feature flag token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "feature:beta".big();
      expect(result).assertEqual("<big>feature:beta</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1100
     * @tc.name testBig011
     * @tc.desc Verify big() result length correctness (abc -> <big>abc</big>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "abc".big();
      expect(r.length).assertEqual("<big>abc</big>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1200
     * @tc.name testBig012
     * @tc.desc Verify big() results can be concatenated with +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a".big() + "b".big();
      expect(result).assertEqual("<big>a</big><big>b</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1300
     * @tc.name testBig013
     * @tc.desc Verify big() with empty string returns <big></big>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".big();
      expect(result).assertEqual("<big></big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1400
     * @tc.name testBig014
     * @tc.desc Verify big() with HTML tag characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<div>".big();
      expect(result).assertEqual("<big><div></big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1500
     * @tc.name testBig015
     * @tc.desc Verify big() with HTML entity preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "&amp;".big();
      expect(result).assertEqual("<big>&amp;</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1600
     * @tc.name testBig016
     * @tc.desc Verify big() with script tag (XSS) preserved as-is without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<script>alert(1)</script>".big();
      expect(result).assertEqual("<big><script>alert(1)</script></big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1700
     * @tc.name testBig017
     * @tc.desc Verify big() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好".big();
      expect(result).assertEqual("<big>你好</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1800
     * @tc.name testBig018
     * @tc.desc Verify big() with Japanese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "こんにちは".big();
      expect(result).assertEqual("<big>こんにちは</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_1900
     * @tc.name testBig019
     * @tc.desc Verify big() with Korean characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "안녕하세요".big();
      expect(result).assertEqual("<big>안녕하세요</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2000
     * @tc.name testBig020
     * @tc.desc Verify big() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀".big();
      expect(result).assertEqual("<big>😀</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2100
     * @tc.name testBig021
     * @tc.desc Verify big() with family emoji (ZWJ sequence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "👨‍👩‍👧‍👦".big();
      expect(result).assertEqual("<big>👨‍👩‍👧‍👦</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2200
     * @tc.name testBig022
     * @tc.desc Verify big() with mixed Unicode content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello世界🌍".big();
      expect(result).assertEqual("<big>Hello世界🌍</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2300
     * @tc.name testBig023
     * @tc.desc Verify big() with surrogate pair Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "𐍈".big();
      expect(result).assertEqual("<big>𐍈</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2400
     * @tc.name testBig024
     * @tc.desc Verify big() with long string (100 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(100);
      let result: string = longStr.big();
      expect(result.length).assertEqual(longStr.length + "<big></big>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2500
     * @tc.name testBig025
     * @tc.desc Verify big() with very long string (10000 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "c".repeat(10000);
      let result: string = longStr.big();
      expect(result.length).assertEqual(longStr.length + "<big></big>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2600
     * @tc.name testBig026
     * @tc.desc Verify big() with very long string (65536 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "d".repeat(65536);
      let result: string = longStr.big();
      expect(result.length).assertEqual(longStr.length + "<big></big>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2700
     * @tc.name testBig027
     * @tc.desc Verify big() chained with big() produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.big();
      expect(result).assertEqual("<big><big>test</big></big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2800
     * @tc.name testBig028
     * @tc.desc Verify big() chained with bold() preserves a file extension label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "report.csv".big();
      let result: string = r1.bold();
      expect(result).assertEqual("<b><big>report.csv</big></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_2900
     * @tc.name testBig029
     * @tc.desc Verify big() chained with italics() produces correctly nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.italics();
      expect(result).assertEqual("<i><big>test</big></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3000
     * @tc.name testBig030
     * @tc.desc Verify big() chained with toUpperCase() transforms everything
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<BIG>TEST</BIG>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3100
     * @tc.name testBig031
     * @tc.desc Verify big() chained with link() produces nested tag with href
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.link("http://example.com");
      expect(result).assertEqual('<a href="http://example.com"><big>test</big></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3200
     * @tc.name testBig032
     * @tc.desc Verify big() chained with anchor() produces nested tag with name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.anchor("section");
      expect(result).assertEqual('<a name="section"><big>test</big></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3300
     * @tc.name testBig033
     * @tc.desc Verify big() chained with blink() produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.blink();
      expect(result).assertEqual("<blink><big>test</big></blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3400
     * @tc.name testBig034
     * @tc.desc Verify big() in three-level chain produces correct nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let r2: string = r1.bold();
      let result: string = r2.italics();
      expect(result).assertEqual("<i><b><big>test</big></b></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3500
     * @tc.name testBig035
     * @tc.desc Verify big() chained with fontcolor() produces nested font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.fontcolor("red");
      expect(result).assertEqual('<font color="red"><big>test</big></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3600
     * @tc.name testBig036
     * @tc.desc Verify big() chained with fontsize() produces nested font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".big();
      let result: string = r1.fontsize(5);
      expect(result).assertEqual('<font size="5"><big>test</big></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3700
     * @tc.name testBig037
     * @tc.desc Verify big() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.big();
      expect(result).assertEqual("<big>a\rb</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3800
     * @tc.name testBig038
     * @tc.desc Verify big() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.big();
      expect(result).assertEqual("<big>😀</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_3900
     * @tc.name testBig039
     * @tc.desc Verify big() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＵＬＬ";
      let result: string = text.big();
      expect(result).assertEqual("<big>ＦＵＬＬ</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4000
     * @tc.name testBig040
     * @tc.desc Verify big() result indexOf finds original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "target".big();
      let pos: int = result.indexOf("target");
      expect(pos).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4100
     * @tc.name testBig041
     * @tc.desc Verify big() with vertical tab \\v in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\vb".big();
      expect(result).assertEqual("<big>a\vb</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4200
     * @tc.name testBig042
     * @tc.desc Verify big() with form feed \\f in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\fb".big();
      expect(result).assertEqual("<big>a\fb</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4300
     * @tc.name testBig043
     * @tc.desc Verify big() with all-punctuation content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "!@#$%".big();
      expect(result).assertEqual("<big>!@#$%</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4400
     * @tc.name testBig044
     * @tc.desc Verify big() with RTL Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "الاختبار".big();
      expect(result).assertEqual("<big>الاختبار</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4500
     * @tc.name testBig045
     * @tc.desc Verify big() with only a less-than character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<".big();
      expect(result).assertEqual("<big><</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4600
     * @tc.name testBig046
     * @tc.desc Verify big() with bare ampersand preserved without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a&b".big();
      expect(result).assertEqual("<big>a&b</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4700
     * @tc.name testBig047
     * @tc.desc Verify big() with double-quote in caller preserved without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\"b".big();
      expect(result).assertEqual("<big>a\"b</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4800
     * @tc.name testBig048
     * @tc.desc Verify big() with only control characters as caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "\t\n\r".big();
      expect(result).assertEqual("<big>\t\n\r</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_4900
     * @tc.name testBig049
     * @tc.desc Verify big() with single right-angle-bracket as caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ">".big();
      expect(result).assertEqual("<big>></big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5000
     * @tc.name testBig050
     * @tc.desc Verify big() with ISO 8859-1 Latin accented content (café)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".big();
      expect(result).assertEqual("<big>café</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5100
     * @tc.name testBig051
     * @tc.desc Verify big() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".big();
      expect(result).assertEqual("<big>ﾊﾝｶｸ</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5200
     * @tc.name testBig052
     * @tc.desc Verify big() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".big();
      expect(result).assertEqual("<big>中文测试</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5300
     * @tc.name testBig053
     * @tc.desc Verify big() does NOT modify the original content string (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.big();
      expect(original).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5400
     * @tc.name testBig054
     * @tc.desc Verify big() called twice on the same status token returns identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "status:ready";
      let r1: string = text.big();
      let r2: string = text.big();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5500
     * @tc.name testBig055
     * @tc.desc Verify big() result starts with <big> and ends with </big>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "data".big();
      let starts: boolean = result.startsWith("<big>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</big>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5600
     * @tc.name testBig056
     * @tc.desc Verify big() inner content between tags matches original via extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "GitHub";
      let result: string = text.big();
      let inner: string = result.substring(5, result.length - 6);
      expect(inner).assertEqual("GitHub");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5700
     * @tc.name testBig057
     * @tc.desc Verify big() with dynamic content variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Variable";
      let result: string = text.big();
      expect(result).assertEqual("<big>Variable</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5800
     * @tc.name testBig058
     * @tc.desc Verify big() with NUL character \\0 in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".big();
      let starts: boolean = result.startsWith("<big>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_5900
     * @tc.name testBig059
     * @tc.desc Verify big() with backslash character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\\b".big();
      expect(result).assertEqual("<big>a\\b</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6000
     * @tc.name testBig060
     * @tc.desc Verify big() with only whitespace content preserves spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "   ".big();
      expect(result).assertEqual("<big>   </big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6100
     * @tc.name testBig061
     * @tc.desc Verify big() with leading spaces in content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "  leading".big();
      expect(result).assertEqual("<big>  leading</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6200
     * @tc.name testBig062
     * @tc.desc Verify big() chained with replace() strips tags to recover original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".big();
      let result: string = r1.replace("<big>", "").replace("</big>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6300
     * @tc.name testBig063
     * @tc.desc Verify big() chained with concat() preserves tag structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "Hello".big();
      let result: string = r1.concat(" World");
      expect(result).assertEqual("<big>Hello</big> World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6400
     * @tc.name testBig064
     * @tc.desc Verify big() with tilde character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "~home".big();
      expect(result).assertEqual("<big>~home</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6500
     * @tc.name testBig065
     * @tc.desc Verify big() with query-string-like content (?key=value&flag)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "?key=value&flag".big();
      expect(result).assertEqual("<big>?key=value&flag</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6600
     * @tc.name testBig066
     * @tc.desc Verify big() with path-like content (/usr/local/bin)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "/usr/local/bin".big();
      expect(result).assertEqual("<big>/usr/local/bin</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6700
     * @tc.name testBig067
     * @tc.desc Verify big() with mixed 3-character-set content (ASCII+CJK+Emoji)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".big();
      expect(result).assertEqual("<big>Hi 世界 😀</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6800
     * @tc.name testBig068
     * @tc.desc Verify big() with square bracket and curly brace content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "[sec]{val}".big();
      expect(result).assertEqual("<big>[sec]{val}</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_6900
     * @tc.name testBig069
     * @tc.desc Verify big() handles mixed text with literal Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("test \\u4e2d\\u6587");
      let result: string = source.big();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_7000
     * @tc.name testBig070
     * @tc.desc Verify big() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.big();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_7100
     * @tc.name testBig071
     * @tc.desc Verify Big handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.big();
      expect(result).assertEqual("<big>" + source.toString() + "</big>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BIG_7200
     * @tc.name testBig072
     * @tc.desc Verify Big handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBig072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.big();
      expect(result).assertEqual("<big>" + source.toString() + "</big>");
    });
  });
}
