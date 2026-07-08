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

export default function StringValueOfTest(): void {
  describe('StringValueOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0100
     * @tc.name testValueOf001
     * @tc.desc Verify valueOf() returns same content as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0200
     * @tc.name testValueOf002
     * @tc.desc Verify valueOf() result has correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Hello");
      let result: String = str.valueOf();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0300
     * @tc.name testValueOf003
     * @tc.desc Verify valueOf() and toString() return equal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let v: String = str.valueOf();
      let t: String = str.toString();
      expect(v.toString()).assertEqual(t.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0400
     * @tc.name testValueOf004
     * @tc.desc Verify valueOf() with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0500
     * @tc.name testValueOf005
     * @tc.desc Verify valueOf() with emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀🎉");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0600
     * @tc.name testValueOf006
     * @tc.desc Verify valueOf() is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let v1: String = str.valueOf();
      let v2: String = v1.valueOf();
      expect(v1.toString()).assertEqual(v2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0700
     * @tc.name testValueOf007
     * @tc.desc Verify valueOf() with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\tb\nc");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("a\tb\nc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0800
     * @tc.name testValueOf008
     * @tc.desc Verify valueOf() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("你好");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("你好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_0900
     * @tc.name testValueOf009
     * @tc.desc Verify valueOf() with GBK Chinese text preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1000
     * @tc.name testValueOf010
     * @tc.desc Verify valueOf() with dynamic variable preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("GitHub");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("GitHub");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1100
     * @tc.name testValueOf011
     * @tc.desc Verify valueOf() on default-constructed String returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String();
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1200
     * @tc.name testValueOf012
     * @tc.desc Verify valueOf() with C0 control characters \0 and \r preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\0b\rc");
      let result: String = str.valueOf();
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1300
     * @tc.name testValueOf013
     * @tc.desc Verify valueOf() with ISO 8859-1 Latin accented text preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("señor");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("señor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1400
     * @tc.name testValueOf014
     * @tc.desc Verify valueOf() with half-width katakana preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ﾊﾝｶｸ");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("ﾊﾝｶｸ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1500
     * @tc.name testValueOf015
     * @tc.desc Verify valueOf() result supports further String method calls (charAt, substring)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("TypeScript");
      let result: String = str.valueOf();
      expect(result.charAt(0)).assertEqual(c'T');
      let sub: string = result.substring(4, 10);
      expect(sub.toString()).assertEqual("Script");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1600
     * @tc.name testValueOf016
     * @tc.desc Verify valueOf() returns independent String (modifications do not affect original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ArkTS");
      let result: String = str.valueOf();
      let modified: string = result.concat(" Extra");
      expect(str.toString()).assertEqual("ArkTS");
      expect(modified).assertEqual("ArkTS Extra");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1700
     * @tc.name testValueOf017
     * @tc.desc Verify valueOf() with mixed ASCII, CJK, and emoji text preserves all characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Hi 世界 😀");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("Hi 世界 😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1800
     * @tc.name testValueOf018
     * @tc.desc Verify valueOf() with backslash character preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("a\\b");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("a\\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_1900
     * @tc.name testValueOf019
     * @tc.desc Verify valueOf() on pure numeric string preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("007");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2000
     * @tc.name testValueOf020
     * @tc.desc Verify valueOf() result used with includes deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("hello world");
      let val: String = str.valueOf();
      let inc: boolean = val.toString().includes("hello");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2100
     * @tc.name testValueOf021
     * @tc.desc Verify valueOf() on spaces-only string preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("     ");
      let result: String = str.valueOf();
      expect(result.toString()).assertEqual("     ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2200
     * @tc.name testValueOf022
     * @tc.desc Verify valueOf() with newline characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("line1\nline2");
      let result: String = str.valueOf();
      expect(result.getLength()).assertEqual(11);
      expect(result.charCodeAt(5)).assertEqual(10);
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2300
     * @tc.name testValueOf023
     * @tc.desc Verify valueOf() returns "test" for String "test"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("test");
      let val: String = str.valueOf();
      expect(val.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2400
     * @tc.name testValueOf024
     * @tc.desc Verify valueOf preserves Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2500
     * @tc.name testValueOf025
     * @tc.desc Verify valueOf preserves zero-width space in mixed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("A\u200BB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2600
     * @tc.name testValueOf026
     * @tc.desc Verify valueOf preserves date-format business string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2700
     * @tc.name testValueOf027
     * @tc.desc Verify valueOf preserves hexadecimal-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("0x123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2800
     * @tc.name testValueOf028
     * @tc.desc Verify valueOf preserves email-format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_2900
     * @tc.name testValueOf029
     * @tc.desc Verify valueOf preserves replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_3000
     * @tc.name testValueOf030
     * @tc.desc Verify valueOf preserves Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631");
      let result: String = text.valueOf();
      expect(result.toString()).assertEqual("\u0627\u0644\u0627\u062E\u062A\u0628\u0627\u0631");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_3100
     * @tc.name testValueOf031
     * @tc.desc Verify ValueOf handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const source = new String(expected);
      let result: string = source.valueOf();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_VALUEOF_3200
     * @tc.name testValueOf032
     * @tc.desc Verify ValueOf handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const source = new String(expected);
      let result: string = new String(source).valueOf();
      expect(result).assertEqual(expected);
    });
  });
}
