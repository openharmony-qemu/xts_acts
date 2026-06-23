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

export default function StringStrikeTest(): void {
  describe('StringStrikeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0100
     * @tc.name testStrike001
     * @tc.desc Verify strike() with no arguments returns <strike> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".strike();
      expect(result).assertEqual("<strike>ArkTS</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0200
     * @tc.name testStrike002
     * @tc.desc Verify strike() on trim result wraps trimmed content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trimmed: string = "  strike  ".trim();
      let result: string = trimmed.strike();
      expect(result).assertEqual("<strike>strike</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0300
     * @tc.name testStrike003
     * @tc.desc Verify strike() result starts with <strike> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".strike();
      let starts: boolean = r1.startsWith("<strike>");
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0400
     * @tc.name testStrike004
     * @tc.desc Verify strike() result ends with </strike> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".strike();
      let ends: boolean = r1.endsWith("</strike>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0500
     * @tc.name testStrike005
     * @tc.desc Verify strike() wraps a deprecated API name completely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "oldApi".strike();
      expect(result).assertEqual("<strike>oldApi</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0600
     * @tc.name testStrike006
     * @tc.desc Verify strike() preserves original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "OpenHarmony".strike();
      let inc: boolean = r1.includes("OpenHarmony");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0700
     * @tc.name testStrike007
     * @tc.desc Verify strike() with spaces and numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "Hello World".strike();
      expect(r1).assertEqual("<strike>Hello World</strike>");
      let r2: string = "abc123".strike();
      expect(r2).assertEqual("<strike>abc123</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0800
     * @tc.name testStrike008
     * @tc.desc Verify strike() with HTML special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "<div>".strike();
      expect(r1).assertEqual("<strike><div></strike>");
      let r2: string = "a&b".strike();
      expect(r2).assertEqual("<strike>a&b</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_0900
     * @tc.name testStrike009
     * @tc.desc Verify strike() preserves a removal marker token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "-removed-".strike();
      expect(result).assertEqual("<strike>-removed-</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1000
     * @tc.name testStrike010
     * @tc.desc Verify strike() preserves status token punctuation literally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "old_value".strike();
      expect(result).assertEqual("<strike>old_value</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1100
     * @tc.name testStrike011
     * @tc.desc Verify strike() result length correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tagLen: number = "<strike></strike>".length;
      let r1: string = "ab".strike();
      expect(r1.length).assertEqual("ab".length + tagLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1200
     * @tc.name testStrike012
     * @tc.desc Verify strike() with empty string returns <strike></strike>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".strike();
      expect(result).assertEqual("<strike></strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1300
     * @tc.name testStrike013
     * @tc.desc Verify strike() with Chinese and emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "中文测试".strike();
      expect(r1).assertEqual("<strike>中文测试</strike>");
      let r2: string = "😀🎉".strike();
      expect(r2).assertEqual("<strike>😀🎉</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1400
     * @tc.name testStrike014
     * @tc.desc Verify strike() with mixed Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello世界🌍".strike();
      expect(result).assertEqual("<strike>Hello世界🌍</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1500
     * @tc.name testStrike015
     * @tc.desc Verify strike() with long string (10000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let result: string = longStr.strike();
      let starts: boolean = result.startsWith("<strike>");
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</strike>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1600
     * @tc.name testStrike016
     * @tc.desc Verify strike() chained with toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "abc".strike();
      let result: string = r1.toUpperCase();
      expect(result).assertEqual("<STRIKE>ABC</STRIKE>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1700
     * @tc.name testStrike017
     * @tc.desc Verify strike() chained with indexOf to find substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefixLen: number = "<strike>".length;
      let r1: string = "hello".strike();
      expect(r1.indexOf("hello")).assertEqual(prefixLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1800
     * @tc.name testStrike018
     * @tc.desc Verify strike() chained with replace to modify content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "abc".strike();
      let result: string = r1.replace("abc", "xyz");
      expect(result).assertEqual("<strike>xyz</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_1900
     * @tc.name testStrike019
     * @tc.desc Verify strike() called twice produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "abc".strike();
      let result: string = r1.strike();
      expect(result).assertEqual("<strike><strike>abc</strike></strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2000
     * @tc.name testStrike020
     * @tc.desc Verify strike() chained with bold() and italics()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "ArkTS".strike();
      let r2: string = r1.bold();
      expect(r2).assertEqual("<b><strike>ArkTS</strike></b>");
      let r3: string = "ArkTS".strike();
      let r4: string = r3.italics();
      expect(r4).assertEqual("<i><strike>ArkTS</strike></i>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2100
     * @tc.name testStrike021
     * @tc.desc Verify bold() chained with strike() nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".bold().strike();
      expect(result).assertEqual("<strike><b>ArkTS</b></strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2200
     * @tc.name testStrike022
     * @tc.desc Verify strike() called via variable and const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Variable";
      expect(text.strike()).assertEqual("<strike>Variable</strike>");
      const text2: string = "Constant";
      expect(text2.strike()).assertEqual("<strike>Constant</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2300
     * @tc.name testStrike023
     * @tc.desc Verify strike() on concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ("Hello" + " World").strike();
      expect(result).assertEqual("<strike>Hello World</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2400
     * @tc.name testStrike024
     * @tc.desc Verify strike() multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ﾊﾝｶｸ";
      expect(text.strike()).assertEqual("<strike>ﾊﾝｶｸ</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2500
     * @tc.name testStrike025
     * @tc.desc Verify strike() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.strike();
      expect(original).assertEqual("ArkTS");
      expect(result).assertEqual("<strike>ArkTS</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2600
     * @tc.name testStrike026
     * @tc.desc Verify strike() with carriage return \\r in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "a\rb";
      let result: string = text.strike();
      expect(result).assertEqual("<strike>a\rb</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2700
     * @tc.name testStrike027
     * @tc.desc Verify strike() with emoji in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.strike();
      expect(result).assertEqual("<strike>😀</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2800
     * @tc.name testStrike028
     * @tc.desc Verify strike() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.strike();
      expect(result).assertEqual("<strike>ＦＷ</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_2900
     * @tc.name testStrike029
     * @tc.desc Verify strike() result indexOf finds an original issue id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ISSUE-1024".strike();
      let pos: int = result.indexOf("ISSUE-1024");
      expect(pos).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3000
     * @tc.name testStrike030
     * @tc.desc Verify strike() with vertical tab  in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ab".strike();
      expect(result).assertEqual("<strike>ab</strike>");
      expect(result.charCodeAt(9)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3100
     * @tc.name testStrike031
     * @tc.desc Verify strike() with form feed  in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ab".strike();
      expect(result).assertEqual("<strike>ab</strike>");
      expect(result.charCodeAt(9)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3200
     * @tc.name testStrike032
     * @tc.desc Verify strike() with all-punctuation content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "!@#$%".strike();
      expect(result).assertEqual("<strike>!@#$%</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3300
     * @tc.name testStrike033
     * @tc.desc Verify strike() with only a less-than character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<".strike();
      expect(result).assertEqual("<strike><</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3400
     * @tc.name testStrike034
     * @tc.desc Verify strike() with null byte in string preserves it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\0b".strike();
      expect(result).assertEqual("<strike>a\0b</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3500
     * @tc.name testStrike035
     * @tc.desc Verify strike() handles mixed text with literal Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("test \\u4e2d\\u6587");
      let result: string = source.strike();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3600
     * @tc.name testStrike036
     * @tc.desc Verify strike() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.strike();
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3700
     * @tc.name testStrike037
     * @tc.desc Verify Strike handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.strike();
      expect(result).assertEqual("<strike>" + source.toString() + "</strike>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE_3800
     * @tc.name testStrike038
     * @tc.desc Verify Strike handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStrike038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.strike();
      expect(result).assertEqual("<strike>" + source.toString() + "</strike>");
    });
  });
}
