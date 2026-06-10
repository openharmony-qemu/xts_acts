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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringCodePointAtTest(): void {
  describe('StringCodePointAtTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0100
     * @tc.name testCodePointAt001
     * @tc.desc Verify codePointAt(0) on ASCII character returns correct code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0200
     * @tc.name testCodePointAt002
     * @tc.desc Verify codePointAt(2) on "ABC" returns code point of 'C'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: int | undefined = text.codePointAt(2);
      expect(result!).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0300
     * @tc.name testCodePointAt003
     * @tc.desc Verify codePointAt(0) on CJK character returns correct code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0400
     * @tc.name testCodePointAt004
     * @tc.desc Verify codePointAt(0) on emoji returns full code point beyond BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(128512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0500
     * @tc.name testCodePointAt005
     * @tc.desc Verify codePointAt(1) on emoji returns low surrogate code unit not full code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: int | undefined = text.codePointAt(1);
      expect(result!).assertEqual(56832);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0600
     * @tc.name testCodePointAt006
     * @tc.desc Verify codePointAt(0) on carriage return returns code point 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\r");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0700
     * @tc.name testCodePointAt007
     * @tc.desc Verify codePointAt(0) on null byte returns code point 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\0");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0800
     * @tc.name testCodePointAt008
     * @tc.desc Verify codePointAt(1) on backspace returns code point 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\bb");
      let result: int | undefined = text.codePointAt(1);
      expect(result!).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_0900
     * @tc.name testCodePointAt009
     * @tc.desc Verify codePointAt(0) on unpaired surrogate returns surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(55296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1000
     * @tc.name testCodePointAt010
     * @tc.desc Verify codePointAt(0) on combining character sequence returns base char code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1100
     * @tc.name testCodePointAt011
     * @tc.desc Verify codePointAt(0) on half-width katakana returns correct code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊ");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(65418);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1200
     * @tc.name testCodePointAt012
     * @tc.desc Verify codePointAt(0) on BMP boundary character U+FFFF returns 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("￿");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1300
     * @tc.name testCodePointAt013
     * @tc.desc Verify codePointAt(0) on empty string returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: int | undefined = text.codePointAt(0);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1400
     * @tc.name testCodePointAt014
     * @tc.desc Verify codePointAt() with out-of-bounds index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: int | undefined = text.codePointAt(2);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1500
     * @tc.name testCodePointAt015
     * @tc.desc Verify codePointAt() with negative index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: int | undefined = text.codePointAt(-1);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1600
     * @tc.name testCodePointAt016
     * @tc.desc Verify codePointAt(0) vs charCodeAt(0) differ for surrogate pair emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let cp: int | undefined = text.codePointAt(0);
      let cc: number = text.charCodeAt(0);
      expect(cp!).assertLarger(0xFFFF);
      expect(cc).assertLarger(0xD800);
      expect(cp! !== cc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1700
     * @tc.name testCodePointAt017
     * @tc.desc Verify codePointAt() on newline character returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1800
     * @tc.name testCodePointAt018
     * @tc.desc Verify codePointAt() on tab character returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t");
      let result: int | undefined = text.codePointAt(0);
      expect(result!).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_1900
     * @tc.name testCodePointAt019
     * @tc.desc Verify codePointAt() roundtrip with fromCodePoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = String.fromCodePoint(65);
      const text1 = new String(original);
      let cp: int | undefined = text1.codePointAt(0);
      expect(cp!).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTAT_2000
     * @tc.name testCodePointAt020
     * @tc.desc Verify codePointAt() at each index of a multi-char ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let c0: int | undefined = text.codePointAt(0);
      let c4: int | undefined = text.codePointAt(4);
      let c9: int | undefined = text.codePointAt(9);
      expect(c0!).assertEqual(84);
      expect(c4!).assertEqual(83);
      expect(c9!).assertEqual(116);
    });
  });
}
