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

export default function StringToStringTest(): void {
  describe('StringToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0100
     * @tc.name testToString001
     * @tc.desc Verify toString() returns string content matching original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0200
     * @tc.name testToString002
     * @tc.desc Verify toString() result has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: String = str.toString();
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0300
     * @tc.name testToString003
     * @tc.desc Verify toString() result supports charAt access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: String = str.toString();
      expect(result.charAt(0)).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0400
     * @tc.name testToString004
     * @tc.desc Verify toString() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String();
      let r1: String = str.toString();
      let r2: String = r1.toString();
      expect(r2.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0500
     * @tc.name testToString005
     * @tc.desc Verify toString() chained with trim returns trimmed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String(" ArkTS ");
      let result: String = str.toString();
      expect(result.trim().toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0600
     * @tc.name testToString006
     * @tc.desc Verify toString() with Chinese and emoji preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("你好世界😀");
      let r1: String = str.toString();
      let r2: String = r1.toString();
      expect(r2.toString()).assertEqual("你好世界😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0700
     * @tc.name testToString007
     * @tc.desc Verify toString() with special characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("!@#$%^&*()");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0800
     * @tc.name testToString008
     * @tc.desc Verify toString() with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("12345");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_0900
     * @tc.name testToString009
     * @tc.desc Verify toString() is idempotent (calling twice gives same result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let r1: String = str.toString();
      let r2: String = r1.toString();
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1000
     * @tc.name testToString010
     * @tc.desc Verify toString() on GBK Chinese text preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1100
     * @tc.name testToString011
     * @tc.desc Verify toString() on ISO 8859-1 Latin text preserves accented characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("café");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1200
     * @tc.name testToString012
     * @tc.desc Verify toString() on string with C0 control characters preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\tb\nc");
      let result: String = str.toString();
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1300
     * @tc.name testToString013
     * @tc.desc Verify toString() with dynamic configuration path preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("config.path=/data/app");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("config.path=/data/app");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1400
     * @tc.name testToString014
     * @tc.desc Verify toString() with half-width katakana content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ﾊﾝｶｸ");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("ﾊﾝｶｸ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1500
     * @tc.name testToString015
     * @tc.desc Verify toString() with emoji content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀🎉");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1600
     * @tc.name testToString016
     * @tc.desc Verify toString() does NOT alter the original source (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: String = str.toString();
      expect(str.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1700
     * @tc.name testToString017
     * @tc.desc Verify toString() idempotent on CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试");
      let r1: String = str.toString();
      let r2: String = r1.toString();
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1800
     * @tc.name testToString018
     * @tc.desc Verify toString() with NUL character \\0 in content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\0b");
      let result: String = str.toString();
      expect(result.getLength()).assertEqual(3);
      expect(result.charCodeAt(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_1900
     * @tc.name testToString019
     * @tc.desc Verify toString() with backslash character in content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\\b");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("a\\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2000
     * @tc.name testToString020
     * @tc.desc Verify toString() with mixed ASCII + CJK + Emoji content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Hi 世界 😀");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("Hi 世界 😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2100
     * @tc.name testToString021
     * @tc.desc Verify toString() and valueOf() return same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("cache-key");
      let ts: String = str.toString();
      let vo: String = str.valueOf();
      expect(ts.toString()).assertEqual(vo.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2200
     * @tc.name testToString022
     * @tc.desc Verify toString() returns mode flag string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("mode=debug");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("mode=debug");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2300
     * @tc.name testToString023
     * @tc.desc Verify toString() on numbers-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("1234567890");
      let result: String = str.toString();
      expect(result.toString()).assertEqual("1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2400
     * @tc.name testToString024
     * @tc.desc Verify toString() on very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = "a".repeat(1000);
      let str: String = new String(base);
      let result: String = str.toString();
      expect(result.getLength()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2500
     * @tc.name testToString025
     * @tc.desc Verify toString preserves Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2600
     * @tc.name testToString026
     * @tc.desc Verify toString preserves zero-width space in mixed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("A\u200BB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2700
     * @tc.name testToString027
     * @tc.desc Verify toString preserves date-format business string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2800
     * @tc.name testToString028
     * @tc.desc Verify toString preserves hexadecimal-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("0x123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_2900
     * @tc.name testToString029
     * @tc.desc Verify toString preserves email-format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_3000
     * @tc.name testToString030
     * @tc.desc Verify toString preserves replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: String = text.toString();
      expect(result.toString()).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_3100
     * @tc.name testToString031
     * @tc.desc Verify ToString handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const source = new String(expected);
      let result: string = source.toString();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOSTRING_3200
     * @tc.name testToString032
     * @tc.desc Verify ToString handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const source = new String(expected);
      let result: string = new String(source).toString();
      expect(result).assertEqual(expected);
    });
  });
}
