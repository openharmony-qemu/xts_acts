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

function matchFirst<T extends string>(s: T, pat: RegExp): RegExpMatchArray | null {
  return s.match(pat);
}

export default function StringMatch2Test(): void {
  describe('StringMatch2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0100
     * @tc.name testMatch001
     * @tc.desc Verify match with empty regex returns array with empty string at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS';
      let match: RegExpMatchArray | null = str.match(new RegExp('(?:)'));
      expect(match).not().assertNull();
      expect(match![0]).assertEqual('');
      expect(match!.index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0200
     * @tc.name testMatch002
     * @tc.desc Verify match with named capture groups returns correct group values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'John:25';
      let match: RegExpMatchArray | null = str.match(new RegExp('(?<name>\\w+):(?<age>\\d+)'));
      expect(match).not().assertNull();
      expect(match![1]).assertEqual('John');
      expect(match![2]).assertEqual('25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0300
     * @tc.name testMatch003
     * @tc.desc Verify match with global regex on emoji text returns all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀🎉😀🎓';
      let match: RegExpMatchArray | null = str.match(new RegExp('😀', 'g'));
      expect(match).not().assertNull();
      expect(match!.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0400
     * @tc.name testMatch004
     * @tc.desc Verify match return value passes typeof and Array.isArray double validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS';
      let match: RegExpMatchArray | null = str.match('Ark');
      expect(match).not().assertNull();
      expect(Array.isArray(match)).assertTrue();
      expect(match!.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0500
     * @tc.name testMatch005
     * @tc.desc Verify match failure returns null and is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      let match: RegExpMatchArray | null = str.match(new RegExp('\\d+'));
      expect(match).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0600
     * @tc.name testMatch006
     * @tc.desc Verify new String instance and primitive string match results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('ArkTS ArkTS');
      let s2: string = 'ArkTS ArkTS';
      let m1: RegExpMatchArray | null = s1.match(new RegExp('Ark', 'g'));
      let m2: RegExpMatchArray | null = s2.match(new RegExp('Ark', 'g'));
      expect(m1!.length).assertEqual(m2!.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0700
     * @tc.name testMatch007
     * @tc.desc Verify generic function with T extends string returns correct match result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: RegExpMatchArray | null = matchFirst('ArkTS 123', new RegExp('\\d+'));
      expect(m).not().assertNull();
      expect(m![0]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0800
     * @tc.name testMatch008
     * @tc.desc Verify match with invalid regex throws SyntaxError and validates error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'test';
        str.match(new RegExp('('));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_0900
     * @tc.name testMatch009
     * @tc.desc Verify match() with g-flag regex called twice on same string returns identical results, proving internal state is reset between calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a1b22c333';
      let re: RegExp = new RegExp('\\d+', 'g');
      let m1: RegExpMatchArray | null = str.match(re);
      let m2: RegExpMatchArray | null = str.match(re);
      expect(m1).not().assertNull();
      expect(m2).not().assertNull();
      if (m1 !== null && m2 !== null) {
        expect(m1.length).assertEqual(m2.length);
        expect(m1[0]).assertEqual(m2[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1000
     * @tc.name testMatch010
     * @tc.desc Verify match() with g-flag regex on string with single match returns one-element array on both calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc123def';
      let re: RegExp = new RegExp('\\d+', 'g');
      let first: RegExpMatchArray | null = str.match(re);
      let second: RegExpMatchArray | null = str.match(re);
      expect(first).not().assertNull();
      expect(second).not().assertNull();
      if (first !== null) {
        expect(first.length).assertEqual(1);
        expect(first[0]).assertEqual('123');
      }
      if (second !== null) {
        expect(second.length).assertEqual(1);
        expect(second[0]).assertEqual('123');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1100
     * @tc.name testMatch011
     * @tc.desc Verify match with string and match with equivalent RegExp produce identical result arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'hello world';
      let mStr: RegExpMatchArray | null = s.match('world');
      let mRe: RegExpMatchArray | null = s.match(new RegExp('world'));
      expect(mStr).not().assertNull();
      expect(mRe).not().assertNull();
      if (mStr !== null && mRe !== null) {
        expect(mStr.length).assertEqual(mRe.length);
        expect(mStr[0]).assertEqual(mRe[0]);
        expect(mStr.index).assertEqual(mRe.index);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1200
     * @tc.name testMatch012
     * @tc.desc Verify match with dotAll flag "s" makes dot match newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('a.b', 's');
      let m: RegExpMatchArray | null = 'a\nb'.match(re);
      expect(m).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1300
     * @tc.name testMatch013
     * @tc.desc Verify match with global flag and empty pattern on emoji matches all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('', 'g');
      let m: RegExpMatchArray | null = '🔥'.match(re);
      expect(m).not().assertNull();
      expect(m!.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1400
     * @tc.name testMatch014
     * @tc.desc Verify match on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello123';
      let result: RegExpMatchArray | null = str.match(new RegExp('\\d+'));
      expect(result![0]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1500
     * @tc.name testMatch015
     * @tc.desc Verify match on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('abc123');
      let result: RegExpMatchArray | null = str.match(new RegExp('\\d+'));
      expect(result![0]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1600
     * @tc.name testMatch016
     * @tc.desc Verify match typeof result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: RegExpMatchArray | null = str.match(new RegExp('\\w+'));
      expect(result![0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1700
     * @tc.name testMatch017
     * @tc.desc Verify match does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.match(new RegExp('hello'));
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1800
     * @tc.name testMatch018
     * @tc.desc Verify match on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: RegExpMatchArray | null = str.match(new RegExp(''));
      expect(result![0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_1900
     * @tc.name testMatch019
     * @tc.desc Verify match on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '12345';
      let result: RegExpMatchArray | null = str.match(new RegExp('\\d+'));
      expect(result![0]).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_2000
     * @tc.name testMatch020
     * @tc.desc Verify match on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: RegExpMatchArray | null = ('he' + 'llo').match(new RegExp('\\w+'));
      expect(result![0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_2100
     * @tc.name testMatch021
     * @tc.desc Verify match on CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文123';
      let result: RegExpMatchArray | null = str.match(new RegExp('\\d+'));
      expect(result![0]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_2200
     * @tc.name testMatch022
     * @tc.desc Verify match after trim chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: RegExpMatchArray | null = str.trim().match(new RegExp('\\w+'));
      expect(result![0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH2_2300
     * @tc.name testMatch023
     * @tc.desc Verify large string match with global regex returns all occurrences in repeated pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatch023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcdefghij'.repeat(100);
      let re: RegExp = new RegExp('a', 'g');
      let m: RegExpMatchArray | null = str.match(re);
      expect(m).not().assertNull();
      expect(m!.length).assertEqual(100);
    });
  });
}