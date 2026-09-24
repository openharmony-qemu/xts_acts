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

function takeSliceOne<T extends string>(s: T, start: int, end: int): string {
  return s.slice(start, end);
}

function takeSliceTwo<T extends string>(s: T): string {
  return s.slice();
}

export default function StringSlice2Test(): void {
  describe('StringSlice2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0100
     * @tc.name testSlice001
     * @tc.desc Verify slice() on string literal directly returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(1, 4);
      expect(result).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0200
     * @tc.name testSlice002
     * @tc.desc Verify slice() on new String() instance returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: string = s.slice(2);
      expect(result).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0300
     * @tc.name testSlice003
     * @tc.desc Verify slice() on empty new String() instance returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let result: string = s.slice();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0400
     * @tc.name testSlice004
     * @tc.desc Verify slice() on function-returned string works correctly with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string = (): string => {
        return 'ArkTS';
      };
      let result: string = fn().slice(-2);
      expect(result).assertEqual('TS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0500
     * @tc.name testSlice005
     * @tc.desc Verify slice() on const-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = 'ArkTS';
      let result: string = s.slice(0, 3);
      expect(result).assertEqual('Ark');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0600
     * @tc.name testSlice006
     * @tc.desc Verify slice() on let-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      let result: string = s.slice(1);
      expect(result).assertEqual('rkTS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0700
     * @tc.name testSlice007
     * @tc.desc Verify slice() on text containing emoji extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ab😀cd'.slice(2, 4);
      expect(result).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0800
     * @tc.name testSlice008
     * @tc.desc Verify slice() on 4-byte Unicode surrogate pair extracts across code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a𝄞b𝄞c'.slice(1, 4);
      expect(result).assertEqual('𝄞b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_0900
     * @tc.name testSlice009
     * @tc.desc Verify slice() on text containing NUL control character with negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a\0b\0c'.slice(1, -1);
      expect(result).assertEqual('\0b\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1000
     * @tc.name testSlice010
     * @tc.desc Verify slice() on text containing backspace form-feed vertical-tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a\bb\fc\vd'.slice(1, 4);
      expect(result).assertEqual('\bb\f');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1100
     * @tc.name testSlice011
     * @tc.desc Verify slice() on text containing non-breaking space with negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a b c'.slice(1, -1);
      expect(result).assertEqual(' b ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1200
     * @tc.name testSlice012
     * @tc.desc Verify slice() on mixed-script text with mixed sign indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'Hello世界123'.slice(5, -3);
      expect(result).assertEqual('世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1300
     * @tc.name testSlice013
     * @tc.desc Verify slice() with double negative indices on repeating-pattern text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'xyxyxyxy'.slice(-6, -2);
      expect(result).assertEqual('xyxy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1400
     * @tc.name testSlice014
     * @tc.desc Verify slice() with start=0 returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(0);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1500
     * @tc.name testSlice015
     * @tc.desc Verify slice() with start beyond length returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1600
     * @tc.name testSlice016
     * @tc.desc Verify slice() with large negative start returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(-100);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1700
     * @tc.name testSlice017
     * @tc.desc Verify slice() with start=0 and end=0 returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1800
     * @tc.name testSlice018
     * @tc.desc Verify slice() with end beyond length extracts to end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(0, 100);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_1900
     * @tc.name testSlice019
     * @tc.desc Verify slice() with large negative end returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(0, -100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2000
     * @tc.name testSlice020
     * @tc.desc Verify slice() with start=0 and end=3 extracts first 3 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(0, 3);
      expect(result).assertEqual('hel');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2100
     * @tc.name testSlice021
     * @tc.desc Verify slice() with negative start whose absolute value exceeds length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hi'.slice(-100);
      expect(result).assertEqual('hi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2200
     * @tc.name testSlice022
     * @tc.desc Verify slice() with large negative start and positive end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hi'.slice(-100, 1);
      expect(result).assertEqual('h');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2300
     * @tc.name testSlice023
     * @tc.desc Verify slice() with both indices beyond length returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hi'.slice(100, 100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2400
     * @tc.name testSlice024
     * @tc.desc Verify slice() on empty string with negative index returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.slice(-5);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2500
     * @tc.name testSlice025
     * @tc.desc Verify slice() on empty string with zero arguments returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.slice();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2600
     * @tc.name testSlice026
     * @tc.desc Verify slice() with zero arguments returns full copy of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2700
     * @tc.name testSlice027
     * @tc.desc Verify chained slice() calls produce correct intermediate extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.slice(0, 4).slice(1);
      expect(result).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2800
     * @tc.name testSlice028
     * @tc.desc Verify slice() inside generic function with T extends string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeSliceOne('hello', 1, 4);
      expect(result).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_2900
     * @tc.name testSlice029
     * @tc.desc Verify slice() inside generic function with zero arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeSliceTwo('hello');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3000
     * @tc.name testSlice030
     * @tc.desc Verify slice() inside generic function with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = takeSliceOne('hello', -3, -1);
      expect(result).assertEqual('ll');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3100
     * @tc.name testSlice031
     * @tc.desc Verify slice() returns empty string when start>end with full dimension checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.slice(3, 1);
      expect(r).assertEqual('');
      expect(r.indexOf('e')).assertEqual(-1);
      expect(r.startsWith('hello')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3200
     * @tc.name testSlice032
     * @tc.desc Verify slice() with zero arguments returns full copy with full dimension checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.slice();
      expect(r).assertEqual('hello');
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3300
     * @tc.name testSlice033
     * @tc.desc Verify slice() with zero arguments returns full copy on new String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: string = s.slice();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3400
     * @tc.name testSlice034
     * @tc.desc Verify slice() vs substring() when start>end: slice returns empty, substring swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.slice(3, 1);
      let r2: string = 'hello'.substring(3, 1);
      expect(r1).assertEqual('');
      expect(r2).assertEqual('el');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3500
     * @tc.name testSlice035
     * @tc.desc Verify slice() with negative index counts from end while substring() treats as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.slice(-3);
      let r2: string = 'hello'.substring(-3);
      expect(r1).assertEqual('llo');
      expect(r2).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3600
     * @tc.name testSlice036
     * @tc.desc Verify slice() with zero arguments and substr(0) both return the full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let r1: string = s.slice();
      let r2: string = s.substr(0);
      expect(r1).assertEqual('hello');
      expect(r2).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3700
     * @tc.name testSlice037
     * @tc.desc Verify slice() with negative index vs substr() with negative from produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.slice(-3);
      let r2: string = 'hello'.substr(-3);
      expect(r1).assertEqual('llo');
      expect(r2).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3800
     * @tc.name testSlice038
     * @tc.desc Verify slice() with double negative vs substr() produce same result with different semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.slice(-4, -1);
      let r2: string = 'hello'.substr(-4, 3);
      expect(r1).assertEqual('ell');
      expect(r2).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_3900
     * @tc.name testSlice039
     * @tc.desc Verify slice() after string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('hello' + 'world').slice(2, 7);
      expect(result).assertEqual('llowo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4000
     * @tc.name testSlice040
     * @tc.desc Verify property access combined with slice() produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'[1] + 'hello'.slice(2);
      expect(result).assertEqual('ello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4100
     * @tc.name testSlice041
     * @tc.desc Verify slice() driven by .length property to extract last characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s.slice(s.length - 2);
      expect(result).assertEqual('lo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4200
     * @tc.name testSlice042
     * @tc.desc Verify slice() after strict equality check extracts substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s === 'hello' ? s.slice(1) : '';
      expect(result).assertEqual('ello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4300
     * @tc.name testSlice043
     * @tc.desc Verify slice() after strict equality check extracts first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s === 'hello' ? s.slice(0, 1) : '';
      expect(result).assertEqual('h');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4400
     * @tc.name testSlice044
     * @tc.desc Verify slice(-1) extracts last char then charCodeAt(0) returns its ASCII code 90 for Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abcXYZ';
      let last: string = s.slice(-1);
      let code: number = last.charCodeAt(0);
      expect(code).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4500
     * @tc.name testSlice045
     * @tc.desc Verify slice(0,1) on 4-byte surrogate-pair emoji produces lone high surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🔥';
      let truncated: string = emoji.slice(0, 1);
      expect(truncated.length).assertEqual(1);
      expect(truncated.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4600
     * @tc.name testSlice046
     * @tc.desc Verify slice(0,2) on surrogate pair preserves full emoji and is well-formed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🔥';
      let full: string = emoji.slice(0, 2);
      expect(full.length).assertEqual(2);
      expect(full.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4700
     * @tc.name testSlice047
     * @tc.desc Verify slice on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world';
      let result: string = str.slice(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4800
     * @tc.name testSlice048
     * @tc.desc Verify slice on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('hello world');
      let result: string = str.slice(6);
      expect(result).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_4900
     * @tc.name testSlice049
     * @tc.desc Verify slice does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.slice(1);
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_5000
     * @tc.name testSlice050
     * @tc.desc Verify slice with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.slice(-3);
      expect(result).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_5100
     * @tc.name testSlice051
     * @tc.desc Verify chained slice() with concat then slice produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat(' world').slice(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE2_5200
     * @tc.name testSlice052
     * @tc.desc Verify slice() on a large string of repeated characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: string = 'x'.repeat(1000);
      let result: string = large.slice(100, 900);
      expect(result.length).assertEqual(800);
    });
  });
}