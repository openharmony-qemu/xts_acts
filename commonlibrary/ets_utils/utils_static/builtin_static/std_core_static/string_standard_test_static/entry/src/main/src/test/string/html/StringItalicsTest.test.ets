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

export default function StringItalicsTest(): void {
  describe('StringItalicsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0100
     * @tc.name testItalics001
     * @tc.desc Verify italics() with no arguments returns <i> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".italics();
      expect(result).assertEqual("<i>ArkTS</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0200
     * @tc.name testItalics002
     * @tc.desc Verify italics() on substring result wraps the extracted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = "ArkTS Static";
      let part: string = source.substring(0, 5);
      let result: string = part.italics();
      expect(result).assertEqual("<i>ArkTS</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0300
     * @tc.name testItalics003
     * @tc.desc Verify italics() with pure English letter string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello".italics();
      expect(result).assertEqual("<i>Hello</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0400
     * @tc.name testItalics004
     * @tc.desc Verify italics() with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "12345".italics();
      expect(result).assertEqual("<i>12345</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0500
     * @tc.name testItalics005
     * @tc.desc Verify italics() with Chinese character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".italics();
      expect(result).assertEqual("<i>你好世界</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0600
     * @tc.name testItalics006
     * @tc.desc Verify italics() result starts with <i> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".italics();
      let starts: boolean = result.startsWith("<i>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0700
     * @tc.name testItalics007
     * @tc.desc Verify italics() result ends with </i> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".italics();
      let ends: boolean = result.endsWith("</i>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0800
     * @tc.name testItalics008
     * @tc.desc Verify italics() preserves original string content inside tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.italics();
      let inner: string = result.substring(3, result.length - 4);
      expect(inner).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_0900
     * @tc.name testItalics009
     * @tc.desc Verify italics() preserves a quoted status phrase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "\"draft\"".italics();
      expect(result).assertEqual("<i>\"draft\"</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1000
     * @tc.name testItalics010
     * @tc.desc Verify italics() preserves markdown-like marker content literally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "*draft*".italics();
      expect(result).assertEqual("<i>*draft*</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1100
     * @tc.name testItalics011
     * @tc.desc Verify italics() preserves hyphenated content exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a-b".italics();
      expect(result).assertEqual("<i>a-b</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1200
     * @tc.name testItalics012
     * @tc.desc Verify italics() with empty string returns <i></i>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".italics();
      expect(result).assertEqual("<i></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1300
     * @tc.name testItalics013
     * @tc.desc Verify italics() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".italics();
      expect(result).assertEqual("<i>A</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1400
     * @tc.name testItalics014
     * @tc.desc Verify italics() with strings containing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = " hello ".italics();
      expect(r1).assertEqual("<i> hello </i>");
      let r2: string = "hello world".italics();
      expect(r2).assertEqual("<i>hello world</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1500
     * @tc.name testItalics015
     * @tc.desc Verify italics() with HTML special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "<div>".italics();
      expect(r1).assertEqual("<i><div></i>");
      let r2: string = "a&b".italics();
      expect(r2).assertEqual("<i>a&b</i>");
      let r3: string = '"quoted"'.italics();
      expect(r3).assertEqual('<i>"quoted"</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1600
     * @tc.name testItalics016
     * @tc.desc Verify italics() preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".italics();
      expect(r1).assertEqual("<i>line1\nline2</i>");
      let r2: string = "tab\there".italics();
      expect(r2).assertEqual("<i>tab\there</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1700
     * @tc.name testItalics017
     * @tc.desc Verify italics() with Unicode characters (Japanese, Russian)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "こんにちは".italics();
      expect(r1).assertEqual("<i>こんにちは</i>");
      let r2: string = "Привет".italics();
      expect(r2).assertEqual("<i>Привет</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1800
     * @tc.name testItalics018
     * @tc.desc Verify italics() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "😀👍".italics();
      expect(r1).assertEqual("<i>😀👍</i>");
      let r2: string = "🎉party🎉".italics();
      expect(r2).assertEqual("<i>🎉party🎉</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_1900
     * @tc.name testItalics019
     * @tc.desc Verify italics() with very long string (10000+ characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "A".repeat(10000);
      let result: string = longStr.italics();
      let starts: boolean = result.startsWith("<i>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</i>");
      expect(ends).assertTrue();
      expect(result.length).assertEqual(10000 + 7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2000
     * @tc.name testItalics020
     * @tc.desc Verify italics() with zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a​b".italics();
      expect(result).assertEqual("<i>a​b</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2100
     * @tc.name testItalics021
     * @tc.desc Verify italics() does not escape existing HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<span>text</span>".italics();
      expect(result).assertEqual("<i><span>text</span></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2200
     * @tc.name testItalics022
     * @tc.desc Verify italics() called multiple times on a note id returns consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "note-42";
      let r1: string = text.italics();
      let r2: string = text.italics();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2300
     * @tc.name testItalics023
     * @tc.desc Verify italics() result length equals original length + 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Hello";
      let result: string = text.italics();
      expect(result.length).assertEqual(5 + 7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2400
     * @tc.name testItalics024
     * @tc.desc Verify italics() on repeat result wraps repeated content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeated: string = "ab".repeat(2);
      let result: string = repeated.italics();
      expect(result).assertEqual("<i>abab</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2500
     * @tc.name testItalics025
     * @tc.desc Verify italics() on trim result wraps trimmed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trimmed: string = "  trim  ".trim();
      let result: string = trimmed.italics();
      expect(result).assertEqual("<i>trim</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2600
     * @tc.name testItalics026
     * @tc.desc Verify italics() on sanitized identifier wraps replaced content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replaced: string = "user id".replace(" ", "_");
      let result: string = replaced.italics();
      expect(result).assertEqual("<i>user_id</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2700
     * @tc.name testItalics027
     * @tc.desc Verify italics() chained with bold() produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".italics();
      let result: string = r1.bold();
      expect(result).assertEqual("<b><i>ArkTS</i></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2800
     * @tc.name testItalics028
     * @tc.desc Verify italics() chained with toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "arkts".italics();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<I>ARKTS</I>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_2900
     * @tc.name testItalics029
     * @tc.desc Verify italics() chained with indexOf to find substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".italics();
      expect(result.indexOf("test")).assertEqual(3);
      expect(result.indexOf("<i>")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3000
     * @tc.name testItalics030
     * @tc.desc Verify italics() called via string variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Variable";
      let result: string = text.italics();
      expect(result).assertEqual("<i>Variable</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3100
     * @tc.name testItalics031
     * @tc.desc Verify italics() called via const string constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = "Constant";
      let result: string = text.italics();
      expect(result).assertEqual("<i>Constant</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3200
     * @tc.name testItalics032
     * @tc.desc Verify italics() called directly on string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Literal".italics();
      expect(result).assertEqual("<i>Literal</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3300
     * @tc.name testItalics033
     * @tc.desc Verify italics() called on concatenated string result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let part1: string = "Hello";
      let part2: string = " World";
      let result: string = (part1 + part2).italics();
      expect(result).assertEqual("<i>Hello World</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3400
     * @tc.name testItalics034
     * @tc.desc Verify italics() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.italics();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<i>ArkTS</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3500
     * @tc.name testItalics035
     * @tc.desc Verify italics() preserves carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.italics();
      expect(result).assertEqual("<i>a\rb</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3600
     * @tc.name testItalics036
     * @tc.desc Verify italics() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.italics();
      expect(result).assertEqual("<i>😀</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3700
     * @tc.name testItalics037
     * @tc.desc Verify italics() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＵＬＬ";
      let result: string = text.italics();
      expect(result).assertEqual("<i>ＦＵＬＬ</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3800
     * @tc.name testItalics038
     * @tc.desc Verify italics() with pure number text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "007";
      let result: string = text.italics();
      expect(result).assertEqual("<i>007</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_3900
     * @tc.name testItalics039
     * @tc.desc Verify italics() result indexOf finds original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "target";
      let result: string = text.italics();
      let pos: int = result.indexOf("target");
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4000
     * @tc.name testItalics040
     * @tc.desc Verify italics() chained with toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "HELLO";
      let r1: string = text.italics();
      let result: string = r1.toLowerCase();
      expect(result).assertEqual("<i>hello</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4100
     * @tc.name testItalics041
     * @tc.desc Verify italics() returns same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "repeat";
      let r1: string = text.italics();
      let r2: string = text.italics();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4200
     * @tc.name testItalics042
     * @tc.desc Verify italics() with vertical tab  in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ab".italics();
      expect(result).assertEqual("<i>ab</i>");
      expect(result.charCodeAt(4)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4300
     * @tc.name testItalics043
     * @tc.desc Verify italics() with form feed  in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ab".italics();
      expect(result).assertEqual("<i>ab</i>");
      expect(result.charCodeAt(4)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4400
     * @tc.name testItalics044
     * @tc.desc Verify italics() with all-punctuation content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "!@#$%".italics();
      expect(result).assertEqual("<i>!@#$%</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4500
     * @tc.name testItalics045
     * @tc.desc Verify italics() with only a less-than character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<".italics();
      expect(result).assertEqual("<i><</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4600
     * @tc.name testItalics046
     * @tc.desc Verify italics() handles illegal UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4\\x3f\\xad");
      let result: string = source.italics();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4700
     * @tc.name testItalics047
     * @tc.desc Verify Italics handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.italics();
      expect(result).assertEqual("<i>" + source.toString() + "</i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS_4800
     * @tc.name testItalics048
     * @tc.desc Verify Italics handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testItalics048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.italics();
      expect(result).assertEqual("<i>" + source.toString() + "</i>");
    });
  });
}
