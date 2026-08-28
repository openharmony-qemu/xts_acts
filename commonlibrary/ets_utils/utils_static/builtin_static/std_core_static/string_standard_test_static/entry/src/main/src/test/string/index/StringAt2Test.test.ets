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

function safeAt<T extends string>(s: T, idx: int): string | undefined {
  return s.at(idx);
}

export default function StringAt2Test(): void {
  describe('StringAt2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0100
     * @tc.name testAt001
     * @tc.desc Verify at with index 0 returns first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      expect(s.at(0)!).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0200
     * @tc.name testAt002
     * @tc.desc Verify at with out-of-range index and negative out-of-range index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      expect(s.at(999)).assertUndefined();
      expect(s.at(-999)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0300
     * @tc.name testAt003
     * @tc.desc Verify at with valid indices returns correct characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      expect(s.at(1)!).assertEqual('r');
      expect(s.at(4)!).assertEqual('S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0400
     * @tc.name testAt004
     * @tc.desc Verify new String instance at returns same result as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('ArkTS');
      let s2: string = 'ArkTS';
      expect(s1.at(0)!).assertEqual(s2.at(0)!);
      expect(s1.at(100)).assertUndefined();
      expect(s2.at(100)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0500
     * @tc.name testAt005
     * @tc.desc Verify at valid index returns correct content with typeof and length triple check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      let r = s.at(0);
      expect(r!).assertEqual('A');
      expect(r!.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0600
     * @tc.name testAt006
     * @tc.desc Verify at on 4-byte supplementary plane character code unit positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'A\u{20000}B';
      expect(s.at(0)!).assertEqual('A');
      expect(s.at(3)!).assertEqual('B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0700
     * @tc.name testAt007
     * @tc.desc Verify at on mixed Chinese English and emoji text at various positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'Hi你好😀';
      expect(s.at(0)!).assertEqual('H');
      expect(s.at(2)!).assertEqual('你');
      let emojiHigh: string | undefined = s.at(4);
      expect(emojiHigh).not().assertUndefined();
      expect(emojiHigh!.length).assertEqual(1);
      expect(emojiHigh!).assertEqual('\uD83D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0800
     * @tc.name testAt008
     * @tc.desc Verify generic function with T extends string calls at and returns string or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(safeAt('ArkTS', 0)!).assertEqual('A');
      expect(safeAt('ArkTS', 999)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_0900
     * @tc.name testAt009
     * @tc.desc Verify at does not throw exception for invalid index and returns undefined instead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      try {
        let r = s.at(-100);
        expect(r).assertUndefined();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1000
     * @tc.name testAt010
     * @tc.desc Verify out-of-bound charAt throws StringIndexOutOfBoundsError while at returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'AB';
      let atResult = s.at(99);
      expect(atResult).assertUndefined();
      try {
        s.charAt(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1100
     * @tc.name testAt011
     * @tc.desc Verify at(0) on 4-byte emoji returns lone high surrogate as single-char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🌟';
      let first: string | undefined = emoji.at(0);
      expect(first).not().assertUndefined();
      expect(first!.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1200
     * @tc.name testAt012
     * @tc.desc Verify at(-1) on 4-byte emoji returns lone low surrogate (last code unit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🔥';
      let last: string | undefined = emoji.at(-1);
      expect(last).not().assertUndefined();
      expect(last!.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1300
     * @tc.name testAt013
     * @tc.desc Verify at(-1) returns last character of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello';
      let last: string | undefined = str.at(-1);
      expect(last).assertEqual('o');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1400
     * @tc.name testAt014
     * @tc.desc Verify at with index equal to string length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ABC';
      let r: string | undefined = str.at(str.length);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1500
     * @tc.name testAt015
     * @tc.desc Verify at on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: string | undefined = str.at(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1600
     * @tc.name testAt016
     * @tc.desc Verify at on Japanese hiragana returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'こんにちは';
      expect(str.at(0)!).assertEqual('こ');
      expect(str.at(4)!).assertEqual('は');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1700
     * @tc.name testAt017
     * @tc.desc Verify at on Cyrillic text returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'привет';
      expect(str.at(0)!).assertEqual('п');
      expect(str.at(3)!).assertEqual('в');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT2_1800
     * @tc.name testAt018
     * @tc.desc Verify chained trim and at returns post-trim first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      expect(str.trim().at(0)!).assertEqual('h');
    });
  });
}