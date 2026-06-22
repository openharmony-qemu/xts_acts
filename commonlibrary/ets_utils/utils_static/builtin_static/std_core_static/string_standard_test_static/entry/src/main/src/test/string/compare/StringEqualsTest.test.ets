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

export default function StringEqualsTest(): void {
  describe('StringEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0100
     * @tc.name testEquals001
     * @tc.desc Verify equals() returns true for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1 = new String("ArkTS");
      let eq: boolean = text1.equals("ArkTS");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0200
     * @tc.name testEquals002
     * @tc.desc Verify equals() returns false for different strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text2 = new String("ArkTS");
      let eq: boolean = text2.equals("Different");
      expect(eq).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0300
     * @tc.name testEquals003
     * @tc.desc Verify equals() returns false for case-sensitive mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text3 = new String("ArkTS");
      let eq: boolean = text3.equals("arkts");
      expect(eq).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0400
     * @tc.name testEquals004
     * @tc.desc Verify equals() with empty strings returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text4 = new String("");
      let eq: boolean = text4.equals("");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0500
     * @tc.name testEquals005
     * @tc.desc Verify equals() with combining character sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text5 = new String("é");
      let eq: boolean = text5.equals("é");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0600
     * @tc.name testEquals006
     * @tc.desc Verify equals() with single character matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text6 = new String("A");
      let eq: boolean = text6.equals("A");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0700
     * @tc.name testEquals007
     * @tc.desc Verify equals() with numeric strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text7 = new String("12345");
      let eq: boolean = text7.equals("12345");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0800
     * @tc.name testEquals008
     * @tc.desc Verify equals() with Unicode supplementary plane emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text8 = new String("😀🎉");
      let eq: boolean = text8.equals("😀🎉");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_0900
     * @tc.name testEquals009
     * @tc.desc Verify equals() with whitespace-only strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text9 = new String("   ");
      let eq: boolean = text9.equals("   ");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1000
     * @tc.name testEquals010
     * @tc.desc Verify equals() with special character strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text10 = new String("!@#$%");
      let eq: boolean = text10.equals("!@#$%");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1100
     * @tc.name testEquals011
     * @tc.desc Verify equals() distinguishes space from empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String(" ");
      let eq: boolean = str.equals("");
      expect(eq).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1200
     * @tc.name testEquals012
     * @tc.desc Verify equals() returns false for precomposed versus decomposed combining character forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const composed = new String("é");
      const decomposed = new String("é");
      let eq: boolean = composed.equals(decomposed);
      expect(eq).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1300
     * @tc.name testEquals013
     * @tc.desc Verify equals() with C0 control characters newline and tab returns true for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ERR\n\tcode");
      let eq: boolean = text.equals("ERR\n\tcode");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1400
     * @tc.name testEquals014
     * @tc.desc Verify equals() with GBK Chinese text returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let eq: boolean = text.equals("中文测试");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1500
     * @tc.name testEquals015
     * @tc.desc Verify equals() with ISO 8859-1 Latin precomposed characters returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café ñoël");
      let eq: boolean = text.equals("café ñoël");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1600
     * @tc.name testEquals016
     * @tc.desc Verify equals() with C0 control NUL character returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("pre\0post");
      let eq: boolean = text.equals("pre\0post");
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1700
     * @tc.name testEquals017
     * @tc.desc Verify equals() with dynamic variable on both sides returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1: String = new String("Node.js");
      const text2: String = new String("Node.js");
      let eq: boolean = text1.equals(text2);
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1800
     * @tc.name testEquals018
     * @tc.desc Verify equals() returns false for same content with different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("Hello");
      const b = new String("hello");
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_1900
     * @tc.name testEquals019
     * @tc.desc Verify case-insensitive equality via toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("HELLO");
      const b = new String("hello");
      let eq: boolean = a.toLowerCase().equals(b.toLowerCase());
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2000
     * @tc.name testEquals020
     * @tc.desc Verify equals() on empty strings returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("");
      const b = new String("");
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2100
     * @tc.name testEquals021
     * @tc.desc Verify equals() after trim for whitespace-insensitive comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("  hello  ");
      const b = new String("hello");
      let eq: boolean = a.trim().equals(b);
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2200
     * @tc.name testEquals022
     * @tc.desc Verify equals() distinguishes Unicode escape text from literal escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: boolean = text.equals("\\u4e2d\\u6587");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2300
     * @tc.name testEquals023
     * @tc.desc Verify equals() returns true for zero-width space content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: boolean = text.equals("A\u200BB");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2400
     * @tc.name testEquals024
     * @tc.desc Verify equals() returns true for business date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: boolean = text.equals("2026-03-05");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2500
     * @tc.name testEquals025
     * @tc.desc Verify equals() distinguishes fullwidth dash and halfwidth dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let result: boolean = text.equals("-");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2600
     * @tc.name testEquals026
     * @tc.desc Verify equals() returns true for Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: boolean = text.equals("\u0627\u0628");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2700
     * @tc.name testEquals027
     * @tc.desc Verify equals() returns true for replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: boolean = text.equals("\uFFFD");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2800
     * @tc.name testEquals028
     * @tc.desc Verify equals() distinguishes LF and CRLF strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\r\nB");
      let result: boolean = text.equals("A\nB");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_2900
     * @tc.name testEquals029
     * @tc.desc Verify equals() returns true for masked bank card string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: boolean = text.equals("622202********1234");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_3000
     * @tc.name testEquals030
     * @tc.desc Verify equals() returns true for scientific-notation-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let result: boolean = text.equals("123.45e6");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_3100
     * @tc.name testEquals031
     * @tc.desc Verify Equals handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const source = new String(expected);
      let result: boolean = source.equals(new String(expected));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_EQUALS_3200
     * @tc.name testEquals032
     * @tc.desc Verify Equals handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const source = new String(expected);
      let result: boolean = source.equals(new String(expected));
      expect(result).assertTrue();
    });
  });
}
