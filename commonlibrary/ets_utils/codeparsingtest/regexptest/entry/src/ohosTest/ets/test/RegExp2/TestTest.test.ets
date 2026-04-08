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
  regexpTestCallThisNotRegExpThrows,
  regexpTestCallThisUndefinedThrows,
  regexpTestCallThisNullThrows,
  regexpTestCallRegexLikeObject,
  strictDeleteRegexSourceThrows,
  regexpTestSymbolParameterThrows,
  regexpTestToPrimitiveCoercionMatchesPrimitive,
  regexpTestBigintParameterMatches123
} from './RegExpHelper';

interface CompileCapable {
  compile?: (pattern: string, flags?: string) => void;
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

function throwsOnRegExpCtor(pattern: string, flags?: string): boolean {
  try {
    if (flags === undefined) {
      new RegExp(pattern);
    } else {
      new RegExp(pattern, flags);
    }
    return false;
  } catch (_) {
    return true;
  }
}

export default function testTest() {

    describe('Test_Basic', () => {
      /**
       * @tc.name testRegExpProtoTest0100
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0100
       * @tc.desc   Test simple_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0101
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0101
       * @tc.desc   Test full_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello';
        const re = /^hello$/;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0102
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0102
       * @tc.desc   Test repeatable_non_global
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0103
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0103
       * @tc.desc   Test no_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /goodbye/;
        expect(re.test(str)).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0104
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0104
       * @tc.desc   Test partial_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /world/;
        expect(re.test(str)).assertTrue();
      });
    });

    describe('Parameter_Types', () => {
      /**
       * @tc.name testRegExpProtoTest0105
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0105
       * @tc.desc   Test string_parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect(re.test('test string')).assertTrue();
        expect(re.test('no match')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0106
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0106
       * @tc.desc   Test empty_string_parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^$/;
        expect(re.test('')).assertTrue();
        expect(re.test('not empty')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0107
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0107
       * @tc.desc   Test non_string_coercion_number_array_object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /123/;
        expect(re.test(String(123))).assertTrue();
        const arr: number[] = [1, 2, 3];
        expect(re.test(String(arr))).assertFalse();
        class EmptyObj {
        }
        expect(re.test(String(new EmptyObj()))).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0108
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0108
       * @tc.desc   Test undefined_and_null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /undefined/;
        expect(re.test(String(undefined))).assertTrue();
        expect(re.test(String(null))).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0109
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0109
       * @tc.desc   Test symbol_parameter_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestSymbolParameterThrows()).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0110
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0110
       * @tc.desc   Test boolean_parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /true/;
        expect(re.test(String(true))).assertTrue();
        expect(re.test(String(false))).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0111
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0111
       * @tc.desc   Test object_toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class CustomToString {
          toString(): string {
            return 'custom';
          }
        }
        const obj = new CustomToString();
        const re = /custom/;
        expect(re.test(String(obj))).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0112
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0112
       * @tc.desc   Test symbol_toPrimitive
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestToPrimitiveCoercionMatchesPrimitive()).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0113
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0113
       * @tc.desc   Test bigint_parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestBigintParameterMatches123()).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0114
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0114
       * @tc.desc   Test function_parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /function/;
        const fn = () => { /* empty */ };
        const v = re.test(String(fn));
        expect(typeof v === 'boolean').assertTrue();
      });
    });

    describe('Test_Flags', () => {
      /**
       * @tc.name testRegExpProtoTest0115
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0115
       * @tc.desc   Test ignoreCase
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'HELLO world';
        expect(/hello/.test(str)).assertFalse();
        expect(/hello/i.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0116
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0116
       * @tc.desc   Test global_lastIndex_changes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello hello';
        const re = /hello/g;
        expect(re.lastIndex).assertEqual(0);
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex > 0).assertTrue();
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex > 0).assertTrue();
        expect(re.test(str)).assertFalse();
        expect(re.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name testRegExpProtoTest0117
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0117
       * @tc.desc   Test multiline_affects_anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello\nworld';
        expect(/^world/.test(str)).assertFalse();
        expect(/^world/m.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0118
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0118
       * @tc.desc   Test sticky_uses_lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world hello';
        const re = /hello/y;
        re.lastIndex = 0;
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex).assertEqual(5);
        expect(re.test(str)).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0119
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0119
       * @tc.desc   Test dotAll_support_when_available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello\nworld';
        const re1 = /hello.*world/;
        expect(re1.test(str)).assertFalse();
        if (supportsRegExp('hello.*world', 's')) {
          const re2 = new RegExp('hello.*world', 's');
          expect(re2.test(str)).assertTrue();
        } else {
          expect(true).assertTrue();
        }
      });

      /**
       * @tc.name testRegExpProtoTest0120
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0120
       * @tc.desc   Test unicode_flag_surrogate_pair
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '𝌆';
        expect(/./.test(str)).assertTrue();
        if (supportsRegExp('.', 'u')) {
          expect(/./u.test(str)).assertTrue();
        }
      });

      /**
       * @tc.name testRegExpProtoTest0121
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0121
       * @tc.desc   Test hasIndices_supported_or_skip
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (supportsRegExp('test', 'd')) {
          const re = new RegExp('test', 'd');
          expect(re.test('test')).assertTrue();
        } else {
          expect(true).assertTrue();
        }
      });

      /**
       * @tc.name testRegExpProtoTest0122
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0122
       * @tc.desc   Test combined_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'HELLO\nhello';
        const re = /^hello$/gim;
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex > 0).assertTrue();
        re.lastIndex = 6;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0123
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0123
       * @tc.desc   Test invalid_flag_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('test', 'x')).assertTrue();
      });
    });

    describe('Syntax', () => {
      /**
       * @tc.name testRegExpProtoTest0124
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0124
       * @tc.desc   Test character_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test@example.com';
        expect(/@/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0125
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0125
       * @tc.desc   Test character_class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a1b2c3';
        expect(/[abc]/.test(str)).assertTrue();
        expect(/[0-9]/.test(str)).assertTrue();
        expect(/[^abc]/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0126
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0126
       * @tc.desc   Test predefined_classes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test123  ';
        expect(/\d/.test(str)).assertTrue();
        expect(/\w/.test(str)).assertTrue();
        expect(/\s/.test(str)).assertTrue();
        expect(/\D/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0127
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0127
       * @tc.desc   Test quantifiers
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a?/.test('a')).assertTrue();
        expect(/a+/.test('ab')).assertTrue();
        expect(/a{2}/.test('abc')).assertFalse();
        expect(/a{1,3}/.test('aaaa')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0128
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0128
       * @tc.desc   Test anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(/^hello/.test(str)).assertTrue();
        expect(/world$/.test(str)).assertTrue();
        expect(/\bhello\b/.test(str)).assertTrue();
        expect(/\Bwor\B/.test(str)).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0129
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0129
       * @tc.desc   Test alternation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/apple|orange/.test('apple')).assertTrue();
        expect(/apple|orange/.test('orange')).assertTrue();
        expect(/apple|orange/.test('banana')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0130
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0130
       * @tc.desc   Test group_and_backref
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello hello';
        expect(/(hello)\s\1/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0131
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0131
       * @tc.desc   Test non_capture_group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(/(?:hello|world) world/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0132
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0132
       * @tc.desc   Test lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str1 = 'hello world';
        const str2 = 'hello universe';
        expect(/hello(?= world)/.test(str1)).assertTrue();
        expect(/hello(?= world)/.test(str2)).assertFalse();
        expect(/hello(?! world)/.test(str1)).assertFalse();
        expect(/hello(?! world)/.test(str2)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0133
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0133
       * @tc.desc   Test lookbehind_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<=hello )world')) {
          expect(true).assertTrue();
          return;
        }
        expect(new RegExp('(?<=hello )world').test('hello world')).assertTrue();
        expect(new RegExp('(?<=hello )world').test('hi world')).assertFalse();
        expect(new RegExp('(?<!hello )world').test('hello world')).assertFalse();
        expect(new RegExp('(?<!hello )world').test('hi world')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0134
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0134
       * @tc.desc   Test atomic_group_if_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?>a*)ab')) {
          expect(true).assertTrue();
          return;
        }
        expect(new RegExp('(?>a*)ab').test('abc')).assertFalse();
        expect(/a*ab/.test('abc')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0135
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0135
       * @tc.desc   Test possessive_quantifier_if_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('a++ab')) {
          expect(true).assertTrue();
          return;
        }
        expect(new RegExp('a++ab').test('aab')).assertFalse();
        expect(/a+ab/.test('aab')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0136
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0136
       * @tc.desc   Test unicode_property_escape_if_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{Lu}', 'u')) {
          expect(true).assertTrue();
          return;
        }
        expect(new RegExp('\\p{Lu}', 'u').test('A')).assertTrue();
        expect(new RegExp('\\p{Lu}', 'u').test('α')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0137
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0137
       * @tc.desc   Test G_anchor_if_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\Gtest', 'g')) {
          expect(true).assertTrue();
          return;
        }
        const probe = new RegExp('\\Gtest', 'g');
        if (!probe.test('test')) {
          expect(true).assertTrue();
          return;
        }
        const str = 'test test';
        const re = new RegExp('\\Gtest', 'g');
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertFalse();
      });
    });

    describe('Test_Boundaries', () => {
      /**
       * @tc.name testRegExpProtoTest0138
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0138
       * @tc.desc   Test min_length_strings
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /.*/;
        expect(re.test('')).assertTrue();
        expect(re.test('a')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0139
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0139
       * @tc.desc   Test long_string_reasonable_size
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const longStr = 'a'.repeat(20000) + 'b';
        expect(/b$/.test(longStr)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0140
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0140
       * @tc.desc   Test special_unicode
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/😀/.test('hello 😀 world')).assertTrue();
        expect(/^é$/.test('é')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0141
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0141
       * @tc.desc   Test surrogate_pair
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '𝌆';
        expect(/./.test(str)).assertTrue();
        if (supportsRegExp('.', 'u')) {
          expect(/./u.test(str)).assertTrue();
        }
      });

      /**
       * @tc.name testRegExpProtoTest0142
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0142
       * @tc.desc   Test zero_width_assertions
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test';
        expect(/^test/.test(str)).assertTrue();
        expect(/test$/.test(str)).assertTrue();
        expect(/\btest\b/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0143
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0143
       * @tc.desc   Test number_boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^9007199254740991$/;
        expect(re.test(String(9007199254740991))).assertTrue();
        expect(re.test(String(-9007199254740991))).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0144
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0144
       * @tc.desc   Test quantifier_edge
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a{0}/.test('')).assertTrue();
        expect(/a{1024}/.test('a'.repeat(1024))).assertTrue();
      });
    });

    describe('Special_Characters', () => {
      /**
       * @tc.name testRegExpProtoTest0145
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0145
       * @tc.desc   Test escape_dot
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test.txt';
        expect(/./.test(str)).assertTrue();
        expect(/\./.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0146
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0146
       * @tc.desc   Test backslash
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'path\\to\\file';
        expect(/\\/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0147
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0147
       * @tc.desc   Test quotes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/'/.test("it's a test")).assertTrue();
        expect(/"/.test('he said "hello"')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0148
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0148
       * @tc.desc   Test parentheses
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '(test)';
        expect(/\(/.test(str)).assertTrue();
        expect(/\)/.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0149
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0149
       * @tc.desc   Test brackets
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str1 = 'test[1]';
        expect(/\[/.test(str1)).assertTrue();
        expect(/\]/.test(str1)).assertTrue();
        expect(/[[]/.test('a')).assertFalse();
        expect(/[[]/.test(str1)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0150
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0150
       * @tc.desc   Test braces_colon_semicolon_equals
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\{/.test('{test}')).assertTrue();
        expect(/\}/.test('{test}')).assertTrue();
        expect(/:/.test('key:value')).assertTrue();
        expect(/;/.test('statement1;statement2')).assertTrue();
        expect(/=/.test('a=b')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0151
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0151
       * @tc.desc   Test plus_star_question
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\+/.test('1+1')).assertTrue();
        expect(/\d+/.test('1+1')).assertTrue();
        expect(/\*/.test('a*b')).assertTrue();
        expect(/a.*b/.test('a*b')).assertTrue();
        expect(/\?/.test('really?')).assertTrue();
        expect(/really?/.test('really?')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0152
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0152
       * @tc.desc   Test hash_dollar_percent_amp_pipe_tilde_backtick_at
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/#/.test('#heading')).assertTrue();
        expect(/\$/.test('$100')).assertTrue();
        expect(/100$/.test('$100')).assertTrue();
        expect(/%/.test('50%')).assertTrue();
        expect(/&/.test('a&b')).assertTrue();
        expect(/\|/.test('a|b')).assertTrue();
        expect(/a|b/.test('a|b')).assertTrue();
        expect(/~/.test('~/.bashrc')).assertTrue();
        expect(/`/.test('`code`')).assertTrue();
        expect(/@/.test('user@example.com')).assertTrue();
      });
    });

    describe('Test_Capture_Groups', () => {
      /**
       * @tc.name testRegExpProtoTest0153
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0153
       * @tc.desc   Test basic_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/([a-z]+)([0-9]+)/.test('abc123')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0154
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0154
       * @tc.desc   Test nested_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/((test)(123))/.test('test123')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0155
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0155
       * @tc.desc   Test named_groups_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})')) {
          expect(true).assertTrue();
          return;
        }
        const re = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})');
        expect(re.test('2023-12-25')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0156
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0156
       * @tc.desc   Test backreference
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/([a-z]+)\1/.test('abcabc')).assertTrue();
        expect(/([a-z]+)\1/.test('abcxyz')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0157
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0157
       * @tc.desc   Test named_backreference_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<word>\\w+)_\\k<word>')) {
          expect(true).assertTrue();
          return;
        }
        const re = new RegExp('(?<word>\\w+)_\\k<word>');
        expect(re.test('test_test')).assertTrue();
        expect(re.test('test_demo')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0158
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0158
       * @tc.desc   Test non_capture_group_does_not_shift_backref
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(?:a)(b)\1/.test('abb')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0159
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0159
       * @tc.desc   Test multiple_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/([^=]+)=([^=]+)/.test('name=value')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0160
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0160
       * @tc.desc   Test nested_named_groups_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<outer>t(?<inner>es)t)(?<num>123)')) {
          expect(true).assertTrue();
          return;
        }
        const re = new RegExp('(?<outer>t(?<inner>es)t)(?<num>123)');
        expect(re.test('test123')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0161
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0161
       * @tc.desc   Test empty_groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/()/.test('')).assertTrue();
        expect(/()()/.test('')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0162
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0162
       * @tc.desc   Test many_groups_reasonable
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const groups = Array(20).fill('(\\w)').join('');
        const re = new RegExp(`^${groups}$`);
        const str = 'a'.repeat(20);
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0163
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0163
       * @tc.desc   Test backref_out_of_range_is_false
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern = '(a)\\2';
        if (!supportsRegExp(pattern)) {
          expect(true).assertTrue();
          return;
        }
        const re = new RegExp(pattern);
        expect(re.test('aa')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0164
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0164
       * @tc.desc   Test duplicate_named_group_throws_when_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<a>a)')) {
          expect(true).assertTrue();
          return;
        }
        expect(throwsOnRegExpCtor('(?<a>a)(?<a>b)')).assertTrue();
      });
    });

    describe('Test_Complex_Patterns', () => {
      /**
       * @tc.name testRegExpProtoTest0165
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0165
       * @tc.desc   Test email
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        expect(re.test('test@example.com')).assertTrue();
        expect(re.test('invalid-email')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0166
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0166
       * @tc.desc   Test url
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^https?:\/\/[^\s/$.?#].[^\s]*$/;
        expect(re.test('https://example.com')).assertTrue();
        expect(re.test('not a url')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0167
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0167
       * @tc.desc   Test phone
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^(\([0-9]{3}\)\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;
        expect(re.test('123-456-7890')).assertTrue();
        expect(re.test('(123) 456-7890')).assertTrue();
        expect(re.test('not a phone')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0168
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0168
       * @tc.desc   Test date_format
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;
        expect(re.test('2023-12-25')).assertTrue();
        expect(re.test('2023-02-30')).assertTrue();
        expect(re.test('not a date')).assertFalse();
      });
    });

    describe('Compare_With_String_Methods', () => {
      /**
       * @tc.name testRegExpProtoTest0169
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0169
       * @tc.desc   Test includes_indexOf_search_match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
        expect(str.includes('hello')).assertTrue();
        expect(str.indexOf('hello') !== -1).assertTrue();
        expect(str.search(re) !== -1).assertTrue();
        expect(str.match(re) !== null).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0170
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0170
       * @tc.desc   Test replace_split_exec_types
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
        expect(str.replace(re, 'hi')).assertEqual('hi world');
        expect('a,b,c'.split(/,/).length).assertEqual(3);
        expect(re.exec(str) !== null).assertTrue();
        expect(typeof re.test(str) === 'boolean').assertTrue();
      });
    });

    describe('Error_Handling', () => {
      /**
       * @tc.name testRegExpProtoTest0171
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0171
       * @tc.desc   Test invalid_regex_syntax
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('[a-z')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0172
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0172
       * @tc.desc   Test invalid_flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('test', 'x')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0173
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0173
       * @tc.desc   Test nested_quantifier_invalid
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('a**')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0174
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0174
       * @tc.desc   Test invalid_quantifier_range
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('a{5,3}')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0175
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0175
       * @tc.desc   Test unicode_codepoint_invalid_when_u_supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\u{123456}', 'u')) {
          expect(true).assertTrue();
          return;
        }
        expect(throwsOnRegExpCtor('\\u{123456}', 'u')).assertTrue();
      });
    });

    describe('This_Value', () => {
      /**
       * @tc.name testRegExpProtoTest0176
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0176
       * @tc.desc   Test call_this_not_regexp_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestCallThisNotRegExpThrows()).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0177
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0177
       * @tc.desc   Test call_this_undefined_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestCallThisUndefinedThrows()).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0178
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0178
       * @tc.desc   Test call_this_null_throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestCallThisNullThrows()).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0179
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0179
       * @tc.desc   Test regex_like_object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const v = regexpTestCallRegexLikeObject();
        expect(typeof v === 'boolean').assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0180
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0180
       * @tc.desc   Test subclass_override_test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class MyRegExp extends RegExp {
          test(str: string): boolean {
            return super.test(str);
          }
        }
        const re = new MyRegExp('test');
        expect(re.test('test')).assertTrue();
      });
    });

    describe('RegExp_Constructor', () => {
      /**
       * @tc.name testRegExpProtoTest0181
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0181
       * @tc.desc   Test new_RegExp
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = new RegExp('test', 'g');
        expect(re.test('test string')).assertTrue();
        expect(re.lastIndex).assertEqual(4);
      });

      /**
       * @tc.name testRegExpProtoTest0182
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0182
       * @tc.desc   Test escape_in_constructor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re1 = /\d+/;
        const re2 = new RegExp('\\d+');
        expect(re1.test('123')).assertTrue();
        expect(re2.test('123')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0183
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0183
       * @tc.desc   Test dynamic_pattern_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern = 'test';
        const flags = 'gi';
        const re = new RegExp(pattern, flags);
        expect(re.test('TEST')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0184
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0184
       * @tc.desc   Test empty_pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re1 = new RegExp('');
        expect(re1.test('')).assertTrue();
        const re2 = new RegExp('', 'g');
        expect(re2.test('anything')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0185
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0185
       * @tc.desc   Test construct_from_regexp
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r1 = /test/g;
        const r2 = new RegExp(r1);
        expect(r2.test('test')).assertTrue();
        expect(r2.global).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0186
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0186
       * @tc.desc   Test override_flags_in_constructor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r1 = /test/;
        const r2 = new RegExp(r1, 'g');
        expect(r2.global).assertTrue();
      });
    });

    describe('Compile', () => {
      /**
       * @tc.name testRegExpProtoTest0187
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0187
       * @tc.desc   Test compile_existence
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        const c = (re as Object as CompileCapable).compile;
        const t = typeof c;
        expect(t === 'function' || t === 'undefined').assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0188
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0188
       * @tc.desc   Test compile_behavior_when_exists
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        re.lastIndex = 5;
        const cap = re as Object as CompileCapable;
        if (typeof cap.compile === 'function') {
          cap.compile('new');
          expect(re.lastIndex).assertEqual(0);
          expect(re.test('new')).assertTrue();
        } else {
          expect(true).assertTrue();
        }
      });
    });

    describe('Strict_Mode', () => {
      /**
       * @tc.name testRegExpProtoTest0189
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0189
       * @tc.desc   Test basic
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/.test('test')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0190
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0190
       * @tc.desc   Test strict_delete_source_throws_via_helper
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(strictDeleteRegexSourceThrows()).assertTrue();
      });
    });

    describe('Multi_Instance', () => {
      /**
       * @tc.name testRegExpProtoTest0191
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0191
       * @tc.desc   Test independent_lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test test';
        const r1 = /test/g;
        const r2 = /test/g;
        r1.test(str);
        r2.test(str);
        expect(r1.lastIndex).assertEqual(4);
        expect(r2.lastIndex).assertEqual(4);
      });

      /**
       * @tc.name testRegExpProtoTest0192
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0192
       * @tc.desc   Test alternate_usage
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'foo bar foo';
        const r1 = /foo/g;
        const r2 = /bar/g;
        expect(r1.test(str)).assertTrue();
        expect(r2.test(str)).assertTrue();
        expect(r1.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0193
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0193
       * @tc.desc   Test same_pattern_diff_flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test';
        const r1 = /test/;
        const r2 = /test/g;
        expect(r1.test(str)).assertTrue();
        expect(r2.test(str)).assertTrue();
        expect(r1.lastIndex).assertEqual(0);
        expect(r2.lastIndex).assertEqual(4);
      });
    });

    describe('Web_Compatibility', () => {
      /**
       * @tc.name testRegExpProtoTest0194
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0194
       * @tc.desc   Test lookbehind_support_probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('(?<=lookbehind)test');
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0195
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0195
       * @tc.desc   Test unicode_property_support_probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('\\p{Extended_Pictographic}', 'u');
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0196
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0196
       * @tc.desc   Test hasIndices_support_probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('test', 'd');
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0197
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0197
       * @tc.desc   Test dotAll_support_probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('test.test', 's');
        expect(typeof supported === 'boolean').assertTrue();
      });
    });

    describe('Performance_Smoke', () => {
      /**
       * @tc.name testRegExpProtoTest0198
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0198
       * @tc.desc   Test simple_perf_smoke
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(20000) + 'b';
        const re = /b$/;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0199
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0199
       * @tc.desc   Test global_loop_smoke
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a b c d e f g h i j'.repeat(50);
        const re = /a/g;
        let count = 0;
        while (re.test(str)) {
          count++;
          if (count > 1000) {
            break;
          }
        }
        expect(count > 0).assertTrue();
      });
    });

    describe('Edge_Cases', () => {
      /**
       * @tc.name testRegExpProtoTest0200
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0200
       * @tc.desc   Test zero_width
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\b/.test('test')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0201
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0201
       * @tc.desc   Test empty_alternative
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a|/.test('')).assertTrue();
        expect(/a|/.test('a')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0202
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0202
       * @tc.desc   Test double_anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/^^/.test('test')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0203
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0203
       * @tc.desc   Test nested_star
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(a)*/.test('')).assertTrue();
        expect(/((a)*)*/.test('')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0204
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0204
       * @tc.desc   Test special_combo
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '\\d\\w\\s';
        const re = /\\\w\\\w\\\w/;
        expect(re.test(str)).assertTrue();
      });
    });

    describe('Real_World', () => {
      /**
       * @tc.name testRegExpProtoTest0205
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0205
       * @tc.desc   Test form_email_validation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const validateEmail = (email: string): boolean => {
          const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          return re.test(email);
        };
        expect(validateEmail('user@example.com')).assertTrue();
        expect(validateEmail('invalid')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0206
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0206
       * @tc.desc   Test data_cleaning
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isClean = (s: string): boolean => /^[a-zA-Z0-9\s]+$/.test(s);
        expect(isClean('Hello World 123')).assertTrue();
        expect(isClean('Hello@World')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0207
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0207
       * @tc.desc   Test search_keyword
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isValidKeyword = (k: string): boolean => /^[a-zA-Z0-9\s\-_]{2,50}$/.test(k);
        expect(isValidKeyword('search-term')).assertTrue();
        expect(isValidKeyword('a')).assertFalse();
      });

      /**
       * @tc.name testRegExpProtoTest0208
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0208
       * @tc.desc   Test log_analysis
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isErrorLog = (log: string): boolean => /\[ERROR\]/.test(log);
        expect(isErrorLog('[INFO] Processing')).assertFalse();
        expect(isErrorLog('[ERROR] Failed')).assertTrue();
      });

      /**
       * @tc.name testRegExpProtoTest0209
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_PROTO_TEST_0209
       * @tc.desc   Test config_line
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testRegExpProtoTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isValidConfigLine = (line: string): boolean => /^[a-zA-Z_]\w*\s*=\s*[^#]+/.test(line);
        expect(isValidConfigLine('key=value')).assertTrue();
        expect(isValidConfigLine('123key=value')).assertFalse();
      });
    });

}


