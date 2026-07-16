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

export default function StringToLowerCaseTest(): void {
  describe('StringToLowerCaseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0100
     * @tc.name testToLowerCase001
     * @tc.desc Verify toLowerCase() converts mixed case to lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("HELLO World");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0200
     * @tc.name testToLowerCase002
     * @tc.desc Verify toLowerCase() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0300
     * @tc.name testToLowerCase003
     * @tc.desc Verify toLowerCase() on already lowercase returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("arkts");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("arkts");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0400
     * @tc.name testToLowerCase004
     * @tc.desc Verify toLowerCase() on numbers returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("12345");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0500
     * @tc.name testToLowerCase005
     * @tc.desc Verify toLowerCase() converts full-width uppercase to lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ＡＢＣ");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("ａｂｃ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0600
     * @tc.name testToLowerCase006
     * @tc.desc Verify toLowerCase() converts single uppercase character to lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("A");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0700
     * @tc.name testToLowerCase007
     * @tc.desc Verify toLowerCase() on CJK and GBK characters returns unchanged while ASCII converts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试ABC");
      let result: String = str.toLowerCase();
      expect(result.toString()).assertEqual("中文测试abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0800
     * @tc.name testToLowerCase008
     * @tc.desc Verify toLowerCase() normalizes a dynamic feature flag key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("FEATURE_LOGIN");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("feature_login");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_0900
     * @tc.name testToLowerCase009
     * @tc.desc Verify toLowerCase() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let result: String = text.toLowerCase();
      expect(text.toString()).assertEqual("HELLO");
      expect(result.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1000
     * @tc.name testToLowerCase010
     * @tc.desc Verify case-insensitive equality using toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("Hello");
      const b = new String("HELLO");
      expect(a.toLowerCase().toString()).assertEqual(b.toLowerCase().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1100
     * @tc.name testToLowerCase011
     * @tc.desc Verify case-insensitive search using toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Blue Whale");
      let lowered: string = text.toLowerCase().toString();
      expect(lowered).assertEqual("blue whale");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1200
     * @tc.name testToLowerCase012
     * @tc.desc Verify toLowerCase() preserves punctuation and spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello, World! 123");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("hello, world! 123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1300
     * @tc.name testToLowerCase013
     * @tc.desc Verify toLowerCase() normalizes a file extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("REPORT.PDF");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("report.pdf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1400
     * @tc.name testToLowerCase014
     * @tc.desc Verify toLowerCase() keeps an already lowercase package name unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("com.example.app");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("com.example.app");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1500
     * @tc.name testToLowerCase015
     * @tc.desc Verify toLowerCase() called twice gives same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let once: String = text.toLowerCase();
      let twice: String = once.toLowerCase();
      expect(twice.toString()).assertEqual(once.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1600
     * @tc.name testToLowerCase016
     * @tc.desc Verify toLowerCase() chained with substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO WORLD");
      let firstWord: string = text.substring(0, 5).toLowerCase().toString();
      expect(firstWord).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1700
     * @tc.name testToLowerCase017
     * @tc.desc Verify toLowerCase() normalizes email address text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ADMIN@EXAMPLE.COM");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("admin@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1800
     * @tc.name testToLowerCase018
     * @tc.desc Verify toLowerCase() preserves leading/trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  HELLO  ");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("  hello  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_1900
     * @tc.name testToLowerCase019
     * @tc.desc Verify toLowerCase() with newlines and tabs preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("LINE1\nLINE2\tEND");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("line1\nline2\tend");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2000
     * @tc.name testToLowerCase020
     * @tc.desc Verify toLowerCase() on very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEFGHIJ".repeat(10));
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("abcdefghij".repeat(10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2100
     * @tc.name testToLowerCase021
     * @tc.desc Verify toLowerCase() on mixed scripts preserves non-Latin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO中文123");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("hello中文123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2200
     * @tc.name testToLowerCase022
     * @tc.desc Verify toLowerCase() with special symbols preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("PRICE: $100 @STORE");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("price: $100 @store");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2300
     * @tc.name testToLowerCase023
     * @tc.desc Verify toLowerCase() on numbers only returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1234567890");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2400
     * @tc.name testToLowerCase024
     * @tc.desc Verify toLowerCase() on underscore-separated uppercase identifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("USER_NAME_INPUT");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("user_name_input");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2500
     * @tc.name testToLowerCase025
     * @tc.desc Verify toLowerCase() normalizes an HTTP header key for lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("CONTENT-TYPE");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("content-type");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2600
     * @tc.name testToLowerCase026
     * @tc.desc Verify chaining toLowerCase() with trim()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  HELLO  ");
      let result: string = text.trim().toLowerCase().toString();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2700
     * @tc.name testToLowerCase027
     * @tc.desc Verify toLowerCase() preserves emoji surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("a😀b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2800
     * @tc.name testToLowerCase028
     * @tc.desc Verify toLowerCase() on ISO 8859-1 Latin accented uppercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("CAFÉ");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_2900
     * @tc.name testToLowerCase029
     * @tc.desc Verify toLowerCase() preserves embedded C0 NUL while converting ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let lower: String = text.toLowerCase();
      expect(lower.toString()).assertEqual("a\0b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_3000
     * @tc.name testToLowerCase030
     * @tc.desc Verify toLowerCase() on symbol-only string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!@#$%^&*()");
      let result: String = text.toLowerCase();
      expect(result.toString()).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_3100
     * @tc.name testToLowerCase031
     * @tc.desc Verify toLowerCase() handles mixed text with literal Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("test \\u4e2d\\u6587");
      let result: string = source.toLowerCase();
      expect(result.length).assertEqual(source.length);
      expect(result).assertEqual("test \\u4e2d\\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_3200
     * @tc.name testToLowerCase032
     * @tc.desc Verify toLowerCase() handles literal malformed Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\u malformed");
      let result: string = source.toLowerCase();
      expect(result.length).assertEqual(source.length);
      expect(result).assertEqual("\\u malformed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_3300
     * @tc.name testToLowerCase033
     * @tc.desc Verify ToLowerCase handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.toLowerCase();
      expect(result).assertEqual(source.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOWERCASE_3400
     * @tc.name testToLowerCase034
     * @tc.desc Verify ToLowerCase handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLowerCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.toLowerCase();
      expect(result).assertEqual("テスト 테스트 test 測試 абвгд الاختبار");
    });
  });
}
