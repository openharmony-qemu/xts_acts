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

export default function StringIsEmptyTest(): void {
  describe('StringIsEmptyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0100
     * @tc.name testIsEmpty001
     * @tc.desc Verify isEmpty() returns true for no-arg constructed empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      expect(text.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0200
     * @tc.name testIsEmpty002
     * @tc.desc Verify isEmpty() returns true for explicitly empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      expect(text.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0300
     * @tc.name testIsEmpty003
     * @tc.desc Verify isEmpty() returns false for single ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0400
     * @tc.name testIsEmpty004
     * @tc.desc Verify isEmpty() returns false for whitespace-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0500
     * @tc.name testIsEmpty005
     * @tc.desc Verify isEmpty() on C0 control tab-only string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0600
     * @tc.name testIsEmpty006
     * @tc.desc Verify isEmpty() on C0 control newline-only string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0700
     * @tc.name testIsEmpty007
     * @tc.desc Verify isEmpty() on C0 control NUL character string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\0");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0800
     * @tc.name testIsEmpty008
     * @tc.desc Verify isEmpty() on CJK Unicode BMP character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_0900
     * @tc.name testIsEmpty009
     * @tc.desc Verify isEmpty() on emoji character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1000
     * @tc.name testIsEmpty010
     * @tc.desc Verify isEmpty() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("");
      let empty: boolean = text.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1100
     * @tc.name testIsEmpty011
     * @tc.desc Verify isEmpty() on single space returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String(" ");
      expect(text.isEmpty()).assertFalse();
      expect(text.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1200
     * @tc.name testIsEmpty012
     * @tc.desc Verify isEmpty() on mixed whitespace tab plus space plus newline returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t \n");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1300
     * @tc.name testIsEmpty013
     * @tc.desc Verify whitespace-only after trim isEmpty returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      let afterTrim: string = text.trim();
      const text1 = new String(afterTrim);
      let empty: boolean = text1.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1400
     * @tc.name testIsEmpty014
     * @tc.desc Verify isEmpty() returns true for a substring-derived empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "X";
      const text = new String(raw.substring(1));
      expect(text.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1500
     * @tc.name testIsEmpty015
     * @tc.desc Verify isEmpty() on single ISO 8859-1 Latin-1 character returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u00E9");
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1600
     * @tc.name testIsEmpty016
     * @tc.desc Verify isEmpty() on long string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(1000));
      expect(text.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1700
     * @tc.name testIsEmpty017
     * @tc.desc Verify isEmpty() after replaceAll removes every character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("----");
      let removed: string = text.replaceAll("-", "");
      const text2 = new String(removed);
      let empty: boolean = text2.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1800
     * @tc.name testIsEmpty018
     * @tc.desc Verify isEmpty() deterministically returns false for non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      expect(text.isEmpty()).assertFalse();
      expect(text.getLength() > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_1900
     * @tc.name testIsEmpty019
     * @tc.desc Verify isEmpty() after trim on whitespace-only becomes empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t\n\r ");
      let trimmed: string = text.trim();
      const text3 = new String(trimmed);
      let empty: boolean = text3.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2000
     * @tc.name testIsEmpty020
     * @tc.desc Verify isEmpty() on zero-width space returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u200B");
      let empty: boolean = text.isEmpty();
      expect(empty).assertFalse();
      expect(text.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2100
     * @tc.name testIsEmpty021
     * @tc.desc Verify isEmpty() on result after repeat(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: string = text.repeat(0);
      const text5 = new String(result);
      let empty: boolean = text5.isEmpty();
      expect(empty).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2200
     * @tc.name testIsEmpty022
     * @tc.desc Verify isEmpty() after split with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let parts: String[] = text.split(",");
      expect(parts.length).assertEqual(1);
      expect(parts[0].isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2300
     * @tc.name testIsEmpty023
     * @tc.desc Verify isEmpty() returns false for zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u200B");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2400
     * @tc.name testIsEmpty024
     * @tc.desc Verify isEmpty() returns true after trimming only CRLF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\r\n");
      let trimmed: string = text.trim();
      const normalized = new String(trimmed);
      let result: boolean = normalized.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2500
     * @tc.name testIsEmpty025
     * @tc.desc Verify isEmpty() returns false for replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2600
     * @tc.name testIsEmpty026
     * @tc.desc Verify isEmpty() returns false for Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2700
     * @tc.name testIsEmpty027
     * @tc.desc Verify isEmpty() returns false for date-format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2800
     * @tc.name testIsEmpty028
     * @tc.desc Verify isEmpty() returns false for literal backslash-u text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\\u4e2d");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_2900
     * @tc.name testIsEmpty029
     * @tc.desc Verify isEmpty() returns false for emoji surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_3000
     * @tc.name testIsEmpty030
     * @tc.desc Verify isEmpty() returns false for hexadecimal-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: boolean = text.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_3100
     * @tc.name testIsEmpty031
     * @tc.desc Verify IsEmpty handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY_3200
     * @tc.name testIsEmpty032
     * @tc.desc Verify IsEmpty handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEmpty032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.isEmpty();
      expect(result).assertFalse();
    });
  });
}
