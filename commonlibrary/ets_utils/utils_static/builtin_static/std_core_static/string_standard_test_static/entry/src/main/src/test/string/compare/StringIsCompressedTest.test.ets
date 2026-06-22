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

export default function StringIsCompressedTest(): void {
  describe('StringIsCompressedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0100
     * @tc.name testIsCompressed001
     * @tc.desc Verify isCompressed() on ASCII string returns true as all chars fit in Latin-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0200
     * @tc.name testIsCompressed002
     * @tc.desc Verify isCompressed() on empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0300
     * @tc.name testIsCompressed003
     * @tc.desc Verify isCompressed() on CJK Unicode BMP string returns false as chars exceed Latin-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0400
     * @tc.name testIsCompressed004
     * @tc.desc Verify isCompressed() on ASCII substring result returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("prefix-ASCII-suffix");
      const text = new String(source.substring(7, 12));
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0500
     * @tc.name testIsCompressed005
     * @tc.desc Verify isCompressed() on long ASCII string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A".repeat(1000));
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0600
     * @tc.name testIsCompressed006
     * @tc.desc Verify isCompressed() on emoji string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0700
     * @tc.name testIsCompressed007
     * @tc.desc Verify isCompressed() on Latin-1 character (U+00E9) returns false, confirming ArkTS restricts compression to ASCII (≤127) unlike Java which uses Latin-1 (≤255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0800
     * @tc.name testIsCompressed008
     * @tc.desc Verify isCompressed() on mixed ASCII plus CJK returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC中文");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0900
     * @tc.name testIsCompressed009
     * @tc.desc Verify isCompressed() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("Latin1Only");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1000
     * @tc.name testIsCompressed010
     * @tc.desc Verify isCompressed() on half-width katakana returns false as code points exceed ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊﾝｶｸ");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1100
     * @tc.name testIsCompressed011
     * @tc.desc Verify isCompressed() on an ASCII string derived from trim returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  OK  ".trim());
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1200
     * @tc.name testIsCompressed012
     * @tc.desc Verify isCompressed() on ASCII-only symbols and digits returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("12345!@#$%");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1300
     * @tc.name testIsCompressed013
     * @tc.desc Verify isCompressed() on CJK text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1400
     * @tc.name testIsCompressed014
     * @tc.desc Verify isCompressed() on mixed ASCII and CJK text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ID-\u4E2D\u6587-001");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1500
     * @tc.name testIsCompressed015
     * @tc.desc Verify isCompressed() on ASCII log tag with digits and separators returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("WARN-2026-06-12T08:30:00Z");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1600
     * @tc.name testIsCompressed016
     * @tc.desc Verify isCompressed() on zero-width space inside ASCII text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1700
     * @tc.name testIsCompressed017
     * @tc.desc Verify isCompressed() on CRLF-delimited ASCII text returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\r\nline2");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1800
     * @tc.name testIsCompressed018
     * @tc.desc Verify isCompressed() on ASCII email string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1900
     * @tc.name testIsCompressed019
     * @tc.desc Verify isCompressed() on ASCII phone number returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("13800138000");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2000
     * @tc.name testIsCompressed020
     * @tc.desc Verify isCompressed() on Japanese Katakana returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u30C6\u30B9\u30C8");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2100
     * @tc.name testIsCompressed021
     * @tc.desc Verify isCompressed() on Korean text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD14C\uC2A4\uD2B8");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2200
     * @tc.name testIsCompressed022
     * @tc.desc Verify isCompressed() on replacement character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2300
     * @tc.name testIsCompressed023
     * @tc.desc Verify isCompressed() on hexadecimal-looking ASCII string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2400
     * @tc.name testIsCompressed024
     * @tc.desc Verify isCompressed() on Arabic text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2500
     * @tc.name testIsCompressed025
     * @tc.desc Verify isCompressed() on fullwidth dash returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2600
     * @tc.name testIsCompressed026
     * @tc.desc Verify isCompressed() on masked bank card string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2700
     * @tc.name testIsCompressed027
     * @tc.desc Verify isCompressed() on C0 NUL inside ASCII text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2800
     * @tc.name testIsCompressed028
     * @tc.desc Verify isCompressed() on emoji surrogate pair returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_2900
     * @tc.name testIsCompressed029
     * @tc.desc Verify isCompressed() on scientific-notation-looking string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_3000
     * @tc.name testIsCompressed030
     * @tc.desc Verify isCompressed() on octal-looking ASCII string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0123");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_3100
     * @tc.name testIsCompressed031
     * @tc.desc Verify IsCompressed handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_3200
     * @tc.name testIsCompressed032
     * @tc.desc Verify IsCompressed handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.isCompressed();
      expect(result).assertFalse();
    });
  });
}
