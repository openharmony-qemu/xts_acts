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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../../Util.test';

export default function StringTrimEndTest(): void {
  describe('StringTrimEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0100
     * @tc.name testTrimEnd001
     * @tc.desc Verify trimEnd() removes trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ArkTS  ");
      let result: string = str.trimEnd();
      expect(result).assertEqual("  ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0200
     * @tc.name testTrimEnd002
     * @tc.desc Verify trimEnd() removes trailing carriage-return and space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS\r ");
      let result: string = str.trimEnd();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0300
     * @tc.name testTrimEnd003
     * @tc.desc Verify trimEnd() removes trailing vertical-tab and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("data\v\n");
      let result: string = str.trimEnd();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0400
     * @tc.name testTrimEnd004
     * @tc.desc Verify trimEnd() and trimRight() produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t ArkTS  ");
      let r1: string = str.trimEnd();
      let r2: string = str.trimRight();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual("\t ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0500
     * @tc.name testTrimEnd005
     * @tc.desc Verify trimEnd() does NOT change string when whitespace is only at the start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  OpenHarmony");
      let result: string = str.trimEnd();
      expect(result).assertEqual("  OpenHarmony");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0600
     * @tc.name testTrimEnd006
     * @tc.desc Verify trimEnd() does NOT change string with no whitespace at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("clean");
      let result: string = str.trimEnd();
      expect(result).assertEqual("clean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0700
     * @tc.name testTrimEnd007
     * @tc.desc Verify trimEnd() on GBK text with trailing whitespace removes only trailing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试  ");
      let result: string = str.trimEnd();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0800
     * @tc.name testTrimEnd008
     * @tc.desc Verify trimEnd() on CJK text with trailing tab removes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试\t");
      let result: string = str.trimEnd();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_0900
     * @tc.name testTrimEnd009
     * @tc.desc Verify trimEnd() on emoji text with trailing spaces removes only trailing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀🎉  ");
      let result: string = str.trimEnd();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1000
     * @tc.name testTrimEnd010
     * @tc.desc Verify trimEnd() on ISO 8859-1 Latin accented text with trailing newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("café\n");
      let result: string = str.trimEnd();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1100
     * @tc.name testTrimEnd011
     * @tc.desc Verify trimEnd() on half-width katakana text with trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ﾊﾝｶｸ  ");
      let result: string = str.trimEnd();
      expect(result).assertEqual("ﾊﾝｶｸ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1200
     * @tc.name testTrimEnd012
     * @tc.desc Verify trimEnd() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: string = str.trimEnd();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1300
     * @tc.name testTrimEnd013
     * @tc.desc Verify trimEnd() on all-whitespace string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   \t   ");
      let result: string = str.trimEnd();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1400
     * @tc.name testTrimEnd014
     * @tc.desc Verify trimEnd() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("data  ");
      let result: string = text.trimEnd();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1500
     * @tc.name testTrimEnd015
     * @tc.desc Verify trimEnd() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello  ");
      let result: string = text.trimEnd();
      expect(text.toString()).assertEqual("hello  ");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1600
     * @tc.name testTrimEnd016
     * @tc.desc Verify trimEnd() preserves leading whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trimEnd();
      expect(result).assertEqual("  hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1700
     * @tc.name testTrimEnd017
     * @tc.desc Verify trimEnd() chained with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello  ");
      let result: string = text.trimEnd().toUpperCase().toString();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1800
     * @tc.name testTrimEnd018
     * @tc.desc Verify trimEnd() result length is original minus trailing whitespace count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc   ");
      let result: string = text.trimEnd();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_1900
     * @tc.name testTrimEnd019
     * @tc.desc Verify trimEnd() on string with only trailing spaces in mixed whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("data\t \n");
      let result: string = text.trimEnd();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2000
     * @tc.name testTrimEnd020
     * @tc.desc Verify trimEnd() chained with concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello  ");
      let cleaned: string = text.trimEnd();
      const text1 = new String(cleaned);
      let result: String = text1.concat(" world");
      expect(result.toString()).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2100
     * @tc.name testTrimEnd021
     * @tc.desc Verify trimEnd() chained with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world   ");
      let cleaned: string = text.trimEnd();
      let result: string = cleaned.slice(0, 5);
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2200
     * @tc.name testTrimEnd022
     * @tc.desc Verify trimStart() then trimEnd() equals trim()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let stepwise: string = text.trimStart().trimEnd();
      let direct: string = text.trim();
      expect(stepwise).assertEqual(direct);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2300
     * @tc.name testTrimEnd023
     * @tc.desc Verify trimEnd removes trailing Unicode BOM after JSON text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("{\"id\":1}\uFEFF");
      let result: string = text.trimEnd();
      expect(result).assertEqual("{\"id\":1}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2400
     * @tc.name testTrimEnd024
     * @tc.desc Verify trimEnd preserves leading tab when only right side is trimmed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\tID\t");
      let result: string = text.trimEnd();
      expect(result).assertEqual("\tID");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2500
     * @tc.name testTrimEnd025
     * @tc.desc Verify trimEnd removes trailing CRLF after protocol status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("OK\r\n");
      let result: string = text.trimEnd();
      expect(result).assertEqual("OK");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2600
     * @tc.name testTrimEnd026
     * @tc.desc Verify trimEnd preserves zero-width space because it is not whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("value\u200B");
      let result: string = text.trimEnd();
      expect(result).assertEqual("value\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2700
     * @tc.name testTrimEnd027
     * @tc.desc Verify trimEnd removes trailing blanks after phone number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("13800138000  ");
      let result: string = text.trimEnd();
      expect(result).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2800
     * @tc.name testTrimEnd028
     * @tc.desc Verify trimEnd preserves leading spaces in date field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  2026-03-05  ");
      let result: string = text.trimEnd();
      expect(result).assertEqual("  2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_2900
     * @tc.name testTrimEnd029
     * @tc.desc Verify trimEnd handles trailing form-feed after email
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("test@example.com\f");
      let result: string = text.trimEnd();
      expect(result).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_3000
     * @tc.name testTrimEnd030
     * @tc.desc Verify trimEnd preserves internal newline before trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("A\nB  ");
      let result: string = text.trimEnd();
      expect(result).assertEqual("A\nB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_3100
     * @tc.name testTrimEnd031
     * @tc.desc Verify trimEnd() handles GBK-to-UTF8 garbled text spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("æµè¯");
      let result: string = source.trimEnd();
      expect(result).assertEqual("æµè¯");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_3200
     * @tc.name testTrimEnd032
     * @tc.desc Verify trimEnd() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.trimEnd();
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_3300
     * @tc.name testTrimEnd033
     * @tc.desc Verify TrimEnd handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = ("  " + source + "  ").trimEnd();
      expect(result).assertEqual("  " + source.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND_3400
     * @tc.name testTrimEnd034
     * @tc.desc Verify TrimEnd handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimEnd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = ("  " + source + "  ").trimEnd();
      expect(result).assertEqual("  " + source.toString());
    });
  });
}
