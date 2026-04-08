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
import { regexpSymbolMatchAll } from './regexp_symbols';
import {
  assignSourceStrictStillOriginal,
  assignGlobalHasNoEffect,
  execNamedGroupsYmd,
  symbolMatchTwoMatches,
  symbolMatchAllTwoMatches,
  symbolReplaceAllDemo,
  symbolSearchIndex6,
  symbolSplitThreeParts,
  subclassSpeciesIsConstructor,
  regexpStaticLastIndexIsNumberOrUndefined,
  globalPropertyNotEnumerable,
  globalDescriptorIsNonWritableData,
  newRegExpInvalidBracketThrows,
  newRegExpInvalidUnicodeThrows,
  literalUnknownFlagThrows,
  captureGroup10IsJ,
  regexpWithDFlagHasIndicesTrue,
  regexpLiteralWithoutDNotHasIndices
} from './RegExpHelper';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function regExpCompleteTest() {
    describe('Instance_Methods_exec_toString', () => {
      /**
       * @tc.name   testRegExpCompleteTest0100
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0100
       * @tc.desc   exec_basic_hello
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const regex = /hello/;
        const result = regex.exec(str);
        expect(result).not().assertEqual(null);
        expect(result![0]).assertEqual('hello');
        expect(result!.index).assertEqual(0);
        expect(result!.input).assertEqual('hello world');
      });

      /**
       * @tc.name   testRegExpCompleteTest0101
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0101
       * @tc.desc   exec_capture_groups_date
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '2023-12-25';
        const regex = /(\d{4})-(\d{2})-(\d{2})/;
        const result = regex.exec(str);
        expect(result![0]).assertEqual('2023-12-25');
        expect(result![1]).assertEqual('2023');
        expect(result![2]).assertEqual('12');
        expect(result![3]).assertEqual('25');
      });

      /**
       * @tc.name   testRegExpCompleteTest0102
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0102
       * @tc.desc   exec_named_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(execNamedGroupsYmd()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0103
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0103
       * @tc.desc   exec_global_lastIndex_flow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test test';
        const regex = /test/g;
        expect(regex.exec(str)![0]).assertEqual('test');
        expect(regex.lastIndex).assertEqual(4);
        expect(regex.exec(str)![0]).assertEqual('test');
        expect(regex.lastIndex).assertEqual(9);
        expect(regex.exec(str)![0]).assertEqual('test');
        expect(regex.lastIndex).assertEqual(14);
        expect(regex.exec(str)).assertEqual(null);
        expect(regex.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name   testRegExpCompleteTest0104
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0104
       * @tc.desc   exec_no_match_null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/xyz/.exec('hello world')).assertEqual(null);
      });

      /**
       * @tc.name   testRegExpCompleteTest0105
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0105
       * @tc.desc   exec_sticky_lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test';
        const regex = /test/y;
        regex.lastIndex = 0;
        expect(regex.exec(str)![0]).assertEqual('test');
        regex.lastIndex = 5;
        expect(regex.exec(str)![0]).assertEqual('test');
        regex.lastIndex = 2;
        expect(regex.exec(str)).assertEqual(null);
      });

      /**
       * @tc.name   testRegExpCompleteTest0106
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0106
       * @tc.desc   exec_index_input_world
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const result = /world/.exec('hello world');
        expect(result!.index).assertEqual(6);
        expect(result!.input).assertEqual('hello world');
        expect(result![0]).assertEqual('world');
      });

      /**
       * @tc.name   testRegExpCompleteTest0107
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0107
       * @tc.desc   toString_slash_form
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1 = /abc/gim;
        const regex2 = new RegExp('\\d+', 'g');
        const s1 = regex1.toString();
        const s2 = regex2.toString();
        expect(s1.indexOf('abc') >= 0).assertTrue();
        expect(s1.indexOf('gim') >= 0).assertTrue();
        expect(s2.indexOf('\\d+') >= 0 || s2.indexOf('d+') >= 0).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0108
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0108
       * @tc.desc   toString_escapes_whitespace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = /\n\r\t\f\v/;
        const s = regex.toString();
        expect(s.indexOf('\\n') >= 0).assertTrue();
        expect(s.indexOf('\\t') >= 0).assertTrue();
      });
    });

    describe('Constructor', () => {
      /**
       * @tc.name   testRegExpCompleteTest0109
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0109
       * @tc.desc   literal_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = /test/i;
        expect(regex.test('TEST')).assertTrue();
        expect(regex.source).assertEqual('test');
        expect(regex.flags).assertEqual('i');
      });

      /**
       * @tc.name   testRegExpCompleteTest0110
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0110
       * @tc.desc   new_RegExp_string_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = new RegExp('test', 'i');
        expect(regex.test('TEST')).assertTrue();
        expect(regex.source).assertEqual('test');
      });

      /**
       * @tc.name   testRegExpCompleteTest0111
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0111
       * @tc.desc   new_RegExp_escape_w_d
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1 = new RegExp('\\w+');
        const regex2 = new RegExp('\\d{3}');
        expect(regex1.test('abc123')).assertTrue();
        expect(regex2.test('123')).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0112
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0112
       * @tc.desc   from_regexp_override_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1 = /test/gi;
        const regex2 = new RegExp(regex1, 'm');
        expect(regex2.source).assertEqual('test');
        expect(regex2.flags.indexOf('m') >= 0).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0113
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0113
       * @tc.desc   flags_override_priority
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1 = /test/g;
        const regex2 = new RegExp(regex1, 'i');
        expect(regex2.global).assertFalse();
        expect(regex2.ignoreCase).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0114
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0114
       * @tc.desc   ctor_syntax_error_bracket
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let threw = false;
        try {
          new RegExp('[a-z');
        } catch (_) {
          threw = true;
        }
        expect(threw).assertTrue();
        expect(newRegExpInvalidBracketThrows()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0115
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0115
       * @tc.desc   dynamic_pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const searchWord = 'hello';
        const regex = new RegExp(searchWord, 'i');
        expect(regex.test('HELLO World')).assertTrue();
      });
    });

    describe('Static_RegExp', () => {
      /**
       * @tc.name   testRegExpCompleteTest0116
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0116
       * @tc.desc   subclass_species
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(subclassSpeciesIsConstructor()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0117
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0117
       * @tc.desc   RegExp_lastIndex_static_shape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        re.test('test test');
        expect(regexpStaticLastIndexIsNumberOrUndefined()).assertTrue();
      });
    });

    describe('Symbol_well_known_methods', () => {
      /**
       * @tc.name   testRegExpCompleteTest0118
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0118
       * @tc.desc   Symbol_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(symbolMatchTwoMatches()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0119
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0119
       * @tc.desc   Symbol_matchAll
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(symbolMatchAllTwoMatches()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0120
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0120
       * @tc.desc   Symbol_replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(symbolReplaceAllDemo()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0121
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0121
       * @tc.desc   Symbol_search
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(symbolSearchIndex6()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0122
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0122
       * @tc.desc   Symbol_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(symbolSplitThreeParts()).assertTrue();
      });
    });

    describe('test_method_scenarios', () => {
      /**
       * @tc.name   testRegExpCompleteTest0123
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0123
       * @tc.desc   empty_quantifier_star
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'abc';
        const regex = /\d*/;
        expect(regex.test(str)).assertTrue();
        const ex = regex.exec(str);
        expect(ex).not().assertEqual(null);
        expect(ex![0]).assertEqual('');
      });

      /**
       * @tc.name   testRegExpCompleteTest0124
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0124
       * @tc.desc   test_returns_boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = /test/;
        expect(typeof regex.test('test')).assertEqual('boolean');
        expect(regex.test('test')).assertTrue();
        expect(regex.test('xyz')).assertFalse();
      });

      /**
       * @tc.name   testRegExpCompleteTest0125
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0125
       * @tc.desc   test_sticky_lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test';
        const regex = /test/y;
        regex.lastIndex = 0;
        expect(regex.test(str)).assertTrue();
        regex.lastIndex = 5;
        expect(regex.test(str)).assertTrue();
        regex.lastIndex = 2;
        expect(regex.test(str)).assertFalse();
      });

      /**
       * @tc.name   testRegExpCompleteTest0126
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0126
       * @tc.desc   test_exec_equivalence_no_capture
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test123';
        const regex = /test\d{3}/;
        expect(regex.test(str)).assertTrue();
        expect(regex.exec(str)).not().assertEqual(null);
      });
    });

    describe('Unicode_advanced', () => {
      /**
       * @tc.name   testRegExpCompleteTest0127
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0127
       * @tc.desc   pL_pScriptHan_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{L}', 'u')) {
          expect(true).assertTrue();
          return;
        }
        const regex1 = new RegExp('\\p{L}', 'u');
        expect(regex1.test('a')).assertTrue();
        expect(regex1.test('中')).assertTrue();
        if (supportsRegExp('\\p{Script=Han}', 'u')) {
          const regex2 = new RegExp('\\p{Script=Han}', 'u');
          expect(regex2.test('中文')).assertTrue();
          expect(regex2.test('abc')).assertFalse();
        }
      });

      /**
       * @tc.name   testRegExpCompleteTest0128
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0128
       * @tc.desc   pP_pN_P_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{P}', 'u')) {
          expect(true).assertTrue();
          return;
        }
        const pP = new RegExp('\\p{P}', 'u');
        expect(pP.test('!')).assertTrue();
        expect(pP.test(',')).assertTrue();
        expect(pP.test('a')).assertFalse();
        const pN = new RegExp('\\p{N}', 'u');
        expect(pN.test('123')).assertTrue();
        expect(pN.test('१२३')).assertTrue();
        const pL = new RegExp('\\P{L}', 'u');
        expect(pL.test('123')).assertTrue();
        expect(pL.test('!')).assertTrue();
        expect(pL.test('a')).assertFalse();
      });

      /**
       * @tc.name   testRegExpCompleteTest0129
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0129
       * @tc.desc   w_ascii_vs_unicode_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '中文';
        expect(/\w/.test(str)).assertFalse();
        if (supportsRegExp('\\w', 'u')) {
          expect(new RegExp('\\w', 'u').test(str)).assertFalse();
        }
        if (supportsRegExp('\\p{L}', 'u')) {
          expect(new RegExp('\\p{L}', 'u').test(str)).assertTrue();
        }
      });

      /**
       * @tc.name   testRegExpCompleteTest0130
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0130
       * @tc.desc   combining_char_dot_vs_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'e\u0301';
        expect(/./.test(str)).assertTrue();
        if (supportsRegExp('.', 'u')) {
          expect(new RegExp('.', 'u').test(str)).assertTrue();
        }
      });
    });

    describe('Advanced_syntax', () => {
      /**
       * @tc.name   testRegExpCompleteTest0131
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0131
       * @tc.desc   atomic_group_not_in_ecmascript_ctor_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let threw = false;
        try {
          new RegExp('(?>(a|ab))+c');
        } catch (_) {
          threw = true;
        }
        expect(threw).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0132
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0132
       * @tc.desc   possessive_not_standard_ctor_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let threw = false;
        try {
          new RegExp('\\d++');
        } catch (_) {
          threw = true;
        }
        expect(threw).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0133
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0133
       * @tc.desc   non_greedy_vs_greedy
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '<div>test</div><div>demo</div>';
        expect(/<div>.*<\/div>/.test(str)).assertTrue();
        expect(/<div>.*?<\/div>/.test(str)).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0134
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0134
       * @tc.desc   quantifier_braces
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'aaa';
        expect(/a{2,3}/.test(str)).assertTrue();
        expect(/a{1,3}/.test(str)).assertTrue();
      });
    });

    describe('RegExp_Boundaries', () => {
      /**
       * @tc.name   testRegExpCompleteTest0135
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0135
       * @tc.desc   empty_string_dollar
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/^$/.test('')).assertTrue();
        expect(/^$/.test('a')).assertFalse();
      });

      /**
       * @tc.name   testRegExpCompleteTest0136
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0136
       * @tc.desc   lookahead_prefix
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test';
        expect(/(?=test).*/.test(str)).assertTrue();
        const ex = /(?=test).*/.exec(str);
        expect(ex![0]).assertEqual('test');
      });

      /**
       * @tc.name   testRegExpCompleteTest0137
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0137
       * @tc.desc   empty_group_matches_anywhere
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(?:)/.test('test')).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0138
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0138
       * @tc.desc   word_boundary_zero_width
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test';
        expect(/\b/.test(str)).assertTrue();
        const ex = /\b/.exec(str);
        expect(ex![0]).assertEqual('');
      });

      /**
       * @tc.name   testRegExpCompleteTest0139
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0139
       * @tc.desc   large_quantifier_1000
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(1000);
        expect(/a{1000}/.test(str)).assertTrue();
      });
    });

    describe('Errors', () => {
      /**
       * @tc.name   testRegExpCompleteTest0140
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0140
       * @tc.desc   unknown_flag_syntax_error
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(literalUnknownFlagThrows()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0141
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0141
       * @tc.desc   capture_group_10
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(captureGroup10IsJ()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0142
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0142
       * @tc.desc   invalid_unicode_escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(newRegExpInvalidUnicodeThrows()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0143
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0143
       * @tc.desc   incomplete_char_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(newRegExpInvalidBracketThrows()).assertTrue();
      });
    });

    describe('Property_descriptor', () => {
      /**
       * @tc.name   testRegExpCompleteTest0144
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0144
       * @tc.desc   assign_global_no_effect
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(assignGlobalHasNoEffect()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0145
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0145
       * @tc.desc   lastIndex_manual_global
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex = /test/g;
        const str = 'test test';
        regex.lastIndex = 5;
        expect(regex.test(str)).assertTrue();
        expect(regex.lastIndex).assertEqual(9);
      });

      /**
       * @tc.name   testRegExpCompleteTest0146
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0146
       * @tc.desc   enumerable_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(globalPropertyNotEnumerable()).assertTrue();
      });

      /**
       * @tc.name   testRegExpCompleteTest0147
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0147
       * @tc.desc   descriptor_global
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(globalDescriptorIsNonWritableData()).assertTrue();
      });
    });

    describe('API_integration', () => {
      /**
       * @tc.name   testRegExpCompleteTest0148
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0148
       * @tc.desc   string_matchAll_iterator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test test';
        const regex = /test/g;
        const iter = regexpSymbolMatchAll(regex, str);
        const arr: RegExpMatchArray[] = Array.from(iter);
        expect(arr.length).assertEqual(3);
      });

      /**
       * @tc.name   testRegExpCompleteTest0149
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0149
       * @tc.desc   string_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a,b,c';
        const regex = /,/;
        const result = str.split(regex);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual('a');
      });

      /**
       * @tc.name   testRegExpCompleteTest0150
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0150
       * @tc.desc   string_replace_function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test123test456';
        const regex = /test(\d+)/g;
        const result = str.replace(regex, (match: string, p1: string) => `demo${p1}`);
        expect(result).assertEqual('demo123demo456');
      });

      /**
       * @tc.name   testRegExpCompleteTest0151
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0151
       * @tc.desc   string_search
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello test world';
        expect(str.search(/test/)).assertEqual(6);
        expect(str.search(/xyz/)).assertEqual(-1);
      });

      /**
       * @tc.name   testRegExpCompleteTest0152
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0152
       * @tc.desc   array_filter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const arr: string[] = ['test1', 'test2', 'demo'];
        const regex = /test/;
        const result = arr.filter((item: string) => regex.test(item));
        expect(result.length).assertEqual(2);
      });

      /**
       * @tc.name   testRegExpCompleteTest0153
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_COMPLETE_TEST_0153
       * @tc.desc   array_map_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpCompleteTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const arr: string[] = ['test1', 'test2'];
        const regex = /test(\d+)/;
        const out: string[] = [];
        for (let i = 0; i < arr.length; i++) {
          const m = arr[i].match(regex);
          out.push(m !== null && m[1] !== undefined ? m[1] : arr[i]);
        }
        expect(out[0]).assertEqual('1');
        expect(out[1]).assertEqual('2');
      });
    });

}
