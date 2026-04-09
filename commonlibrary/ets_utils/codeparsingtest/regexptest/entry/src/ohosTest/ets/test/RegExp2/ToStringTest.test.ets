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
  toStringDefinePropertySourceGetter,
  toStringDefinePropertyFlagsGetter,
  toStringGetterHijackSourceCalled,
  regexpToStringCallNonRegExpThrows,
  regexpToStringCallNullThrows,
  regexpToStringCallUndefinedThrows,
  regexpToStringCallStringThrows,
  regexpToStringCallNumberThrows,
  regexpToStringOnFrozen,
  regexpToStringOnSealed,
  definePropertyOnFrozenThrows,
  regexpToStringApply,
  regexpToStringBind,
  jsonStringifyRegExpIsEmptyObject,
  jsonStringifyWithToJSON,
  regexpToStringByComputedName,
  regexpInstanceHasOwnToString,
  regexpPrototypeHasOwnToString,
  regexpToStringSameAsPrototype,
  objectPrototypeToStringOnRegExp,
  regexpOverrideToStringReturnsCustom,
  regexpDeleteOverrideRestoresPrototype,
  regexpPrototypeToStringDescriptor
} from './RegExpHelper';

interface ToStringHelperResult {
  ok?: boolean;
  thrown?: boolean;
  value?: string;
  getterCalled?: boolean;
}

interface ToStringOverride {
  toString: () => string;
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function toStringTest() {

    describe('ToString_Basic', () => {
      /**
       * @tc.name testToStringTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0100
       * @tc.desc   literal_simple
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/abc/.toString()).assertEqual('/abc/');
      });

      /**
       * @tc.name testToStringTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0101
       * @tc.desc   literal_with_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/abc/gi.toString()).assertEqual('/abc/gi');
      });

      /**
       * @tc.name testToStringTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0102
       * @tc.desc   ctor_string_args
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(new RegExp('abc', 'i').toString()).assertEqual('/abc/i');
      });

      /**
       * @tc.name testToStringTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0103
       * @tc.desc   ctor_regex_arg
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(new RegExp(/abc/, 'g').toString()).assertEqual('/abc/g');
      });

      /**
       * @tc.name testToStringTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0104
       * @tc.desc   return_type_is_string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(typeof /test/.toString() === 'string').assertTrue();
      });

      /**
       * @tc.name testToStringTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0105
       * @tc.desc   format_is_slash_pattern_slash_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const s = /abc/gi.toString();
        expect(s.startsWith('/')).assertTrue();
        expect(s.endsWith('gi')).assertTrue();
      });
    });

    describe('Patterns', () => {
      /**
       * @tc.name testToStringTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0106
       * @tc.desc   metacharacters
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\d+\w*\s?/.toString()).assertEqual('/\\d+\\w*\\s?/');
      });

      /**
       * @tc.name testToStringTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0107
       * @tc.desc   char_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/[a-zA-Z0-9]/.toString()).assertEqual('/[a-zA-Z0-9]/');
      });

      /**
       * @tc.name testToStringTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0108
       * @tc.desc   quantifiers
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a{2,4}b+c?d*/.toString()).assertEqual('/a{2,4}b+c?d*/');
      });

