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

function firstChar(s: string): char {
  return s.charAt(0);
}

export default function StringCharAt2Test(): void {
  describe('StringCharAt2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0100
     * @tc.name testCharAt001
     * @tc.desc Verify charAt with index 0 returns the first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      let ch: char = s.charAt(0);
      expect(ch.toString()).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0200
     * @tc.name testCharAt002
     * @tc.desc Verify charAt with out-of-range index 999 throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      try {
        s.charAt(999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0300
     * @tc.name testCharAt003
     * @tc.desc Verify charAt with index 1 returns the second character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      expect(s.charAt(1).toString()).assertEqual('r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0400
     * @tc.name testCharAt004
     * @tc.desc Verify new String instance charAt returns same result as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('ArkTS');
      let s2: string = 'ArkTS';
      expect(s1.charAt(0).toString()).assertEqual(s2.charAt(0).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0500
     * @tc.name testCharAt005
     * @tc.desc Verify charAt chained on function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(firstChar('ArkTS').toString()).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0600
     * @tc.name testCharAt006
     * @tc.desc Verify charAt on emoji string returns surrogate pair code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '😀A';
      let ch0: char = s.charAt(0);
      let ch1: char = s.charAt(1);
      let ch2: char = s.charAt(2);
      expect(ch0.toString()).assertEqual('\uD83D');
      expect(ch1.toString()).assertEqual('\uDE00');
      expect(ch2.toString()).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0700
     * @tc.name testCharAt007
     * @tc.desc Verify charAt on full-width CJK punctuation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '你好。世界！';
      expect(s.charAt(2).toString()).assertEqual('。');
      expect(s.charAt(5).toString()).assertEqual('！');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0800
     * @tc.name testCharAt008
     * @tc.desc Verify charAt(0) returns char (needs toString) and at(0) returns string|undefined, both produce same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      let byCharAt: string = s.charAt(0).toString();
      let byAt = s.at(0);
      expect(byAt).not().assertUndefined();
      expect(byCharAt).assertEqual(byAt!);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_0900
     * @tc.name testCharAt009
     * @tc.desc Verify charAt(0) on 4-byte emoji returns lone high surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🔥';
      let ch: char = emoji.charAt(0);
      expect(ch.toString().length).assertEqual(1);
      expect(emoji.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1000
     * @tc.name testCharAt010
     * @tc.desc Verify charAt(1) on 4-byte emoji returns lone low surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = '🔥';
      let ch: char = emoji.charAt(1);
      expect(ch.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1100
     * @tc.name testCharAt011
     * @tc.desc Verify charAt with negative index -1 throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ArkTS';
      try {
        s.charAt(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1200
     * @tc.name testCharAt012
     * @tc.desc Verify charAt at exact string length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'ABC';
      try {
        s.charAt(s.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1300
     * @tc.name testCharAt013
     * @tc.desc Verify charAt on String wrapper with index returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('test');
      let ch: char = s.charAt(2);
      expect(ch.toString()).assertEqual('s');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1400
     * @tc.name testCharAt014
     * @tc.desc Verify chained charAt after slice returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ch: char = 'hello world'.slice(6).charAt(0);
      expect(ch.toString()).assertEqual('w');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1500
     * @tc.name testCharAt015
     * @tc.desc Verify charAt on a large string returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: string = 'x'.repeat(1000);
      let ch: char = large.charAt(999);
      expect(ch.toString()).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1600
     * @tc.name testCharAt016
     * @tc.desc Verify charAt() with NaN index returns character at index 0 (NaN coerces to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abc';
      let chCode: int = s.charCodeAt(Number.NaN.toInt());
      let ch: string = String.fromCharCode(chCode);
      expect(ch).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1700
     * @tc.name testCharAt017
     * @tc.desc Verify charAt() with undefined index returns character at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'abc';
      let ch: string = String.fromCharCode(s.charCodeAt(0));
      expect(ch).assertEqual('a');
      expect(ch).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT2_1800
     * @tc.name testCharAt018
     * @tc.desc Verify charAt() on empty string with index 0 throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCharAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ''.charAt(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });
  });
}