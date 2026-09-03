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

function takeSubstrTwo(s: string, f: int): string {
  return s.substr(f);
}

export default function StringSubstr2Test(): void {
  describe('StringSubstr2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0100
     * @tc.name testSubstr001
     * @tc.desc Verify substr() on string literal directly returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(1, 3);
      expect(result).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0200
     * @tc.name testSubstr002
     * @tc.desc Verify substr() on new String() instance returns correct substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: string = s.substr(2);
      expect(result).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0300
     * @tc.name testSubstr003
     * @tc.desc Verify substr() on empty new String() instance returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let result: string = s.substr(0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0400
     * @tc.name testSubstr004
     * @tc.desc Verify substr() on function-returned string works correctly with negative from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => string = (): string => {
        return 'ArkTS';
      };
      let result: string = fn().substr(-2);
      expect(result).assertEqual('TS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0500
     * @tc.name testSubstr005
     * @tc.desc Verify substr() on const-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = 'ArkTS';
      let result: string = s.substr(0, 3);
      expect(result).assertEqual('Ark');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0600
     * @tc.name testSubstr006
     * @tc.desc Verify substr() on let-declared variable works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      let result: string = s.substr(1, 2);
      expect(result).assertEqual('rk');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0700
     * @tc.name testSubstr007
     * @tc.desc Verify substr() on text containing emoji extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ab😀cd'.substr(2, 2);
      expect(result).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0800
     * @tc.name testSubstr008
     * @tc.desc Verify substr() on 4-byte Unicode surrogate pair extracts across code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a𝄞b𝄞c'.substr(1, 3);
      expect(result).assertEqual('𝄞b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_0900
     * @tc.name testSubstr009
     * @tc.desc Verify substr() on text containing NUL control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a\0b\0c'.substr(1, 3);
      expect(result).assertEqual('\0b\0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1000
     * @tc.name testSubstr010
     * @tc.desc Verify substr() on text containing backspace form-feed vertical-tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a\bb\fc\vd'.substr(2, 3);
      expect(result).assertEqual('b\fc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1100
     * @tc.name testSubstr011
     * @tc.desc Verify substr() on text containing non-breaking space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a b c'.substr(0, 4);
      expect(result).assertEqual('a b ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1200
     * @tc.name testSubstr012
     * @tc.desc Verify substr() on mixed-script text extracts at code-unit boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'Hello世界123'.substr(5, 4);
      expect(result).assertEqual('世界12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1300
     * @tc.name testSubstr013
     * @tc.desc Verify substr() with negative from on repeating-pattern text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'xyxyxyxy'.substr(-4, 2);
      expect(result).assertEqual('xy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1400
     * @tc.name testSubstr014
     * @tc.desc Verify substr() with from=0 returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(0);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1500
     * @tc.name testSubstr015
     * @tc.desc Verify substr() with from beyond length returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1600
     * @tc.name testSubstr016
     * @tc.desc Verify substr() with large negative from returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(-100);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1700
     * @tc.name testSubstr017
     * @tc.desc Verify substr() with length=0 returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1800
     * @tc.name testSubstr018
     * @tc.desc Verify substr() with length beyond string length extracts to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(0, 100);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_1900
     * @tc.name testSubstr019
     * @tc.desc Verify substr() with negative length returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(0, -100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2000
     * @tc.name testSubstr020
     * @tc.desc Verify substr() with from=0 and length=2 extracts first 2 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(0, 2);
      expect(result).assertEqual('he');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2100
     * @tc.name testSubstr021
     * @tc.desc Verify substr() with large negative from and positive length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hi'.substr(-100, 5);
      expect(result).assertEqual('hi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2200
     * @tc.name testSubstr022
     * @tc.desc Verify substr() on empty string with negative from and length returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.substr(-5, 3);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2300
     * @tc.name testSubstr023
     * @tc.desc Verify substr() on empty string with large index returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.substr(0, 100);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2400
     * @tc.name testSubstr024
     * @tc.desc Verify chained substr() calls produce correct intermediate extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.substr(0, 4).substr(1, 2);
      expect(result).assertEqual('el');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2500
     * @tc.name testSubstr025
     * @tc.desc Verify multi-level chained substr() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'ArkTSFramework'.substr(0, 7).substr(3, 4);
      expect(result).assertEqual('TSFr');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2600
     * @tc.name testSubstr026
     * @tc.desc Verify substr() inside helper function with negative start returns last chars "lo"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: (s: string, f: int) => string = takeSubstrTwo;
      let result: string = fn('hello', -2);
      expect(result).assertEqual('lo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2700
     * @tc.name testSubstr027
     * @tc.desc Verify substr() returns empty string with full dimension checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = 'hello'.substr(5, 2);
      expect(r).assertEqual('');
      expect(r.indexOf('h')).assertEqual(-1);
      expect(r.startsWith('hello')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2800
     * @tc.name testSubstr028
     * @tc.desc Verify substr() with from=0 on new String instance returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let result: string = s.substr(0);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_2900
     * @tc.name testSubstr029
     * @tc.desc Verify substr() vs slice() produce same result in this example with positive indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substr(1, 3);
      let r2: string = 'hello'.slice(1, 4);
      expect(r1).assertEqual('ell');
      expect(r2).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3000
     * @tc.name testSubstr030
     * @tc.desc Verify substr() with negative from vs slice() with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substr(-3, 2);
      let r2: string = 'hello'.slice(-3, -1);
      expect(r1).assertEqual('ll');
      expect(r2).assertEqual('ll');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3100
     * @tc.name testSubstr031
     * @tc.desc Verify substr() uses index+length while substring() uses index-to-index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substr(1, 3);
      let r2: string = 'hello'.substring(1, 4);
      expect(r1).assertEqual('ell');
      expect(r2).assertEqual('ell');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3200
     * @tc.name testSubstr032
     * @tc.desc Verify substr() with negative from plus large length vs slice() with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = 'hello'.substr(-3, 100);
      let r2: string = 'hello'.slice(-3);
      expect(r1).assertEqual('llo');
      expect(r2).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3300
     * @tc.name testSubstr033
     * @tc.desc Verify substr() after string concatenation with + operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('hello' + 'world').substr(2, 5);
      expect(result).assertEqual('llowo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3400
     * @tc.name testSubstr034
     * @tc.desc Verify property access combined with substr() produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'[1] + 'hello'.substr(2);
      expect(result).assertEqual('ello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3500
     * @tc.name testSubstr035
     * @tc.desc Verify substr() driven by .length property to extract last characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello';
      let result: string = s.substr(s.length - 3);
      expect(result).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3600
     * @tc.name testSubstr036
     * @tc.desc Verify substr cuts into a 4-byte emoji surrogate pair producing a broken half-surrogate detected by isWellFormed as false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'A\u{1F600}B';
      let cut: string = s.substr(1, 1);
      expect(cut.length).assertEqual(1);
      expect(cut.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3700
     * @tc.name testSubstr037
     * @tc.desc Verify substr on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world';
      let result: string = str.substr(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3800
     * @tc.name testSubstr038
     * @tc.desc Verify substr on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('hello world');
      let result: string = str.substr(6);
      expect(result).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_3900
     * @tc.name testSubstr039
     * @tc.desc Verify substr does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.substr(1);
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_4000
     * @tc.name testSubstr040
     * @tc.desc Verify substr with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.substr(-3);
      expect(result).assertEqual('llo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_4100
     * @tc.name testSubstr041
     * @tc.desc Verify substr() on Japanese text extracts characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'こんにちは世界'.substr(2, 2);
      expect(result).assertEqual('にち');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_4200
     * @tc.name testSubstr042
     * @tc.desc Verify chained substr() with concat then substr produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.concat(' world').substr(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR2_4300
     * @tc.name testSubstr043
     * @tc.desc Verify substr() on a large string of repeated characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstr043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: string = 'x'.repeat(1000);
      let result: string = large.substr(100, 800);
      expect(result.length).assertEqual(800);
    });
  });
}