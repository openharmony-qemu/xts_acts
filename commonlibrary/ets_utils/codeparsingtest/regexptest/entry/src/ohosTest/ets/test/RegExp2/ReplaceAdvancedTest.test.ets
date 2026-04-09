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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function replaceAdvancedTest() {

    describe('lastIndex_Property_Tests', () => {
      /**
       * @tc.name testReplaceTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0100
       * @tc.desc   Non-global replace honors lastIndex as search start
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc abc";
        const regex = /abc/;
        regex.lastIndex = 4;
        const result = str.replace(regex, "XYZ");
        expect(result).assertEqual("XYZ abc");
      });

      /**
       * @tc.name testReplaceTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0101
       * @tc.desc   Global replace replaces all matches and resets lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc abc abc";
        const regex = /abc/g;
        regex.lastIndex = 4;
        const result = str.replace(regex, "XYZ");
        expect(result).assertEqual("XYZ XYZ XYZ");
        expect(regex.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name testReplaceTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0102
       * @tc.desc   Sticky replace respects lastIndex positioning
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "aaa";
        const regex = /a/y;
        regex.lastIndex = 1;
        const result = str.replace(regex, "b");
        expect(result).assertEqual("aba");
      });

      /**
       * @tc.name testReplaceTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0103
       * @tc.desc   Global replace after manually setting lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test test";
        const regex = /test/g;
        regex.lastIndex = 5;
        const result = str.replace(regex, "XYZ");
        expect(result).assertEqual("XYZ XYZ");
        expect(regex.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name testReplaceTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0104
       * @tc.desc   lastIndex returns to zero after global replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc abc";
        const regex = /abc/g;
        const before = regex.lastIndex;
        str.replace(regex, "XYZ");
        const after = regex.lastIndex;
        expect(after).assertEqual(0);
      });
    });

    describe('ReplaceAdvanced_Boundary_Value_Tests', () => {
      /**
       * @tc.name testReplaceTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0105
       * @tc.desc   Replace on empty source string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "";
        const result = str.replace(/a/, "b");
        expect(result).assertEqual("");
      });

      /**
       * @tc.name testReplaceTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0106
       * @tc.desc   Empty-match regex inserts replacement at position zero
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test";
        const result = str.replace(/(?:)/, "_");
        expect(result).assertEqual("_test");
      });

      /**
       * @tc.name testReplaceTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0107
       * @tc.desc   Single-character string replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a";
        const result = str.replace(/a/, "b");
        expect(result).assertEqual("b");
      });

      /**
       * @tc.name testReplaceTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0108
       * @tc.desc   Long string global replace preserves length
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a".repeat(10000);
        const result = str.replace(/a/g, "b");
        expect(result.length).assertEqual(10000);
        expect(result).assertEqual("b".repeat(10000));
      });

      /**
       * @tc.name testReplaceTest0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0109
       * @tc.desc   Replace matched segment with empty string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, "");
        expect(result).assertEqual("Hello ");
      });

      /**
       * @tc.name testReplaceTest0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0110
       * @tc.desc   Replace whole string using start/end anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello";
        const result = str.replace(/^.*$/, "Bye");
        expect(result).assertEqual("Bye");
      });

      /**
       * @tc.name testReplaceTest0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0111
       * @tc.desc   Emoji replace with Unicode flag on surrogate pairs
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "\uD83D\uDE00\uD83D\uDE00";
        const resultWithU = str.replace(/\uD83D\uDE00/gu, "X");
        expect(resultWithU).assertEqual("XX");
      });
    });

    describe('Special_Chars_And_Unicode', () => {
      /**
       * @tc.name testReplaceTest0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0112
       * @tc.desc   Replace newline and tab with spaces
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello\nWorld\t!";
        const result = str.replace(/\n/g, " ").replace(/\t/g, "  ");
        expect(result).assertEqual("Hello World  !");
      });

      /**
       * @tc.name testReplaceTest0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0113
       * @tc.desc   Replace accented Unicode character
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "caf\u00e9";
        const result = str.replace(/\u00e9/, "e");
        expect(result).assertEqual("cafe");
      });

      /**
       * @tc.name testReplaceTest0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0114
       * @tc.desc   Replace emoji in plain text
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello \uD83D\uDE00 World";
        const result = str.replace(/\uD83D\uDE00/g, ":-)");
        expect(result).assertEqual("Hello :-) World");
      });

      /**
       * @tc.name testReplaceTest0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0115
       * @tc.desc   Replace Unicode math digit with u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const mathSansHigh = 55349;
        const mathSansDigitZeroLow = 57240;
        const mathSansDigitOneLow = 57241;
        const mathSansDigitTwoLow = 57242;
        const mathZero = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow);
        const str = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow, mathSansHigh, mathSansDigitOneLow,
          mathSansHigh, mathSansDigitTwoLow);
        const result = str.replace(new RegExp(mathZero, 'gu'), '0');
        const digitOne = String.fromCharCode(mathSansHigh, mathSansDigitOneLow);
        const digitTwo = String.fromCharCode(mathSansHigh, mathSansDigitTwoLow);
        expect(result).assertEqual('0' + digitOne + digitTwo);
      });

      /**
       * @tc.name testReplaceTest0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0116
       * @tc.desc   Surrogate pair handling with and without global u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "\uD83D\uDE00\uD83D\uDE00";
        const result1 = str.replace(/\uD83D\uDE00/u, "X");
        const result2 = str.replace(/\uD83D\uDE00/gu, "X");
        expect(result1).assertEqual("X\uD83D\uDE00");
        expect(result2).assertEqual("XX");
      });

      /**
       * @tc.name testReplaceTest0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0117
       * @tc.desc   Combining character replace with u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "e\u0301";
        const result = str.replace(/\u0301/u, "");
        expect(result).assertEqual("e");
      });

      /**
       * @tc.name testReplaceTest0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0118
       * @tc.desc   Partial replace in complex emoji sequence
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "\uD83D\uDE00\uD83D\uDE00\uD83D\uDE00";
        const result = str.replace(/\uD83D\uDE00/gu, "XX");
        expect(result).not().assertEqual(str);
      });

      /**
       * @tc.name testReplaceTest0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0119
       * @tc.desc   Unicode property escape Script=Greek
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "ABC \u03b1\u03b2\u03b3";
        const result = str.replace(/\p{Script=Greek}/gu, "X");
        expect(result).assertEqual("ABC XXX");
      });
    });

    describe('Regex_Flag_Interactions', () => {
      /**
       * @tc.name testReplaceTest0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0120
       * @tc.desc   Sticky y flag replace with lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "aaa";
        const regex = /a/y;
        regex.lastIndex = 1;
        const result = str.replace(regex, "b");
        expect(result).assertEqual("aba");
      });

      /**
       * @tc.name testReplaceTest0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0121
       * @tc.desc   dotAll s flag matches across newline
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello\nWorld";
        const result = str.replace(/Hello.World/s, "Hi");
        expect(result).assertEqual("Hi");
      });

      /**
       * @tc.name testReplaceTest0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0122
       * @tc.desc   Combined gim and sm flag replace behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Test\nTEST\ntest";
        const result1 = str.replace(/test/gim, "XYZ");
        const result2 = str.replace(/.+/sm, "ABC");
        expect(result1).assertEqual("XYZ\nXYZ\nXYZ");
        expect(result2).assertEqual("ABC");
      });

      /**
       * @tc.name testReplaceTest0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0123
       * @tc.desc   Compare first-only vs global replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test test test";
        const result1 = str.replace(/test/, "XYZ");
        const result2 = str.replace(/test/g, "XYZ");
        expect(result1).assertEqual("XYZ test test");
        expect(result2).assertEqual("XYZ XYZ XYZ");
      });
    });

}
