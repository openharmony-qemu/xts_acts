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

function takeSplitOne<T extends string>(s: T, sep: string): string[] {
  return s.split(sep);
}

function takeSplitTwo<T extends string>(s: T, sep: string, limit: int): string[] {
  return s.split(sep, limit);
}

export default function StringSplit2Test(): void {
  describe('StringSplit2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0100
     * @tc.name testSplit001
     * @tc.desc Verify split() on string literal directly splits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b,c'.split(',');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0200
     * @tc.name testSplit002
     * @tc.desc Verify split() on new String() instance splits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a,b,c');
      let result: string[] = s.split(',');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0300
     * @tc.name testSplit003
     * @tc.desc Verify split() on empty new String() instance returns array with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let result: string[] = s.split(',');
      expect(result.length).assertEqual(1);
      expect(result[0].toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0400
     * @tc.name testSplit004
     * @tc.desc Verify split() on function-returned string works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string = (): string => {
        return 'x|y|z';
      };
      let result: string[] = fn().split('|');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0500
     * @tc.name testSplit005
     * @tc.desc Verify split() on let-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '1-2-3';
      let result: string[] = s.split('-');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0600
     * @tc.name testSplit006
     * @tc.desc Verify split() on text containing emoji as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a😀b😁c'.split('😀');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b😁c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0700
     * @tc.name testSplit007
     * @tc.desc Verify split() with empty string separator on emoji text splits at each UTF-16 code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = '😀😁😂'.split('');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0800
     * @tc.name testSplit008
     * @tc.desc Verify split() on 4-byte Unicode surrogate pair as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a𝄞b𝄞c'.split('𝄞');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_0900
     * @tc.name testSplit009
     * @tc.desc Verify split() with NUL control character as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a\0b\0c'.split('\0');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1000
     * @tc.name testSplit010
     * @tc.desc Verify split() with form-feed character as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a\bb\fc\vd'.split('\f');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a\bb');
      expect(result[1]).assertEqual('c\vd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1100
     * @tc.name testSplit011
     * @tc.desc Verify split() with non-breaking space as separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a b c'.split(' ');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1200
     * @tc.name testSplit012
     * @tc.desc Verify split() on mixed-script text with hyphen separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'Hello-世界-123'.split('-');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('Hello');
      expect(result[1]).assertEqual('世界');
      expect(result[2]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1300
     * @tc.name testSplit013
     * @tc.desc Verify split() on repeating-pattern text with pattern separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'abababab'.split('ab');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1400
     * @tc.name testSplit014
     * @tc.desc Verify split() with empty string separator splits each character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'hello'.split('');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1500
     * @tc.name testSplit015
     * @tc.desc Verify split() with RegExp separator produces correct array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a1b2c3'.split(new RegExp('\\d'));
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1600
     * @tc.name testSplit016
     * @tc.desc Verify split() with limit=0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b,c'.split(',', 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1700
     * @tc.name testSplit017
     * @tc.desc Verify split() with limit exceeding element count returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b,c'.split(',', 100);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1800
     * @tc.name testSplit018
     * @tc.desc Verify split() with negative limit returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b,c'.split(',', -100);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_1900
     * @tc.name testSplit019
     * @tc.desc Verify split() with limit=2 returns only first 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b,c,d'.split(',', 2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2000
     * @tc.name testSplit020
     * @tc.desc Verify split() with limit=1 returns only first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b,c'.split(',', 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2100
     * @tc.name testSplit021
     * @tc.desc Verify chained split() with dash and join() with pipe changes separator from dashes to pipes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a-b-c-d'.split('-').join('|');
      expect(result).assertEqual('a|b|c|d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2200
     * @tc.name testSplit022
     * @tc.desc Verify split() result element access with toUpperCase() chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a,b,c'.split(',')[0].toUpperCase();
      expect(result).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2300
     * @tc.name testSplit023
     * @tc.desc Verify split() inside generic function with limit parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = takeSplitTwo('a,b,c,d', ',', 2);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2400
     * @tc.name testSplit024
     * @tc.desc Verify split() inside generic function with empty string separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = takeSplitOne('abc', '');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2500
     * @tc.name testSplit025
     * @tc.desc Verify split() return value with Array.isArray plus length checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string[] = 'a,b,c'.split(',');
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2600
     * @tc.name testSplit026
     * @tc.desc Verify split() with non-existent separator returns single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string[] = 'hello'.split('X');
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2700
     * @tc.name testSplit027
     * @tc.desc Verify split() with limit=0 returns empty array verified by isArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string[] = 'a,b'.split(',', 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2800
     * @tc.name testSplit028
     * @tc.desc Verify split() with empty string separator returns character array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: string[] = s.split('');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_2900
     * @tc.name testSplit029
     * @tc.desc Verify split() then join() round-trip preserves original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a,b,c'.split(',').join(',');
      expect(result).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3000
     * @tc.name testSplit030
     * @tc.desc Verify split() with empty string produces same structure as spread would
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'abc'.split('');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3100
     * @tc.name testSplit031
     * @tc.desc Verify split() vs match() with global regex produce comparable element counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string[] = 'a,b,c'.split(',');
      let r2: RegExpMatchArray | null = 'a,b,c'.match(new RegExp('[a-z]', 'g'));
      expect(r1.length).assertEqual(3);
      expect(r2).not().assertNull();
      if (r2 !== null) {
        expect(r2.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3200
     * @tc.name testSplit032
     * @tc.desc Verify split() with limit vs array slice() produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string[] = 'a,b,c,d'.split(',', 2);
      let r2: string[] = 'a,b,c,d'.split(',').slice(0, 2);
      expect(r1.length).assertEqual(r2.length);
      expect(r1[0]).assertEqual(r2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3300
     * @tc.name testSplit033
     * @tc.desc Verify split() after string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = ('a,' + 'b,c').split(',');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3400
     * @tc.name testSplit034
     * @tc.desc Verify split() elements combined with + operator produce concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a,b,c'.split(',')[0] + '-' + 'a,b,c'.split(',')[1];
      expect(result).assertEqual('a-b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3500
     * @tc.name testSplit035
     * @tc.desc Verify property access combined with split() produces correct concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a,b';
      let result: string = s[0] + s.split(',')[1];
      expect(result).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3600
     * @tc.name testSplit036
     * @tc.desc Verify split() with limit driven by .length property division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a,b,c,d';
      let limit: int = 2;
      let result: string[] = s.split(',', limit);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3700
     * @tc.name testSplit037
     * @tc.desc Verify split with RegExp \d+ then join with dash rebuilds string with separators replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a1b22c333';
      let parts: string[] = s.split(new RegExp('\\d+'));
      let result: string = parts.join('-');
      expect(result).assertEqual('a-b-c-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3800
     * @tc.name testSplit038
     * @tc.desc Verify split with capture group regex includes captured groups in result array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a1b2c';
      let parts: string[] = s.split(new RegExp('(\\d)'));
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('a');
      expect(parts[1]).assertEqual('1');
      expect(parts[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_3900
     * @tc.name testSplit039
     * @tc.desc Verify split("") on 4-byte emoji breaks into 2 lone surrogate halves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🔥';
      let parts: string[] = emoji.split('');
      expect(parts.length).assertEqual(2);
      expect(parts[0].length).assertEqual(1);
      expect(parts[1].length).assertEqual(1);
      expect(parts[0].isWellFormed()).assertFalse();
      expect(parts[1].isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4000
     * @tc.name testSplit040
     * @tc.desc Verify split("") on multi-char string with emoji counts code units not code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixed: string = 'a🔥b';
      let parts: string[] = mixed.split('');
      expect(parts.length).assertEqual(4);
      expect(parts.join('')).assertEqual(mixed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4100
     * @tc.name testSplit041
     * @tc.desc Verify split on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'a,b,c';
      let result: string[] = str.split(',');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4200
     * @tc.name testSplit042
     * @tc.desc Verify split does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a,b';
      let before: string = str;
      str.split(',');
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4300
     * @tc.name testSplit043
     * @tc.desc Verify split typeof result is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a,b'.split(',');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4400
     * @tc.name testSplit044
     * @tc.desc Verify split with regex dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string[] = 'a.b.c'.split(new RegExp('\\.'));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4500
     * @tc.name testSplit045
     * @tc.desc Verify split() on String wrapper with non-matching separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: string[] = s.split('x');
      expect(result.length).assertEqual(1);
      expect(result[0].toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4600
     * @tc.name testSplit046
     * @tc.desc Verify chained split() with reverse and join transforms the string order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a,b,c'.split(',').reverse().join('|');
      expect(result).assertEqual('c|b|a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT2_4700
     * @tc.name testSplit047
     * @tc.desc Verify split() with invalid regex throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSplit047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'hello'.split(new RegExp('['));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });
  });
}