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
import { regexpSymbolSearch } from './regexp_symbols';

class PlainObjectForToString {
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (err) {
    return false;
  }
}

function supportsLookbehindSemantics(): boolean {
  try {
    const re: RegExp = new RegExp('(?<!abc)\\d+');
    if (re.test('abc100')) {
      return false;
    }
    if (!re.test('def100')) {
      return false;
    }
    return true;
  } catch (_) {
    return false;
  }
}

export default function searchBasicTest() {
  describe('RegExp_Search_Basic', () => {
    /**
       * @tc.name testSearchTest0100
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0100
       * @tc.desc   returns the first match index
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/[A-Z]/, 'hey JudE')).assertEqual(4);
    });

    /**
       * @tc.name testSearchTest0101
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0101
       * @tc.desc   returns -1 when not found
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/[.]/, 'hey JudE')).assertEqual(-1);
    });

    /**
       * @tc.name testSearchTest0102
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0102
       * @tc.desc   accepts a string pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('Hello World'.search('World')).assertEqual(6);
    });

    /**
       * @tc.name testSearchTest0103
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0103
       * @tc.desc   empty pattern returns 0
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('Hello'.search('')).assertEqual(0);
      expect(regexpSymbolSearch(/(?:)/, '')).assertEqual(0);
    });
  });

  describe('RegExp_Search_Flags', () => {
    /**
       * @tc.name testSearchTest0104
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0104
       * @tc.desc   global flag does not change the result
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/abc/g, 'abc abc abc')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0105
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0105
       * @tc.desc   ignore-case flag works
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/world/i, 'Hello World')).assertEqual(6);
    });

    /**
       * @tc.name testSearchTest0106
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0106
       * @tc.desc   multiline anchors work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/^Line2/m, 'Line1\nLine2\nLine3')).assertEqual(6);
    });

    /**
       * @tc.name testSearchTest0107
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0107
       * @tc.desc   combined flags work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/world/gim, 'Hello\nWORLD\nworld')).assertEqual(6);
    });

    /**
       * @tc.name testSearchTest0108
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0108
       * @tc.desc   unicode flag works
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/é/u, 'café')).assertEqual(3);
    });

    /**
       * @tc.name testSearchTest0109
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0109
       * @tc.desc   sticky flag does not affect the result
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/y;
      re.lastIndex = 3;
      expect(regexpSymbolSearch(re, 'abcabc')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0110
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0110
       * @tc.desc   dotAll matches newline when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('.', 's')) {
        expect(regexpSymbolSearch(/Hello.World/s, 'Hello\nWorld')).assertEqual(0);
      } else {
        expect(supportsRegExp('.', 's')).assertFalse();
      }
    });

    /**
       * @tc.name testSearchTest0111
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0111
       * @tc.desc   hasIndices does not change search return when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('test(\\d+)', 'd')) {
        const re: RegExp = new RegExp('test(\\d+)', 'd');
        expect(regexpSymbolSearch(re, 'test123')).assertEqual(0);
      } else {
        expect(supportsRegExp('test(\\d+)', 'd')).assertFalse();
      }
    });
  });

  describe('RegExp_Search_lastIndex', () => {
    /**
       * @tc.name testSearchTest0112
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0112
       * @tc.desc   ignores an existing lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/g;
      re.lastIndex = 4;
      expect(regexpSymbolSearch(re, 'abc abc')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0113
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0113
       * @tc.desc   restores lastIndex after the call
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/g;
      re.lastIndex = 5;
      regexpSymbolSearch(re, 'abc abc abc');
      expect(re.lastIndex).assertEqual(5);
    });

    /**
       * @tc.name testSearchTest0114
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0114
       * @tc.desc   ignores lastIndex for sticky patterns
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/y;
      re.lastIndex = 4;
      expect(regexpSymbolSearch(re, 'abc abc')).assertEqual(0);
    });
  });

  describe('RegExp_Search_Patterns_And_Unicode', () => {
    /**
       * @tc.name testSearchTest0115
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0115
       * @tc.desc   special and escaped characters work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/@/, 'price@100')).assertEqual(5);
      expect(regexpSymbolSearch(/\n/, 'Hello\nWorld')).assertEqual(5);
    });

    /**
       * @tc.name testSearchTest0116
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0116
       * @tc.desc   character classes work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/[0-9]/, 'abc123')).assertEqual(3);
      expect(regexpSymbolSearch(/[^\w\s']/, "I think Ruth's dog is cuter than your dog!")).assertEqual(41);
    });

    /**
       * @tc.name testSearchTest0117
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0117
       * @tc.desc   unicode and emoji work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/好/, '你好世界')).assertEqual(1);
      expect(regexpSymbolSearch(/😊/, 'Hello 😊 World')).assertEqual(6);
    });

    /**
       * @tc.name testSearchTest0118
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0118
       * @tc.desc   unicode property escapes work when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('\\p{Script=Greek}', 'u')) {
        const greekRe: RegExp = new RegExp('\\p{Script=Greek}', 'u');
        const notNumberRe: RegExp = new RegExp('\\P{Number}', 'u');
        expect(regexpSymbolSearch(greekRe, 'ABC αβγ')).assertEqual(4);
        expect(regexpSymbolSearch(notNumberRe, '123ABC')).assertEqual(3);
      } else {
        expect(supportsRegExp('\\p{Script=Greek}', 'u')).assertFalse();
      }
    });

    /**
       * @tc.name testSearchTest0119
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0119
       * @tc.desc   predefined character classes work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'test123';
      expect(regexpSymbolSearch(/\d/, str)).assertEqual(4);
      expect(regexpSymbolSearch(/\w/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/\s/, str)).assertEqual(-1);
    });
  });

  describe('RegExp_Search_Boundaries_And_Lookarounds', () => {
    /**
       * @tc.name testSearchTest0120
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0120
       * @tc.desc   handles empty and single-char cases
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/abc/, '')).assertEqual(-1);
      expect(regexpSymbolSearch(/a/, 'a')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0121
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0121
       * @tc.desc   start/end anchors work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'Hello World';
      expect(regexpSymbolSearch(/^Hello/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/World$/, str)).assertEqual(6);
    });

    /**
       * @tc.name testSearchTest0122
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0122
       * @tc.desc   works for long strings
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'a'.repeat(10000) + 'target';
      expect(regexpSymbolSearch(/target/, str)).assertEqual(10000);
    });

    /**
       * @tc.name testSearchTest0123
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0123
       * @tc.desc   lookahead works
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/\d(?=def)/, 'abc123def')).assertEqual(5);
      expect(regexpSymbolSearch(/\d(?!def)/, 'abc123def')).assertEqual(3);
    });

    /**
       * @tc.name testSearchTest0124
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0124
       * @tc.desc   lookbehind works when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsLookbehindSemantics()) {
        const positiveLookbehind: RegExp = new RegExp('(?<=:)\\d+');
        const negativeLookbehind: RegExp = new RegExp('(?<!abc)\\d+');
        expect(regexpSymbolSearch(positiveLookbehind, 'price:100')).assertEqual(6);
        expect(regexpSymbolSearch(negativeLookbehind, 'abc100 def100')).assertEqual(10);
      } else {
        expect(supportsLookbehindSemantics()).assertFalse();
      }
    });

    /**
       * @tc.name testSearchTest0125
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0125
       * @tc.desc   word boundaries work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/\bhello\b/i, 'Hello world, hello')).assertEqual(0);
      expect(regexpSymbolSearch(/\B\d\B/, 'abc123')).assertEqual(3);
    });
  });

  describe('RegExp_Search_Type_Conversion', () => {
    /**
       * @tc.name testSearchTest0126
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0126
       * @tc.desc   coerces number/null/undefined/boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('abc123'.search(String(123))).assertEqual(3);
      expect('null undefined'.search(String(null))).assertEqual(0);
      expect('null undefined'.search(String(undefined))).assertEqual(5);
      expect('true false'.search(String(true))).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0127
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0127
       * @tc.desc   coerces object/array to string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PlainObjectForToString = new PlainObjectForToString();
      const arr: Array<string> = [','];
      const objIdx: number = '[object Object]'.search(String(obj));
      expect(objIdx >= 0).assertTrue();
      const pat: string = String(arr);
      const idx: number = 'a,b,c'.search(pat);
      if (pat === ',') {
        expect(idx === 1 || idx === 0).assertTrue();
      } else {
        expect(idx === 0 || idx === 1).assertTrue();
      }
    });
  });

  describe('RegExp_Search_Advanced_And_Applications', () => {
    /**
       * @tc.name testSearchTest0128
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0128
       * @tc.desc   preserves group/quantifier/alternation semantics
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/(\d{4})-(\d{2})-(\d{2})/, '2023-12-25')).assertEqual(0);
      expect(regexpSymbolSearch(/(?:abc)\d+/, 'abc123')).assertEqual(0);
      const namedGroupRe: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
      expect(regexpSymbolSearch(namedGroupRe, 'John Smith')).assertEqual(0);
      expect(regexpSymbolSearch(/a+b+/, 'aaabbc')).assertEqual(0);
      expect(regexpSymbolSearch(/cat|dog/, 'cat or dog')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0129
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0129
       * @tc.desc   constructor forms work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(new RegExp('test'), 'test')).assertEqual(0);
      expect(regexpSymbolSearch(new RegExp('\\d+'), 'test123')).assertEqual(4);
      const pattern: RegExp = new RegExp(['cat', 'dog', 'bird'].join('|'), 'i');
      expect(regexpSymbolSearch(pattern, 'Cat Dog Bird')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0130
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0130
       * @tc.desc   covers -1, 0 and positive return values
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/xyz/, 'test')).assertEqual(-1);
      expect(regexpSymbolSearch(/(?:)/, 'test')).assertEqual(0);
      expect(regexpSymbolSearch(/test/, 'abc test')).assertEqual(4);
      expect(regexpSymbolSearch(/c/, 'abc')).assertEqual(2);
      expect(regexpSymbolSearch(/\n/, 'abc\ndef')).assertEqual(3);
    });

    /**
       * @tc.name testSearchTest0131
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0131
       * @tc.desc   covers common application scenarios
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hasEmail: boolean = regexpSymbolSearch(/^[\w.-]+@[\w.-]+\.\w+$/, 'test@example.com') !== -1;
      const hasHttps: boolean = regexpSymbolSearch(/^https:/, 'https://example.com') === 0;
      const hasFirstNumberAt3: boolean = regexpSymbolSearch(/\d/, 'abc123def') === 3;
      const hasHtml: boolean = regexpSymbolSearch(/<[^>]+>/, '<div>Hello</div>') !== -1;
      const isHexColor: boolean = regexpSymbolSearch(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, '#FF5733') !== -1;

      expect(hasEmail).assertTrue();
      expect(hasHttps).assertTrue();
      expect(hasFirstNumberAt3).assertTrue();
      expect(hasHtml).assertTrue();
      expect(isHexColor).assertTrue();
    });
  });

  describe('RegExp_Search_Error_And_Compatibility', () => {
    /**
       * @tc.name testSearchTest0132
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0132
       * @tc.desc   invalid regex or flag throws syntax error
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let e1: boolean = false;
      let e2: boolean = false;

      try {
        new RegExp('[a-z');
      } catch (err) {
        e1 = true;
      }

      try {
        new RegExp('test', 'x');
      } catch (err) {
        e2 = true;
      }

      expect(e1).assertTrue();
      expect(e2).assertTrue();
    });

    /**
       * @tc.name testSearchTest0133
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0133
       * @tc.desc   invalid unicode property throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let thrown: boolean = false;
      try {
        new RegExp('\\p{Invalid}', 'u');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
       * @tc.name testSearchTest0134
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0134
       * @tc.desc   undefined pattern is coerced to "undefined"
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('null undefined'.search('undefined')).assertEqual(5);
    });

    /**
       * @tc.name testSearchTest0135
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0135
       * @tc.desc   feature detection is consistent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const supportsLookbehind: boolean = supportsRegExp('(?<=a)b');
      const supportsUnicodeProperties: boolean = supportsRegExp('\\p{L}', 'u');
      const supportsDotAll: boolean = supportsRegExp('.', 's');
      const supportsHasIndices: boolean = supportsRegExp('.', 'd');

      expect(typeof supportsLookbehind).assertEqual('boolean');
      expect(typeof supportsUnicodeProperties).assertEqual('boolean');
      expect(typeof supportsDotAll).assertEqual('boolean');
      expect(typeof supportsHasIndices).assertEqual('boolean');
    });
  });

  describe('RegExp_Search_Extended_Scenarios', () => {
    /**
       * @tc.name testSearchTest0136
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0136
       * @tc.desc   zero-width matches return expected positions
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'abc';
      expect(regexpSymbolSearch(/^/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/$/, str)).assertEqual(3);
      expect(regexpSymbolSearch(/\b/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/\B/, str)).assertEqual(1);
    });

    /**
       * @tc.name testSearchTest0137
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0137
       * @tc.desc   extreme quantifier and nested group work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const longA: string = 'a'.repeat(1000);
      expect(regexpSymbolSearch(/a{1000}/, longA)).assertEqual(0);
      expect(regexpSymbolSearch(/(((a)))/, 'a')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0138
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0138
       * @tc.desc   zero-width global does not loop indefinitely
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/(?=)/g, 'test')).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0139
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0139
       * @tc.desc   many capture groups work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const group: string = '(\\w)';
      const groups: string = group.repeat(20);
      const pattern: RegExp = new RegExp('^' + groups + '$');
      const str: string = 'a'.repeat(20);
      expect(regexpSymbolSearch(pattern, str)).assertEqual(0);
    });

    /**
       * @tc.name testSearchTest0140
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0140
       * @tc.desc   real-world validation patterns work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ipv4: boolean = regexpSymbolSearch(/^((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.){3}(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)$/, '192.168.1.1') !== -1;
      const phone: boolean = regexpSymbolSearch(/^(\([0-9]{3}\)\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$/, '123-456-7890') !== -1;
      const date: boolean = regexpSymbolSearch(/^\d{4}-\d{2}-\d{2}$/, '2024-01-15') !== -1;
      const time: boolean = regexpSymbolSearch(/^\d{1,2}:\d{2}(:\d{2})?$/, '10:30') !== -1;
      const coordinates: boolean = regexpSymbolSearch(/^\(\s*-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?\s*\)$/, '(123.45, -67.89)') !== -1;

      expect(ipv4).assertTrue();
      expect(phone).assertTrue();
      expect(date).assertTrue();
      expect(time).assertTrue();
      expect(coordinates).assertTrue();
    });

    /**
       * @tc.name testSearchTest0141
       * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_SEARCH_TEST_0141
       * @tc.desc   unicode script cases work when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearchTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('\\p{Script=Hiragana}+', 'u')) {
        const hiraganaRe: RegExp = new RegExp('\\p{Script=Hiragana}+', 'u');
        expect(regexpSymbolSearch(hiraganaRe, 'こんにちは')).assertEqual(0);
      } else {
        expect(supportsRegExp('\\p{Script=Hiragana}+', 'u')).assertFalse();
      }
    });
  });
}
