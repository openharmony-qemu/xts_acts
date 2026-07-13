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

export default function StringBlinkTest(): void {
  describe('StringBlinkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0100
     * @tc.name testBlink001
     * @tc.desc Verify blink() with no arguments returns <blink> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".blink();
      expect(result).assertEqual("<blink>ArkTS</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0200
     * @tc.name testBlink002
     * @tc.desc Verify blink() on trim result wraps trimmed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trimmed: string = "  blink  ".trim();
      let result: string = trimmed.blink();
      expect(result).assertEqual("<blink>blink</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0300
     * @tc.name testBlink003
     * @tc.desc Verify blink() result starts with <blink> and ends with </blink>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".blink();
      let starts: boolean = result.startsWith("<blink>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</blink>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0400
     * @tc.name testBlink004
     * @tc.desc Verify blink() preserves original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello World".blink();
      expect(result).assertEqual("<blink>Hello World</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0500
     * @tc.name testBlink005
     * @tc.desc Verify blink() preserves an alert status token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "alert:stale".blink();
      expect(result).assertEqual("<blink>alert:stale</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0600
     * @tc.name testBlink006
     * @tc.desc Verify blink() preserves a route-like lowercase token exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "home/settings".blink();
      expect(result).assertEqual("<blink>home/settings</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0700
     * @tc.name testBlink007
     * @tc.desc Verify blink() with empty string returns <blink></blink>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".blink();
      expect(result).assertEqual("<blink></blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0800
     * @tc.name testBlink008
     * @tc.desc Verify blink() with single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "A".blink();
      expect(result).assertEqual("<blink>A</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_0900
     * @tc.name testBlink009
     * @tc.desc Verify blink() with HTML special characters preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<div>".blink();
      expect(result).assertEqual("<blink><div></blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1000
     * @tc.name testBlink010
     * @tc.desc Verify blink() result length correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tagLen: number = "<blink></blink>".length;
      let r1: string = "ab".blink();
      expect(r1.length).assertEqual("ab".length + tagLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1100
     * @tc.name testBlink011
     * @tc.desc Verify blink() preserves newline and tab characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "line1\nline2".blink();
      expect(r1).assertEqual("<blink>line1\nline2</blink>");
      let r2: string = "col1\tcol2".blink();
      expect(r2).assertEqual("<blink>col1\tcol2</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1200
     * @tc.name testBlink012
     * @tc.desc Verify blink() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".blink();
      expect(result).assertEqual("<blink>你好世界</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1300
     * @tc.name testBlink013
     * @tc.desc Verify blink() with emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀🎉".blink();
      expect(result).assertEqual("<blink>😀🎉</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1400
     * @tc.name testBlink014
     * @tc.desc Verify blink() with long string (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tagLen: number = "<blink></blink>".length;
      let r1: string = "x".repeat(1000);
      let r2: string = r1.blink();
      expect(r2.length).assertEqual(1000 + tagLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1500
     * @tc.name testBlink015
     * @tc.desc Verify blink() with long string (10000 chars) result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "b".repeat(10000);
      let result: string = longStr.blink();
      expect(result.length).assertEqual(10000 + 15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1600
     * @tc.name testBlink016
     * @tc.desc Verify blink() chained with length property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tagLen: number = "<blink></blink>".length;
      let r1: string = "test".blink();
      expect(r1.length).assertEqual(tagLen + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1700
     * @tc.name testBlink017
     * @tc.desc Verify blink() chained with toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "abc".blink();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<BLINK>ABC</BLINK>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1800
     * @tc.name testBlink018
     * @tc.desc Verify blink() chained with toLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "HI";
      let r1: string = text.blink();
      let result: string = r1.toLowerCase();
      expect(result).assertEqual("<blink>hi</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_1900
     * @tc.name testBlink019
     * @tc.desc Verify blink() called twice produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "abc".blink();
      let result: string = r1.blink();
      expect(result).assertEqual("<blink><blink>abc</blink></blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2000
     * @tc.name testBlink020
     * @tc.desc Verify blink() called three times produces triple nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "x".blink();
      let r2: string = r1.blink();
      let result: string = r2.blink();
      expect(result).assertEqual("<blink><blink><blink>x</blink></blink></blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2100
     * @tc.name testBlink021
     * @tc.desc Verify blink() chained with bold() produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".blink();
      let result: string = r1.bold();
      expect(result).assertEqual("<b><blink>ArkTS</blink></b>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2200
     * @tc.name testBlink022
     * @tc.desc Verify blink() chained with italics() produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".blink();
      let result: string = r1.italics();
      expect(result).assertEqual("<i><blink>ArkTS</blink></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2300
     * @tc.name testBlink023
     * @tc.desc Verify blink() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.blink();
      expect(result).assertEqual("<blink>a\rb</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2400
     * @tc.name testBlink024
     * @tc.desc Verify blink() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.blink();
      expect(result).assertEqual("<blink>😀</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2500
     * @tc.name testBlink025
     * @tc.desc Verify blink() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.blink();
      expect(result).assertEqual("<blink>ＦＷ</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2600
     * @tc.name testBlink026
     * @tc.desc Verify blink() result indexOf finds original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "target".blink();
      let pos: int = result.indexOf("target");
      expect(pos).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2700
     * @tc.name testBlink027
     * @tc.desc Verify blink() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.blink();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<blink>ArkTS</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2800
     * @tc.name testBlink028
     * @tc.desc Verify blink() with mixed multilingual characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello你好World世界".blink();
      expect(result).assertEqual("<blink>Hello你好World世界</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_2900
     * @tc.name testBlink029
     * @tc.desc Verify blink() with substring result wraps extracted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = "OpenHarmony";
      let part: string = source.substring(4, 11);
      let result: string = part.blink();
      expect(result).assertEqual("<blink>Harmony</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3000
     * @tc.name testBlink030
     * @tc.desc Verify blink() with mixed Unicode and ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Testテスト".blink();
      expect(result).assertEqual("<blink>Testテスト</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3100
     * @tc.name testBlink031
     * @tc.desc Verify blink() with Japanese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "こんにちは".blink();
      expect(result).assertEqual("<blink>こんにちは</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3200
     * @tc.name testBlink032
     * @tc.desc Verify blink() with Korean characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "안녕하세요".blink();
      expect(result).assertEqual("<blink>안녕하세요</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3300
     * @tc.name testBlink033
     * @tc.desc Verify blink() with RTL Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "مرحبا".blink();
      expect(result).assertEqual("<blink>مرحبا</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3400
     * @tc.name testBlink034
     * @tc.desc Verify blink() with surrogate pair Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "𐍈".blink();
      expect(result).assertEqual("<blink>𐍈</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3500
     * @tc.name testBlink035
     * @tc.desc Verify blink() chained with toUpperCase() via variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "hello";
      let r1: string = text.blink();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<BLINK>HELLO</BLINK>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3600
     * @tc.name testBlink036
     * @tc.desc Verify blink() called multiple times on a timer label returns consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "retry-30s";
      let r1: string = text.blink();
      let r2: string = text.blink();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3700
     * @tc.name testBlink037
     * @tc.desc Verify blink() with bell character \\a in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "beep\a".blink();
      expect(result).assertEqual("<blink>beep\a</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3800
     * @tc.name testBlink038
     * @tc.desc Verify blink() with vertical tab \\v in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\vb".blink();
      expect(result).assertEqual("<blink>a\vb</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_3900
     * @tc.name testBlink039
     * @tc.desc Verify blink() with form feed \\f in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\fb".blink();
      expect(result).assertEqual("<blink>a\fb</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4000
     * @tc.name testBlink040
     * @tc.desc Verify blink() with all-punctuation content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "!@#$%".blink();
      expect(result).assertEqual("<blink>!@#$%</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4100
     * @tc.name testBlink041
     * @tc.desc Verify blink() with only a less-than character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<".blink();
      expect(result).assertEqual("<blink><</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4200
     * @tc.name testBlink042
     * @tc.desc Verify blink() with half-width katakana characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".blink();
      expect(result).assertEqual("<blink>ﾊﾝｶｸ</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4300
     * @tc.name testBlink043
     * @tc.desc Verify blink() with bare ampersand preserved without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a&b".blink();
      expect(result).assertEqual("<blink>a&b</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4400
     * @tc.name testBlink044
     * @tc.desc Verify blink() with </blink> in caller produces malformed close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "x</blink>y".blink();
      expect(result).assertEqual("<blink>x</blink>y</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4500
     * @tc.name testBlink045
     * @tc.desc Verify blink() with single right-angle-bracket as caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ">".blink();
      expect(result).assertEqual("<blink>></blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4600
     * @tc.name testBlink046
     * @tc.desc Verify blink() with ISO 8859-1 Latin accented content (café)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".blink();
      expect(result).assertEqual("<blink>café</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4700
     * @tc.name testBlink047
     * @tc.desc Verify blink() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".blink();
      expect(result).assertEqual("<blink>中文测试</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4800
     * @tc.name testBlink048
     * @tc.desc Verify blink() does NOT modify the original content string (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.blink();
      expect(original).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_4900
     * @tc.name testBlink049
     * @tc.desc Verify blink() inner content between tags matches original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "core".blink();
      let inner: string = result.substring(7, result.length - 8);
      expect(inner).assertEqual("core");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5000
     * @tc.name testBlink050
     * @tc.desc Verify blink() with dynamic content variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Dynamic";
      let result: string = text.blink();
      expect(result).assertEqual("<blink>Dynamic</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5100
     * @tc.name testBlink051
     * @tc.desc Verify blink() with NUL character \\0 in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".blink();
      let starts: boolean = result.startsWith("<blink>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5200
     * @tc.name testBlink052
     * @tc.desc Verify blink() with backslash character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\\b".blink();
      expect(result).assertEqual("<blink>a\\b</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5300
     * @tc.name testBlink053
     * @tc.desc Verify blink() with only whitespace content preserves spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "   ".blink();
      expect(result).assertEqual("<blink>   </blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5400
     * @tc.name testBlink054
     * @tc.desc Verify blink() chained with replace() strips tags to recover original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".blink();
      let result: string = r1.replace("<blink>", "").replace("</blink>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5500
     * @tc.name testBlink055
     * @tc.desc Verify blink() with tilde character in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "~home".blink();
      expect(result).assertEqual("<blink>~home</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5600
     * @tc.name testBlink056
     * @tc.desc Verify blink() with path-like content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "/usr/local/bin".blink();
      expect(result).assertEqual("<blink>/usr/local/bin</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5700
     * @tc.name testBlink057
     * @tc.desc Verify blink() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".blink();
      expect(result).assertEqual("<blink>Hi 世界 😀</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5800
     * @tc.name testBlink058
     * @tc.desc Verify blink() handles GBK-to-UTF8 garbled text spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("æµè¯");
      let result: string = source.blink();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_5900
     * @tc.name testBlink059
     * @tc.desc Verify blink() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.blink();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_6000
     * @tc.name testBlink060
     * @tc.desc Verify Blink handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.blink();
      expect(result).assertEqual("<blink>" + source.toString() + "</blink>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_BLINK_6100
     * @tc.name testBlink061
     * @tc.desc Verify Blink handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlink061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.blink();
      expect(result).assertEqual("<blink>" + source.toString() + "</blink>");
    });
  });
}
