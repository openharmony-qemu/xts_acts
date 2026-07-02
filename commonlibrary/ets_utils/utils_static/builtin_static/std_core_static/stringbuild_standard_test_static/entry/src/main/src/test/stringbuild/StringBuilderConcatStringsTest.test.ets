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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function StringBuilderConcatStringsTest(): void {
  describe('StringBuilderConcatStringsTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0001
     * @tc.name testStringBuilderConcatStrings001
     * @tc.desc Verify normal concatenation of two string parameters
     *   returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Ark", "TS");
        expect(result).assertEqual("ArkTS");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0002
     * @tc.name testStringBuilderConcatStrings002
     * @tc.desc Verify delimiter-like content is preserved between words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Hello", "-World");
        expect(result).assertEqual("Hello-World");
        expect(result.charAt(5)).assertEqual("-".charAt(0));
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0003
     * @tc.name testStringBuilderConcatStrings003
     * @tc.desc Verify lhs Chinese string concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("测试工程", "Hello");
        expect(result).assertEqual("测试工程Hello");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0004
     * @tc.name testStringBuilderConcatStrings004
     * @tc.desc Verify lhs numeric string concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("123456", "789");
        expect(result).assertEqual("123456789");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0005
     * @tc.name testStringBuilderConcatStrings005
     * @tc.desc Verify lhs mixed Chinese English numeric string
     *   concatenation returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Test123 测试", "End");
        expect(result).assertEqual("Test123 测试End");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0006
     * @tc.name testStringBuilderConcatStrings006
     * @tc.desc Verify lhs empty string concatenation result equals rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result1 = StringBuilder.concatStrings("", "NonEmpty");
        expect(result1).assertEqual("NonEmpty");
        const result2 = StringBuilder.concatStrings("Test", "");
        expect(result2).assertEqual("Test");
        const result3 = StringBuilder.concatStrings("", "");
        expect(result3).assertEqual("");
        expect(result3.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0007
     * @tc.name testStringBuilderConcatStrings007
     * @tc.desc Verify lhs single character concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("A", "BC");
        expect(result).assertEqual("ABC");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0008
     * @tc.name testStringBuilderConcatStrings008
     * @tc.desc Verify lhs long string (10000+ chars) concatenation
     *   returns correct result and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const longStr = "A".repeat(10000);
        const result = StringBuilder.concatStrings(longStr, "End");
        expect(result.length).assertEqual(10003);
        expect(result.startsWith("A")).assertTrue();
        expect(result.endsWith("End")).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0009
     * @tc.name testStringBuilderConcatStrings009
     * @tc.desc Verify lhs 65535 length string concatenation boundary
     *   handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxStr = "B".repeat(65535);
        const result = StringBuilder.concatStrings(maxStr, "X");
        expect(result.length).assertEqual(65536);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0010
     * @tc.name testStringBuilderConcatStrings010
     * @tc.desc Verify lhs Unicode escape string concatenation returns
     *   correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\u4e2d\u6587", "Test");
        expect(result).assertEqual("中文Test");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0011
     * @tc.name testStringBuilderConcatStrings011
     * @tc.desc Verify lhs emoji character concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\uD83D\uDE00", "Hello");
        expect(result).assertEqual("\uD83D\uDE00Hello");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0012
     * @tc.name testStringBuilderConcatStrings012
     * @tc.desc Verify lhs XSS injection string is concatenated as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings(
          "<script>alert(1)</script>", "End"
        );
        expect(result).assertEqual(
          "<script>alert(1)</script>End"
        );
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0013
     * @tc.name testStringBuilderConcatStrings013
     * @tc.desc Verify lhs zero-width space concatenation returns correct
     *   length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\u200B", "Visible");
        expect(result.length).assertEqual(8);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0014
     * @tc.name testStringBuilderConcatStrings014
     * @tc.desc Verify lhs space string concatenation includes space in
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings(" ", "World");
        expect(result).assertEqual(" World");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0015
     * @tc.name testStringBuilderConcatStrings015
     * @tc.desc Verify lhs tab character concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\t", "World");
        expect(result).assertEqual("\tWorld");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0016
     * @tc.name testStringBuilderConcatStrings016
     * @tc.desc Verify lhs newline character concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\n", "World");
        expect(result).assertEqual("\nWorld");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0017
     * @tc.name testStringBuilderConcatStrings017
     * @tc.desc Verify lhs Japanese string concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("テスト", "Data");
        expect(result).assertEqual("テストData");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0018
     * @tc.name testStringBuilderConcatStrings018
     * @tc.desc Verify lhs Korean string concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("???", "Data");
        expect(result).assertEqual("???Data");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0019
     * @tc.name testStringBuilderConcatStrings019
     * @tc.desc Verify lhs Russian string concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("АБВГД", "Data");
        expect(result).assertEqual("АБВГДData");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0020
     * @tc.name testStringBuilderConcatStrings020
     * @tc.desc Verify lhs Arabic RTL string concatenation returns correct
     *   result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings(
          "الاختبار", "Data"
        );
        expect(result).assertEqual("الاختبارData");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0021
     * @tc.name testStringBuilderConcatStrings021
     * @tc.desc Verify lhs Unicode replacement character concatenation
     *   returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\uFFFD", "Test");
        expect(result).assertEqual("\uFFFDTest");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0022
     * @tc.name testStringBuilderConcatStrings022
     * @tc.desc Verify lone surrogate character concatenation returns result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\udc04", "Test");
        expect(result).assertEqual("\udc04Test");
        expect(result.length).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0023
     * @tc.name testStringBuilderConcatStrings023
     * @tc.desc Verify lhs special symbols string concatenation returns
     *   correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("!@#$%^&*()", "End");
        expect(result).assertEqual("!@#$%^&*()End");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0024
     * @tc.name testStringBuilderConcatStrings024
     * @tc.desc Verify catalog code prefix and suffix concatenate with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("CAT:", "device-alpha");
        expect(result).assertEqual("CAT:device-alpha");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0025
     * @tc.name testStringBuilderConcatStrings025
     * @tc.desc Verify version-like text with suffix is concatenated correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("v", "1.2.3-beta");
        expect(result).assertEqual("v1.2.3-beta");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0026
     * @tc.name testStringBuilderConcatStrings026
     * @tc.desc Verify overlapping boundary characters are not deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("abc", "cde");
        expect(result).assertEqual("abccde");
        expect(result.indexOf("cc")).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0027
     * @tc.name testStringBuilderConcatStrings027
     * @tc.desc Verify boundary-sized text keeps trailing marker position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxStr = "Y".repeat(65534);
        const result = StringBuilder.concatStrings(maxStr, "#end");
        expect(result.length).assertEqual(65538);
        expect(result.substring(65534)).assertEqual("#end");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0028
     * @tc.name testStringBuilderConcatStrings028
     * @tc.desc Verify combining mark sequence is preserved during concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Cafe", "\u0301");
        expect(result).assertEqual("Cafe\u0301");
        expect(result.length).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0029
     * @tc.name testStringBuilderConcatStrings029
     * @tc.desc Verify emoji joined by zero-width joiner remains intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\uD83D\uDC69", "\u200D\uD83D\uDCBB");
        expect(result).assertEqual("\uD83D\uDC69\u200D\uD83D\uDCBB");
        expect(result.indexOf("\u200D") > 0).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0030
     * @tc.name testStringBuilderConcatStrings030
     * @tc.desc Verify SQL-like text is concatenated as plain string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("SELECT", " * FROM table");
        expect(result).assertEqual("SELECT * FROM table");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0031
     * @tc.name testStringBuilderConcatStrings031
     * @tc.desc Verify zero-width joiner contributes to string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("A", "\u200DB");
        expect(result.length).assertEqual(3);
        expect(String(result.charAt(1))).assertEqual("\u200D");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0032
     * @tc.name testStringBuilderConcatStrings032
     * @tc.desc Verify consecutive internal spaces are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("one  ", " two");
        expect(result).assertEqual("one   two");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0033
     * @tc.name testStringBuilderConcatStrings033
     * @tc.desc Verify carriage return and tab sequence is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("A\r", "\tB");
        expect(result).assertEqual("A\r\tB");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0034
     * @tc.name testStringBuilderConcatStrings034
     * @tc.desc Verify form feed control character is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("page", "\fbreak");
        expect(result).assertEqual("page\fbreak");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0035
     * @tc.name testStringBuilderConcatStrings035
     * @tc.desc Verify Japanese punctuation remains between text fragments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("日本語", "。OK");
        expect(result).assertEqual("日本語。OK");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0036
     * @tc.name testStringBuilderConcatStrings036
     * @tc.desc Verify Korean text with ASCII separator is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("???", "-Test");
        expect(result).assertEqual("???-Test");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0037
     * @tc.name testStringBuilderConcatStrings037
     * @tc.desc Verify Cyrillic lowercase and uppercase sequence is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("тест", "АБВ");
        expect(result).assertEqual("тестАБВ");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0038
     * @tc.name testStringBuilderConcatStrings038
     * @tc.desc Verify RTL text with LTR punctuation keeps exact code order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("[", "????????]");
        expect(result).assertEqual("[????????]");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0039
     * @tc.name testStringBuilderConcatStrings039
     * @tc.desc Verify replacement character in middle of text is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("bad", "\uFFFDraw");
        expect(result).assertEqual("bad\uFFFDraw");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0040
     * @tc.name testStringBuilderConcatStrings040
     * @tc.desc Verify lone high surrogate character concatenation returns result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Test", "\ud800");
        expect(result).assertEqual("Test\ud800");
        expect(result.length).assertEqual(5);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0041
     * @tc.name testStringBuilderConcatStrings041
     * @tc.desc Verify shell-like special symbols concatenate as plain text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("cmd", " && exit");
        expect(result).assertEqual("cmd && exit");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0042
     * @tc.name testStringBuilderConcatStrings042
     * @tc.desc Verify both parameters containing special characters
     *   concatenate correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("!@#", "$%^");
        expect(result).assertEqual("!@#$%^");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0043
     * @tc.name testStringBuilderConcatStrings043
     * @tc.desc Verify both parameters containing Unicode characters
     *   concatenate correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings(
          "\u4e2d\u6587", "\u0061"
        );
        expect(result).assertEqual("中文a");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0044
     * @tc.name testStringBuilderConcatStrings044
     * @tc.desc Verify both parameters containing emoji characters
     *   concatenate correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings(
          "\uD83D\uDE00", "\uD83D\uDE01"
        );
        expect(result).assertEqual("\uD83D\uDE00\uD83D\uDE01");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0045
     * @tc.name testStringBuilderConcatStrings045
     * @tc.desc Verify both parameters as space strings concatenate
     *   correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings(" ", " ");
        expect(result).assertEqual("  ");
        expect(result.length).assertEqual(2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0046
     * @tc.name testStringBuilderConcatStrings046
     * @tc.desc Verify lhs Chinese and rhs English cross-language
     *   concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("你好", "World");
        expect(result).assertEqual("你好World");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0047
     * @tc.name testStringBuilderConcatStrings047
     * @tc.desc Verify concatenation with identical substrings has no
     *   side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("ab", "ab");
        expect(result).assertEqual("abab");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0048
     * @tc.name testStringBuilderConcatStrings048
     * @tc.desc Verify return value type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("A", "B");
        expect(typeof result).assertEqual("string");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0049
     * @tc.name testStringBuilderConcatStrings049
     * @tc.desc Verify return value length equals lhs.length + rhs.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Hello", "World");
        expect(result.length).assertEqual(10);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0050
     * @tc.name testStringBuilderConcatStrings050
     * @tc.desc Verify return value indexOf finds lhs at 0 and rhs at
     *   lhs.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("ABC", "DEF");
        expect(result.indexOf("ABC")).assertEqual(0);
        expect(result.indexOf("DEF")).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0051
     * @tc.name testStringBuilderConcatStrings051
     * @tc.desc Verify concatenation does not mutate original string
     *   variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const lhs = "Left";
        const rhs = "Right";
        const result = StringBuilder.concatStrings(lhs, rhs);
        expect(lhs).assertEqual("Left");
        expect(rhs).assertEqual("Right");
        expect(result).assertEqual("LeftRight");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0052
     * @tc.name testStringBuilderConcatStrings052
     * @tc.desc Verify concatenation with special characters in both
     *   params returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Hello\n", "\tWorld");
        expect(result).assertEqual("Hello\n\tWorld");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0053
     * @tc.name testStringBuilderConcatStrings053
     * @tc.desc Verify Unicode character concatenation return value is
     *   correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("\u4e2d", "\u6587");
        expect(result).assertEqual("中文");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0054
     * @tc.name testStringBuilderConcatStrings054
     * @tc.desc Verify two 65535-char strings concatenate with correct
     *   total length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxA = "X".repeat(65535);
        const maxB = "Y".repeat(65535);
        const result = StringBuilder.concatStrings(maxA, maxB);
        expect(result.length).assertEqual(131070);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0055
     * @tc.name testStringBuilderConcatStrings055
     * @tc.desc Verify chain concatenation using concatStrings results
     *   as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("A", "B");
        const r2 = StringBuilder.concatStrings(r1, "C");
        const r3 = StringBuilder.concatStrings(r2, "D");
        expect(r3).assertEqual("ABCD");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0056
     * @tc.name testStringBuilderConcatStrings056
     * @tc.desc Verify continuous multiple calls to concatStrings each
     *   return correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("A", "B");
        const r2 = StringBuilder.concatStrings("C", "D");
        const r3 = StringBuilder.concatStrings(r1, r2);
        expect(r1).assertEqual("AB");
        expect(r2).assertEqual("CD");
        expect(r3).assertEqual("ABCD");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0057
     * @tc.name testStringBuilderConcatStrings057
     * @tc.desc Verify static method returns consistent results across
     *   multiple calls with same inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("X", "Y");
        const r2 = StringBuilder.concatStrings("X", "Y");
        expect(r1).assertEqual(r2);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0058
     * @tc.name testStringBuilderConcatStrings058
     * @tc.desc Verify concatStrings preserves slash-separated path fragments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("/data/", "tmp/file.txt");
        expect(result).assertEqual("/data/tmp/file.txt");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0059
     * @tc.name testStringBuilderConcatStrings059
     * @tc.desc Verify concatStrings result can be used in append
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const concatResult = StringBuilder.concatStrings("Hello", " ");
        const builder = new StringBuilder(concatResult);
        builder.append("World");
        expect(builder.toString()).assertEqual("Hello World");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0060
     * @tc.name testStringBuilderConcatStrings060
     * @tc.desc Verify concatStrings can build comma-separated token list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = "0";
        for (let i = 1; i <= 5; i++) {
          result = StringBuilder.concatStrings(result, "," + i.toString());
        }
        expect(result).assertEqual("0,1,2,3,4,5");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0061
     * @tc.name testStringBuilderConcatStrings061
     * @tc.desc Verify concatStrings result starts with lhs and ends with rhs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = StringBuilder.concatStrings("Verify", "Data");
        expect(result.startsWith("Verify")).assertTrue();
        expect(result.endsWith("Data")).assertTrue();
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0062
     * @tc.name testStringBuilderConcatStrings062
     * @tc.desc Verify concatStrings can grow bracketed structured text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let result: string = "[";
        result = StringBuilder.concatStrings(result, "section");
        result = StringBuilder.concatStrings(result, ":1]");
        expect(result).assertEqual("[section:1]");
      }
    );


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0063
     * @tc.name testStringBuilderConcatStrings063
     * @tc.desc Verify concatStrings with numbers converted to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("123", "456");
        expect(r1).assertEqual("123456");
        const r2 = StringBuilder.concatStrings("0", "-1");
        expect(r2).assertEqual("0-1");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0064
     * @tc.name testStringBuilderConcatStrings064
     * @tc.desc Verify concatStrings with two 50000-char strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const longA = "A".repeat(50000);
        const longB = "B".repeat(50000);
        const str1 = "A";
        const str2 = "B";
        const result = StringBuilder.concatStrings(longA, longB);
        expect(result.length).assertEqual(100000);
        expect(result.charAt(0)).assertEqual(str1.charAt(0));
        expect(result.charAt(49999)).assertEqual(str1.charAt(0));
        expect(result.charAt(50000)).assertEqual(str2.charAt(0));
        expect(result.charAt(99999)).assertEqual(str2.charAt(0));
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0065
     * @tc.name testStringBuilderConcatStrings065
     * @tc.desc Verify concatStrings with leading trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("  ", "  ");
        expect(r1).assertEqual("    ");
        const r2 = StringBuilder.concatStrings("\t", "\n");
        expect(r2).assertEqual("\t\n");
        const r3 = StringBuilder.concatStrings(" ", "");
        expect(r3).assertEqual(" ");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0066
     * @tc.name testStringBuilderConcatStrings066
     * @tc.desc Verify concatStrings with string containing only digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("000", "111");
        expect(r1).assertEqual("000111");
        const r2 = StringBuilder.concatStrings("999", "000");
        expect(r2).assertEqual("999000");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0067
     * @tc.name testStringBuilderConcatStrings067
     * @tc.desc Verify concatStrings with StringBuilder.toString() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const builder = new StringBuilder("Hello");
        builder.append(" World");
        const sbStr: string = builder.toString();
        const result = StringBuilder.concatStrings(sbStr, "!");
        expect(result).assertEqual("Hello World!");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0068
     * @tc.name testStringBuilderConcatStrings068
     * @tc.desc Verify concatStrings with mixed case sensitivity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("UPPER", "lower");
        expect(r1).assertEqual("UPPERlower");
        const r2 = StringBuilder.concatStrings("Mixed", "Case");
        expect(r2).assertEqual("MixedCase");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0069
     * @tc.name testStringBuilderConcatStrings069
     * @tc.desc Verify concatStrings with Arabic script text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings(
          "\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631", "\u0639\u0631\u0628\u064A");
        expect(r1).assertEqual("\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631\u0639\u0631\u0628\u064A");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0070
     * @tc.name testStringBuilderConcatStrings070
     * @tc.desc Verify concatStrings with business phone format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("138", "00138000");
        expect(r1).assertEqual("13800138000");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0071
     * @tc.name testStringBuilderConcatStrings071
     * @tc.desc Verify concatStrings with encoding garbled text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("\u00E6\u00B5", "\u008B\u00E8\u00AF\u0095");
        expect(r1).assertEqual("\u00E6\u00B5\u008B\u00E8\u00AF\u0095");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0072
     * @tc.name testStringBuilderConcatStrings072
     * @tc.desc Verify concatStrings with hex format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("0x", "123");
        expect(r1).assertEqual("0x123");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0073
     * @tc.name testStringBuilderConcatStrings073
     * @tc.desc Verify concatStrings with scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r1 = StringBuilder.concatStrings("1.", "0e6");
        expect(r1).assertEqual("1.0e6");
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0074
     * @tc.name testStringBuilderConcatStrings074
     * @tc.desc Verify concatStrings with null lhs throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let s: string | null = null;
          const result = StringBuilder.concatStrings(s!, "rhs");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0075
     * @tc.name testStringBuilderConcatStrings075
     * @tc.desc Verify concatStrings with null rhs throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let s: string | null = null;
          const result = StringBuilder.concatStrings("lhs", s!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BUILDER_CONCAT_STRINGS_0076
     * @tc.name testStringBuilderConcatStrings076
     * @tc.desc Verify concatStrings with undefined rhs throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringBuilderConcatStrings076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          let s: string | undefined = undefined;
          const result = StringBuilder.concatStrings("lhs", s!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
        }
      }
    );
  });
}

