/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';



export default function builtinsStringBuilderTestConstructor() {
  describe('BuiltinsStringBuilderTestConstructor', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0100
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_EMPTY_TEST0100
     * @tc.desc: Test StringBuilder append(String) with empty string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0200
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_SPECIAL_CHARS_TEST0200
     * @tc.desc: Test StringBuilder append(String) with special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(specialChars);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(specialChars);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0300
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_ASCII_TEST0300
     * @tc.desc: Test StringBuilder append(String) with full ASCII range
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiString: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(asciiString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(asciiString);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0400
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_DOUBLE_SPECIAL_TEST0400
     * @tc.desc: Test StringBuilder append(String) with double special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleSpecial: string = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(doubleSpecial);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(doubleSpecial);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0500
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_ESCAPE_CHARS_TEST0500
     * @tc.desc: Test StringBuilder append(String) with escape characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeString: string = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0\\101\\x42";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(escapeString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(escapeString);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0600
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_EMOJI_TEST0600
     * @tc.desc: Test StringBuilder append(String) with emoji characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojiString: string = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(emojiString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(emojiString);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0700
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_EMOJI_UNICODE_TEST0700
     * @tc.desc: Test StringBuilder append(String) with emoji Unicode codes
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicodeEmoji: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(unicodeEmoji);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(unicodeEmoji);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0800
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_INVALID_UNICODE_TEST0800
     * @tc.desc: Test StringBuilder append(String) with invalid Unicode codes
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode: string = "\udc04\ud83d\udff4";
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(invalidUnicode);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(invalidUnicode);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor0900
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_KEYWORDS_TEST0900
     * @tc.desc: Test StringBuilder append(String) with keyword strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("0")
        .append("NaN")
        .append("");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0NaN');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1000
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_MIXED_TEST1000
     * @tc.desc: Test StringBuilder append(String) with mixed content
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Hello")
        .append(" ")
        .append("World")
        .append("!")
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Hello World!');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1100
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_LONG_TEST1100
     * @tc.desc: Test StringBuilder append(String) with long string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longString: string = "a".repeat(1000);
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(longString);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(longString);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1200
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_SLICE_TEST1200
     * @tc.desc: Test StringBuilder append(String) with sliced string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "{k1:value1,k2:value2}";
      const slicedStr: string = str.substring(0, str.length - 2);
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(slicedStr);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual("{k1:value1,k2:value");
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1300
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_CHAINED_TEST1300
     * @tc.desc: Test StringBuilder append(String) with chained calls
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("First")
        .append("Second")
        .append("Third")
        .append("Fourth")
        .append("Fifth");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('FirstSecondThirdFourthFifth');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1400
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_WITH_OTHER_TYPES_TEST1400
     * @tc.desc: Test StringBuilder append(String) mixed with other types
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Count: ")
        .append(100 as byte)
        .append(", Flag: ")
        .append(true)
        .append(", Text: ")
        .append("Hello")
        .append(", Number: ")
        .append(3.14);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Count: 100, Flag: true, Text: Hello, Number: 3.14');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1500
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_EMPTY_CHAIN_TEST1500
     * @tc.desc: Test StringBuilder append(String) with empty strings in chain
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("")
        .append("Hello")
        .append("")
        .append("World")
        .append("");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('HelloWorld');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1600
     * @tc.number: BUILTINS_STRING_BUILDER_APPEND_STRING_ONLY_TEST1600
     * @tc.desc: Test StringBuilder append(String) only
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("SingleString");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('SingleString');
    });/**


    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1700
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_EMPTY_TEST1700
     * @tc.desc: Test StringBuilder concatStrings with empty strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("", "");
      expect(result).assertEqual('');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1800
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_SPECIAL_CHARS_TEST1800
     * @tc.desc: Test StringBuilder concatStrings with special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const result: string = StringBuilder.concatStrings(specialChars, specialChars);
      expect(result).assertEqual(specialChars + specialChars);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor1900
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_ASCII_TEST1900
     * @tc.desc: Test StringBuilder concatStrings with full ASCII range
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiPart1: string = "!\"#$%&'()*+,-./0123456789:;<=>?@";
      const asciiPart2: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const result: string = StringBuilder.concatStrings(asciiPart1, asciiPart2);
      expect(result).assertEqual(asciiPart1 + asciiPart2);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2000
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_ESCAPE_CHARS_TEST2000
     * @tc.desc: Test StringBuilder concatStrings with escape characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeString1: string = "\\a\\b\\f\\n\\r\\t\\v";
      const escapeString2: string = "\\\\\\'\\\"\\?\\0\\101\\x42";
      const result: string = StringBuilder.concatStrings(escapeString1, escapeString2);
      expect(result).assertEqual(escapeString1 + escapeString2);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2100
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_EMOJI_TEST2100
     * @tc.desc: Test StringBuilder concatStrings with emoji characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emoji1: string = "👆👿👀💯🎅😼";
      const emoji2: string = "🔧💇🤼‍♂️🛢🀄🏴";
      const result: string = StringBuilder.concatStrings(emoji1, emoji2);
      expect(result).assertEqual(emoji1 + emoji2);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2200
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_UNICODE_TEST2200
     * @tc.desc: Test StringBuilder concatStrings with Unicode codes
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicode1: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      const unicode2: string = "\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87";
      const result: string = StringBuilder.concatStrings(unicode1, unicode2);
      expect(result).assertEqual(unicode1 + unicode2);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2300
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_INVALID_UNICODE_TEST2300
     * @tc.desc: Test StringBuilder concatStrings with invalid Unicode codes
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode: string = "\udc04\ud83d\udff4";
      const normalString: string = "Hello";
      const result: string = StringBuilder.concatStrings(normalString, invalidUnicode);
      expect(result).assertEqual(normalString + invalidUnicode);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2400
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_KEYWORDS_TEST2400
     * @tc.desc: Test StringBuilder concatStrings with keyword strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = StringBuilder.concatStrings("0", "NaN");
      expect(result1).assertEqual('0NaN');

      const result2: string = StringBuilder.concatStrings("NaN", "");
      expect(result2).assertEqual('NaN');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2500
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_NORMAL_TEST2500
     * @tc.desc: Test StringBuilder concatStrings with normal strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("Hello ", "World!");
      expect(result).assertEqual('Hello World!');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2600
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_LONG_TEST2600
     * @tc.desc: Test StringBuilder concatStrings with long strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longString1: string = "a".repeat(500);
      const longString2: string = "b".repeat(500);
      const result: string = StringBuilder.concatStrings(longString1, longString2);
      expect(result).assertEqual(longString1 + longString2);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2700
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_SLICE_TEST2700
     * @tc.desc: Test StringBuilder concatStrings with sliced strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "{k1:value1,k2:value2}";
      const slicedStr1: string = str.substring(0, 10);
      const slicedStr2: string = str.substring(10);
      const result: string = StringBuilder.concatStrings(slicedStr1, slicedStr2);
      expect(result).assertEqual(str);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2800
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_MIXED_TEST2800
     * @tc.desc: Test StringBuilder concatStrings with mixed content
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("Prefix: ", "123abc👆");
      expect(result).assertEqual('Prefix: 123abc👆');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor2900
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_REVERSE_TEST2900
     * @tc.desc: Test StringBuilder concatStrings with reversed order
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = StringBuilder.concatStrings("Hello", "World");
      const result2: string = StringBuilder.concatStrings("World", "Hello");
      expect(result1).assertEqual('HelloWorld');
      expect(result2).assertEqual('WorldHello');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3000
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_COMPLEX_TEST3000
     * @tc.desc: Test StringBuilder concatStrings with complex combination
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = StringBuilder.concatStrings("", "NotEmpty");
      expect(result1).assertEqual('NotEmpty');

      const result2: string = StringBuilder.concatStrings("NotEmpty", "");
      expect(result2).assertEqual('NotEmpty');

      const result3: string = StringBuilder.concatStrings("Left", "Right");
      expect(result3).assertEqual('LeftRight');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3100
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_WHITESPACE_TEST3100
     * @tc.desc: Test StringBuilder concatStrings with whitespace characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("Hello\t", "\nWorld");
      expect(result).assertEqual('Hello\t\nWorld');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3200
     * @tc.number: BUILTINS_STRING_BUILDER_CONCAT_STRINGS_NUMBERS_TEST3200
     * @tc.desc: Test StringBuilder concatStrings with number strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: string = StringBuilder.concatStrings("123", "456");
      expect(result).assertEqual('123456');

      const result2: string = StringBuilder.concatStrings("3.14", "159");
      expect(result2).assertEqual('3.14159');
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3300
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_EMPTY_TEST3300
     * @tc.desc: Test StringBuilder stringLength with empty builder
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const length: int = builder.stringLength;
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3400
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_SIMPLE_TEST3400
     * @tc.desc: Test StringBuilder stringLength with simple string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Hello");
      const length: int = builder.stringLength;
      expect(length).assertEqual(5);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3500
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_SPECIAL_CHARS_TEST3500
     * @tc.desc: Test StringBuilder stringLength with special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      builder.append(specialChars);
      const length: int = builder.stringLength;
      expect(length).assertEqual(specialChars.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3600
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_EMOJI_TEST3600
     * @tc.desc: Test StringBuilder stringLength with emoji characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const emojiString: string = "👆👿👀💯🎅😼";
      builder.append(emojiString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(emojiString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3700
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_ESCAPE_CHARS_TEST3700
     * @tc.desc: Test StringBuilder stringLength with escape characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const escapeString: string = "\\n\\t\\r\\\\";
      builder.append(escapeString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(escapeString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3800
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_INCREMENTAL_TEST3800
     * @tc.desc: Test StringBuilder stringLength with incremental appends
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      expect(builder.stringLength).assertEqual(0);

      builder.append("Hello");
      expect(builder.stringLength).assertEqual(5);

      builder.append(" ");
      expect(builder.stringLength).assertEqual(6);

      builder.append("World");
      expect(builder.stringLength).assertEqual(11);

      builder.append("!");
      expect(builder.stringLength).assertEqual(12);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor3900
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_MIXED_TYPES_TEST3900
     * @tc.desc: Test StringBuilder stringLength with mixed type appends
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append("Count: ");
      builder.append(100 as byte);
      builder.append(", Flag: ");
      builder.append(true);
      builder.append(", Value: ");
      builder.append(3.14);

      const expectedString: string = "Count: 100, Flag: true, Value: 3.14";
      const length: int = builder.stringLength;
      expect(length).assertEqual(expectedString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4000
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_LONG_STRING_TEST4000
     * @tc.desc: Test StringBuilder stringLength with long string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const longString: string = "a".repeat(1000);
      builder.append(longString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(1000);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4100
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_UNICODE_TEST4100
     * @tc.desc: Test StringBuilder stringLength with Unicode characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const unicodeString: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      builder.append(unicodeString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(unicodeString.length);
    });


    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4200
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_ASCII_TEST4200
     * @tc.desc: Test StringBuilder stringLength with full ASCII range
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const asciiString: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      builder.append(asciiString);
      const length: int = builder.stringLength;
      expect(length).assertEqual(asciiString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4300
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_CLEAR_TEST4300
     * @tc.desc: Test StringBuilder stringLength after multiple operations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append("Hello");
      builder.append(" ");
      builder.append("World");
      expect(builder.stringLength).assertEqual(11);

      builder.append("!");
      builder.append(" Test");
      expect(builder.stringLength).assertEqual(17);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4400
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_NUMBERS_ONLY_TEST4400
     * @tc.desc: Test StringBuilder stringLength with number strings only
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append("123");
      builder.append("456");
      builder.append("789");

      const length: int = builder.stringLength;
      expect(length).assertEqual(9);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4500
     * @tc.number: BUILTINS_STRING_BUILDER_STRING_LENGTH_MULTIPLE_BUILDERS_TEST4500
     * @tc.desc: Test StringBuilder stringLength with multiple builders
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder();
      builder1.append("First");
      expect(builder1.stringLength).assertEqual(5);

      const builder2: StringBuilder = new StringBuilder();
      builder2.append("SecondBuilder");
      expect(builder2.stringLength).assertEqual(13);

      const builder3: StringBuilder = new StringBuilder();
      expect(builder3.stringLength).assertEqual(0);
    });
    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4600
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_EMPTY_TEST4600
     * @tc.desc: Test StringBuilder constructor with empty string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("");
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4700
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_NORMAL_TEST4700
     * @tc.desc: Test StringBuilder constructor with normal string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Hello World");
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("Hello World");
      expect(length).assertEqual(11);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4800
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_SPECIAL_CHARS_TEST4800
     * @tc.desc: Test StringBuilder constructor with special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const builder: StringBuilder = new StringBuilder(specialChars);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(specialChars);
      expect(length).assertEqual(specialChars.length);
    });


    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor4900
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_EMOJI_TEST4900
     * @tc.desc: Test StringBuilder constructor with emoji characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emojiString: string = "👆👿👀💯🎅😼";
      const builder: StringBuilder = new StringBuilder(emojiString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(emojiString);
      expect(length).assertEqual(emojiString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5000
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_UNICODE_TEST5000
     * @tc.desc: Test StringBuilder constructor with Unicode codes
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicodeString: string = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      const builder: StringBuilder = new StringBuilder(unicodeString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(unicodeString);
      expect(length).assertEqual(unicodeString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5100
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_ESCAPE_CHARS_TEST5100
     * @tc.desc: Test StringBuilder constructor with escape characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const escapeString: string = "\\n\\t\\r\\\\\\\"\\'";
      const builder: StringBuilder = new StringBuilder(escapeString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(escapeString);
      expect(length).assertEqual(escapeString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5200
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_ASCII_TEST5200
     * @tc.desc: Test StringBuilder constructor with full ASCII range
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiString: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      const builder: StringBuilder = new StringBuilder(asciiString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(asciiString);
      expect(length).assertEqual(asciiString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5300
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_KEYWORDS_TEST5300
     * @tc.desc: Test StringBuilder constructor with keyword strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("0");
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("0");
      expect(length).assertEqual(1);

      const builder2: StringBuilder = new StringBuilder("NaN");
      const result2: string = builder2.toString();
      const length2: int = builder2.stringLength;
      expect(result2).assertEqual("NaN");
      expect(length2).assertEqual(3);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5400
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_LONG_STRING_TEST5400
     * @tc.desc: Test StringBuilder constructor with long string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longString: string = "a".repeat(1000);
      const builder: StringBuilder = new StringBuilder(longString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(longString);
      expect(length).assertEqual(1000);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5500
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_SLICE_STRING_TEST5500
     * @tc.desc: Test StringBuilder constructor with sliced string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const originalString: string = "{k1:value1,k2:value2}";
      const slicedString: string = originalString.substring(0, originalString.length - 2);
      const builder: StringBuilder = new StringBuilder(slicedString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(slicedString);
      expect(length).assertEqual(slicedString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5600
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_INVALID_UNICODE_TEST5600
     * @tc.desc: Test StringBuilder constructor with invalid Unicode codes
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const invalidUnicode: string = "\udc04\ud83d\udff4";
      const builder: StringBuilder = new StringBuilder(invalidUnicode);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(invalidUnicode);
      expect(length).assertEqual(invalidUnicode.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5700
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_APPEND_AFTER_TEST5700
     * @tc.desc: Test StringBuilder constructor then append more content
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Initial: ");
      builder.append("More Content");
      builder.append(123 as byte);
      builder.append(true);

      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("Initial: More Content123true");
      expect(length).assertEqual("Initial: More Content123true".length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5800
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_WHITESPACE_TEST5800
     * @tc.desc: Test StringBuilder constructor with whitespace characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const whitespaceString: string = "  \t\n\r  ";
      const builder: StringBuilder = new StringBuilder(whitespaceString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(whitespaceString);
      expect(length).assertEqual(whitespaceString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor5900
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_NUMBERS_TEST5900
     * @tc.desc: Test StringBuilder constructor with number strings
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberString: string = "123.456-789";
      const builder: StringBuilder = new StringBuilder(numberString);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual(numberString);
      expect(length).assertEqual(numberString.length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6000
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_CHARS_EMPTY_TEST6000
     * @tc.desc: Test StringBuilder constructor with empty char array
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charArray: char[] = [];
      const builder: StringBuilder = new StringBuilder(charArray);
      const result: string = builder.toString();
      const length: int = builder.stringLength;
      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });
    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6100
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_EMPTY_TEST6100
     * @tc.desc: Test StringBuilder constructor with empty FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("");
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6200
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_SIMPLE_TEST6200
     * @tc.desc: Test StringBuilder constructor with simple FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Hello");
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("Hello");
      expect(length).assertEqual(5);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6300
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_HELLO_WORLD_TEST6300
     * @tc.desc: Test StringBuilder constructor with HelloWorld FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const helloWorldStr: string = "HelloWorld123?";
      const builder: StringBuilder = new StringBuilder(helloWorldStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("HelloWorld123?");
      expect(length).assertEqual(14);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6400
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_WITH_ZEROS_TEST6400
     * @tc.desc: Test StringBuilder constructor with FixedArray<char> containing zeros
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let testString: string = "HelloWorld";
      for (let i = 0; i < 5; i++) {
        testString += String.fromCharCode(0);
      }
      testString += "123?";

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(length).assertEqual(19);
      expect(result.substring(0, 10)).assertEqual("HelloWorld");
      expect(result.charCodeAt(10)).assertEqual(0);
      expect(result.charCodeAt(11)).assertEqual(0);
      expect(result.charCodeAt(12)).assertEqual(0);
      expect(result.charCodeAt(13)).assertEqual(0);
      expect(result.charCodeAt(14)).assertEqual(0);
      expect(result.substring(15)).assertEqual("123?");
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6500
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_FULL_RANGE_TEST6500
     * @tc.desc: Test StringBuilder constructor with full char range in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charCodes: number[] = [0, 1, 127, 255, 1000, 32767, 65535];
      let testString: string = "";
      for (const code of charCodes) {
        testString += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(length).assertEqual(7);
      for (let i = 0; i < charCodes.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(charCodes[i]);
      }
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6600
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_SPECIAL_CHARS_TEST6600
     * @tc.desc: Test StringBuilder constructor with special characters in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialStr: string = "!\"#$%&'()*+,-./";
      const builder: StringBuilder = new StringBuilder(specialStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("!\"#$%&'()*+,-./");
      expect(length).assertEqual(15);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6700
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_ASCII_TEST6700
     * @tc.desc: Test StringBuilder constructor with ASCII characters in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const asciiStr: string = "0123456789ABCDEFGHIJabcdefghij";
      const builder: StringBuilder = new StringBuilder(asciiStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("0123456789ABCDEFGHIJabcdefghij");
      expect(length).assertEqual(30);
    });



    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6800
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_APPEND_AFTER_TEST6800
     * @tc.desc: Test StringBuilder constructor with FixedArray<char> then append more content
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Start: ");
      builder.append(" Additional Text ");
      builder.append("123");
      builder.append("true");

      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("Start:  Additional Text 123true");
      expect(length).assertEqual("Start:  Additional Text 123true".length);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor6900
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_MIXED_VALUES_TEST6900
     * @tc.desc: Test StringBuilder constructor with mixed char values in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charCodes: number[] = [10, 32, 65, 97, 255, 1000, 2000, 65535];
      let testString: string = "";
      for (const code of charCodes) {
        testString += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;

      expect(length).assertEqual(8);
      for (let i = 0; i < charCodes.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(charCodes[i]);
      }
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7000
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_REPEATED_TEST7000
     * @tc.desc: Test StringBuilder constructor with repeated char values in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const repeatedStr: string = "aaaaabbbcc";
      const builder: StringBuilder = new StringBuilder(repeatedStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("aaaaabbbcc");
      expect(length).assertEqual(10);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7100
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_SINGLE_CHAR_TEST7100
     * @tc.desc: Test StringBuilder constructor with single char in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("X");
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("X");
      expect(length).assertEqual(1);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7200
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_CONTROL_CHARS_TEST7200
     * @tc.desc: Test StringBuilder constructor with control characters in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const controlCodes: number[] = [7, 8, 9, 10, 11, 12, 13, 27];
      let testString: string = "";
      for (const code of controlCodes) {
        testString += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(length).assertEqual(8);
      for (let i = 0; i < controlCodes.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(controlCodes[i]);
      }
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7300
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_FIXED_CHARS_NUMERIC_TEST7300
     * @tc.desc: Test StringBuilder constructor with numeric char values in FixedArray<char>
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numericStr: string = "01234";
      const builder: StringBuilder = new StringBuilder(numericStr);
      const result: string = builder.toString();
      const length: int = result.length;
      expect(result).assertEqual("01234");
      expect(length).assertEqual(5);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7400
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_EMPTY_TEST7400
     * @tc.desc: Test StringBuilder default constructor (empty)
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const result: string = builder.toString();
      const length: int = result.length;

      expect(result).assertEqual("");
      expect(length).assertEqual(0);
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7500
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_STRING_TEST7500
     * @tc.desc: Test StringBuilder constructor with string parameter
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testString: string = "Hello World";
      const builder: StringBuilder = new StringBuilder(testString);
      const result: string = builder.toString();
      const length: int = result.length;

      expect(result).assertEqual("Hello World");
      expect(length).assertEqual(11);
    });


    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7600
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_BOOLEAN_TEST7600
     * @tc.desc: Test StringBuilder constructor with boolean parameters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder(true.toString());
      const result1: string = builder1.toString();
      expect(result1).assertEqual("true");

      const builder2: StringBuilder = new StringBuilder(false.toString());
      const result2: string = builder2.toString();
      expect(result2).assertEqual("false");
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7700
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_EMPTY_STRING_TEST7700
     * @tc.desc: Test StringBuilder constructor with empty string
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder("");
      const result1: string = builder1.toString();
      expect(result1).assertEqual("");
      expect(result1.length).assertEqual(0);

      const builder2: StringBuilder = new StringBuilder("");
      builder2.append("");
      builder2.append("");
      const result2: string = builder2.toString();
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7800
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_SPECIAL_CHARS_TEST7800
     * @tc.desc: Test StringBuilder constructor with special characters
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const builder: StringBuilder = new StringBuilder(specialChars);
      const result: string = builder.toString();

      expect(result).assertEqual(specialChars);
      expect(result.length).assertEqual(32);

      for (let i = 0; i < specialChars.length; i++) {
        expect(result.charAt(i)).assertEqual(specialChars.charAt(i));
      }
    });



    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor7900
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_ARRAY_TEST7900
     * @tc.desc: Test StringBuilder constructor with array-like inputs
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const array1: number[] = [72, 101, 108, 108, 111];
      const arrayStr1: string = String.fromCharCode(...array1);
      const builder1: StringBuilder = new StringBuilder(arrayStr1);
      const result1: string = builder1.toString();
      expect(result1).assertEqual("Hello");

      const array2: number[] = [72, 101, 108, 108, 111, 0, 0, 0, 87, 111, 114, 108, 100];
      let arrayStr2: string = "";
      for (const code of array2) {
        arrayStr2 += String.fromCharCode(code);
      }
      const builder2: StringBuilder = new StringBuilder(arrayStr2);
      const result2: string = builder2.toString();
      expect(result2.length).assertEqual(array2.length);
      expect(result2.charCodeAt(5)).assertEqual(0);
      expect(result2.charCodeAt(6)).assertEqual(0);
      expect(result2.charCodeAt(7)).assertEqual(0);

      const array3: number[] = [72, 101, 108, 108, 111, -111, 114, 108, 100];
      let arrayStr3: string = "";
      for (const code of array3) {
        const normalizedCode = code < 0 ? 256 + (code % 256) : code;
        arrayStr3 += String.fromCharCode(normalizedCode);
      }
      const builder3: StringBuilder = new StringBuilder(arrayStr3);
      const result3: string = builder3.toString();
      expect(result3.length).assertEqual(array3.length);

      const emptyArray: number[] = [];
      const emptyStr: string = "";
      const builder4: StringBuilder = new StringBuilder(emptyStr);
      const result4: string = builder4.toString();
      expect(result4).assertEqual("");
      expect(result4.length).assertEqual(0);
    });



    /**
     *
     * @tc.name: BuiltinsStringBuilderTestConstructor8000
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_TYPEDARRAY_TEST8000
     * @tc.desc: Test StringBuilder constructor with TypedArray inputs
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const int8Array = new Int8Array([-128, -1, 0, 127, 128]);
      let int8Str: string = "";
      for (let i = 0; i < int8Array.length; i++) {
        int8Str += String.fromCharCode(int8Array[i] & 0xFF);
      }
      const builder1: StringBuilder = new StringBuilder(int8Str);
      const result1: string = builder1.toString();
      expect(result1.length).assertEqual(5);

      const uint8Array = new Uint8Array([0, 255, 256, -1]);
      let uint8Str: string = "";
      for (let i = 0; i < uint8Array.length; i++) {
        uint8Str += String.fromCharCode(uint8Array[i]);
      }
      const builder2: StringBuilder = new StringBuilder(uint8Str);
      const result2: string = builder2.toString();
      expect(result2.length).assertEqual(4);
      expect(result2.charCodeAt(1)).assertEqual(255);


    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor8100
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_BOUNDARY_TEST8100
     * @tc.desc: Test StringBuilder constructor boundary cases
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boundaryChars: number[] = [
        0,
        1,
        127,
        255,
        1000,
        32767,
        65535
      ];

      let boundaryStr: string = "";
      for (const code of boundaryChars) {
        boundaryStr += String.fromCharCode(code);
      }

      const builder: StringBuilder = new StringBuilder(boundaryStr);
      const result: string = builder.toString();

      expect(result.length).assertEqual(boundaryChars.length);
      for (let i = 0; i < boundaryChars.length; i++) {
        expect(result.charCodeAt(i)).assertEqual(boundaryChars[i]);
      }
    });

    /**
     * @tc.name: BuiltinsStringBuilderTestConstructor8200
     * @tc.number: BUILTINS_STRING_BUILDER_CONSTRUCTOR_CHAIN_TEST8200
     * @tc.desc: Test StringBuilder constructor chaining operations
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('BuiltinsStringBuilderTestConstructor8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder("Start");
      builder.append(" Middle");
      builder.append(" End");

      const result: string = builder.toString();
      expect(result).assertEqual("Start Middle End");

      const builder2: StringBuilder = new StringBuilder("");
      for (let i = 0; i < 10; i++) {
        builder2.append(i.toString());
      }

      const result2: string = builder2.toString();
      expect(result2).assertEqual("0123456789");
    });

  })
}