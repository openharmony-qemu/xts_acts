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

export default function StringSmallTest(): void {
  describe('StringSmallTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0100
     * @tc.name testSmall001
     * @tc.desc Verify small() with no arguments returns <small> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".small();
      expect(result).assertEqual("<small>ArkTS</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0200
     * @tc.name testSmall002
     * @tc.desc Verify small() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".small();
      expect(result).assertEqual("<small>Hi 世界 😀</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0300
     * @tc.name testSmall003
     * @tc.desc Verify small() result starts with <small> and ends with </small>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".small();
      let starts: boolean = result.startsWith("<small>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</small>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0400
     * @tc.name testSmall004
     * @tc.desc Verify small() preserves original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello World".small();
      expect(result).assertEqual("<small>Hello World</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0500
     * @tc.name testSmall005
     * @tc.desc Verify small() wraps a compact footnote marker exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "fn:1".small();
      expect(result).assertEqual("<small>fn:1</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0600
     * @tc.name testSmall006
     * @tc.desc Verify small() with empty string returns <small></small>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".small();
      expect(result).assertEqual("<small></small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0700
     * @tc.name testSmall007
     * @tc.desc Verify small() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".small();
      expect(result).assertEqual("<small>A</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0800
     * @tc.name testSmall008
     * @tc.desc Verify small() preserves a mixed-case product code exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "SkuX9".small();
      expect(result).assertEqual("<small>SkuX9</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_0900
     * @tc.name testSmall009
     * @tc.desc Verify small() with HTML special characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<div>".small();
      expect(result).assertEqual("<small><div></small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1000
     * @tc.name testSmall010
     * @tc.desc Verify small() result length correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "".small();
      expect(r1.length).assertEqual("<small></small>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1100
     * @tc.name testSmall011
     * @tc.desc Verify small() preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".small();
      expect(r1).assertEqual("<small>line1\nline2</small>");
      let r2: string = "col1\tcol2".small();
      expect(r2).assertEqual("<small>col1\tcol2</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1200
     * @tc.name testSmall012
     * @tc.desc Verify small() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".small();
      expect(result).assertEqual("<small>你好世界</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1300
     * @tc.name testSmall013
     * @tc.desc Verify small() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀🎉".small();
      expect(result).assertEqual("<small>😀🎉</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1400
     * @tc.name testSmall014
     * @tc.desc Verify small() with long string (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(1000);
      let result: string = longStr.small();
      let starts: boolean = result.startsWith("<small>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</small>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1500
     * @tc.name testSmall015
     * @tc.desc Verify small() with long string (10000 chars) result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "b".repeat(10000);
      let result: string = longStr.small();
      expect(result.length).assertEqual(10000 + 15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1600
     * @tc.name testSmall016
     * @tc.desc Verify small() with emoji mixed with ASCII label text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello 🌍🎉".small();
      expect(result).assertEqual("<small>Hello 🌍🎉</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1700
     * @tc.name testSmall017
     * @tc.desc Verify small() with multilingual characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "こんにちは 안녕".small();
      expect(result).assertEqual("<small>こんにちは 안녕</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1800
     * @tc.name testSmall018
     * @tc.desc Verify small() with long string (10000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let result: string = longStr.small();
      let starts: boolean = result.startsWith("<small>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</small>");
      expect(ends).assertTrue();
      expect(result.length).assertEqual(10000 + "<small></small>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_1900
     * @tc.name testSmall019
     * @tc.desc Verify small() with very long string (100000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "x".repeat(100000);
      let result: string = longStr.small();
      expect(result.length).assertEqual(100000 + "<small></small>".length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2000
     * @tc.name testSmall020
     * @tc.desc Verify small() chained with bold()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".small();
      let result: string = r1.bold();
      expect(result).assertEqual("<b><small>ArkTS</small></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2100
     * @tc.name testSmall021
     * @tc.desc Verify small() chained with concat()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "hello".small();
      let result: string = r1.concat(" world");
      expect(result).assertEqual("<small>hello</small> world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2200
     * @tc.name testSmall022
     * @tc.desc Verify small() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.small();
      expect(result).assertEqual("<small>a\rb</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2300
     * @tc.name testSmall023
     * @tc.desc Verify small() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.small();
      expect(result).assertEqual("<small>😀</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2400
     * @tc.name testSmall024
     * @tc.desc Verify small() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.small();
      expect(result).assertEqual("<small>ＦＷ</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2500
     * @tc.name testSmall025
     * @tc.desc Verify small() result indexOf finds an original note id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "note-7".small();
      let pos: int = result.indexOf("note-7");
      expect(pos).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2600
     * @tc.name testSmall026
     * @tc.desc Verify small() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.small();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<small>ArkTS</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2700
     * @tc.name testSmall027
     * @tc.desc Verify small() with mixed multilingual characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello你好World世界".small();
      expect(result).assertEqual("<small>Hello你好World世界</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2800
     * @tc.name testSmall028
     * @tc.desc Verify small() with substring result wraps extracted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = "OpenHarmony";
      let part: string = source.substring(4, 11);
      let result: string = part.small();
      expect(result).assertEqual("<small>Harmony</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_2900
     * @tc.name testSmall029
     * @tc.desc Verify small() with mixed Unicode and ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Testテスト".small();
      expect(result).assertEqual("<small>Testテスト</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3000
     * @tc.name testSmall030
     * @tc.desc Verify small() with Japanese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "こんにちは".small();
      expect(result).assertEqual("<small>こんにちは</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3100
     * @tc.name testSmall031
     * @tc.desc Verify small() with Korean characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "안녕하세요".small();
      expect(result).assertEqual("<small>안녕하세요</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3200
     * @tc.name testSmall032
     * @tc.desc Verify small() with RTL Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "مرحبا".small();
      expect(result).assertEqual("<small>مرحبا</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3300
     * @tc.name testSmall033
     * @tc.desc Verify small() with surrogate pair Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "𐍈".small();
      expect(result).assertEqual("<small>𐍈</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3400
     * @tc.name testSmall034
     * @tc.desc Verify small() chained with toUpperCase() via variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "hello";
      let r1: string = text.small();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<SMALL>HELLO</SMALL>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3500
     * @tc.name testSmall035
     * @tc.desc Verify small() called multiple times returns consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "test";
      let r1: string = text.small();
      let r2: string = text.small();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3600
     * @tc.name testSmall036
     * @tc.desc Verify small() with bell character \\a in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "beep\a".small();
      expect(result).assertEqual("<small>beep\a</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3700
     * @tc.name testSmall037
     * @tc.desc Verify small() with vertical tab \\v in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\vb".small();
      expect(result).assertEqual("<small>a\vb</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3800
     * @tc.name testSmall038
     * @tc.desc Verify small() with form feed \\f in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\fb".small();
      expect(result).assertEqual("<small>a\fb</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_3900
     * @tc.name testSmall039
     * @tc.desc Verify small() with all-punctuation content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "!@#$%".small();
      expect(result).assertEqual("<small>!@#$%</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4000
     * @tc.name testSmall040
     * @tc.desc Verify small() with only a less-than character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<".small();
      expect(result).assertEqual("<small><</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4100
     * @tc.name testSmall041
     * @tc.desc Verify small() with ISO 8859-1 Latin accented content (café)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".small();
      expect(result).assertEqual("<small>café</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4200
     * @tc.name testSmall042
     * @tc.desc Verify small() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".small();
      expect(result).assertEqual("<small>ﾊﾝｶｸ</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4300
     * @tc.name testSmall043
     * @tc.desc Verify small() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".small();
      expect(result).assertEqual("<small>中文测试</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4400
     * @tc.name testSmall044
     * @tc.desc Verify small() does NOT modify the original content string (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.small();
      expect(original).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4500
     * @tc.name testSmall045
     * @tc.desc Verify small() inner content between tags matches original via extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "core".small();
      let inner: string = result.substring(7, result.length - 8);
      expect(inner).assertEqual("core");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4600
     * @tc.name testSmall046
     * @tc.desc Verify small() with dynamic content variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Dynamic";
      let result: string = text.small();
      expect(result).assertEqual("<small>Dynamic</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4700
     * @tc.name testSmall047
     * @tc.desc Verify small() with NUL character \\0 in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".small();
      let starts: boolean = result.startsWith("<small>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4800
     * @tc.name testSmall048
     * @tc.desc Verify small() with backslash character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\\b".small();
      expect(result).assertEqual("<small>a\\b</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_4900
     * @tc.name testSmall049
     * @tc.desc Verify small() with only whitespace content preserves spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "   ".small();
      expect(result).assertEqual("<small>   </small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_5000
     * @tc.name testSmall050
     * @tc.desc Verify small() chained with replace() strips tags to recover original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".small();
      let result: string = r1.replace("<small>", "").replace("</small>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_5100
     * @tc.name testSmall051
     * @tc.desc Verify small() with tilde character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "~home".small();
      expect(result).assertEqual("<small>~home</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_5200
     * @tc.name testSmall052
     * @tc.desc Verify small() with path-like content (/usr/local/bin)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "/usr/local/bin".small();
      expect(result).assertEqual("<small>/usr/local/bin</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_5300
     * @tc.name testSmall053
     * @tc.desc Verify small() handles literal malformed Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\u malformed");
      let result: string = source.small();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_5400
     * @tc.name testSmall054
     * @tc.desc Verify Small handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.small();
      expect(result).assertEqual("<small>" + source.toString() + "</small>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL_5500
     * @tc.name testSmall055
     * @tc.desc Verify Small handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSmall055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.small();
      expect(result).assertEqual("<small>" + source.toString() + "</small>");
    });
  });
}
