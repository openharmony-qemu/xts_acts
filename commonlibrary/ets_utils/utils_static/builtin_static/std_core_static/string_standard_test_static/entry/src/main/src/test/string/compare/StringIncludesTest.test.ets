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

export default function StringIncludesTest(): void {
  describe('StringIncludesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0100
     * @tc.name testIncludes001
     * @tc.desc Verify includes() returns true for contained ASCII substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.includes("rk");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0200
     * @tc.name testIncludes002
     * @tc.desc Verify includes() returns false for absent ASCII substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.includes("xyz");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0300
     * @tc.name testIncludes003
     * @tc.desc Verify includes() returns true for empty search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("EmptyNeedle");
      let result: boolean = text.includes("");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0400
     * @tc.name testIncludes004
     * @tc.desc Verify includes() is case-sensitive for lowercase search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("CaseSensitive");
      let result: boolean = text.includes("ark");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0500
     * @tc.name testIncludes005
     * @tc.desc Verify includes() with position finds substring at or after position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTSArk");
      let result: boolean = text.includes("Ark", 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0600
     * @tc.name testIncludes006
     * @tc.desc Verify includes() with position skips earlier substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("PrefixOnly");
      let result: boolean = text.includes("Ark", 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0700
     * @tc.name testIncludes007
     * @tc.desc Verify includes() with negative position searches from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkNegativeStart");
      let result: boolean = text.includes("Ark", -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0800
     * @tc.name testIncludes008
     * @tc.desc Verify includes() with position beyond length returns false for non-empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Short");
      let result: boolean = text.includes("Ark", 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_0900
     * @tc.name testIncludes009
     * @tc.desc Verify includes() with empty search and position beyond length returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("EmptyAfterEnd");
      let result: boolean = text.includes("", 100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1000
     * @tc.name testIncludes010
     * @tc.desc Verify includes() on empty source returns true for empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: boolean = text.includes("");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1100
     * @tc.name testIncludes011
     * @tc.desc Verify includes() on empty source returns false for non-empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: boolean = text.includes("a");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1200
     * @tc.name testIncludes012
     * @tc.desc Verify includes() finds Unicode escape CJK substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Test\\u4E2D\\u6587");
      let result: boolean = text.includes("\\u4E2D\\u6587");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1300
     * @tc.name testIncludes013
     * @tc.desc Verify includes() distinguishes Unicode text from literal escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\\u4E2D\\u6587");
      let result: boolean = text.includes("\\\\u4E2D");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1400
     * @tc.name testIncludes014
     * @tc.desc Verify includes() finds emoji surrogate pair substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hi\\uD83D\\uDE00Done");
      let result: boolean = text.includes("\\uD83D\\uDE00");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1500
     * @tc.name testIncludes015
     * @tc.desc Verify includes() finds zero-width space substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\\u200BB");
      let result: boolean = text.includes("\\u200B");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1600
     * @tc.name testIncludes016
     * @tc.desc Verify includes() finds tab control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\\tB");
      let result: boolean = text.includes("\\t");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1700
     * @tc.name testIncludes017
     * @tc.desc Verify includes() finds newline control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\\nline2");
      let result: boolean = text.includes("\\n");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1800
     * @tc.name testIncludes018
     * @tc.desc Verify includes() finds CRLF sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Header: ok\\r\\n");
      let result: boolean = text.includes("\\r\\n");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_1900
     * @tc.name testIncludes019
     * @tc.desc Verify includes() finds NUL control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\\0B");
      let result: boolean = text.includes("\\0");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2000
     * @tc.name testIncludes020
     * @tc.desc Verify includes() finds replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("bad\\uFFFDdata");
      let result: boolean = text.includes("\\uFFFD");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2100
     * @tc.name testIncludes021
     * @tc.desc Verify includes() finds fullwidth dash and rejects halfwidth dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\\u2014B");
      let fullwidth: boolean = text.includes("\\u2014");
      let halfwidth: boolean = text.includes("-");
      expect(fullwidth).assertTrue();
      expect(halfwidth).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2200
     * @tc.name testIncludes022
     * @tc.desc Verify includes() finds phone number inside message text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("tel=13800138000;type=mobile");
      let result: boolean = text.includes("13800138000");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2300
     * @tc.name testIncludes023
     * @tc.desc Verify includes() finds identity-card style digit segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("id=310101199001011234");
      let result: boolean = text.includes("19900101");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2400
     * @tc.name testIncludes024
     * @tc.desc Verify includes() finds masked bank card asterisk segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: boolean = text.includes("********");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2500
     * @tc.name testIncludes025
     * @tc.desc Verify includes() finds email domain segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: boolean = text.includes("@example.com");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2600
     * @tc.name testIncludes026
     * @tc.desc Verify includes() finds date string segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("created=2026-03-05");
      let result: boolean = text.includes("2026-03-05");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2700
     * @tc.name testIncludes027
     * @tc.desc Verify includes() finds hexadecimal-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("value=0x123");
      let result: boolean = text.includes("0x123");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2800
     * @tc.name testIncludes028
     * @tc.desc Verify includes() finds binary-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("flags=0b1010");
      let result: boolean = text.includes("0b1010");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_2900
     * @tc.name testIncludes029
     * @tc.desc Verify includes() finds scientific-notation-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("count=123.45e6");
      let result: boolean = text.includes("123.45e6");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_3000
     * @tc.name testIncludes030
     * @tc.desc Verify includes() finds Arabic substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\\u0627\\u0644\\u0627\\u062E\\u062A\\u0628\\u0627\\u0631");
      let result: boolean = text.includes("\\u0627\\u062E");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_3100
     * @tc.name testIncludes031
     * @tc.desc Verify Includes handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.includes("<script>alert(1)</script>");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_3200
     * @tc.name testIncludes032
     * @tc.desc Verify Includes handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.includes("Test 測試");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES_3300
     * @tc.name testIncludes033
     * @tc.desc Verify includes() finds glowing star emoji from Unicode escape pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("prefix-\uD83C\uDF1F-suffix");
      let result: boolean = text.includes("\uD83C\uDF1F");
      expect(result).assertTrue();
    });
  });
}
