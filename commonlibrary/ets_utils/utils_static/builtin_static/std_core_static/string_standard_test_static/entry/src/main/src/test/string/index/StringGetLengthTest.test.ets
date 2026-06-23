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

export default function StringGetLengthTest(): void {
  describe('StringGetLengthTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0100
     * @tc.name testGetLength001
     * @tc.desc Verify getLength() returns correct int length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      expect(text.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0200
     * @tc.name testGetLength002
     * @tc.desc Verify getLength() returns 0 for empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      expect(text.getLength()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0300
     * @tc.name testGetLength003
     * @tc.desc Verify getLength() with Chinese and emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      expect(text.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0400
     * @tc.name testGetLength004
     * @tc.desc Verify getLength() returns correct int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String("ArkTS").getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0500
     * @tc.name testGetLength005
     * @tc.desc Verify length and getLength() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      expect(text.length).assertEqual(text.getLength());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0600
     * @tc.name testGetLength006
     * @tc.desc Verify getLength() is 0 for empty or newly constructed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String().getLength()).assertEqual(0);
      expect(new String("").getLength()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0700
     * @tc.name testGetLength007
     * @tc.desc Verify getLength() with escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String("\n\t\r").getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0800
     * @tc.name testGetLength008
     * @tc.desc Verify getLength() of combining character sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String("é").getLength()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_0900
     * @tc.name testGetLength009
     * @tc.desc Verify getLength() of string with null byte in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new String("A\0B").getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1000
     * @tc.name testGetLength010
     * @tc.desc Verify getLength() consistency after multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let l1: int = text.getLength();
      let l2: int = text.getLength();
      expect(l1).assertEqual(l2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1100
     * @tc.name testGetLength011
     * @tc.desc Verify getLength() of GBK-misdecoded garbled text counts code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("æµè¯");
      let len: int = text.getLength();
      expect(len).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1200
     * @tc.name testGetLength012
     * @tc.desc Verify getLength() of emoji surrogate pair equals 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      expect(text.getLength()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1300
     * @tc.name testGetLength013
     * @tc.desc Verify getLength() on ISO 8859-1 Latin precomposed character returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      expect(text.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1400
     * @tc.name testGetLength014
     * @tc.desc Verify getLength() on half-width katakana string returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊﾝｶｸ");
      expect(text.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1500
     * @tc.name testGetLength015
     * @tc.desc Verify getLength() with dynamic variable returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("GitHub");
      let len: int = text.getLength();
      expect(len).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1600
     * @tc.name testGetLength016
     * @tc.desc Verify getLength() on long ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(1000));
      expect(text.getLength()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1700
     * @tc.name testGetLength017
     * @tc.desc Verify getLength() on whitespace-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      expect(text.getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1800
     * @tc.name testGetLength018
     * @tc.desc Verify getLength() on mixed letters digits and symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123!@#");
      expect(text.getLength()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_1900
     * @tc.name testGetLength019
     * @tc.desc Verify getLength() returns 1 for single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      expect(text.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2000
     * @tc.name testGetLength020
     * @tc.desc Verify getLength() on substring result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let sub: string = text.substring(0, 5);
      const text1 = new String(sub);
      let subLen: int = text1.getLength();
      expect(subLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2100
     * @tc.name testGetLength021
     * @tc.desc Verify getLength() to check if string is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("");
      const b = new String("data");
      expect(a.getLength()).assertEqual(0);
      expect(b.getLength() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2200
     * @tc.name testGetLength022
     * @tc.desc Verify getLength() before and after trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let before: int = text.getLength();
      let after: int = new String(text.trim()).getLength();
      expect(before).assertEqual(9);
      expect(after).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2300
     * @tc.name testGetLength023
     * @tc.desc Verify getLength() after repeat operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let repeated: String = text.repeat(4);
      expect(repeated.getLength()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2400
     * @tc.name testGetLength024
     * @tc.desc Verify getLength() after padStart operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let padded: String = text.padStart(5, c'0');
      expect(padded.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2500
     * @tc.name testGetLength025
     * @tc.desc Verify getLength() after replace operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a-b-c");
      let result: string = text.replaceAll("-", "");
      expect(new String(result).getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2600
     * @tc.name testGetLength026
     * @tc.desc Verify traversal using getLength() and charAt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let chars: string = "";
      for (let i: int = 0; i < text.getLength(); i++) {
        chars += String(text.charAt(i));
      }
      expect(chars).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2700
     * @tc.name testGetLength027
     * @tc.desc Verify getLength() counts zero-width and BOM characters as code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroWidthSpace = new String("\u200B");
      const zeroWidthNonJoiner = new String("\u200C");
      const zeroWidthJoiner = new String("\u200D");
      const byteOrderMark = new String("\uFEFF");
      expect(zeroWidthSpace.getLength()).assertEqual(1);
      expect(zeroWidthNonJoiner.getLength()).assertEqual(1);
      expect(zeroWidthJoiner.getLength()).assertEqual(1);
      expect(byteOrderMark.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2800
     * @tc.name testGetLength028
     * @tc.desc Verify getLength() includes embedded zero-width characters between visible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\u200Bb");
      expect(text.getLength()).assertEqual(3);
      expect(text.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_2900
     * @tc.name testGetLength029
     * @tc.desc Verify getLength() counts mixed character sets by UTF-16 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u4E2D\u0391\u0410\u0627\u05D0\uD83D\uDE00");
      expect(text.getLength()).assertEqual(8);
      expect(text.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_3000
     * @tc.name testGetLength030
     * @tc.desc Verify getLength() counts CRLF as two code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\r\nb");
      expect(text.getLength()).assertEqual(4);
      expect(text.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_3100
     * @tc.name testGetLength031
     * @tc.desc Verify getLength() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: int = source.getLength();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_3200
     * @tc.name testGetLength032
     * @tc.desc Verify GetLength handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      expect(source.length).assertEqual(74);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_3300
     * @tc.name testGetLength033
     * @tc.desc Verify GetLength handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      expect(source.length).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETLENGTH_3400
     * @tc.name testGetLength034
     * @tc.desc Verify getLength() counts glowing star emoji escape pair as two code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLength034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83C\uDF1F");
      expect(text.getLength()).assertEqual(2);
      expect(text.length).assertEqual(2);
      expect(text.charCodeAt(0)).assertEqual(0xD83C);
      expect(text.charCodeAt(1)).assertEqual(0xDF1F);
    });
  });
}
