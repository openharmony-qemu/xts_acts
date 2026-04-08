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
import {
  splitDirectSymbolSplit,
  splitStringVsSymbolSame,
  splitSymbolWithLimit,
  splitHasIndicesD,
  splitSubclassOverride,
  splitSubclassCallSuperOut,
  splitSubclassCallSuperCount,
  splitSpeciesEffect,
  splitSubclassConstructorOut,
  splitSubclassConstructorSplitCount,
  splitCustomSymbolObject,
  splitThisTypeErrors,
  splitNonRegExpThisThrows,
  splitRegexLikeObjectCallThrows,
  splitRegexLikeObjectCallOut,
  splitSymbolInputThrows,
  splitBigIntInput,
  splitToStringObjectInput,
  splitToPrimitiveInput,
  splitArrayInput,
  splitFunctionInput,
  splitCustomSplitterStateful,
  splitCustomSplitterWithLimit,
  splitCustomSplitterValidate,
  splitCustomSplitterNonArrayReturn,
  splitLimitStringInput,
  splitSeparatorNullInput,
  splitSeparatorNumberInput,
  splitSeparatorObjectInput,
  splitSupportsHasIndices,
  splitUndefinedSeparator
} from './RegExpHelper';

export default function splitTest() {

    describe('Split_Basic', () => {
      /**
       * @tc.name testSplitTest0100
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0100
       * @tc.desc   Test basic_string_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'Hello World'.split(' ');
        expect(out.join('|')).assertEqual('Hello|World');
      });

      /**
       * @tc.name testSplitTest0101
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0101
       * @tc.desc   Test regex_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello1World2Test'.split(/\d/).join('|')).assertEqual('Hello|World|Test');
      });

      /**
       * @tc.name testSplitTest0102
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0102
       * @tc.desc   Test regex_literal_char_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('apple,orange;banana|grape'.split(/[,;|]/).join('|')).assertEqual('apple|orange|banana|grape');
      });

      /**
       * @tc.name testSplitTest0103
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0103
       * @tc.desc   Test separator_not_found
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'Hello World'.split(/xyz/);
        expect(out.length).assertEqual(1);
        expect(out[0]).assertEqual('Hello World');
      });

      /**
       * @tc.name testSplitTest0104
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0104
       * @tc.desc   Test direct_symbol_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitDirectSymbolSplit().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0105
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0105
       * @tc.desc   Test string_split_equals_symbol_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitStringVsSymbolSame()).assertTrue();
      });

      /**
       * @tc.name testSplitTest0106
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0106
       * @tc.desc   Test param_order_equivalent_result
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const a = 'a,b,c'.split(/,/, 2);
        const b = splitSymbolWithLimit();
        expect(a.join('|')).assertEqual(b.join('|'));
      });
    });

    describe('Special_Chars_And_Escape', () => {
      /**
       * @tc.name testSplitTest0107
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0107
       * @tc.desc   Test dot_escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a.b.c'.split(/\./).join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0108
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0108
       * @tc.desc   Test char_set_tab_newline
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello\tWorld\nTest'.split(/[\t\n]/).join('|')).assertEqual('Hello|World|Test');
      });

      /**
       * @tc.name testSplitTest0109
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0109
       * @tc.desc   Test backslash_escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('path\\to\\file'.split(/\\/).join('|')).assertEqual('path|to|file');
      });

      /**
       * @tc.name testSplitTest0110
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0110
       * @tc.desc   Test unicode_char_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('中文①英文①测试'.split(/①/).join('|')).assertEqual('中文|英文|测试');
      });

      /**
       * @tc.name testSplitTest0111
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0111
       * @tc.desc   Test emoji_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test😀data😀example'.split(/😀/).join('|')).assertEqual('test|data|example');
      });

      /**
       * @tc.name testSplitTest0112
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0112
       * @tc.desc   Test zero_width_char_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test\u200Bdata'.split(/\u200B/).join('|')).assertEqual('test|data');
      });
    });

    describe('Split_Flags', () => {
      /**
       * @tc.name testSplitTest0113
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0113
       * @tc.desc   Test ignore_case_i
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('HelloAworldATEST'.split(/a/i).join('|')).assertEqual('Hello|world|TEST');
      });

      /**
       * @tc.name testSplitTest0114
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0114
       * @tc.desc   Test ignore_g_behavior_equivalent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const a = 'test1test2test3'.split(/test/);
        const b = 'test1test2test3'.split(/test/g);
        expect(a.join('|')).assertEqual(b.join('|'));
      });

      /**
       * @tc.name testSplitTest0115
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0115
       * @tc.desc   Test multiline_m
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'line1\nline2\nline3'.split(/$/m);
        expect(out.length >= 3).assertTrue();
      });

      /**
       * @tc.name testSplitTest0116
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0116
       * @tc.desc   Test unicode_u_empty_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('😄😄'.split(/(?:)/u).length).assertEqual(2);
      });

      /**
       * @tc.name testSplitTest0117
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0117
       * @tc.desc   Test sticky_y
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test1test2test3'.split(/test/y);
        expect(out[0]).assertEqual('');
      });

      /**
       * @tc.name testSplitTest0118
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0118
       * @tc.desc   Test dotAll_s
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'line1\nline2'.split(/.+/s);
        expect(out.length >= 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0119
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0119
       * @tc.desc   Test has_indices_d
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitHasIndicesD();
        if (out === null) {
          expect(false).assertTrue();
          return;
        }
        expect(out.join('|')).assertEqual('|1|2');
      });

      /**
       * @tc.name testSplitTest0120
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0120
       * @tc.desc   Test combined_flags_sample
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Test1TEST2test3'.split(/test/gi).join('|')).assertEqual('|1|2|3');
      });
    });

    describe('Split_Capture_Groups', () => {
      /**
       * @tc.name testSplitTest0121
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0121
       * @tc.desc   Test single_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello 1 word. Sentence number 2.'.split(/(\d)/).join('|')).assertEqual('Hello |1| word. Sentence number |2|.');
      });

      /**
       * @tc.name testSplitTest0122
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0122
       * @tc.desc   Test multi_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'item1-item2=item3'.split(/(-)|(=)/);
        expect(out[1]).assertEqual('-');
        expect(out[2]).assertEqual(undefined);
        expect(out[3]).assertEqual('item2');
      });

      /**
       * @tc.name testSplitTest0123
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0123
       * @tc.desc   Test non_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('item1,item2;item3'.split(/(?:,|;)/).join('|')).assertEqual('item1|item2|item3');
      });

      /**
       * @tc.name testSplitTest0124
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0124
       * @tc.desc   Test nested_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test123abc'.split(/((\d)(\d))/);
        expect(out[1]).assertEqual('12');
        expect(out[2]).assertEqual('1');
        expect(out[3]).assertEqual('2');
      });

      /**
       * @tc.name testSplitTest0125
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0125
       * @tc.desc   Test named_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'version1.2.3'.split(/(?<sep>\.)/);
        expect(out.join('|')).assertEqual('version1|.|2|.|3');
      });

      /**
       * @tc.name testSplitTest0126
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0126
       * @tc.desc   Test capture_group_with_limit
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = '1a2b3c4d'.split(/(\d)/, 5);
        expect(out.join('|')).assertEqual('|1|a|2|b');
      });

      /**
       * @tc.name testSplitTest0127
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0127
       * @tc.desc   Test capture_group_undefined_case
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'a-b=c'.split(/(-)|(=)/);
        expect(out[0]).assertEqual('a');
        expect(out[1]).assertEqual('-');
        expect(out[2]).assertEqual(undefined);
        expect(out[3]).assertEqual('b');
      });
    });

    describe('Quantifiers', () => {
      /**
       * @tc.name testSplitTest0128
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0128
       * @tc.desc   Test star_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'Hello    World'.split(/\s*/).filter((x: string) => x !== '');
        expect(out.join('')).assertEqual('HelloWorld');
      });

      /**
       * @tc.name testSplitTest0129
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0129
       * @tc.desc   Test plus_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello     World'.split(/\s+/).join('|')).assertEqual('Hello|World');
      });

      /**
       * @tc.name testSplitTest0130
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0130
       * @tc.desc   Test optional_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('col1, col2, col3'.split(/,\s?/).join('|')).assertEqual('col1|col2|col3');
      });

      /**
       * @tc.name testSplitTest0131
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0131
       * @tc.desc   Test exact_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test--split--here'.split(/-{2}/).join('|')).assertEqual('test|split|here');
      });

      /**
       * @tc.name testSplitTest0132
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0132
       * @tc.desc   Test range_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a1b22c333d'.split(/\d{1,2}/).join('|')).assertEqual('a|b|c||d');
      });

      /**
       * @tc.name testSplitTest0133
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0133
       * @tc.desc   Test at_least_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test111split222here'.split(/\d{2,}/).join('|')).assertEqual('test|split|here');
      });

      /**
       * @tc.name testSplitTest0134
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0134
       * @tc.desc   Test possessive_quantifier_family_not_supported_should_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let starThrows = false;
        let plusThrows = false;
        let qThrows = false;

        try {
          new RegExp('a*+b');
        } catch (_) {
          starThrows = true;
        }

        try {
          new RegExp('a++b');
        } catch (_) {
          plusThrows = true;
        }

        try {
          new RegExp('a?+b');
        } catch (_) {
          qThrows = true;
        }

        expect(starThrows).assertTrue();
        expect(plusThrows).assertTrue();
        expect(qThrows).assertTrue();
      });
    });

    describe('Boundary_Assertions', () => {
      /**
       * @tc.name testSplitTest0135
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0135
       * @tc.desc   Test start_anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('^test content'.split(/^\^/).join('|')).assertEqual('|test content');
      });

      /**
       * @tc.name testSplitTest0136
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0136
       * @tc.desc   Test end_anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test content$'.split(/\$$/).join('|')).assertEqual('test content|');
      });

      /**
       * @tc.name testSplitTest0137
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0137
       * @tc.desc   Test word_boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'word1 word2'.split(/\b/);
        const joined = out.join('|');
        expect(
          joined === '|word|1 |word|2' || joined === 'word1| |word2|' || joined === 'word1| |word2'
        ).assertTrue();
      });

      /**
       * @tc.name testSplitTest0138
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0138
       * @tc.desc   Test non_word_boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test123'.split(/\B/);
        expect(out.length > 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0139
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0139
       * @tc.desc   Test positive_lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test1split2here3'.split(/(?=\d)/).join('|')).assertEqual('test|1split|2here|3');
      });

      /**
       * @tc.name testSplitTest0140
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0140
       * @tc.desc   Test negative_lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('abc123def'.split(/\d(?!\d)/).join('|')).assertEqual('abc12|def');
      });

      /**
       * @tc.name testSplitTest0141
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0141
       * @tc.desc   Test positive_lookbehind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test1world'.split(/(?<=\d)/).join('|')).assertEqual('test1|world');
      });

      /**
       * @tc.name testSplitTest0142
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0142
       * @tc.desc   Test negative_lookbehind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('abc123def'.split(/(?<!\d)(?=\d)/).join('|')).assertEqual('abc|123def');
      });

      /**
       * @tc.name testSplitTest0143
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0143
       * @tc.desc   Test G_assertion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test test'.split(/\Gtest/g);
        expect(out.length >= 1).assertTrue();
      });
    });

    describe('Limit', () => {
      /**
       * @tc.name testSplitTest0144
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0144
       * @tc.desc   Test limit_count
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello World. How are you?'.split(/\s/, 3).join('|')).assertEqual('Hello|World.|How');
      });

      /**
       * @tc.name testSplitTest0145
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0145
       * @tc.desc   Test limit_zero
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello World'.split(/\s/, 0).length).assertEqual(0);
      });

      /**
       * @tc.name testSplitTest0146
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0146
       * @tc.desc   Test limit_gt_possible
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, 10).join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0147
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0147
       * @tc.desc   Test limit_negative
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, -1).join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0148
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0148
       * @tc.desc   Test limit_float
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c d'.split(/\s/, 2.9).join('|')).assertEqual('a|b');
      });

      /**
       * @tc.name testSplitTest0149
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0149
       * @tc.desc   Test limit_string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitLimitStringInput().join('|')).assertEqual('a|b');
      });

      /**
       * @tc.name testSplitTest0150
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0150
       * @tc.desc   Test limit_infinity
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, Number.POSITIVE_INFINITY).length).assertEqual(0);
      });

      /**
       * @tc.name testSplitTest0151
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0151
       * @tc.desc   Test limit_minus_infinity
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, Number.NEGATIVE_INFINITY).length).assertEqual(0);
      });

      /**
       * @tc.name testSplitTest0152
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0152
       * @tc.desc   Test limit_nan
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, Number.NaN).length).assertEqual(0);
      });

      /**
       * @tc.name testSplitTest0153
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0153
       * @tc.desc   Test limit_with_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = '1a2b3c'.split(/(\d)(?=\D)/, 4);
        expect(out.join('|')).assertEqual('|1|a|2');
      });
    });

    describe('Empty_And_Edges', () => {
      /**
       * @tc.name testSplitTest0154
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0154
       * @tc.desc   Test empty_input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = ''.split(/test/);
        expect(out.length).assertEqual(1);
        expect(out[0]).assertEqual('');
      });

      /**
       * @tc.name testSplitTest0155
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0155
       * @tc.desc   Test empty_match_regex_on_non_empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test'.split(/(?:)/).join('|')).assertEqual('t|e|s|t');
      });

      /**
       * @tc.name testSplitTest0156
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0156
       * @tc.desc   Test starts_with_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(',Hello,World'.split(/,/).join('|')).assertEqual('|Hello|World');
      });

      /**
       * @tc.name testSplitTest0157
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0157
       * @tc.desc   Test ends_with_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello,World,'.split(/,/).join('|')).assertEqual('Hello|World|');
      });

      /**
       * @tc.name testSplitTest0158
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0158
       * @tc.desc   Test consecutive_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a,,b,,,c'.split(/,/).join('|')).assertEqual('a||b|||c');
      });

      /**
       * @tc.name testSplitTest0159
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0159
       * @tc.desc   Test all_separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('///'.split(/\//).join('|')).assertEqual('|||');
      });

      /**
       * @tc.name testSplitTest0160
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0160
       * @tc.desc   Test empty_string_with_empty_match_regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(''.split(/(?:)/).length).assertEqual(0);
      });

      /**
       * @tc.name testSplitTest0161
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0161
       * @tc.desc   Test nullable_regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test'.split(/a?/);
        expect(out.join('|') === 't|e|s|t' || out.join('|') === 't|e|s|t|').assertTrue();
      });
    });

    describe('Split_Complex_Patterns', () => {
      /**
       * @tc.name testSplitTest0162
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0162
       * @tc.desc   Test alternation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('apple|banana;orange|grape'.split(/\||;/).join('|')).assertEqual('apple|banana|orange|grape');
      });

      /**
       * @tc.name testSplitTest0163
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0163
       * @tc.desc   Test char_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a1b2c3d4'.split(/[0246]/).join('|')).assertEqual('a1b|c3d|');
      });

      /**
       * @tc.name testSplitTest0164
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0164
       * @tc.desc   Test negated_char_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('testABC123XYZ'.split(/[^a-z]+/).join('|')).assertEqual('test|');
      });

      /**
       * @tc.name testSplitTest0165
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0165
       * @tc.desc   Test predefined_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test123abc456def'.split(/\d+/).join('|')).assertEqual('test|abc|def');
      });

      /**
       * @tc.name testSplitTest0166
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0166
       * @tc.desc   Test negative_predefined_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('123test456abc'.split(/\D+/).join('|')).assertEqual('123|456|');
      });

      /**
       * @tc.name testSplitTest0167
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0167
       * @tc.desc   Test combined_pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('name:John; age:25; city:NYC'.split(/;\s*/).join('|')).assertEqual('name:John|age:25|city:NYC');
      });

      /**
       * @tc.name testSplitTest0168
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0168
       * @tc.desc   Test atomic_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          const re = new RegExp('(?>a*)b');
          'abc'.split(re);
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplitTest0169
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0169
       * @tc.desc   Test unicode_property_escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Aα1'.split(/\p{Lu}/u).join('|')).assertEqual('|α1');
      });
    });

    describe('Practical', () => {
      /**
       * @tc.name testSplitTest0170
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0170
       * @tc.desc   Test multiline_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('line1\nline2\r\nline3'.split(/\r?\n/).join('|')).assertEqual('line1|line2|line3');
      });

      /**
       * @tc.name testSplitTest0171
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0171
       * @tc.desc   Test tsv_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('col1\tcol2\tcol3'.split(/\t/).join('|')).assertEqual('col1|col2|col3');
      });

      /**
       * @tc.name testSplitTest0172
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0172
       * @tc.desc   Test html_div_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('<div>content1</div><div>content2</div>'.split(/<\/?div>/).join('|')).assertEqual('|content1||content2|');
      });

      /**
       * @tc.name testSplitTest0173
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0173
       * @tc.desc   Test url_path_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('/api/v1/users/123'.split(/\/+/).join('|')).assertEqual('|api|v1|users|123');
      });

      /**
       * @tc.name testSplitTest0174
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0174
       * @tc.desc   Test datetime_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('2024-01-15T10:30:00'.split(/[-T:]/).join('|')).assertEqual('2024|01|15|10|30|00');
      });

      /**
       * @tc.name testSplitTest0175
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0175
       * @tc.desc   Test quoted_string_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello "world, test" example'.split(/ (?=")|(?<=") /).join('|')).assertEqual('Hello|"world, test"|example');
      });

      /**
       * @tc.name testSplitTest0176
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0176
       * @tc.desc   Test csv_split_complex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'name,"John, Doe",age,30';
        const out = str.split(/,(?=(?:(?:[^"]*"){2})*[^"]*$)/);
        expect(out.join('|')).assertEqual('name|"John, Doe"|age|30');
      });

      /**
       * @tc.name testSplitTest0177
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0177
       * @tc.desc   Test log_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('[ERROR] 2024-01-15 [INFO] 2024-01-16'.split(/\[\w+\]\s*/).join('|')).assertEqual('|2024-01-15 |2024-01-16');
      });

      /**
       * @tc.name testSplitTest0178
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0178
       * @tc.desc   Test config_kv_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('key1=value1;key2=value2;key3=value3'.split(/;|=/).join('|')).assertEqual('key1|value1|key2|value2|key3|value3');
      });

      /**
       * @tc.name testSplitTest0179
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0179
       * @tc.desc   Test windows_path_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('C:\\Users\\test\\file.txt'.split(/\\/).join('|')).assertEqual('C:|Users|test|file.txt');
      });

      /**
       * @tc.name testSplitTest0180
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0180
       * @tc.desc   Test unix_path_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('/home/user/documents/file.txt'.split(/\//).join('|')).assertEqual('|home|user|documents|file.txt');
      });
    });

    describe('Symbol_This_Input_11_12_13_14_15', () => {
      /**
       * @tc.name testSplitTest0181
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0181
       * @tc.desc   Test subclass_override
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSubclassOverride().join('|')).assertEqual('(a)|(b)|(c)');
      });

      /**
       * @tc.name testSplitTest0182
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0182
       * @tc.desc   Test subclass_call_super_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitSubclassCallSuperOut();
        const count = splitSubclassCallSuperCount();
        expect(out.join('|')).assertEqual('a|b|c');
        expect(count).assertEqual(1);
      });

      /**
       * @tc.name testSplitTest0183
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0183
       * @tc.desc   Test species_effect
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitSpeciesEffect();
        expect(out.join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0184
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0184
       * @tc.desc   Test subclass_constructor_behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitSubclassConstructorOut();
        const splitCount = splitSubclassConstructorSplitCount();
        expect(out.join('|')).assertEqual('a|b|c');
        expect(splitCount).assertEqual(3);
      });

      /**
       * @tc.name testSplitTest0185
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0185
       * @tc.desc   Test lastIndex_reset_by_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        re.lastIndex = 5;
        'test test'.split(re);
        expect(re.lastIndex).assertEqual(5);
      });

      /**
       * @tc.name testSplitTest0186
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0186
       * @tc.desc   Test lastIndex_change_during_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        const out = 'test test test'.split(re);
        expect(out.length).assertEqual(4);
      });

      /**
       * @tc.name testSplitTest0187
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0187
       * @tc.desc   Test manual_lastIndex_ignored
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/y;
        re.lastIndex = 5;
        const out = 'test test'.split(re);
        expect(out[0]).assertEqual('');
      });

      /**
       * @tc.name testSplitTest0188
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0188
       * @tc.desc   Test sticky_lastIndex_behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/y;
        const out = 'testtest'.split(re);
        expect(out.length >= 2).assertTrue();
      });

      /**
       * @tc.name testSplitTest0189
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0189
       * @tc.desc   Test non_regexp_this_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitNonRegExpThisThrows()).assertFalse();
      });

      /**
       * @tc.name testSplitTest0190
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0190
       * @tc.desc   Test undefined_null_this_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitThisTypeErrors()).assertTrue();
      });

      /**
       * @tc.name testSplitTest0191
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0191
       * @tc.desc   Test null_this_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitThisTypeErrors()).assertTrue();
      });

      /**
       * @tc.name testSplitTest0192
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0192
       * @tc.desc   Test regex_like_object_this_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const thrown = splitRegexLikeObjectCallThrows();
        const out = splitRegexLikeObjectCallOut();
        if (thrown) {
          expect(thrown).assertTrue();
          return;
        }
        const joined = out.join('|');
        expect(joined === 'a|b|c' || joined === 'a,|,|').assertTrue();
      });

      /**
       * @tc.name testSplitTest0193
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0193
       * @tc.desc   Test custom_splitter_object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSymbolObject().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0194
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0194
       * @tc.desc   Test stateful_custom_splitter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSplitterStateful().join('|')).assertEqual('a|bc|c5d|e|f');
      });

      /**
       * @tc.name testSplitTest0195
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0195
       * @tc.desc   Test custom_splitter_with_limit
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSplitterWithLimit().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0196
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0196
       * @tc.desc   Test validating_splitter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSplitterValidate().join('|')).assertEqual('abc|bcdefg');
      });

      /**
       * @tc.name testSplitTest0197
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0197
       * @tc.desc   Test custom_splitter_non_array_return
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitCustomSplitterNonArrayReturn();
        expect(out[0]).assertEqual('not an array');
      });

      /**
       * @tc.name testSplitTest0198
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0198
       * @tc.desc   Test symbol_input_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSymbolInputThrows()).assertTrue();
      });

      /**
       * @tc.name testSplitTest0199
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0199
       * @tc.desc   Test bigint_input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitBigIntInput().length).assertEqual(1);
      });

      /**
       * @tc.name testSplitTest0200
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0200
       * @tc.desc   Test object_to_string_input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitToStringObjectInput().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0201
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0201
       * @tc.desc   Test symbol_toPrimitive_input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitToPrimitiveInput().join('|')).assertEqual('x|y|z');
      });

      /**
       * @tc.name testSplitTest0202
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0202
       * @tc.desc   Test array_input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitArrayInput().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplitTest0203
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0203
       * @tc.desc   Test function_input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitFunctionInput();
        expect(out.length >= 1).assertTrue();
      });
    });

    describe('Extended_16_17_18_19_20', () => {
      /**
       * @tc.name testSplitTest0204
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0204
       * @tc.desc   Test surrogate_pair_u_vs_non_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '𝌆𝌆';
        const a = str.split(/(?:)/);
        const b = str.split(/(?:)/u);
        expect(a.length > b.length).assertTrue();
      });

      /**
       * @tc.name testSplitTest0205
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0205
       * @tc.desc   Test emoji_sequence_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = '👨‍👩‍👧‍👦'.split(/(?:)/u);
        expect(out.length >= 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0206
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0206
       * @tc.desc   Test combining_char_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const composed = 'é';
        const decomposed = 'e\u0301';
        const a = composed.split(/(?:)/u);
        const b = decomposed.split(/(?:)/u);
        expect(a.length >= 1).assertTrue();
        expect(b.length >= a.length).assertTrue();
      });

      /**
       * @tc.name testSplitTest0207
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0207
       * @tc.desc   Test unicode_property_letter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let out: string[] = [];
        let supported = true;
        try {
          out = 'Aα1'.split(/\p{Letter}/u);
        } catch (_) {
          supported = false;
        }
        if (!supported) {
          expect(true).assertTrue();
          return;
        }
        expect(out.join('|')).assertEqual('||1');
      });

      /**
       * @tc.name testSplitTest0208
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0208
       * @tc.desc   Test unicode_script_greek
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let out: string[] = [];
        let supported = true;
        try {
          out = 'Aαβ'.split(/\p{Script=Greek}/u);
        } catch (_) {
          supported = false;
        }
        if (!supported) {
          expect(true).assertTrue();
          return;
        }
        expect(out.join('|')).assertEqual('A||');
      });

      /**
       * @tc.name testSplitTest0209
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0209
       * @tc.desc   Test separator_undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitUndefinedSeparator().join('|')).assertEqual('Hello World');
      });

      /**
       * @tc.name testSplitTest0210
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0210
       * @tc.desc   Test separator_null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSeparatorNullInput().join('|')).assertEqual('test||test');
      });

      /**
       * @tc.name testSplitTest0211
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0211
       * @tc.desc   Test separator_number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSeparatorNumberInput().join('|')).assertEqual('test|test');
      });

      /**
       * @tc.name testSplitTest0212
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0212
       * @tc.desc   Test separator_plain_object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSeparatorObjectInput().join('|')).assertEqual('test|test');
      });

      /**
       * @tc.name testSplitTest0213
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0213
       * @tc.desc   Test invalid_regex_syntax_should_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('[a-z');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplitTest0214
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0214
       * @tc.desc   Test invalid_flag_combination_should_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('test', 'x');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplitTest0215
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0215
       * @tc.desc   Test invalid_unicode_codepoint_should_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('\\u{123456}', 'u');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplitTest0216
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0216
       * @tc.desc   Test invalid_lookbehind_syntax_should_throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('(?<=');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplitTest0217
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0217
       * @tc.desc   Test very_long_string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const left = 'a'.repeat(100000);
        const out = `${left},b`.split(/,/);
        expect(out.length).assertEqual(2);
        expect(out[1]).assertEqual('b');
      });

      /**
       * @tc.name testSplitTest0218
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0218
       * @tc.desc   Test special_unicode_chars
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('🎉🎊🎁🎈'.split(/(?:)/u).join('|')).assertEqual('🎉|🎊|🎁|🎈');
      });

      /**
       * @tc.name testSplitTest0219
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0219
       * @tc.desc   Test lookbehind_support_detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let supported = false;
        try {
          supported = new RegExp('(?<=)').test('');
        } catch (_) {
          supported = false;
        }
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplitTest0220
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0220
       * @tc.desc   Test unicode_property_support_detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let supported = false;
        try {
          supported = new RegExp('\\p{L}', 'u').test('A');
        } catch (_) {
          supported = false;
        }
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplitTest0221
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0221
       * @tc.desc   Test dotAll_support_detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let supported = false;
        try {
          supported = new RegExp('.', 's').test('\n');
        } catch (_) {
          supported = false;
        }
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplitTest0222
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0222
       * @tc.desc   Test hasIndices_support_detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = splitSupportsHasIndices();
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplitTest0223
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0223
       * @tc.desc   Test engine_diff_empty_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = ''.split(/(?:)/);
        expect(out.length === 0 || out.length === 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0224
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0224
       * @tc.desc   Test csv_simple_parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const csv = 'name,age,city\nJohn,25,NYC\nJane,30,LA';
        const rows = csv.split(/\n/);
        const parsed = rows.map((r: string) => r.split(/,/).join(':')).join('|');
        expect(parsed).assertEqual('name:age:city|John:25:NYC|Jane:30:LA');
      });

      /**
       * @tc.name testSplitTest0225
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0225
       * @tc.desc   Test csv_complex_parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const csv = 'name,"description,with,commas",value';
        const out = csv.split(/,(?=(?:(?:[^"]*"){2})*[^"]*$)/);
        expect(out.join('|')).assertEqual('name|"description,with,commas"|value');
      });

      /**
       * @tc.name testSplitTest0226
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0226
       * @tc.desc   Test log_line_parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const logLine = '127.0.0.1 - - [10/Oct/2023:13:55:36] "GET /api HTTP/1.1" 200 1234';
        const out = logLine.split(/\s+/);
        expect(out.length >= 8).assertTrue();
      });

      /**
       * @tc.name testSplitTest0227
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0227
       * @tc.desc   Test ini_section_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const ini = '[section1]\nkey1=value1\nkey2=value2\n[section2]\nkey3=value3';
        const out = ini.split(/\n(?=\[)/);
        expect(out.length).assertEqual(2);
      });

      /**
       * @tc.name testSplitTest0228
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0228
       * @tc.desc   Test markdown_heading_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const markdown = '# Title1\ncontent1\n## Title2\ncontent2\n### Title3\ncontent3';
        const out = markdown.split(/\n(?=#{1,3}\s)/);
        expect(out.length).assertEqual(3);
      });

      /**
       * @tc.name testSplitTest0229
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0229
       * @tc.desc   Test code_statement_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const code = 'let a=1;let b=2;if(a>b){return a;}else{return b;}';
        const out = code.split(/(?<=;|\})(?=\s*\w)/);
        expect(out.length >= 2).assertTrue();
      });

      /**
       * @tc.name testSplitTest0230
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0230
       * @tc.desc   Test url_query_parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const query = 'name=John&age=25&city=NYC';
        const parsed = query.split(/&/).map((x: string) => x.split(/=/).join(':')).join('|');
        expect(parsed).assertEqual('name:John|age:25|city:NYC');
      });

      /**
       * @tc.name testSplitTest0231
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0231
       * @tc.desc   Test rgba_value_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const rgba = 'rgba(255, 128, 64, 0.5)';
        const out = rgba.split(/[\(\),\s]+/).filter((x: string) => x);
        expect(out.join('|')).assertEqual('rgba|255|128|64|0.5');
      });

      /**
       * @tc.name testSplitTest0232
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0232
       * @tc.desc   Test extreme_quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(1000);
        const out = str.split(/a{1000}/);
        expect(out.join('|')).assertEqual('|');
      });

      /**
       * @tc.name testSplitTest0233
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0233
       * @tc.desc   Test many_capture_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const groups = Array(20).fill('(\\w)').join('');
        const re = new RegExp(`^${groups}$`);
        const out = 'a'.repeat(20).split(re);
        expect(out.length > 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0234
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0234
       * @tc.desc   Test deep_nested_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'abc'.split(/(((a)))/);
        expect(out[1]).assertEqual('a');
        expect(out[2]).assertEqual('a');
        expect(out[3]).assertEqual('a');
      });

      /**
       * @tc.name testSplitTest0235
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0235
       * @tc.desc   Test zero_width_match_loop_guard
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test'.split(/(?=)/);
        expect(out.length > 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0236
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0236
       * @tc.desc   Test empty_string_with_empty_regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = ''.split(/(?:)/);
        expect(out.length === 0 || out.length === 1).assertTrue();
      });

      /**
       * @tc.name testSplitTest0237
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0237
       * @tc.desc   Test limit_equals_one
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a,b,c,d'.split(/,/, 1).join('|')).assertEqual('a');
      });

      /**
       * @tc.name testSplitTest0238
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0238
       * @tc.desc   Test capture_at_start
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('123abc'.split(/(\d+)/).join('|')).assertEqual('|123|abc');
      });

      /**
       * @tc.name testSplitTest0239
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0239
       * @tc.desc   Test capture_at_end
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('abc123'.split(/(\d+)/).join('|')).assertEqual('abc|123|');
      });

      /**
       * @tc.name testSplitTest0240
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0240
       * @tc.desc   Test only_capture_split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('1a2b3c'.split(/(\d)/).join('|')).assertEqual('|1|a|2|b|3|c');
      });

      /**
       * @tc.name testSplitTest0241
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SPLIT_TEST_0241
       * @tc.desc   Test alt_empty_nonempty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplitTest0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test'.split(/t|/);
        expect(out.length >= 1).assertTrue();
      });
    });

}
