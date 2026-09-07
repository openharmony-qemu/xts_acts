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

function getStr(): string {
  return '😀';
}

function codeAt<T extends string>(s: T): int | undefined {
  return s.codePointAt(0);
}

export default function StringCodePointAt2Test(): void {
  describe('StringCodePointAt2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0100
     * @tc.name testCodePointAt001
     * @tc.desc Verify new String instance and literal codePointAt return same code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = new String('A').codePointAt(0) as Int;
      let r2 = 'A'.codePointAt(0);
      expect(r1).assertEqual(65);
      expect(r2).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0200
     * @tc.name testCodePointAt002
     * @tc.desc Verify codePointAt on function return value for emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = getStr().codePointAt(0);
      expect(r).assertEqual(0x1f600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0300
     * @tc.name testCodePointAt003
     * @tc.desc Verify codePointAt on ZWJ family emoji returns individual code points at each position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '👨‍👩‍👧';
      let cp0 = s.codePointAt(0);
      let cp1 = s.codePointAt(1);
      expect(cp0).not().assertUndefined();
      expect(cp1).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0400
     * @tc.name testCodePointAt004
     * @tc.desc Verify codePointAt with out-of-range index 999 returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = 'A'.codePointAt(999);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0500
     * @tc.name testCodePointAt005
     * @tc.desc Verify codePointAt with index 3 returns char code of character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = 'Hello'.codePointAt(3);
      expect(r).assertEqual('l'.charCodeAt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0600
     * @tc.name testCodePointAt006
     * @tc.desc Verify codePointAt with negative index absolute value larger than length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = 'AB'.codePointAt(-100);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0700
     * @tc.name testCodePointAt007
     * @tc.desc Verify codePointAt on emoji surrogate pair second unit returns low surrogate code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = '😀'.codePointAt(1);
      expect(r).assertEqual(0xde00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0800
     * @tc.name testCodePointAt008
     * @tc.desc Verify generic function with T extends string calls codePointAt correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(codeAt('A')).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_0900
     * @tc.name testCodePointAt009
     * @tc.desc Verify codePointAt return value is not null and roundtrips with String.fromCodePoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp = 'A'.codePointAt(0);
      expect(cp).not().assertUndefined();
      if (cp !== undefined) {
        expect(String.fromCodePoint(cp!)).assertEqual('A');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1000
     * @tc.name testCodePointAt010
     * @tc.desc Verify codePointAt and charCodeAt are equal for BMP character A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp = 'A'.codePointAt(0);
      let cc: number = 'A'.charCodeAt(0);
      expect(cp).assertEqual(cc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1100
     * @tc.name testCodePointAt011
     * @tc.desc Verify codePointAt on supplementary plane emoji returns full code point not equal to charCodeAt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp = '😀'.codePointAt(0);
      let cc: number = '😀'.charCodeAt(0);
      expect(cp).assertEqual(0x1f600);
      expect(cp!).not().assertEqual(cc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1200
     * @tc.name testCodePointAt012
     * @tc.desc Verify codePointAt(0) on emoji returns full code point not surrogate half
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp = '🌟'.codePointAt(0);
      expect(cp).assertEqual(0x1f31f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1300
     * @tc.name testCodePointAt013
     * @tc.desc Verify codePointAt(1) on emoji returns low surrogate as-is (not a full code point)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp = '🌟'.codePointAt(1);
      expect(cp!).assertEqual(0xdf1f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1400
     * @tc.name testCodePointAt014
     * @tc.desc Verify codePointAt(0) on empty string returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ''.codePointAt(0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1500
     * @tc.name testCodePointAt015
     * @tc.desc Verify codePointAt after trim chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  ABC  ';
      expect(str.trim().codePointAt(0)!).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1600
     * @tc.name testCodePointAt016
     * @tc.desc Verify typeof codePointAt result is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ABC';
      expect(str.codePointAt(0)).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1700
     * @tc.name testCodePointAt017
     * @tc.desc Verify codePointAt on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#';
      expect(str.codePointAt(0)!).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1800
     * @tc.name testCodePointAt018
     * @tc.desc Verify codePointAt on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '123';
      expect(str.codePointAt(0)!).assertEqual(49);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_1900
     * @tc.name testCodePointAt019
     * @tc.desc Verify codePointAt precomposed e vs decomposed e differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let precomposed: string = '\u00E9';
      let decomposed: string = 'e\u0301';
      expect(precomposed.codePointAt(0)).assertEqual(233);
      expect(decomposed.codePointAt(0)).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_2000
     * @tc.name testCodePointAt020
     * @tc.desc Verify codePointAt zero-width space returns 0x200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\u200B';
      expect(str.codePointAt(0)!).assertEqual(0x200b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_2100
     * @tc.name testCodePointAt021
     * @tc.desc Verify codePointAt replacement character returns 0xFFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\uFFFD';
      expect(str.codePointAt(0)!).assertEqual(0xfffd);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_2200
     * @tc.name testCodePointAt022
     * @tc.desc Verify codePointAt on concatenation expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int | undefined = ('A' + 'B' + 'C').codePointAt(2);
      expect(result!).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_2300
     * @tc.name testCodePointAt023
     * @tc.desc Verify codePointAt in loop for multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ABC';
      let sum: number = 0;
      for (let i: int = 0; i < 3; i++) {
        let cp = str.codePointAt(i);
        if (cp !== undefined) sum += cp;
      }
      expect(sum).assertEqual(198);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT2_2400
     * @tc.name testCodePointAt024
     * @tc.desc Verify codePointAt() with NaN index returns codePointAt(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: Int | undefined = 'ABC'.codePointAt(Number.NaN.toInt());
      expect(cp).assertEqual(65);
    });
  });
}