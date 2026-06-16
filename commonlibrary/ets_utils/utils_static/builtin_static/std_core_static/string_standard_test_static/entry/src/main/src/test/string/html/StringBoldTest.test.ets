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

export default function StringBoldTest(): void {
  describe('StringBoldTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0100
     * @tc.name testBold001
     * @tc.desc Verify bold() with no arguments returns <b> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".bold();
      expect(result).assertEqual("<b>ArkTS</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0200
     * @tc.name testBold002
     * @tc.desc Verify bold() with pure English letter string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello".bold();
      expect(result).assertEqual("<b>Hello</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0300
     * @tc.name testBold003
     * @tc.desc Verify bold() with pure numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "12345".bold();
      expect(result).assertEqual("<b>12345</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0400
     * @tc.name testBold004
     * @tc.desc Verify bold() with Chinese character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".bold();
      expect(result).assertEqual("<b>你好世界</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0500
     * @tc.name testBold005
     * @tc.desc Verify bold() result starts with <b> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".bold();
      let starts: boolean = result.startsWith("<b>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0600
     * @tc.name testBold006
     * @tc.desc Verify bold() result ends with </b> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".bold();
      let ends: boolean = result.endsWith("</b>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0700
     * @tc.name testBold007
     * @tc.desc Verify bold() preserves original string content inside tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.bold();
      let inner: string = result.substring(3, result.length - 4);
      expect(inner).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0800
     * @tc.name testBold008
     * @tc.desc Verify bold() with empty string returns <b></b>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".bold();
      expect(result).assertEqual("<b></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_0900
     * @tc.name testBold009
     * @tc.desc Verify bold() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".bold();
      expect(result).assertEqual("<b>A</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1000
     * @tc.name testBold010
     * @tc.desc Verify bold() with string containing leading/trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = " hello ".bold();
      expect(r1).assertEqual("<b> hello </b>");
      let r2: string = "hello world".bold();
      expect(r2).assertEqual("<b>hello world</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1100
     * @tc.name testBold011
     * @tc.desc Verify bold() with HTML special characters < > & \" '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "<div>".bold();
      expect(r1).assertEqual("<b><div></b>");
      let r2: string = "a&b".bold();
      expect(r2).assertEqual("<b>a&b</b>");
      let r3: string = '"quoted"'.bold();
      expect(r3).assertEqual('<b>"quoted"</b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1200
     * @tc.name testBold012
     * @tc.desc Verify bold() with newline and tab escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".bold();
      expect(r1).assertEqual("<b>line1\nline2</b>");
      let r2: string = "tab\there".bold();
      expect(r2).assertEqual("<b>tab\there</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1300
     * @tc.name testBold013
     * @tc.desc Verify bold() with Unicode characters (Japanese, Russian)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "こんにちは".bold();
      expect(r1).assertEqual("<b>こんにちは</b>");
      let r2: string = "Привет".bold();
      expect(r2).assertEqual("<b>Привет</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1400
     * @tc.name testBold014
     * @tc.desc Verify bold() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "😀👍".bold();
      expect(r1).assertEqual("<b>😀👍</b>");
      let r2: string = "🎉party🎉".bold();
      expect(r2).assertEqual("<b>🎉party🎉</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1500
     * @tc.name testBold015
     * @tc.desc Verify bold() with very long string (10000+ characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "A".repeat(10000);
      let result: string = longStr.bold();
      let starts: boolean = result.startsWith("<b>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</b>");
      expect(ends).assertTrue();
      expect(result.length).assertEqual(10000 + 7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1600
     * @tc.name testBold016
     * @tc.desc Verify bold() preserves zero-width space \\u200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a​b".bold();
      expect(result).assertEqual("<b>a​b</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1700
     * @tc.name testBold017
     * @tc.desc Verify bold() does not escape existing HTML tags in original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<span>text</span>".bold();
      expect(result).assertEqual("<b><span>text</span></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1800
     * @tc.name testBold018
     * @tc.desc Verify bold() called multiple times on same string returns consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "test";
      let r1: string = text.bold();
      let r2: string = text.bold();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_1900
     * @tc.name testBold019
     * @tc.desc Verify bold() result length equals original length plus 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Hello";
      let result: string = text.bold();
      expect(result.length).assertEqual(5 + 7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2000
     * @tc.name testBold020
     * @tc.desc Verify bold() chained with italics() produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".bold();
      let result: string = r1.italics();
      expect(result).assertEqual("<i><b>ArkTS</b></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2100
     * @tc.name testBold021
     * @tc.desc Verify bold() chained with toUpperCase() transforms tag and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "arkts".bold();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<B>ARKTS</B>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2200
     * @tc.name testBold022
     * @tc.desc Verify bold() called via string variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Variable";
      let result: string = text.bold();
      expect(result).assertEqual("<b>Variable</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2300
     * @tc.name testBold023
     * @tc.desc Verify bold() called via const string constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "Constant";
      let result: string = text.bold();
      expect(result).assertEqual("<b>Constant</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2400
     * @tc.name testBold024
     * @tc.desc Verify bold() called directly on string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Literal".bold();
      expect(result).assertEqual("<b>Literal</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2500
     * @tc.name testBold025
     * @tc.desc Verify bold() called on concatenated string result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let part1: string = "Hello";
      let part2: string = " World";
      let result: string = (part1 + part2).bold();
      expect(result).assertEqual("<b>Hello World</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2600
     * @tc.name testBold026
     * @tc.desc Verify bold() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.bold();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<b>ArkTS</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2700
     * @tc.name testBold027
     * @tc.desc Verify bold() preserves carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.bold();
      expect(result).assertEqual("<b>a\rb</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2800
     * @tc.name testBold028
     * @tc.desc Verify bold() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＵＬＬ";
      let result: string = text.bold();
      expect(result).assertEqual("<b>ＦＵＬＬ</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_2900
     * @tc.name testBold029
     * @tc.desc Verify bold() chained with toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "HELLO";
      let r1: string = text.bold();
      let result: string = r1.toLowerCase();
      expect(result).assertEqual("<b>hello</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3000
     * @tc.name testBold030
     * @tc.desc Verify bold() with all-punctuation content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "!@#$%^&*()_+-=[]{}|;:',.<>/?";
      let result: string = text.bold();
      expect(result).assertEqual("<b>!@#$%^&*()_+-=[]{}|;:',.<>/?</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3100
     * @tc.name testBold031
     * @tc.desc Verify bold() deep chain 5 levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "x".bold();
      let r2: string = r1.big();
      let r3: string = r2.italics();
      let r4: string = r3.small();
      let result: string = r4.fixed();
      expect(result).assertEqual("<tt><small><i><big><b>x</b></big></i></small></tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3200
     * @tc.name testBold032
     * @tc.desc Verify bold() with vertical tab \\v in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\vb";
      let result: string = text.bold();
      expect(result).assertEqual("<b>a\vb</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3300
     * @tc.name testBold033
     * @tc.desc Verify bold() with form feed \\f in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\fb";
      let result: string = text.bold();
      expect(result).assertEqual("<b>a\fb</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3400
     * @tc.name testBold034
     * @tc.desc Verify bold() with null byte \\0 in middle of text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\0b";
      let result: string = text.bold();
      expect(result.getLength()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3500
     * @tc.name testBold035
     * @tc.desc Verify bold() with </b> in caller produces malformed close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "x</b>y".bold();
      expect(result).assertEqual("<b>x</b>y</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3600
     * @tc.name testBold036
     * @tc.desc Verify bold() with bare ampersand preserved without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a&b".bold();
      expect(result).assertEqual("<b>a&b</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3700
     * @tc.name testBold037
     * @tc.desc Verify bold() with ISO 8859-1 Latin accented content (café)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".bold();
      expect(result).assertEqual("<b>café</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3800
     * @tc.name testBold038
     * @tc.desc Verify bold() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".bold();
      expect(result).assertEqual("<b>ﾊﾝｶｸ</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_3900
     * @tc.name testBold039
     * @tc.desc Verify bold() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".bold();
      expect(result).assertEqual("<b>中文测试</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4000
     * @tc.name testBold040
     * @tc.desc Verify bold() chained with replace() strips tags to recover original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".bold();
      let result: string = r1.replace("<b>", "").replace("</b>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4100
     * @tc.name testBold041
     * @tc.desc Verify bold() with backslash character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\\b".bold();
      expect(result).assertEqual("<b>a\\b</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4200
     * @tc.name testBold042
     * @tc.desc Verify bold() with tilde character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "~home".bold();
      expect(result).assertEqual("<b>~home</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4300
     * @tc.name testBold043
     * @tc.desc Verify bold() with path-like content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "/usr/local/bin".bold();
      expect(result).assertEqual("<b>/usr/local/bin</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4400
     * @tc.name testBold044
     * @tc.desc Verify bold() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".bold();
      expect(result).assertEqual("<b>Hi 世界 😀</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4500
     * @tc.name testBold045
     * @tc.desc Verify bold() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.bold();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4600
     * @tc.name testBold046
     * @tc.desc Verify Bold handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.bold();
      expect(result).assertEqual("<b>" + source.toString() + "</b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BOLD_4700
     * @tc.name testBold047
     * @tc.desc Verify Bold handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBold047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.bold();
      expect(result).assertEqual("<b>" + source.toString() + "</b>");
    });
  });
}
