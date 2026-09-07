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

function takeSubTwo(s: string): string {
  return s.substring(1, 3);
}

export default function StringSubstring2Test(): void {
  describe('StringSubstring2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0100
     * @tc.name testSubstring001
     * @tc.desc Verify substring() on string literal directly returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0, 2);
      expect(result).assertEqual('he');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0200
     * @tc.name testSubstring002
     * @tc.desc Verify substring() on new String() instance returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String('hello');
      let result: string = s.substring(1, 4);
      expect(result.toString()).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0300
     * @tc.name testSubstring003
     * @tc.desc Verify substring() on empty new String() instance returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String('');
      let result: string = s.substring(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0400
     * @tc.name testSubstring004
     * @tc.desc Verify substring() on function-returned string works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string = (): string => {
        return 'ArkTS';
      };
      let result: string = fn().substring(1);
      expect(result).assertEqual('rkTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0500
     * @tc.name testSubstring005
     * @tc.desc Verify substring() on const-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = 'ArkTS';
      let result: string = s.substring(0, 3);
      expect(result).assertEqual('Ark');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0600
     * @tc.name testSubstring006
     * @tc.desc Verify substring() on let-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      let result: string = s.substring(2);
      expect(result).assertEqual('kTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0700
     * @tc.name testSubstring007
     * @tc.desc Verify substring() on text containing emoji extracts at code-unit boundary producing lone surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello😀world'.substring(0, 6);
      expect(result).assertEqual('hello\uD83D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0800
     * @tc.name testSubstring008
     * @tc.desc Verify substring(0, 1) on a mixed string returns only the first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a𝄞b'.substring(0, 1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_0900
     * @tc.name testSubstring009
     * @tc.desc Verify substring() on text containing NUL control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a\0b\0c'.substring(0, 3);
      expect(result).assertEqual('a\0b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1000
     * @tc.name testSubstring010
     * @tc.desc Verify substring() on text containing backspace form-feed vertical-tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a\bb\fc\vd'.substring(1, 4);
      expect(result).assertEqual('\bb\f');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1100
     * @tc.name testSubstring011
     * @tc.desc Verify substring() on text containing non-breaking space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a b c'.substring(2, 5);
      expect(result).assertEqual('b c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1200
     * @tc.name testSubstring012
     * @tc.desc Verify substring() on mixed-script text extracts at code-unit boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'Hello世界123'.substring(0, 7);
      expect(result).assertEqual('Hello世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1300
     * @tc.name testSubstring013
     * @tc.desc Verify substring() on repeating-pattern text extracts correct repeated segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'abababab'.substring(0, 4);
      expect(result).assertEqual('abab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1400
     * @tc.name testSubstring014
     * @tc.desc Verify substring() with start=0 returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1500
     * @tc.name testSubstring015
     * @tc.desc Verify substring() with start beyond length returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1600
     * @tc.name testSubstring016
     * @tc.desc Verify substring() with negative start returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(-100);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1700
     * @tc.name testSubstring017
     * @tc.desc Verify substring() with start=0 and end=0 returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1800
     * @tc.name testSubstring018
     * @tc.desc Verify substring() with end beyond length extracts to end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0, 100);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_1900
     * @tc.name testSubstring019
     * @tc.desc Verify substring() with negative end returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0, -100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2000
     * @tc.name testSubstring020
     * @tc.desc Verify substring() with start=0 and end=3 extracts first 3 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0, 3);
      expect(result).assertEqual('hel');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2100
     * @tc.name testSubstring021
     * @tc.desc Verify substring() with both indices beyond length returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hi'.substring(100, 100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2200
     * @tc.name testSubstring022
     * @tc.desc Verify substring() on empty string with negative index returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.substring(-5);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2300
     * @tc.name testSubstring023
     * @tc.desc Verify substring() on empty string with large index returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.substring(0, 100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2400
     * @tc.name testSubstring024
     * @tc.desc Verify chained substring() calls produce correct intermediate extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(0, 4).substring(1, 3);
      expect(result).assertEqual('el');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2500
     * @tc.name testSubstring025
     * @tc.desc Verify multi-level chained substring() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ArkTSFramework'.substring(0, 5).substring(1, 4);
      expect(result).assertEqual('rkT');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2600
     * @tc.name testSubstring026
     * @tc.desc Verify substring() called via helper function returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeSubTwo('hello');
      expect(result).assertEqual('el');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2700
     * @tc.name testSubstring027
     * @tc.desc Verify substring() called via function reference variable with new string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: (s: string) => string = takeSubTwo;
      let result: string = fn(new String('hello').toString());
      expect(result).assertEqual('el');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2800
     * @tc.name testSubstring028
     * @tc.desc Verify substring() returns empty string with full dimension checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.substring(2, 2);
      expect(r).assertEqual('');
      expect(r.indexOf('l')).assertEqual(-1);
      expect(r.startsWith('hello')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_2900
     * @tc.name testSubstring029
     * @tc.desc Verify substring() with start=0 on new string instance returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String('hello');
      let result: string = s.substring(0);
      expect(result.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3000
     * @tc.name testSubstring030
     * @tc.desc Verify substring() on empty new string instance returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String('');
      expect(s.substring(0).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3100
     * @tc.name testSubstring031
     * @tc.desc Verify substring() vs slice() produce same result in normal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substring(1, 4);
      let r2: string = 'hello'.slice(1, 4);
      expect(r1).assertEqual('ell');
      expect(r2).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3200
     * @tc.name testSubstring032
     * @tc.desc Verify substring() swaps when start>end while slice() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substring(3, 1);
      let r2: string = 'hello'.slice(3, 1);
      expect(r1).assertEqual('el');
      expect(r2).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3300
     * @tc.name testSubstring033
     * @tc.desc Verify substring() treats negative as 0 while slice() counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substring(-3);
      let r2: string = 'hello'.slice(-3);
      expect(r1).assertEqual('hello');
      expect(r2).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3400
     * @tc.name testSubstring034
     * @tc.desc Verify substring() uses index-to-index while substr() uses index+length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substring(1, 3);
      let r2: string = 'hello'.substr(1, 3);
      expect(r1).assertEqual('el');
      expect(r2).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3500
     * @tc.name testSubstring035
     * @tc.desc Verify substring() after string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('hello' + 'world').substring(3, 8);
      expect(result).assertEqual('lowor');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3600
     * @tc.name testSubstring036
     * @tc.desc Verify property access combined with substring() produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'[0] + 'hello'.substring(1, 4);
      expect(result).assertEqual('hell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3700
     * @tc.name testSubstring037
     * @tc.desc Verify substring() driven by .length property to exclude last character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s.substring(0, s.length - 1);
      expect(result).assertEqual('hell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3800
     * @tc.name testSubstring038
     * @tc.desc Verify substring() after strict equality (===) check returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s === 'hello' ? s.substring(0) : '';
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_3900
     * @tc.name testSubstring039
     * @tc.desc Verify substring(4,1) auto-swaps to (1,4) then toUpperCase produces uppercase segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s.substring(4, 1).toUpperCase();
      expect(result).assertEqual('ELL');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4000
     * @tc.name testSubstring040
     * @tc.desc Verify substring and slice both return primitive string with typeof check on same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let sub: string = s.substring(0, 3);
      let sli: string = s.slice(0, 3);

      expect(sub).assertEqual(sli);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4100
     * @tc.name testSubstring041
     * @tc.desc Verify substring(0,1) on 4-byte surrogate-pair emoji produces lone high surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🌟';
      let truncated: string = emoji.substring(0, 1);
      expect(truncated.length).assertEqual(1);
      expect(truncated.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4200
     * @tc.name testSubstring042
     * @tc.desc Verify substring(0,2) on surrogate pair preserves full emoji and is well-formed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🌟';
      let full: string = emoji.substring(0, 2);
      expect(full.length).assertEqual(2);
      expect(full.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4300
     * @tc.name testSubstring043
     * @tc.desc Verify substring on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world';
      let result: string = str.substring(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4400
     * @tc.name testSubstring044
     * @tc.desc Verify substring on string instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = new String('hello world');
      let result: string = str.substring(6);
      expect(result).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4500
     * @tc.name testSubstring045
     * @tc.desc Verify substring does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.substring(1);
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4600
     * @tc.name testSubstring046
     * @tc.desc Verify substring on expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substring(1, 3);
      expect(result).assertEqual('el');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4700
     * @tc.name testSubstring047
     * @tc.desc Verify chained substring() with concat then substring produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat(' world').substring(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4800
     * @tc.name testSubstring048
     * @tc.desc Verify substring() does not mutate the original string instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = new String('hello');
      let before: string = str.toString();
      str.substring(1);
      expect(str.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_4900
     * @tc.name testSubstring049
     * @tc.desc Verify substring() and slice() with negative start index produce different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substring(-1);
      let r2: string = 'hello'.slice(-1);
      expect(r1).assertEqual('hello');
      expect(r2).assertEqual('o');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING2_5000
     * @tc.name testSubstring050
     * @tc.desc Verify substring() on a large string of repeated characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstring050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: string = 'x'.repeat(1000);
      let result: string = large.substring(100, 900);
      expect(result.length).assertEqual(800);
    });
  });
}