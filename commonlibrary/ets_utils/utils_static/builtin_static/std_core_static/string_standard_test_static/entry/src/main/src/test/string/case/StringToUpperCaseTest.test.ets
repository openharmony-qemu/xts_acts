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

export default function StringToUpperCaseTest(): void {
  describe('StringToUpperCaseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0100
     * @tc.name testToUpperCase001
     * @tc.desc Verify toUpperCase() converts lowercase to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("arkts");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("ARKTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0200
     * @tc.name testToUpperCase002
     * @tc.desc Verify toUpperCase() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0300
     * @tc.name testToUpperCase003
     * @tc.desc Verify toUpperCase() on already uppercase returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ARKTS");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("ARKTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0400
     * @tc.name testToUpperCase004
     * @tc.desc Verify toUpperCase() with mixed alphanumeric input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("abc123xyz");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("ABC123XYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0500
     * @tc.name testToUpperCase005
     * @tc.desc Verify toUpperCase() converts single lowercase character to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("z");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0600
     * @tc.name testToUpperCase006
     * @tc.desc Verify toUpperCase() on emoji returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀abc");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("😀ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0700
     * @tc.name testToUpperCase007
     * @tc.desc Verify toUpperCase() on CJK and GBK characters returns unchanged while ASCII converts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试abc");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("中文测试ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0800
     * @tc.name testToUpperCase008
     * @tc.desc Verify toUpperCase() normalizes a dynamic environment variable key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("path_home");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("PATH_HOME");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0900
     * @tc.name testToUpperCase009
     * @tc.desc Verify toUpperCase() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.toUpperCase();
      expect(text.toString()).assertEqual("hello");
      expect(result.toString()).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1000
     * @tc.name testToUpperCase010
     * @tc.desc Verify case-insensitive equality using toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("hello");
      const b = new String("HELLO");
      expect(a.toUpperCase().toString()).assertEqual(b.toUpperCase().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1100
     * @tc.name testToUpperCase011
     * @tc.desc Verify toUpperCase() preserves punctuation and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello, world! 123");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("HELLO, WORLD! 123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1200
     * @tc.name testToUpperCase012
     * @tc.desc Verify toUpperCase() keeps an already uppercase permission token unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("READ_ONLY");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("READ_ONLY");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1300
     * @tc.name testToUpperCase013
     * @tc.desc Verify toUpperCase() normalizes an HTTP method token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("post");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("POST");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1400
     * @tc.name testToUpperCase014
     * @tc.desc Verify case-insensitive search using toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let upper: string = text.toUpperCase().toString();
      expect(upper).assertEqual("HELLO WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1500
     * @tc.name testToUpperCase015
     * @tc.desc Verify toUpperCase() called twice gives same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let once: String = text.toUpperCase();
      let twice: String = once.toUpperCase();
      expect(twice.toString()).assertEqual(once.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1600
     * @tc.name testToUpperCase016
     * @tc.desc Verify toUpperCase() chained with substring extracts and transforms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let firstWord: string = text.substring(0, 5).toUpperCase().toString();
      expect(firstWord).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1700
     * @tc.name testToUpperCase017
     * @tc.desc Verify toUpperCase() on full-width lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ａｂｃ");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("ＡＢＣ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1800
     * @tc.name testToUpperCase018
     * @tc.desc Verify toUpperCase() on string with leading/trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("  HELLO  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1900
     * @tc.name testToUpperCase019
     * @tc.desc Verify toUpperCase() on string with newlines and tabs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\tend");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("LINE1\nLINE2\tEND");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2000
     * @tc.name testToUpperCase020
     * @tc.desc Verify toUpperCase() on very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdefghij".repeat(10));
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("ABCDEFGHIJ".repeat(10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2100
     * @tc.name testToUpperCase021
     * @tc.desc Verify toUpperCase() on mixed scripts preserves non-Latin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello中文123");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("HELLO中文123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2200
     * @tc.name testToUpperCase022
     * @tc.desc Verify toUpperCase() on string with special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price: $100 @store");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("PRICE: $100 @STORE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2300
     * @tc.name testToUpperCase023
     * @tc.desc Verify toUpperCase() with numbers only returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1234567890");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2400
     * @tc.name testToUpperCase024
     * @tc.desc Verify toUpperCase() with underscore-separated identifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("user_name_input");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("USER_NAME_INPUT");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2500
     * @tc.name testToUpperCase025
     * @tc.desc Verify toUpperCase() with camelCase identifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("camelCaseIdentifier");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("CAMELCASEIDENTIFIER");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2600
     * @tc.name testToUpperCase026
     * @tc.desc Verify toUpperCase() preserves surrogate pairs in emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a😀b");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("A😀B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2700
     * @tc.name testToUpperCase027
     * @tc.desc Verify toUpperCase() normalizes a log level token for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("warning");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("WARNING");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2800
     * @tc.name testToUpperCase028
     * @tc.desc Verify chaining toUpperCase() with trim()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trim().toUpperCase().toString();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2900
     * @tc.name testToUpperCase029
     * @tc.desc Verify toUpperCase() preserves embedded C0 NUL while converting ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ok\0done");
      let upper: String = text.toUpperCase();
      expect(upper.toString()).assertEqual("OK\0DONE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3000
     * @tc.name testToUpperCase030
     * @tc.desc Verify toUpperCase() on string with only symbols returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!@#$%^&*()");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3100
     * @tc.name testToUpperCase031
     * @tc.desc Verify toUpperCase() on ISO 8859-1 Latin accented lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("CAFÉ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3200
     * @tc.name testToUpperCase032
     * @tc.desc Verify toUpperCase() handles GBK-to-UTF8 garbled text spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("æµè¯");
      let result: string = source.toUpperCase();
      expect(result.length).assertEqual(source.length);
      expect(result.charCodeAt(0)).assertEqual(0x00C6);
      expect(result.charCodeAt(1)).assertEqual(0x039C);
      expect(result.charCodeAt(2)).assertEqual(0x00C8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3300
     * @tc.name testToUpperCase033
     * @tc.desc Verify toUpperCase() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.toUpperCase();
      expect(result.length).assertEqual(source.length);
      expect(result.charCodeAt(0)).assertEqual(0xFFFD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3400
     * @tc.name testToUpperCase034
     * @tc.desc Verify ToUpperCase handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.toUpperCase();
      expect(result).assertEqual(source.toString().toUpperCase());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3500
     * @tc.name testToUpperCase035
     * @tc.desc Verify ToUpperCase handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.toUpperCase();
      expect(result).assertEqual("テスト 테스트 TEST 測試 АБВГД الاختبار");
    });
  });
}
