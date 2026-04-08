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
import { regexpSymbolMatchAll } from './RegExpHelper';

interface GroupsType {
  year?: [number, number];
  month?: [number, number];
  day?: [number, number];
  word?: [number, number];
}

interface IndicesArrayType extends Array<[number, number]> {
  groups?: GroupsType;
}

interface SafeRegExpMatchArray extends RegExpMatchArray {
  indices?: IndicesArrayType;
}

export default function matchAllCompleteTest() {

    describe('Sticky_Flag_y_Tests', () => {
      /**
      * @tc.name testMatchAllTest0100
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0100
       * @tc.desc   Test RegExp[Symbol.matchAll] sticky matches from lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /[abc]/gy;
        const str: string = "ab-c";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("a");
        expect(results[1][0]).assertEqual("b");
      });

      /**
      * @tc.name testMatchAllTest0101
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0101
       * @tc.desc   Test RegExp[Symbol.matchAll] sticky only matches at lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/gy;
        regex.lastIndex = 3;
        const str: string = "testest";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("test");
        expect(results[0].index).assertEqual(3);
      });
    });

    describe('Unicode_Flag_u_Tests', () => {
      /**
      * @tc.name testMatchAllTest0102
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0102
       * @tc.desc   Test RegExp[Symbol.matchAll] emoji matches with u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /😀+/gu;
        const str: string = "😀😀😀";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("😀😀😀");
      });

      /**
      * @tc.name testMatchAllTest0103
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0103
       * @tc.desc   Test RegExp[Symbol.matchAll] surrogate pairs match correctly with u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /./gu;
        const str: string = "𝌆𝌆";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("𝌆");
        expect(results[1][0]).assertEqual("𝌆");
      });
    });

    describe('DotAll_Flag_s_Tests', () => {
      /**
      * @tc.name testMatchAllTest0104
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0104
       * @tc.desc   Test RegExp[Symbol.matchAll] dotAll s matches newline
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /a.b/gs;
        const str: string = "a\nb a\tb";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("a\nb");
        expect(results[1][0]).assertEqual("a\tb");
      });
    });

    describe('Multiline_Flag_m_Tests', () => {
      /**
      * @tc.name testMatchAllTest0105
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0105
       * @tc.desc   Test RegExp[Symbol.matchAll] multiline m line start anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /^test/gm;
        const str: string = "test\ntest";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0].index).assertEqual(0);
        expect(results[1].index).assertEqual(5);
      });
    });

    describe('Ignore_Case_Flag_i_Tests', () => {
      /**
      * @tc.name testMatchAllTest0106
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0106
       * @tc.desc   Test RegExp[Symbol.matchAll] ignoreCase i matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/gi;
        const str: string = "TEST test TeSt";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(3);
        expect(results[0][0]).assertEqual("TEST");
        expect(results[1][0]).assertEqual("test");
        expect(results[2][0]).assertEqual("TeSt");
      });
    });

    describe('Flag_Combination_Tests', () => {
      /**
      * @tc.name testMatchAllTest0107
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0107
       * @tc.desc   Test RegExp[Symbol.matchAll] g and i flags combination
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/gi;
        const str: string = "TEST test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
      });

      /**
      * @tc.name testMatchAllTest0108
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0108
       * @tc.desc   Test RegExp[Symbol.matchAll] g i m flags combination
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/gim;
        const str: string = "TEST\nTest";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
      });
    });

    describe('MatchAll_Capture_Group_Tests', () => {
      /**
      * @tc.name testMatchAllTest0109
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0109
       * @tc.desc   Test RegExp[Symbol.matchAll] single capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /t(e)st/g;
        const str: string = "test test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("test");
        expect(results[0][1]).assertEqual("e");
        expect(results[1][1]).assertEqual("e");
      });

      /**
      * @tc.name testMatchAllTest0110
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0110
       * @tc.desc   Test RegExp[Symbol.matchAll] multiple capture groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /(\w+)\s+(\w+)/g;
        const str: string = "hello world foo bar";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][1]).assertEqual("hello");
        expect(results[0][2]).assertEqual("world");
        expect(results[1][1]).assertEqual("foo");
        expect(results[1][2]).assertEqual("bar");
      });

      /**
      * @tc.name testMatchAllTest0111
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0111
       * @tc.desc   Test RegExp[Symbol.matchAll] nested capture groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /t(e)(st(\d?))/g;
        const str: string = "test1test2";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("test1");
        expect(results[0][1]).assertEqual("e");
        expect(results[0][2]).assertEqual("st1");
        expect(results[0][3]).assertEqual("1");
      });

      /**
      * @tc.name testMatchAllTest0112
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0112
       * @tc.desc   Test RegExp[Symbol.matchAll] non-capture groups are excluded
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /t(?:e)st/g;
        const str: string = "test test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results[0].length).assertEqual(1);
        expect(results[0][0]).assertEqual("test");
      });

      /**
      * @tc.name testMatchAllTest0113
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0113
       * @tc.desc   Test RegExp[Symbol.matchAll] named capture groups through groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/g;
        const str: string = "2024-01-15 and 2023-12-25";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        if (results[0].groups) {
          expect(results[0].groups.year).assertEqual("2024");
          expect(results[0].groups.month).assertEqual("01");
          expect(results[0].groups.day).assertEqual("15");
        }
        if (results[1].groups) {
          expect(results[1].groups.year).assertEqual("2023");
          expect(results[1].groups.month).assertEqual("12");
          expect(results[1].groups.day).assertEqual("25");
        }
      });

      /**
      * @tc.name testMatchAllTest0114
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0114
       * @tc.desc   Test RegExp[Symbol.matchAll] groups is undefined when no named groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results[0].groups).assertUndefined();
      });
    });

    describe('lastIndex_Behavior_Tests', () => {
      /**
      * @tc.name testMatchAllTest0115
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0115
       * @tc.desc   Test RegExp[Symbol.matchAll] lastIndex does not change original regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /[a-c]/g;
        const originalLastIndex: number = 1;
        regex.lastIndex = originalLastIndex;
        const str: string = "abc";
        Array.from<RegExpMatchArray>(regexpSymbolMatchAll(regex, str));
        expect(regex.lastIndex).assertEqual(originalLastIndex);
      });

      /**
      * @tc.name testMatchAllTest0116
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0116
       * @tc.desc   Test RegExp[Symbol.matchAll] lastIndex starts from 0 by default
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        regex.lastIndex = 0;
        const str: string = "test test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
      });

      /**
      * @tc.name testMatchAllTest0117
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0117
       * @tc.desc   Test RegExp[Symbol.matchAll] lastIndex out of range returns no matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        regex.lastIndex = 100;
        const str: string = "test test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(0);
      });
    });

    describe('Iterator_Characteristic_Tests', () => {
      /**
      * @tc.name testMatchAllTest0118
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0118
       * @tc.desc   Test RegExp[Symbol.matchAll] iterator protocol next method
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "test test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(firstResult.done).assertFalse();
        expect(firstResult.value[0]).assertEqual("test");
        const secondResult: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(secondResult.done).assertFalse();
        expect(secondResult.value[0]).assertEqual("test");
        const thirdResult: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(thirdResult.done).assertTrue();
      });

      /**
      * @tc.name testMatchAllTest0119
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0119
       * @tc.desc   Test RegExp[Symbol.matchAll] for-of iterator traversal
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456 789";
        let matchCount: number = 0;
        for (const match of regexpSymbolMatchAll(regex, str)) {
          matchCount++;
          expect(match[0]).not().assertEqual("");
        }
        expect(matchCount).assertEqual(3);
      });

      /**
      * @tc.name testMatchAllTest0120
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0120
       * @tc.desc   Test RegExp[Symbol.matchAll] Array.from conversion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "test test test";
        const matches: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(matches.length).assertEqual(3);
      });

      /**
      * @tc.name testMatchAllTest0121
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0121
       * @tc.desc   Test RegExp[Symbol.matchAll] explicit Array.from conversion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456 789";
        const matches: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(matches.length).assertEqual(3);
        expect(matches[0][0]).assertEqual("123");
        expect(matches[1][0]).assertEqual("456");
        expect(matches[2][0]).assertEqual("789");
      });

      /**
      * @tc.name testMatchAllTest0122
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0122
       * @tc.desc   Test RegExp[Symbol.matchAll] iterator partial consumption state
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456 789";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        iterator.next();
        const remaining: RegExpMatchArray[] = Array.from(iterator);
        expect(remaining.length).assertEqual(2);
        expect(remaining[0][0]).assertEqual("456");
        expect(remaining[1][0]).assertEqual("789");
      });
    });

    describe('MatchAllComplete_Boundary_Value_Tests', () => {
      /**
      * @tc.name testMatchAllTest0123
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0123
       * @tc.desc   Test RegExp[Symbol.matchAll] no matches returns empty results array
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "hello world";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(0);
      });

      /**
      * @tc.name testMatchAllTest0124
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0124
       * @tc.desc   Test RegExp[Symbol.matchAll] no matches iterator done immediately
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "hello";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const firstNext: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(firstNext.done).assertTrue();
        expect(firstNext.value).assertUndefined();
      });

      /**
      * @tc.name testMatchAllTest0125
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0125
       * @tc.desc   Test RegExp[Symbol.matchAll] zero-width assertions
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d(?=\.)/g;
        const str: string = "123.456";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("3");
      });

      /**
      * @tc.name testMatchAllTest0126
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0126
       * @tc.desc   Test RegExp[Symbol.matchAll] empty match returns empty string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /(?:)/g;
        const str: string = "abc";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(4);
        expect(results[0][0]).assertEqual("");
        expect(results[0].index).assertEqual(0);
        expect(results[3].index).assertEqual(3);
      });

      /**
      * @tc.name testMatchAllTest0127
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0127
       * @tc.desc   Test RegExp[Symbol.matchAll] empty string input returns no matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(0);
      });

      /**
      * @tc.name testMatchAllTest0128
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0128
       * @tc.desc   Test RegExp[Symbol.matchAll] empty string with empty match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /(?:)/g;
        const str: string = "";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("");
        expect(results[0].index).assertEqual(0);
      });

      /**
      * @tc.name testMatchAllTest0129
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0129
       * @tc.desc   Test RegExp[Symbol.matchAll] single character string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /a/g;
        const str: string = "a";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("a");
      });

      /**
      * @tc.name testMatchAllTest0130
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_MATCHALL_TEST_0130
       * @tc.desc   Test RegExp[Symbol.matchAll] special unicode characters
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAllTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /😀/gu;
        const str: string = "Hello 😀 World";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("😀");
      });
    });

}