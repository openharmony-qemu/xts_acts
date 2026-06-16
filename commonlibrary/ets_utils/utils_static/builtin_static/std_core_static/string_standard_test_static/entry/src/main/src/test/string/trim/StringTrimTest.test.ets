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

export default function StringTrimTest(): void {
  describe('StringTrimTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0100
     * @tc.name testTrim001
     * @tc.desc Verify trim() removes leading and trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ArkTS  ");
      let result: string = str.trim();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0200
     * @tc.name testTrim002
     * @tc.desc Verify trim() removes all whitespace types: tab newline carriage-return space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t\n\r ArkTS \t\n\r");
      let result: string = str.trim();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0300
     * @tc.name testTrim003
     * @tc.desc Verify trim() on all-whitespace string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   \t   ");
      let result: string = str.trim();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0400
     * @tc.name testTrim004
     * @tc.desc Verify trim() on string with no whitespace returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: string = str.trim();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0500
     * @tc.name testTrim005
     * @tc.desc Verify trim() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: string = str.trim();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0600
     * @tc.name testTrim006
     * @tc.desc Verify trim() with vertical tab and form feed whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\v\fArkTS\v\f");
      let result: string = str.trim();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0700
     * @tc.name testTrim007
     * @tc.desc Verify trim() on CJK and GBK text with surrounding whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  中文测试  ");
      let result: string = str.trim();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0800
     * @tc.name testTrim008
     * @tc.desc Verify trim() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  data  ");
      let result: string = text.trim();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_0900
     * @tc.name testTrim009
     * @tc.desc Verify trim() does NOT change string when whitespace is only in the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Ark TS");
      let result: string = str.trim();
      expect(result).assertEqual("Ark TS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1000
     * @tc.name testTrim010
     * @tc.desc Verify trim() does NOT change string with tab between words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("col1\tcol2");
      let result: string = str.trim();
      expect(result).assertEqual("col1\tcol2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1100
     * @tc.name testTrim011
     * @tc.desc Verify trim() does NOT change string with newline only between lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("line1\nline2");
      let result: string = str.trim();
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1200
     * @tc.name testTrim012
     * @tc.desc Verify trim() does NOT change CJK text with whitespace only in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文 测试");
      let result: string = str.trim();
      expect(result).assertEqual("中文 测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1300
     * @tc.name testTrim013
     * @tc.desc Verify trim() does NOT change numeric string with spaces only in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("2026 06 09");
      let result: string = str.trim();
      expect(result).assertEqual("2026 06 09");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1400
     * @tc.name testTrim014
     * @tc.desc Verify trim() removes edges but preserves internal spaces: "  a  b  " → "a  b"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  a  b  ");
      let result: string = str.trim();
      expect(result).assertEqual("a  b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1500
     * @tc.name testTrim015
     * @tc.desc Verify trim() does NOT collapse multiple consecutive internal spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("x    y");
      let result: string = str.trim();
      expect(result).assertEqual("x    y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1600
     * @tc.name testTrim016
     * @tc.desc Verify trim() removes mixed whitespace at edges, preserves internal mixed whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t\n a\tb \r");
      let result: string = str.trim();
      expect(result).assertEqual("a\tb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1700
     * @tc.name testTrim017
     * @tc.desc Verify trim() removes whitespace around emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  😀🎉  ");
      let result: string = str.trim();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1800
     * @tc.name testTrim018
     * @tc.desc Verify trim() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trim();
      expect(text.toString()).assertEqual("  hello  ");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_1900
     * @tc.name testTrim019
     * @tc.desc Verify trim() result is usable for case-insensitive comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("  Hello  ");
      const b = new String("hello");
      let ta: string = a.trim().toLowerCase();
      let tb: string = b.trim().toLowerCase();
      expect(ta).assertEqual(tb);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2000
     * @tc.name testTrim020
     * @tc.desc Verify trim() chained with indexOf to find position after cleaning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello world  ");
      let cleaned: string = text.trim();
      let pos: int = cleaned.indexOf("world");
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2100
     * @tc.name testTrim021
     * @tc.desc Verify trim() chained with includes to search in cleaned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello world  ");
      let cleaned: string = text.trim();
      let inc: boolean = cleaned.includes("hello");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2200
     * @tc.name testTrim022
     * @tc.desc Verify trim() returns empty string deterministically for all-whitespace input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t \n \r \v \f");
      let result: string = text.trim();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2300
     * @tc.name testTrim023
     * @tc.desc Verify trim() then slice for clean extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello world  ");
      let cleaned: string = text.trim();
      let word: string = cleaned.slice(0, 5);
      expect(word).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2400
     * @tc.name testTrim024
     * @tc.desc Verify trim() then startsWith for clean prefix check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello world  ");
      let cleaned: string = text.trim();
      expect(cleaned.startsWith("hello")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2500
     * @tc.name testTrim025
     * @tc.desc Verify trim() then endsWith for clean suffix check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello world  ");
      let cleaned: string = text.trim();
      expect(cleaned.endsWith("world")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2600
     * @tc.name testTrim026
     * @tc.desc Verify trim() then padEnd for formatting pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  data  ");
      let cleaned: string = text.trim();
      const text1 = new String(cleaned);
      let padded: string = text1.padEnd(8, ".");
      expect(padded).assertEqual("data....");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2700
     * @tc.name testTrim027
     * @tc.desc Verify trim removes BOM and spaces around JSON text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String(" \uFEFF{\"id\":1} ");
      let result: string = text.trim();
      expect(result).assertEqual("{\"id\":1}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2800
     * @tc.name testTrim028
     * @tc.desc Verify trim removes CRLF around protocol status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\r\nOK\r\n");
      let result: string = text.trim();
      expect(result).assertEqual("OK");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_2900
     * @tc.name testTrim029
     * @tc.desc Verify trim preserves zero-width spaces at both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\u200Bvalue\u200B");
      let result: string = text.trim();
      expect(result).assertEqual("\u200Bvalue\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_3000
     * @tc.name testTrim030
     * @tc.desc Verify trim trims phone number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  13800138000  ");
      let result: string = text.trim();
      expect(result).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_3100
     * @tc.name testTrim031
     * @tc.desc Verify trim() handles illegal UTF-8 single-byte spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4");
      let result: string = source.trim();
      expect(result).assertEqual("\\xe4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_3200
     * @tc.name testTrim032
     * @tc.desc Verify Trim handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = ("  " + source + "  ").trim();
      expect(result).assertEqual(source.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM_3300
     * @tc.name testTrim033
     * @tc.desc Verify Trim handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrim033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = ("  " + source + "  ").trim();
      expect(result).assertEqual(source.toString());
    });
  });
}
