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

function getText(): string {
  return 'x1y2z3';
}

function countMatches<T extends string>(s: T, pat: RegExp): int {
  let count: int = 0;
  for (let m of s.matchAll(pat)) {
    count++;
  }
  return count;
}

export default function StringMatchAll2Test(): void {
  describe('StringMatchAll2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0100
     * @tc.name testMatchAll001
     * @tc.desc Verify matchAll with empty regex matches empty string at every position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ab';
      let iter: IterableIterator<RegExpMatchArray> = str.matchAll(new RegExp('(?:)', 'g'));
      let count: int = 0;
      for (let m of iter) {
        expect(m[0]).assertEqual('');
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0200
     * @tc.name testMatchAll002
     * @tc.desc Verify matchAll with Unicode range regex matches all Chinese character sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '你好世界abc测试';
      let iter: IterableIterator<RegExpMatchArray> = str.matchAll(new RegExp('[一-鿿]+', 'g'));
      let results: RegExpMatchArray[] = Array.from(iter);
      expect(results.length).assertEqual(2);
      expect(results[0][0]).assertEqual('你好世界');
      expect(results[1][0]).assertEqual('测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0300
     * @tc.name testMatchAll003
     * @tc.desc Verify matchAll with gi flags matches all occurrences case-insensitively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS arkts ARKTS';
      let iter: IterableIterator<RegExpMatchArray> = str.matchAll(new RegExp('arkts', 'gi'));
      let count: int = 0;
      for (let m of iter) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0400
     * @tc.name testMatchAll004
     * @tc.desc Verify new String instance matchAll has same iteration count as primitive string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('a1b2c3');
      let s2: string = 'a1b2c3';
      let count1: number = 0;
      let count2: number = 0;
      for (let m of s1.matchAll(new RegExp('\\d', 'g'))) {
        count1++;
      }
      for (let m of s2.matchAll(new RegExp('\\d', 'g'))) {
        count2++;
      }
      expect(count1).assertEqual(count2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0500
     * @tc.name testMatchAll005
     * @tc.desc Verify function-returned string can be chained with matchAll and iterated by for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      for (let m of getText().matchAll(new RegExp('\\d', 'g'))) {
        results.push(m[0]!);
      }
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0600
     * @tc.name testMatchAll006
     * @tc.desc Verify generic constraint T extends string calls matchAll and counts matches correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(countMatches('a1b2c3', new RegExp('\\d', 'g'))).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0700
     * @tc.name testMatchAll007
     * @tc.desc Verify matchAll with non-global regex throws Error and validates error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'ArkTS';
        str.matchAll(new RegExp('Ark'));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0800
     * @tc.name testMatchAll008
     * @tc.desc Verify matchAll iteration completeness on ultra-long repeated text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ab'.repeat(5000);
      let iter: IterableIterator<RegExpMatchArray> = str.matchAll(new RegExp('ab', 'g'));
      let count: int = 0;
      for (let m of iter) {
        count++;
      }
      expect(count).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_0900
     * @tc.name testMatchAll009
     * @tc.desc Verify matchAll iterator results match global match array results one-to-one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a1b2c3';
      let mArr: RegExpMatchArray | null = str.match(new RegExp('\\d', 'g'));
      let iterResults: string[] = [];
      for (let m of str.matchAll(new RegExp('\\d', 'g'))) {
        iterResults.push(m[0]!);
      }
      expect(mArr).not().assertNull();
      expect(mArr!.length).assertEqual(iterResults.length);
      for (let i = 0; i < mArr!.length; i++) {
        expect(mArr![i]).assertEqual(iterResults[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1000
     * @tc.name testMatchAll010
     * @tc.desc Verify matchAll with empty pattern (?:) iterates length+1 times for string of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abc';
      let count: int = 0;
      for (let m of s.matchAll(new RegExp('(?:)', 'g'))) {
        count++;
      }
      expect(count).assertEqual(s.length + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1100
     * @tc.name testMatchAll011
     * @tc.desc Verify matchAll iterator exhausted by first Array.from then second Array.from returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a1b2c3';
      let iter: IterableIterator<RegExpMatchArray> = s.matchAll(new RegExp('\\d', 'g'));
      let first: RegExpMatchArray[] = Array.from(iter);
      let second: RegExpMatchArray[] = Array.from(iter);
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1200
     * @tc.name testMatchAll012
     * @tc.desc Verify matchAll with capture group regex includes captured groups in each match array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ab12cd34';
      let results: RegExpMatchArray[] = Array.from(s.matchAll(new RegExp('(\\d)(\\d)', 'g')));
      expect(results.length).assertEqual(2);
      expect(results[0].length).assertEqual(3);
      expect(results[0][1]).assertEqual('1');
      expect(results[0][2]).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1300
     * @tc.name testMatchAll013
     * @tc.desc Verify matchAll on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'a1b2c3';
      let matches: RegExpMatchArray[] = Array.from(str.matchAll(new RegExp('\\d', 'g')));
      expect(matches.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1400
     * @tc.name testMatchAll014
     * @tc.desc Verify matchAll does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a1b2';
      let before: string = str;
      Array.from(str.matchAll(new RegExp('\\d', 'g')));
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1500
     * @tc.name testMatchAll015
     * @tc.desc Verify matchAll on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('x1y2');
      let matches: RegExpMatchArray[] = Array.from(str.matchAll(new RegExp('\\d', 'g')));
      expect(matches.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1600
     * @tc.name testMatchAll016
     * @tc.desc Verify matchAll on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let matches: RegExpMatchArray[] = Array.from(str.matchAll(new RegExp('\\d', 'g')));
      expect(matches.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1700
     * @tc.name testMatchAll017
     * @tc.desc Verify matchAll with word regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello world test';
      let matches: RegExpMatchArray[] = Array.from(str.matchAll(new RegExp('\\w+', 'g')));
      expect(matches.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1800
     * @tc.name testMatchAll018
     * @tc.desc Verify matchAll on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matches: RegExpMatchArray[] = Array.from(('he' + 'llo').matchAll(new RegExp('l', 'g')));
      expect(matches.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCHALL2_1900
     * @tc.name testMatchAll019
     * @tc.desc Verify matchAll on CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMatchAll019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '中文123英文456';
      let matches: RegExpMatchArray[] = Array.from(str.matchAll(new RegExp('\\d+', 'g')));
      expect(matches.length).assertEqual(2);
    });
  });
}