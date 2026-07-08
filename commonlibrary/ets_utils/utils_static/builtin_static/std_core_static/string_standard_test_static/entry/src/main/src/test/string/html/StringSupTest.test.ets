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

export default function StringSupTest(): void {
  describe('StringSupTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0100
     * @tc.name testSup001
     * @tc.desc Verify sup() with no arguments returns <sup> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello".sup();
      expect(result).assertEqual("<sup>hello</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0200
     * @tc.name testSup002
     * @tc.desc Verify sup() on trim result wraps trimmed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trimmed: string = "  sup  ".trim();
      let result: string = trimmed.sup();
      expect(result).assertEqual("<sup>sup</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0300
     * @tc.name testSup003
     * @tc.desc Verify sup() result starts with <sup> and ends with </sup>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".sup();
      let starts: boolean = result.startsWith("<sup>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</sup>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0400
     * @tc.name testSup004
     * @tc.desc Verify sup() preserves original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello World".sup();
      expect(result).assertEqual("<sup>Hello World</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0500
     * @tc.name testSup005
     * @tc.desc Verify sup() wraps a power exponent digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "2".sup();
      expect(result).assertEqual("<sup>2</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0600
     * @tc.name testSup006
     * @tc.desc Verify sup() wraps an ordinal suffix exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "th".sup();
      expect(result).assertEqual("<sup>th</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0700
     * @tc.name testSup007
     * @tc.desc Verify sup() result length equals original length + 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "hi".sup();
      expect(r1.length).assertEqual(2 + 11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0800
     * @tc.name testSup008
     * @tc.desc Verify sup() on repeat result wraps repeated content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let repeated: string = "x".repeat(3);
      let result: string = repeated.sup();
      expect(result).assertEqual("<sup>xxx</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_0900
     * @tc.name testSup009
     * @tc.desc Verify sup() with empty string returns <sup></sup>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".sup();
      expect(result).assertEqual("<sup></sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1000
     * @tc.name testSup010
     * @tc.desc Verify sup() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".sup();
      expect(result).assertEqual("<sup>A</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1100
     * @tc.name testSup011
     * @tc.desc Verify sup() with HTML special characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<div>".sup();
      expect(result).assertEqual("<sup><div></sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1200
     * @tc.name testSup012
     * @tc.desc Verify sup() preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".sup();
      expect(r1).assertEqual("<sup>line1\nline2</sup>");
      let r2: string = "col1\tcol2".sup();
      expect(r2).assertEqual("<sup>col1\tcol2</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1300
     * @tc.name testSup013
     * @tc.desc Verify sup() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".sup();
      expect(result).assertEqual("<sup>你好世界</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1400
     * @tc.name testSup014
     * @tc.desc Verify sup() chained with toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "HELLO".sup();
      let result: string = r1.toLowerCase();
      expect(result).assertEqual("<sup>hello</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1500
     * @tc.name testSup015
     * @tc.desc Verify sup() chained after toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "HELLO".toLowerCase().sup();
      expect(result).assertEqual("<sup>hello</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1600
     * @tc.name testSup016
     * @tc.desc Verify sup() called twice produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "a".sup();
      let result: string = r1.sup();
      expect(result).assertEqual("<sup><sup>a</sup></sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1700
     * @tc.name testSup017
     * @tc.desc Verify sup() result length matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ok".sup();
      expect(r1.length).assertEqual("<sup>ok</sup>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1800
     * @tc.name testSup018
     * @tc.desc Verify sup() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.sup();
      expect(result).assertEqual("<sup>a\rb</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_1900
     * @tc.name testSup019
     * @tc.desc Verify sup() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.sup();
      expect(result).assertEqual("<sup>😀</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2000
     * @tc.name testSup020
     * @tc.desc Verify sup() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.sup();
      expect(result).assertEqual("<sup>ＦＷ</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2100
     * @tc.name testSup021
     * @tc.desc Verify sup() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.sup();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<sup>ArkTS</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2200
     * @tc.name testSup022
     * @tc.desc Verify sup() with ISO 8859-1 Latin accented content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".sup();
      expect(result).assertEqual("<sup>café</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2300
     * @tc.name testSup023
     * @tc.desc Verify sup() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".sup();
      expect(result).assertEqual("<sup>ﾊﾝｶｸ</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2400
     * @tc.name testSup024
     * @tc.desc Verify sup() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".sup();
      expect(result).assertEqual("<sup>中文测试</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2500
     * @tc.name testSup025
     * @tc.desc Verify sup() chained with replace() strips tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".sup();
      let result: string = r1.replace("<sup>", "").replace("</sup>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2600
     * @tc.name testSup026
     * @tc.desc Verify sup() with NUL character \\0 in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".sup();
      let starts: boolean = result.startsWith("<sup>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2700
     * @tc.name testSup027
     * @tc.desc Verify sup() with backslash in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "x\\y".sup();
      expect(result).assertEqual("<sup>x\\y</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2800
     * @tc.name testSup028
     * @tc.desc Verify sup() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "E=mc² 中文 😀".sup();
      expect(result).assertEqual("<sup>E=mc² 中文 😀</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_2900
     * @tc.name testSup029
     * @tc.desc Verify sup() wraps Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "\u4E2D\u6587".sup();
      expect(result).assertEqual("<sup>\u4E2D\u6587</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_3000
     * @tc.name testSup030
     * @tc.desc Verify sup() wraps zero-width space content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A\u200BB".sup();
      expect(result).assertEqual("<sup>A\u200BB</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_3100
     * @tc.name testSup031
     * @tc.desc Verify sup() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.sup();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_3200
     * @tc.name testSup032
     * @tc.desc Verify Sup handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.sup();
      expect(result).assertEqual("<sup>" + source.toString() + "</sup>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP_3300
     * @tc.name testSup033
     * @tc.desc Verify Sup handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSup033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.sup();
      expect(result).assertEqual("<sup>" + source.toString() + "</sup>");
    });
  });
}
