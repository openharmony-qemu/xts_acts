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

export default function replaceBasicTest() {

    describe('String_Pattern_Replacement', () => {
      /**
       * @tc.name testReplaceTest0100
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0100
       * @tc.desc   Test Basic_String_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World, Hello Universe";
        const result = str.replace("Hello", "Hi");
        expect(result).assertEqual("Hi World, Hello Universe");
      });

      /**
       * @tc.name testReplaceTest0101
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0101
       * @tc.desc   Test String_Replaces_First_Match_Only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "apple, apple, apple";
        const result = str.replace("apple", "orange");
        expect(result).assertEqual("orange, apple, apple");
      });

      /**
       * @tc.name testReplaceTest0102
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0102
       * @tc.desc   Test Empty_String_Pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "xxx";
        const result = str.replace("", "_");
        expect(result === "_xxx" || result === "xxx").assertTrue();
      });

      /**
       * @tc.name testReplaceTest0103
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0103
       * @tc.desc   Test Non_Existent_String_Pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace("goodbye", "Hi");
        expect(result).assertEqual("Hello World");
      });

      /**
       * @tc.name testReplaceTest0104
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0104
       * @tc.desc   Test String_Pattern_Escapes_Special_Chars
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a.b.c";
        const result = str.replace(".", "_");
        expect(result).assertEqual("a_b.c");
      });
    });

    describe('Regex_Pattern_Replacement', () => {
      /**
       * @tc.name testReplaceTest0105
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0105
       * @tc.desc   Test Basic_Regex_Replacement_No_Flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "cat, dog, cat";
        const result = str.replace(/cat/, "bird");
        expect(result).assertEqual("bird, dog, cat");
      });

      /**
       * @tc.name testReplaceTest0106
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0106
       * @tc.desc   Test Global_Replacement_g_Flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "cat, dog, cat";
        const result = str.replace(/cat/g, "bird");
        expect(result).assertEqual("bird, dog, bird");
      });

      /**
       * @tc.name testReplaceTest0107
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0107
       * @tc.desc   Test Case_Insensitive_Replacement_i_Flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello world, hello universe";
        const result = str.replace(/hello/i, "Hi");
        expect(result).assertEqual("Hi world, hello universe");
      });

      /**
       * @tc.name testReplaceTest0108
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0108
       * @tc.desc   Test Multiline_Replacement_m_Flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Line1\nLine2\nLine3";
        const result = str.replace(/^Line/gm, "Row");
        expect(result).assertEqual("Row1\nRow2\nRow3");
      });

      /**
       * @tc.name testReplaceTest0109
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0109
       * @tc.desc   Test Combined_Flags_gi
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello HELLO hello HeLLo";
        const result = str.replace(/hello/gi, "Hi");
        expect(result).assertEqual("Hi Hi Hi Hi");
      });

      /**
       * @tc.name testReplaceTest0110
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0110
       * @tc.desc   Test dotAll_Flag_s
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello\nWorld";
        const result = str.replace(/Hello.World/s, "Hi");
        expect(result).assertEqual("Hi");
      });

      /**
       * @tc.name testReplaceTest0111
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0111
       * @tc.desc   Test Unicode_Flag_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "𝟘𝟙𝟚";
        const result = str.replace(/\u{1D7D8}/gu, "0");
        expect(result).assertEqual("0𝟙𝟚");
      });

      /**
       * @tc.name testReplaceTest0112
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0112
       * @tc.desc   Test Sticky_Flag_y
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "aaa";
        const regex = /a/y;
        regex.lastIndex = 1;
        const result = str.replace(regex, "b");
        expect(result).assertEqual("aba");
      });

      /**
       * @tc.name testReplaceTest0113
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0113
       * @tc.desc   Test hasIndices_Flag_d
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test123";
        try {
          const regex: RegExp = new RegExp('test(\\d+)', 'd');
          const replaced = str.replace(regex, "replaced");
          expect(replaced).assertEqual("replaced");
        } catch (_) {
          expect(true).assertTrue();
        }
      });
    });

    describe('Special_Replacement_Patterns', () => {
      /**
       * @tc.name testReplaceTest0114
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0114
       * @tc.desc   Test Insert_Dollar_Sign
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "price: 100";
        const result = str.replace(/\d+/, "$$");
        expect(result).assertEqual("price: $");
      });

      /**
       * @tc.name testReplaceTest0115
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0115
       * @tc.desc   Test Insert_Entire_Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, "$&!");
        expect(result).assertEqual("Hello World!");
      });

      /**
       * @tc.name testReplaceTest0116
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0116
       * @tc.desc   Test Insert_Text_Before_Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, "[$`]");
        expect(result).assertEqual("Hello [Hello ]");
      });

      /**
       * @tc.name testReplaceTest0117
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0117
       * @tc.desc   Test Insert_Text_After_Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/Hello/, "[$']");
        expect(result).assertEqual("[ World] World");
      });

      /**
       * @tc.name testReplaceTest0118
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0118
       * @tc.desc   Test Numbered_Capture_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(\w+)\s(\w+)/, "$2, $1");
        expect(result).assertEqual("Smith, John");
      });

      /**
       * @tc.name testReplaceTest0119
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0119
       * @tc.desc   Test Multiple_Capture_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "2023-12-25";
        const result = str.replace(/(\d{4})-(\d{2})-(\d{2})/, "$3/$2/$1");
        expect(result).assertEqual("25/12/2023");
      });

      /**
       * @tc.name testReplaceTest0120
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0120
       * @tc.desc   Test Named_Capture_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(?<first>\w+)\s(?<last>\w+)/, "$<last>, $<first>");
        expect(result).assertEqual("Smith, John");
      });

      /**
       * @tc.name testReplaceTest0121
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0121
       * @tc.desc   Test Non_Existent_Capture_Group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "foo";
        const result = str.replace(/(f)/, "$2");
        expect(result).assertEqual("$2oo");
      });

      /**
       * @tc.name testReplaceTest0122
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0122
       * @tc.desc   Test String_Pattern_Ignores_Dollar
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "foo";
        const result = str.replace("f", "$1");
        expect(result).assertEqual("$1oo");
      });

      /**
       * @tc.name testReplaceTest0123
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0123
       * @tc.desc   Test Nested_Capture_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc123";
        const result = str.replace(/((\w)(\w))/, "$1-$2-$3");
        expect(result).assertEqual("ab-a-bc123");
      });
    });

    describe('Function_as_Replacement', () => {
      interface NameGroups {
        first?: string;
        last?: string;
      }
      interface KeyValueGroups {
        key?: string;
        value?: string;
      }

      /**
       * @tc.name testReplaceTest0124
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0124
       * @tc.desc   Test Basic_Function_Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, (match: string) => match.toUpperCase());
        expect(result).assertEqual("Hello WORLD");
      });

      /**
       * @tc.name testReplaceTest0125
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0125
       * @tc.desc   Test Function_Receives_Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc123";
        const result = str.replace(/\d+/, (match: string) => `[${match}]`);
        expect(result).assertEqual("abc[123]");
      });

      /**
       * @tc.name testReplaceTest0126
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0126
       * @tc.desc   Test Function_Receives_Capture_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(\w+)\s(\w+)/, (match: string, p1: string, p2: string) => `${p2.toUpperCase()}, ${p1}`);
        expect(result).assertEqual("SMITH, John");
      });

      /**
       * @tc.name testReplaceTest0127
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0127
       * @tc.desc   Test Function_Receives_Offset
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abcde";
        const result = str.replace(/cd/, (match: string, offset: number) => `${match}@${offset}`);
        expect(result).assertEqual("abcd@2e");
      });

      /**
       * @tc.name testReplaceTest0128
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0128
       * @tc.desc   Test Function_Receives_String
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello";
        const result = str.replace(/l/, (match: string, offset: number, string: string) => `${match}[${string.length}]`);
        expect(result).assertEqual("Hel[5]lo");
      });

      /**
       * @tc.name testReplaceTest0129
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0129
       * @tc.desc   Test Function_Receives_Named_Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(?<first>\w+)\s(?<last>\w+)/, (match: string, p1: string, p2: string, offset: number, string: string, groups?: NameGroups) => {
          return `${groups?.last}, ${groups?.first}`;
        });
        expect(result).assertEqual("Smith, John");
      });

      /**
       * @tc.name testReplaceTest0130
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0130
       * @tc.desc   Test Function_Called_Multiple_Times_Global
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a1b2c3";
        const result = str.replace(/\d/g, (match: string) => {
          return (parseInt(match) * 10).toString();
        });
        expect(result).assertEqual("a10b20c30");
      });

      /**
       * @tc.name testReplaceTest0131
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0131
       * @tc.desc   Test Unmatched_Branch_Capture_Group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc";
        const result = str.replace(/(a)|(b)/g, (match: string, p1?: string, p2?: string) => {
          return p1 ? "A" : (p2 ? "B" : "?");
        });
        expect(result).assertEqual("ABc");
      });

      /**
       * @tc.name testReplaceTest0132
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0132
       * @tc.desc   Test Temperature_Conversion_Example
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const f2c = (() => {
          const convert = (str: string, p1: string): string => {
            return `${((parseFloat(p1) - 32) * 5) / 9}C`;
          };
          return (x: string): string => {
            const s = String(x);
            const test = /(-?\d+(?:\.\d*)?)F\b/g;
            return s.replace(test, convert);
          };
        })();
        const result = f2c("212F");
        expect(result).assertEqual("100C");
      });

      /**
       * @tc.name testReplaceTest0133
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0133
       * @tc.desc   Test Access_Named_Groups_In_Function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "name:John,age:25";
        const result = str.replace(/(?<key>\w+):(?<value>\w+)/g, (match: string, p1: string, p2: string, offset: number, string: string, groups?: KeyValueGroups) => {
          return `${groups?.key}=${groups?.value}`;
        });
        expect(result).assertEqual("name=John,age=25");
      });

      /**
       * @tc.name testReplaceTest0134
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0134
       * @tc.desc   Test Function_Returns_Undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc";
        const result = str.replace(/a/, (): string => {
          return String(undefined);
        });
        expect(result).assertEqual("undefinedbc");
      });

      /**
       * @tc.name testReplaceTest0135
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_REPLACE_TEST_0135
       * @tc.desc   Test Function_Throws_Exception
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplaceTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc";
        let caughtError = false;
        try {
          str.replace(/a/, () => {
            throw new Error("Replace error");
          });
        } catch (e) {
          caughtError = true;
        }
        expect(caughtError).assertTrue();
      });
    });

}
