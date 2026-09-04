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
  return '😀😀';
}

function countCodes<T extends string>(s: T, b: int, e: int): int {
  return s.codePointCount(b, e);
}

export default function StringCodePointCount2Test(): void {
  describe('StringCodePointCount2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0100
     * @tc.name testCodePointCount001
     * @tc.desc Verify new String instance and literal codePointCount return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = new String('abc').codePointCount(0, 3);
      let r2: number = 'abc'.codePointCount(0, 3);
      expect(r1).assertEqual(3);
      expect(r2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0200
     * @tc.name testCodePointCount002
     * @tc.desc Verify codePointCount on function return value with emoji counts code points correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = getStr().codePointCount(0, 4);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0300
     * @tc.name testCodePointCount003
     * @tc.desc Verify codePointCount on ZWJ family emoji counts each code point correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '👨‍👩‍👧';
      let r: int = s.codePointCount(0, 8);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0400
     * @tc.name testCodePointCount004
     * @tc.desc Verify codePointCount on partial range of ZWJ emoji counts code points correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '👨‍👩‍👧';
      let r: int = s.codePointCount(0, 3);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0500
     * @tc.name testCodePointCount005
     * @tc.desc Verify codePointCount with endIndex 100 throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'abc'.codePointCount(0, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0600
     * @tc.name testCodePointCount006
     * @tc.desc Verify codePointCount with integer indices 1 and 2 returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = 'abc'.codePointCount(1, 2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0700
     * @tc.name testCodePointCount007
     * @tc.desc Verify generic function with T extends string calls codePointCount correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(countCodes('abc', 0, 3)).assertEqual(3);
      expect(countCodes('a😀b', 0, 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0800
     * @tc.name testCodePointCount008
     * @tc.desc Verify codePointCount return value typeof is number and zero range returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: int = 'abc'.codePointCount(0, 3);
      let zero: int = 'abc'.codePointCount(1, 1);
      expect(zero).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_0900
     * @tc.name testCodePointCount009
     * @tc.desc Verify codePointCount with negative beginIndex throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'abc'.codePointCount(-1, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1000
     * @tc.name testCodePointCount010
     * @tc.desc Verify codePointCount with beginIndex greater than endIndex throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        'abc'.codePointCount(3, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1100
     * @tc.name testCodePointCount011
     * @tc.desc Verify codePointCount on emoji string returns fewer code points than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'a😀b';
      let count: int = s.codePointCount(0, s.length);
      expect(count).assertLess(s.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1200
     * @tc.name testCodePointCount012
     * @tc.desc Verify codePointCount on empty string returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = ''.codePointCount(0, 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1300
     * @tc.name testCodePointCount013
     * @tc.desc Verify codePointCount on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello';
      let result: number = str.codePointCount(0, 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1400
     * @tc.name testCodePointCount014
     * @tc.desc Verify codePointCount on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('😀🎉');
      let result: number = str.codePointCount(0, 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1500
     * @tc.name testCodePointCount015
     * @tc.desc Verify codePointCount on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀🎉🚀';
      let result: number = str.codePointCount(0, 6);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1600
     * @tc.name testCodePointCount016
     * @tc.desc Verify codePointCount on Japanese string returns correct code point count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'こんにちは';
      let result: number = str.codePointCount(0, 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1700
     * @tc.name testCodePointCount017
     * @tc.desc Verify codePointCount on Cyrillic string returns correct code point count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'привет';
      let result: number = str.codePointCount(0, 6);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1800
     * @tc.name testCodePointCount018
     * @tc.desc Verify codePointCount with start index 0 returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 'abc'.codePointCount(0, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_1900
     * @tc.name testCodePointCount019
     * @tc.desc Verify codePointCount after method chaining (toLowerCase)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 'HELLO'.toLowerCase().codePointCount(0, 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_2000
     * @tc.name testCodePointCount020
     * @tc.desc Verify codePointCount after triple method chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = ' hello '.trim().toUpperCase().toLowerCase().codePointCount(0, 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT2_2100
     * @tc.name testCodePointCount021
     * @tc.desc Verify codePointCount on large repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCodePointCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc'.repeat(100);
      let result: number = str.codePointCount(0, 300);
      expect(result).assertEqual(300);
    });
  });
}