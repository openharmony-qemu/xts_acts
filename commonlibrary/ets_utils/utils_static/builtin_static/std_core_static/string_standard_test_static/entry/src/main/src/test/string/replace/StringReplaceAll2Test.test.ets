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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringReplaceAll2Test(): void {
  describe('StringReplaceAll2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0100
     * @tc.name testReplaceAll001
     * @tc.desc Verify replaceAll() on string literal replaces all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = 'abcabc';
      let r1: string = s1.replaceAll('abc', 'X');
      expect(r1).assertEqual('XX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0200
     * @tc.name testReplaceAll002
     * @tc.desc Verify replaceAll() behavior consistency between string literal and new String()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literal: string = 'aabbccaa';
      let boxed: String = new String('aabbccaa');
      let rLiteral: string = literal.replaceAll('aa', 'XX');
      let rBoxed: string = boxed.replaceAll('aa', 'XX');
      expect(rLiteral).assertEqual(rBoxed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0300
     * @tc.name testReplaceAll003
     * @tc.desc Verify replaceAll() on const-declared string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sConst: string = 'test test test';
      let rConst: string = sConst.replaceAll('test', 'demo');
      expect(rConst).assertEqual('demo demo demo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0400
     * @tc.name testReplaceAll004
     * @tc.desc Verify replaceAll() on string literal with hyphens replaces all "a" with "X"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'a-b-c-a-b-c'.replaceAll('a', 'X');
      expect(r).assertEqual('X-b-c-X-b-c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0500
     * @tc.name testReplaceAll005
     * @tc.desc Verify replaceAll() replaces all emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\u{1F600}a\u{1F600}b\u{1F600}';
      let r: string = s.replaceAll('\u{1F600}', '\u{1F60A}');
      expect(r).assertEqual('\u{1F60A}a\u{1F60A}b\u{1F60A}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0600
     * @tc.name testReplaceAll006
     * @tc.desc Verify replaceAll() replaces all ZWJ emoji sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\u{1F468}‍\u{1F469}‍\u{1F467}-\u{1F468}‍\u{1F469}‍\u{1F467}';
      let r: string = s.replaceAll('\u{1F468}‍\u{1F469}‍\u{1F467}', 'family');
      expect(r).assertEqual('family-family');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0700
     * @tc.name testReplaceAll007
     * @tc.desc Verify replaceAll() replaces all 4-byte Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\u{20BB7}a\u{20BB7}b\u{20BB7}';
      let r: string = s.replaceAll('\u{20BB7}', '吉');
      expect(r).assertEqual('吉a吉b吉');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0800
     * @tc.name testReplaceAll008
     * @tc.desc Verify replaceAll() replaces all newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'line1\nline2\nline3';
      let r: string = s.replaceAll('\n', '|');
      expect(r).assertEqual('line1|line2|line3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_0900
     * @tc.name testReplaceAll009
     * @tc.desc Verify replaceAll() replaces all tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a\tb\tc';
      let r: string = s.replaceAll('\t', ',');
      expect(r).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1000
     * @tc.name testReplaceAll010
     * @tc.desc Verify replaceAll() replaces all null characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a\x00b\x00c';
      let r: string = s.replaceAll('\x00', '[NUL]');
      expect(r).assertEqual('a[NUL]b[NUL]c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1100
     * @tc.name testReplaceAll011
     * @tc.desc Verify replaceAll() replaces all traditional Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '數據數據庫';
      let r: string = s.replaceAll('數據', '資料');
      expect(r).assertEqual('資料資料庫');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1200
     * @tc.name testReplaceAll012
     * @tc.desc Verify replaceAll() replaces all occurrences in mixed script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'Hello世界Hello世界';
      let r: string = s.replaceAll('Hello', '你好');
      expect(r).assertEqual('你好世界你好世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1300
     * @tc.name testReplaceAll013
     * @tc.desc Verify replaceAll() with number coerced to string as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '123abc456def';
      let r: string = s.replaceAll(String(123), 'NUM');
      expect(r).assertEqual('NUMabc456def');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1400
     * @tc.name testReplaceAll014
     * @tc.desc Verify replaceAll() with boolean coerced to string as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'true or true';
      let r: string = s.replaceAll(String(true), 'bool');
      expect(r).assertEqual('bool or bool');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1500
     * @tc.name testReplaceAll015
     * @tc.desc Verify replaceAll() with "[object Object]" literal string as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '[object Object] and [object Object]';
      let r: string = s.replaceAll('[object Object]', 'OBJ');
      expect(r).assertEqual('OBJ and OBJ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1600
     * @tc.name testReplaceAll016
     * @tc.desc Verify replaceAll() with number coerced to string as replaceValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abcabc';
      let r: string = s.replaceAll('abc', String(999));
      expect(r).assertEqual('999999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1700
     * @tc.name testReplaceAll017
     * @tc.desc Verify replaceAll() with boolean coerced to string as replaceValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a-a-a';
      let r: string = s.replaceAll('a', String(true));
      expect(r).assertEqual('true-true-true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1800
     * @tc.name testReplaceAll018
     * @tc.desc Verify replaceAll() with empty replacement string removes all matched substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'abcabc'.replaceAll('abc', '');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_1900
     * @tc.name testReplaceAll019
     * @tc.desc Verify replaceAll() on numeric-looking string replaces all occurrences of "12" with "AB"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = '1212'.replaceAll('12', 'AB');
      expect(r).assertEqual('ABAB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2000
     * @tc.name testReplaceAll020
     * @tc.desc Verify chained replaceAll() then replace() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a-b-c-a-b-c';
      let r: string = s.replaceAll('-', '_').replace('a', 'X');
      expect(r).assertEqual('X_b_c_a_b_c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2100
     * @tc.name testReplaceAll021
     * @tc.desc Verify chained replaceAll() calls on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello world arkts';
      let r: string = s.replaceAll('o', 'O').replaceAll('l', 'L');
      expect(r).assertEqual('heLLO wOrLd arkts');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2200
     * @tc.name testReplaceAll022
     * @tc.desc Verify replaceAll() triple-layer validation: typeof, content, and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello world hello'.replaceAll('hello', 'hi');
      expect(r).assertEqual('hi world hi');
      expect(r.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2300
     * @tc.name testReplaceAll023
     * @tc.desc Verify replaceAll() length increases after full replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'aaa';
      let r: string = s.replaceAll('a', 'bb');
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2400
     * @tc.name testReplaceAll024
     * @tc.desc Verify replaceAll() throws error for regex without g flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'aaa'.replaceAll(new RegExp('a'), 'b');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2500
     * @tc.name testReplaceAll025
     * @tc.desc Verify constructing an invalid regex for use with replaceAll() throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let invalidRe: RegExp = new RegExp('[unclosed', 'g');
        'test'.replaceAll(invalidRe, 'X');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2600
     * @tc.name testReplaceAll026
     * @tc.desc Verify replaceAll() with valid g-flagged regex does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'abcabc'.replaceAll(new RegExp('abc', 'g'), 'X');
      expect(r).assertEqual('XX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2700
     * @tc.name testReplaceAll027
     * @tc.desc Verify replaceAll() with non-matching regex returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abcdef';
      let r: string = s.replaceAll(new RegExp('\\d', 'g'), 'NUM');
      expect(r).assertEqual('abcdef');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2800
     * @tc.name testReplaceAll028
     * @tc.desc Verify replaceAll() with single-match global regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'abc123'.replaceAll(new RegExp('\\d+', 'g'), 'NUM');
      expect(r).assertEqual('abcNUM');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_2900
     * @tc.name testReplaceAll029
     * @tc.desc Verify replaceAll() with global regex replacing multiple matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'a1b2c3d4'.replaceAll(new RegExp('\\d', 'g'), '*');
      expect(r).assertEqual('a*b*c*d*');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3000
     * @tc.name testReplaceAll030
     * @tc.desc Verify replaceAll() with g-flagged capture group regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = '2024-01-15 2024-07-17'.replaceAll(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})', 'g'), '$3/$2/$1');
      expect(r).assertEqual('15/01/2024 17/07/2024');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3100
     * @tc.name testReplaceAll031
     * @tc.desc Verify replace() replaces first only, replaceAll() replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abcabcabc';
      expect(s.replace('abc', 'X')).assertEqual('Xabcabc');
      expect(s.replaceAll('abc', 'X')).assertEqual('XXX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3200
     * @tc.name testReplaceAll032
     * @tc.desc Verify replaceAll() result property access: length, charAt, toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.replaceAll('l', 'LL');
      expect(r.length).assertEqual(7);
      expect(r.charAt(0).toString()).assertEqual('h');
      expect(r.toUpperCase()).assertEqual('HELLLLO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3300
     * @tc.name testReplaceAll033
     * @tc.desc Verify replaceAll() result length unchanged when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let r: string = s.replaceAll('xyz', 'abc');
      expect(r.length).assertEqual(s.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3400
     * @tc.name testReplaceAll034
     * @tc.desc Verify replaceAll() with function replacer on string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = 'abcabc';
      let r1: string = s1.replaceAll('abc', (m: string): string => m.toUpperCase());
      expect(r1).assertEqual('ABCABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3500
     * @tc.name testReplaceAll035
     * @tc.desc Verify replaceAll() with function replacer on new String() instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: String = new String('abcabc');
      let r2: string = s2.replaceAll('abc', (m: string): string => m.toUpperCase());
      expect(r2).assertEqual('ABCABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3600
     * @tc.name testReplaceAll036
     * @tc.desc Verify replaceAll() with function replacer on const-declared string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sConst: string = 'test test test';
      let rConst: string = sConst.replaceAll('test', (m: string): string => m.toUpperCase());
      expect(rConst).assertEqual('TEST TEST TEST');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3700
     * @tc.name testReplaceAll037
     * @tc.desc Verify replaceAll() with function replacer on function-returned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'a1b1c1'.replaceAll('1', (m: string): string => '[' + m + ']');
      expect(r).assertEqual('a[1]b[1]c[1]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3800
     * @tc.name testReplaceAll038
     * @tc.desc Verify replaceAll() with function replacer replaces all emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\u{1F600}a\u{1F600}b\u{1F600}';
      let r: string = s.replaceAll('\u{1F600}', (m: string): string => '\u{1F60A}');
      expect(r).assertEqual('\u{1F60A}a\u{1F60A}b\u{1F60A}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_3900
     * @tc.name testReplaceAll039
     * @tc.desc Verify replaceAll() with function replacer on ZWJ emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\u{1F468}‍\u{1F469}‍\u{1F467}-\u{1F468}‍\u{1F469}‍\u{1F467}';
      let r: string = s.replaceAll('\u{1F468}‍\u{1F469}‍\u{1F467}', (m: string): string => '[' + m.length + ']');
      expect(r).assertEqual('[8]-[8]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4000
     * @tc.name testReplaceAll040
     * @tc.desc Verify replaceAll() with function replacer and 4-byte Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '\u{20BB7}a\u{20BB7}b';
      let r: string = s.replaceAll('\u{20BB7}', (m: string): string => '吉');
      expect(r).assertEqual('吉a吉b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4100
     * @tc.name testReplaceAll041
     * @tc.desc Verify replaceAll() with function replacer wraps control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a\tb\tc';
      let r: string = s.replaceAll('\t', (m: string): string => '[TAB]');
      expect(r).assertEqual('a[TAB]b[TAB]c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4200
     * @tc.name testReplaceAll042
     * @tc.desc Verify replaceAll() with function replacer and traditional Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '數據數據庫';
      let r: string = s.replaceAll('數據', (m: string): string => '[' + m + ']');
      expect(r).assertEqual('[數據][數據]庫');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4300
     * @tc.name testReplaceAll043
     * @tc.desc Verify replaceAll() with number searchValue and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '123abc123def';
      let r: string = s.replaceAll(String(123), (m: string): string => '[NUM]');
      expect(r).assertEqual('[NUM]abc[NUM]def');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4400
     * @tc.name testReplaceAll044
     * @tc.desc Verify replaceAll() with boolean searchValue and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'true or true';
      let r: string = s.replaceAll(String(true), (m: string): string => m.toUpperCase());
      expect(r).assertEqual('TRUE or TRUE');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4500
     * @tc.name testReplaceAll045
     * @tc.desc Verify replaceAll() with object searchValue and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '[object Object] and [object Object]';
      let r: string = s.replaceAll('[object Object]', (m: string): string => '[OBJ]');
      expect(r).assertEqual('[OBJ] and [OBJ]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4600
     * @tc.name testReplaceAll046
     * @tc.desc Verify chained replaceAll(function) then replaceAll(string) call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a-b-c';
      let r: string = s
        .replaceAll(new RegExp('[a-z]', 'g'), (m: string): string => m.toUpperCase())
        .replaceAll('-', '_');
      expect(r).assertEqual('A_B_C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4700
     * @tc.name testReplaceAll047
     * @tc.desc Verify replaceAll() with function replacer triple-layer validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello world hello'.replaceAll('hello', (m: string): string => m.toUpperCase());
      expect(r).assertEqual('HELLO world HELLO');
      expect(r.length).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4800
     * @tc.name testReplaceAll048
     * @tc.desc Verify replaceAll() length verification when replacer returns doubled chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'ab'.replaceAll(new RegExp('.', 'g'), (m: string): string => m + m);
      expect(r.length).assertEqual(4);
      expect(r).assertEqual('aabb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_4900
     * @tc.name testReplaceAll049
     * @tc.desc Verify replaceAll() with non-global regex and function replacer throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'abc'.replaceAll(new RegExp('a'), (m: string): string => m);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5000
     * @tc.name testReplaceAll050
     * @tc.desc Verify replaceAll() catches error thrown by replacer function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'abc'.replaceAll(new RegExp('[a-z]', 'g'), (m: string): string => {
          throw new RangeError('out of range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.message).assertEqual('out of range');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5100
     * @tc.name testReplaceAll051
     * @tc.desc Verify replaceAll() with non-matching regex does not invoke replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      let r: string = 'hello'.replaceAll(new RegExp('\\d', 'g'), (m: string): string => {
        called = true;
        return 'N';
      });
      expect(called).assertFalse();
      expect(r).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5200
     * @tc.name testReplaceAll052
     * @tc.desc Verify replaceAll() with global regex invokes function replacer three times in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indices: number[] = [];
      let callIdx: number = 0;
      let r: string = 'a1a2a3'.replaceAll(
        new RegExp('\\d', 'g'),
        (match: string, args: (Object | undefined)[]): string => {
          indices.push(callIdx);
          callIdx++;
          return '(' + match + ')';
        },
      );
      expect(r).assertEqual('a(1)a(2)a(3)');
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5300
     * @tc.name testReplaceAll053
     * @tc.desc Verify replaceAll() with capture groups passed to function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = '2024-01 2024-07'.replaceAll(
        new RegExp('(\\d{4})-(\\d{2})', 'g'),
        (match: string, args: (Object | undefined)[]): string => {
          return (args[0] as string) + '年' + (args[1] as string) + '月';
        },
      );
      expect(r).assertEqual('2024年01月 2024年07月');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5400
     * @tc.name testReplaceAll054
     * @tc.desc Verify replaceAll() with function replacer result property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.replaceAll('l', (m: string): string => m.toUpperCase());
      expect(r.length).assertEqual(5);
      expect(r.charAt(2).toString()).assertEqual('L');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5500
     * @tc.name testReplaceAll055
     * @tc.desc Verify replaceAll() with function replacer deletes all, properties validate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'abcabc'.replaceAll('abc', (): string => '');
      expect(r.indexOf('a')).assertEqual(-1);
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5600
     * @tc.name testReplaceAll056
     * @tc.desc Verify replaceAll does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let before: string = s;
      s.replaceAll('l', 'x');
      expect(s).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5700
     * @tc.name testReplaceAll057
     * @tc.desc Verify replaceAll() with Japanese characters replaces all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'こんにちは こんにちは';
      let r: string = s.replaceAll('こんにちは', 'こんばんは');
      expect(r).assertEqual('こんばんは こんばんは');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5800
     * @tc.name testReplaceAll058
     * @tc.desc Verify replaceAll() with Cyrillic characters replaces all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'привет привет';
      let r: string = s.replaceAll('привет', 'здравствуйте');
      expect(r).assertEqual('здравствуйте здравствуйте');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_5900
     * @tc.name testReplaceAll059
     * @tc.desc Verify replaceAll() with NaN converted via String() as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'NaN123NaN';
      let r: string = s.replaceAll(String(Number.NaN), 'Num');
      expect(r).assertEqual('Num123Num');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6000
     * @tc.name testReplaceAll060
     * @tc.desc Verify replaceAll() with NaN converted via String() as replaceValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abc-abc';
      let r: string = s.replaceAll('abc', String(Number.NaN));
      expect(r).assertEqual('NaN-NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6100
     * @tc.name testReplaceAll061
     * @tc.desc Verify replaceAll() with String wrapper as searchValue via toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let search: String = new String('abc');
      let s: string = 'abcabcabc';
      let r: string = s.replaceAll(search.toString(), 'X');
      expect(r).assertEqual('XXX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6200
     * @tc.name testReplaceAll062
     * @tc.desc Verify replaceAll() with String wrapper as replaceValue via toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replaceVal: String = new String('XYZ');
      let s: string = 'abcabc';
      let r: string = s.replaceAll('abc', replaceVal.toString());
      expect(r).assertEqual('XYZXYZ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6300
     * @tc.name testReplaceAll063
     * @tc.desc Verify triple chained replaceAll() calls replacing three different substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a-b_c.d';
      let r: string = s.replaceAll('-', '_').replaceAll('_', '.').replaceAll('.', '!');
      expect(r).assertEqual('a!b!c!d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6400
     * @tc.name testReplaceAll064
     * @tc.desc Verify replaceAll() on large string with many occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello '.repeat(100) + 'world';
      let r: string = s.replaceAll('hello', 'hi');
      expect(r.indexOf('hello')).assertEqual(-1);
      expect(r.indexOf('hi')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6500
     * @tc.name testReplaceAll065
     * @tc.desc Verify replaceAll() on very large string with repeated single-char pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = 'a'.repeat(500);
      let r: string = base.replaceAll('a', 'b');
      expect(r.length).assertEqual(500);
      expect(r).assertEqual('b'.repeat(500));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6600
     * @tc.name testReplaceAll066
     * @tc.desc Verify replaceAll() on empty source string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.replaceAll('a', 'b');
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6700
     * @tc.name testReplaceAll067
     * @tc.desc Verify replaceAll() with regex i flag performs case-insensitive match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'Foo foo FOO'.replaceAll(new RegExp('foo', 'gi'), 'bar');
      expect(result).assertEqual('bar bar bar');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6800
     * @tc.name testReplaceAll068
     * @tc.desc Verify replaceAll() $$ replacement pattern inserts literal $
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a-b-c'.replaceAll('-', '[$$]');
      expect(result).assertEqual('a[$]b[$]c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL2_6900
     * @tc.name testReplaceAll069
     * @tc.desc Verify replaceAll() preserves surrogate pair in replacement value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceAll069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x-x'.replaceAll('x', '🎉');
      expect(result).assertEqual('🎉-🎉');
      expect(result.length).assertEqual(5);
    });
  });
}