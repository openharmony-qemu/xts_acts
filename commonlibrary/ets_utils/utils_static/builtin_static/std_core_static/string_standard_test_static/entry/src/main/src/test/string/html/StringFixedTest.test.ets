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

export default function StringFixedTest(): void {
  describe('StringFixedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0100
     * @tc.name testFixed001
     * @tc.desc Verify fixed() with no arguments returns <tt> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello".fixed();
      expect(result).assertEqual("<tt>hello</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0200
     * @tc.name testFixed002
     * @tc.desc Verify fixed() on trim result wraps trimmed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trimmed: string = "  fixed  ".trim();
      let result: string = trimmed.fixed();
      expect(result).assertEqual("<tt>fixed</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0300
     * @tc.name testFixed003
     * @tc.desc Verify fixed() result starts with <tt> and ends with </tt>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".fixed();
      let starts: boolean = result.startsWith("<tt>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</tt>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0400
     * @tc.name testFixed004
     * @tc.desc Verify fixed() preserves original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello World".fixed();
      expect(result).assertEqual("<tt>Hello World</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0500
     * @tc.name testFixed005
     * @tc.desc Verify fixed() preserves a command-line option token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "--verbose".fixed();
      expect(result).assertEqual("<tt>--verbose</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0600
     * @tc.name testFixed006
     * @tc.desc Verify fixed() wraps a dotted identifier exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "app.cache.key".fixed();
      expect(result).assertEqual("<tt>app.cache.key</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0700
     * @tc.name testFixed007
     * @tc.desc Verify fixed() with empty string returns <tt></tt>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".fixed();
      expect(result).assertEqual("<tt></tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0800
     * @tc.name testFixed008
     * @tc.desc Verify fixed() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".fixed();
      expect(result).assertEqual("<tt>A</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_0900
     * @tc.name testFixed009
     * @tc.desc Verify fixed() with HTML special characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<div>".fixed();
      expect(result).assertEqual("<tt><div></tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1000
     * @tc.name testFixed010
     * @tc.desc Verify fixed() preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".fixed();
      expect(r1).assertEqual("<tt>line1\nline2</tt>");
      let r2: string = "col1\tcol2".fixed();
      expect(r2).assertEqual("<tt>col1\tcol2</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1100
     * @tc.name testFixed011
     * @tc.desc Verify fixed() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".fixed();
      expect(result).assertEqual("<tt>你好世界</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1200
     * @tc.name testFixed012
     * @tc.desc Verify fixed() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀🎉".fixed();
      expect(result).assertEqual("<tt>😀🎉</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1300
     * @tc.name testFixed013
     * @tc.desc Verify fixed() with long string (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(1000);
      let result: string = longStr.fixed();
      let starts: boolean = result.startsWith("<tt>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</tt>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1400
     * @tc.name testFixed014
     * @tc.desc Verify fixed() with long string (10000 chars) result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "b".repeat(10000);
      let result: string = longStr.fixed();
      expect(result.length).assertEqual(10000 + 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1500
     * @tc.name testFixed015
     * @tc.desc Verify fixed() result length matches expected string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".fixed();
      expect(r1.length).assertEqual("<tt>test</tt>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1600
     * @tc.name testFixed016
     * @tc.desc Verify fixed() chained with toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".fixed();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<TT>TEST</TT>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1700
     * @tc.name testFixed017
     * @tc.desc Verify fixed() chained with indexOf to find tag substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".fixed();
      let pos: int = result.indexOf("tt");
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1800
     * @tc.name testFixed018
     * @tc.desc Verify fixed() called twice produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "test".fixed();
      let result: string = r1.fixed();
      expect(result).assertEqual("<tt><tt>test</tt></tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_1900
     * @tc.name testFixed019
     * @tc.desc Verify fixed() result includes an original error code via includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ERR_404".fixed();
      let inc: boolean = r1.includes("ERR_404");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2000
     * @tc.name testFixed020
     * @tc.desc Verify fixed() with mixed multilingual characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello你好World世界".fixed();
      expect(result).assertEqual("<tt>Hello你好World世界</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2100
     * @tc.name testFixed021
     * @tc.desc Verify fixed() with substring result wraps extracted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = "OpenHarmony";
      let part: string = source.substring(0, 4);
      let result: string = part.fixed();
      expect(result).assertEqual("<tt>Open</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2200
     * @tc.name testFixed022
     * @tc.desc Verify fixed() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.fixed();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<tt>ArkTS</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2300
     * @tc.name testFixed023
     * @tc.desc Verify fixed() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.fixed();
      expect(result).assertEqual("<tt>a\rb</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2400
     * @tc.name testFixed024
     * @tc.desc Verify fixed() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.fixed();
      expect(result).assertEqual("<tt>😀</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2500
     * @tc.name testFixed025
     * @tc.desc Verify fixed() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.fixed();
      expect(result).assertEqual("<tt>ＦＷ</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2600
     * @tc.name testFixed026
     * @tc.desc Verify fixed() with ISO 8859-1 Latin accented content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".fixed();
      expect(result).assertEqual("<tt>café</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2700
     * @tc.name testFixed027
     * @tc.desc Verify fixed() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".fixed();
      expect(result).assertEqual("<tt>ﾊﾝｶｸ</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2800
     * @tc.name testFixed028
     * @tc.desc Verify fixed() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".fixed();
      expect(result).assertEqual("<tt>中文测试</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_2900
     * @tc.name testFixed029
     * @tc.desc Verify fixed() chained with replace() strips tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".fixed();
      let result: string = r1.replace("<tt>", "").replace("</tt>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_3000
     * @tc.name testFixed030
     * @tc.desc Verify fixed() with NUL character \\0 in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".fixed();
      let starts: boolean = result.startsWith("<tt>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_3100
     * @tc.name testFixed031
     * @tc.desc Verify fixed() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".fixed();
      expect(result).assertEqual("<tt>Hi 世界 😀</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_3200
     * @tc.name testFixed032
     * @tc.desc Verify fixed() handles ISO-8859-1 question-mark garbled text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("????");
      let result: string = source.fixed();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_3300
     * @tc.name testFixed033
     * @tc.desc Verify Fixed handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.fixed();
      expect(result).assertEqual("<tt>" + source.toString() + "</tt>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FIXED_3400
     * @tc.name testFixed034
     * @tc.desc Verify Fixed handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFixed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.fixed();
      expect(result).assertEqual("<tt>" + source.toString() + "</tt>");
    });
  });
}