      /**
       * @tc.name testToStringTest0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0109
       * @tc.desc   capture_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(abc)(\d+)/.toString()).assertEqual('/(abc)(\\d+)/');
      });

      /**
       * @tc.name testToStringTest0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0110
       * @tc.desc   non_capture_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(?:abc)+/.toString()).assertEqual('/(?:abc)+/');
      });

      /**
       * @tc.name testToStringTest0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0111
       * @tc.desc   named_capture_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<name>\\w+)')) {
          expect(supportsRegExp('(?<name>\\w+)')).assertFalse();
          return;
        }
        expect(new RegExp('(?<name>\\w+)').toString()).assertEqual('/(?<name>\\w+)/');
      });

      /**
       * @tc.name testToStringTest0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0112
       * @tc.desc   positive_lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\d+(?= dollars)/.toString()).assertEqual('/\\d+(?= dollars)/');
      });

      /**
       * @tc.name testToStringTest0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0113
       * @tc.desc   negative_lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\d+(?! dollars)/.toString()).assertEqual('/\\d+(?! dollars)/');
      });

      /**
       * @tc.name testToStringTest0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0114
       * @tc.desc   lookbehind_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<=\\$)\\d+')) {
          expect(supportsRegExp('(?<=\\$)\\d+')).assertFalse();
          return;
        }
        expect(new RegExp('(?<=\\$)\\d+').toString()).assertEqual('/(?<=\\$)\\d+/');
      });

      /**
       * @tc.name testToStringTest0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0115
       * @tc.desc   anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/^start.*end$/.toString()).assertEqual('/^start.*end$/');
      });

      /**
       * @tc.name testToStringTest0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0116
       * @tc.desc   word_boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\bword\b/.toString()).assertEqual('/\\bword\\b/');
      });

      /**
       * @tc.name testToStringTest0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0117
       * @tc.desc   escape_special_chars
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\.\*\+\?\^\$\(\)\[\]\{\}\|\\/.toString()).assertEqual('/\\.\\*\\+\\?\\^\\$\\(\\)\\[\\]\\{\\}\\|\\\\/');
      });

      /**
       * @tc.name testToStringTest0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0118
       * @tc.desc   escape_slash
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\/path\/to\/file/.toString()).assertEqual('/\\/path\\/to\\/file/');
      });

      /**
       * @tc.name testToStringTest0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0119
       * @tc.desc   empty_pattern_ctor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const s = new RegExp('').toString();
        expect(s === '/(?:)/' || s === '//').assertTrue();
      });

      /**
       * @tc.name testToStringTest0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0120
       * @tc.desc   empty_pattern_literal
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(?:)/.toString()).assertEqual('/(?:)/');
      });

      /**
       * @tc.name testToStringTest0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0121
       * @tc.desc   single_char
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a/.toString()).assertEqual('/a/');
      });
    });

    describe('ToString_Flags', () => {
      /**
       * @tc.name testToStringTest0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0122
       * @tc.desc   flag_g_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/g.toString()).assertEqual('/test/g');
      });

      /**
       * @tc.name testToStringTest0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0123
       * @tc.desc   flag_i_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/i.toString()).assertEqual('/test/i');
      });

      /**
       * @tc.name testToStringTest0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0124
       * @tc.desc   flag_m_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/m.toString()).assertEqual('/test/m');
      });

      /**
       * @tc.name testToStringTest0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0125
       * @tc.desc   flag_s_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('test', 's')) {
          expect(supportsRegExp('test', 's')).assertFalse();
          return;
        }
        expect(new RegExp('test', 's').toString()).assertEqual('/test/s');
      });

      /**
       * @tc.name testToStringTest0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0126
       * @tc.desc   flag_u_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/u.toString()).assertEqual('/test/u');
      });

      /**
       * @tc.name testToStringTest0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0127
       * @tc.desc   flag_y_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/y.toString()).assertEqual('/test/y');
      });

      /**
       * @tc.name testToStringTest0128
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0128
       * @tc.desc   flag_d_only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('test', 'd')) {
          expect(supportsRegExp('test', 'd')).assertFalse();
          return;
        }
        expect(new RegExp('test', 'd').toString()).assertEqual('/test/d');
      });

      /**
       * @tc.name testToStringTest0129
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0129
       * @tc.desc   two_flags_gi
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/gi.toString()).assertEqual('/test/gi');
      });

      /**
       * @tc.name testToStringTest0130
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0130
       * @tc.desc   multiple_flags_gimsuy
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('test', 'gimsuy')) {
          expect(supportsRegExp('test', 'gimsuy')).assertFalse();
          return;
        }
        expect(new RegExp('test', 'gimsuy').toString()).assertEqual('/test/gimsuy');
      });

      /**
       * @tc.name testToStringTest0131
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0131
       * @tc.desc   all_flags_gimsud
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('test', 'gimsud')) {
          expect(supportsRegExp('test', 'gimsud')).assertFalse();
          return;
        }
        expect(new RegExp('test', 'gimsud').toString()).assertEqual('/test/dgimsu');
      });

      /**
       * @tc.name testToStringTest0132
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0132
       * @tc.desc   no_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/.toString()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0133
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0133
       * @tc.desc   flags_order_equals_flags_property
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/i;
        expect(re.toString()).assertEqual('/test/i');
        expect(re.flags).assertEqual('i');
      });

      /**
       * @tc.name testToStringTest0134
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0134
       * @tc.desc   flags_are_sorted
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = new RegExp('test', 'ygi');
        expect(re.flags).assertEqual('giy');
        expect(re.toString()).assertEqual('/test/giy');
      });
    });

    describe('ToString_Boundaries', () => {
      /**
       * @tc.name testToStringTest0135
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0135
       * @tc.desc   very_long_pattern_length
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern = 'a'.repeat(1000);
        const re = new RegExp(pattern);
        expect(re.toString().length).assertEqual(1002);
      });

      /**
       * @tc.name testToStringTest0136
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0136
       * @tc.desc   deep_nesting
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/((((((((a))))))))/.toString()).assertEqual('/((((((((a))))))))/');
      });

      /**
       * @tc.name testToStringTest0137
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0137
       * @tc.desc   unicode_range_with_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/[\u4e00-\u9fa5]+/u.toString()).assertEqual('/[\\u4e00-\\u9fa5]+/u');
      });

      /**
       * @tc.name testToStringTest0138
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0138
       * @tc.desc   emoji_with_u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/😀+/u.toString()).assertEqual('/😀+/u');
      });

      /**
       * @tc.name testToStringTest0139
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0139
       * @tc.desc   control_chars
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\x00\x1F/.toString()).assertEqual('/\\x00\\x1F/');
      });

      /**
       * @tc.name testToStringTest0140
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0140
       * @tc.desc   dynamic_pattern_contains_content
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const dynamicPattern = 'test' + Math.random();
        const re = new RegExp(dynamicPattern);
        expect(re.toString().includes(dynamicPattern)).assertTrue();
      });

      /**
       * @tc.name testToStringTest0141
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0141
       * @tc.desc   user_input_pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const userInput = 'user.*input';
        const re = new RegExp(userInput);
        expect(re.toString()).assertEqual('/user.*input/');
      });
    });

    describe('Interactions', () => {
      /**
       * @tc.name testToStringTest0142
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0142
       * @tc.desc   source_consistency
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /abc/;
        const s = re.toString();
        expect(s.includes(re.source)).assertTrue();
      });

      /**
       * @tc.name testToStringTest0143
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0143
       * @tc.desc   empty_source_is_non_empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = new RegExp('');
        const src = re.source;
        const s = re.toString();
        expect(
          (src === '(?:)' || src === '') && (s === '/(?:)/' || s === '//')
        ).assertTrue();
      });

      /**
       * @tc.name testToStringTest0144
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0144
       * @tc.desc   flags_consistency
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/gi;
        const s = re.toString();
        expect(s.endsWith(re.flags)).assertTrue();
      });

      /**
       * @tc.name testToStringTest0145
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0145
       * @tc.desc   flags_empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect(re.flags).assertEqual('');
        expect(re.toString()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0146
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0146
       * @tc.desc   defineProperty_source_getter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r = toStringDefinePropertySourceGetter() as ToStringHelperResult;
        if (!r?.ok) {
          expect(!!r?.thrown).assertTrue();
          return;
        }
        expect(r.value).assertEqual('/modified/gi');
      });

      /**
       * @tc.name testToStringTest0147
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0147
       * @tc.desc   defineProperty_flags_getter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r = toStringDefinePropertyFlagsGetter() as ToStringHelperResult;
        if (!r?.ok) {
          expect(!!r?.thrown).assertTrue();
          return;
        }
        expect(r.value).assertEqual('/test/um');
      });

      /**
       * @tc.name testToStringTest0148
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0148
       * @tc.desc   getter_hijack_source_called
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r = toStringGetterHijackSourceCalled() as ToStringHelperResult;
        if (!r?.ok) {
          expect(!!r?.thrown).assertTrue();
          return;
        }
        expect(!!r.getterCalled).assertTrue();
      });

      /**
       * @tc.name testToStringTest0149
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0149
       * @tc.desc   exec_does_not_change_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re: RegExp = /test/g;
        const before = re.toString();
        re.exec('test test');
        const after = re.toString();
        expect(before).assertEqual(after);
      });

      /**
       * @tc.name testToStringTest0150
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0150
       * @tc.desc   test_does_not_change_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re: RegExp = /test/g;
        const before = re.toString();
        re.test('test');
        const after = re.toString();
        expect(before).assertEqual(after);
      });

      /**
       * @tc.name testToStringTest0151
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0151
       * @tc.desc   lastIndex_does_not_change_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re: RegExp = /test/g;
        re.lastIndex = 5;
        expect(re.toString()).assertEqual('/test/g');
      });

      /**
       * @tc.name testToStringTest0152
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0152
       * @tc.desc   match_does_not_change_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r1: RegExp = /test/gi;
        'test TEST Test'.match(r1);
        expect(r1.toString()).assertEqual('/test/gi');
      });

      /**
       * @tc.name testToStringTest0153
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0153
       * @tc.desc   replace_does_not_change_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r2: RegExp = /test/g;
        'test string'.replace(r2, 'result');
        expect(r2.toString()).assertEqual('/test/g');
      });

      /**
       * @tc.name testToStringTest0154
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0154
       * @tc.desc   split_does_not_change_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r3: RegExp = /\s+/;
        'a b c'.split(r3);
        expect(r3.toString()).assertEqual('/\\s+/');
      });
    });

    describe('Type_Coercion', () => {
      /**
       * @tc.name testToStringTest0155
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0155
       * @tc.desc   concat
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect('regex is: ' + re).assertEqual('regex is: /test/');
      });

      /**
       * @tc.name testToStringTest0156
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0156
       * @tc.desc   template_string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect(`regex is: ${re}`).assertEqual('regex is: /test/');
      });

      /**
       * @tc.name testToStringTest0157
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0157
       * @tc.desc   String_constructor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/gi;
        expect(String(re)).assertEqual('/test/gi');
      });

      /**
       * @tc.name testToStringTest0158
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0158
       * @tc.desc   String_equals_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/gi;
        expect(String(re) === re.toString()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0159
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0159
       * @tc.desc   Number_is_NaN
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect(Number.isNaN(Number(re))).assertTrue();
      });

      /**
       * @tc.name testToStringTest0160
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0160
       * @tc.desc   parseInt_is_NaN
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /123/;
        expect(Number.isNaN(parseInt(String(re)))).assertTrue();
      });

      /**
       * @tc.name testToStringTest0161
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0161
       * @tc.desc   Boolean_is_true
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect(Boolean(re)).assertTrue();
      });

      /**
       * @tc.name testToStringTest0162
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0162
       * @tc.desc   truthy_in_if_condition
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        let hit = false;
        if (re) {
          hit = true;
        }
        expect(hit).assertTrue();
      });
    });

    describe('Prototype_And_Inheritance', () => {
      /**
       * @tc.name testToStringTest0163
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0163
       * @tc.desc   toString_on_prototype
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpInstanceHasOwnToString()).assertFalse();
        expect(regexpPrototypeHasOwnToString()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0164
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0164
       * @tc.desc   prototype_chain
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringSameAsPrototype()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0165
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0165
       * @tc.desc   diff_from_Object_prototype_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        const a = re.toString();
        const b = objectPrototypeToStringOnRegExp();
        expect(a !== b).assertTrue();
      });

      /**
       * @tc.name testToStringTest0166
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0166
       * @tc.desc   call_non_regexp_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringCallNonRegExpThrows()).assertFalse();
      });

      /**
       * @tc.name testToStringTest0167
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0167
       * @tc.desc   override_instance_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpOverrideToStringReturnsCustom()).assertEqual('custom');
      });

      /**
       * @tc.name testToStringTest0168
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0168
       * @tc.desc   delete_override_restore
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpDeleteOverrideRestoresPrototype()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0169
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0169
       * @tc.desc   subclass_inherits_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class MyRegExp extends RegExp { }
        const re = new MyRegExp('test', 'gi');
        expect(re.toString()).assertEqual('/test/gi');
      });

      /**
       * @tc.name testToStringTest0170
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0170
       * @tc.desc   subclass_override_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class MyRegExp extends RegExp {
          toString(): string {
            return `[MyRegExp: ${this.source}]`;
          }
        }
        const re = new MyRegExp('test', 'gi');
        expect(re.toString()).assertEqual('[MyRegExp: test]');
      });
    });

    describe('Errors_And_Freeze_Seal', () => {
      /**
       * @tc.name testToStringTest0171
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0171
       * @tc.desc   call_null_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringCallNullThrows()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0172
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0172
       * @tc.desc   call_undefined_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringCallUndefinedThrows()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0173
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0173
       * @tc.desc   call_string_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringCallStringThrows()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0174
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0174
       * @tc.desc   call_number_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringCallNumberThrows()).assertTrue();
      });

      /**
       * @tc.name testToStringTest0175
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0175
       * @tc.desc   frozen_toString_ok
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringOnFrozen()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0176
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0176
       * @tc.desc   sealed_toString_ok
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringOnSealed()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0177
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0177
       * @tc.desc   defineProperty_on_frozen_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(definePropertyOnFrozenThrows()).assertTrue();
      });
    });

    describe('Special_Scenarios', () => {
      /**
       * @tc.name testToStringTest0178
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0178
       * @tc.desc   unicode_escape_sequence
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\u0041+/.toString()).assertEqual('/\\u0041+/');
      });

      /**
       * @tc.name testToStringTest0179
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0179
       * @tc.desc   unicode_property_escape_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{Script=Hiragana}', 'u')) {
          expect(supportsRegExp('\\p{Script=Hiragana}', 'u')).assertFalse();
          return;
        }
        expect(new RegExp('\\p{Script=Hiragana}', 'u').toString()).assertEqual('/\\p{Script=Hiragana}/u');
      });

      /**
       * @tc.name testToStringTest0180
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0180
       * @tc.desc   unicode_property_letter_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{Letter}+', 'u')) {
          expect(supportsRegExp('\\p{Letter}+', 'u')).assertFalse();
          return;
        }
        expect(new RegExp('\\p{Letter}+', 'u').toString()).assertEqual('/\\p{Letter}+/u');
      });

      /**
       * @tc.name testToStringTest0181
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0181
       * @tc.desc   alternation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/cat|dog|bird/.toString()).assertEqual('/cat|dog|bird/');
      });

      /**
       * @tc.name testToStringTest0182
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0182
       * @tc.desc   complex_nesting
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/((a|b)+(\d|[x-z]))*/.toString()).assertEqual('/((a|b)+(\\d|[x-z]))*/');
      });

      /**
       * @tc.name testToStringTest0183
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0183
       * @tc.desc   backreference
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(a|b)\1/.toString()).assertEqual('/(a|b)\\1/');
      });

      /**
       * @tc.name testToStringTest0184
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0184
       * @tc.desc   named_backreference_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<quote>[\'"])\\k<quote>')) {
          expect(supportsRegExp('(?<quote>[\'"])\\k<quote>')).assertFalse();
          return;
        }
        expect(new RegExp('(?<quote>[\'"])\\k<quote>').toString()).assertEqual('/(?<quote>[\'"])\\k<quote>/');
      });

      /**
       * @tc.name testToStringTest0185
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0185
       * @tc.desc   apply
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringApply()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0186
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0186
       * @tc.desc   bind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringBind()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0187
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0187
       * @tc.desc   JSON_stringify_regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(jsonStringifyRegExpIsEmptyObject()).assertEqual('{}');
      });

      /**
       * @tc.name testToStringTest0188
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0188
       * @tc.desc   custom_toJSON
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(jsonStringifyWithToJSON()).assertEqual('{\"regex\":\"/test/gi\"}');
      });

      /**
       * @tc.name testToStringTest0189
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0189
       * @tc.desc   strict_mode_toString_output
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/.toString()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0190
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0190
       * @tc.desc   non_strict_same_literal_output_note
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/.toString()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0191
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0191
       * @tc.desc   repeatability
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/gi;
        const a = re.toString();
        const b = re.toString();
        const c = re.toString();
        expect(a === b && b === c).assertTrue();
      });

      /**
       * @tc.name testToStringTest0192
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0192
       * @tc.desc   many_regexes_toString_contains_pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        for (let i = 0; i < 100; i++) {
          const p = `pattern${i}`;
          const re = new RegExp(p, 'gi');
          expect(re.toString().includes(p)).assertTrue();
        }
      });

      /**
       * @tc.name testToStringTest0193
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0193
       * @tc.desc   computed_property_access
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpToStringByComputedName()).assertEqual('/test/');
      });

      /**
       * @tc.name testToStringTest0194
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0194
       * @tc.desc   Object_toStringTag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(objectPrototypeToStringOnRegExp()).assertEqual('[object RegExp]');
      });

      /**
       * @tc.name testToStringTest0195
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0195
       * @tc.desc   property_descriptor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const d = regexpPrototypeToStringDescriptor();
        expect(d.writable).assertTrue();
        expect(d.enumerable).assertFalse();
        expect(d.configurable).assertTrue();
      });

      /**
       * @tc.name testToStringTest0196
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0196
       * @tc.desc   toString_output_can_construct_new_regexp
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1 = /test/gi;
        const s = regex1.toString();
        const m = /^\/(.*)\/([a-z]*)$/.exec(s);
        expect(m !== null).assertTrue();
        if (m === null) {
          return;
        }
        const regex2 = new RegExp(m[1], m[2]);
        expect(regex1.toString()).assertEqual(regex2.toString());
      });

      /**
       * @tc.name testToStringTest0197
       * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0197
       * @tc.desc   constructed_regexp_test_behavior_matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testToStringTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1 = /test/gi;
        const s = regex1.toString();
        const m = /^\/(.*)\/([a-z]*)$/.exec(s);
        expect(m !== null).assertTrue();
        if (m === null) {
          return;
        }
        const regex2 = new RegExp(m[1], m[2]);
        expect(regex1.test('TEST')).assertEqual(regex2.test('TEST'));
      });
    });

}

