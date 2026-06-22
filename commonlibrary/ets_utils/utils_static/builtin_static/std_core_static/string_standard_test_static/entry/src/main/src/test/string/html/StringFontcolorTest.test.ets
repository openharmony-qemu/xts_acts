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

export default function StringFontcolorTest(): void {
  describe('StringFontcolorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0100
     * @tc.name testFontcolor001
     * @tc.desc Verify fontcolor() with 1 argument returns <font color> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".fontcolor("red");
      expect(result).assertEqual('<font color="red">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0200
     * @tc.name testFontcolor002
     * @tc.desc Verify fontcolor() with slash color value preserves it as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("red/blue");
      expect(result).assertEqual('<font color="red/blue">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0300
     * @tc.name testFontcolor003
     * @tc.desc Verify fontcolor() with colon color value preserves it as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("theme:primary");
      expect(result).assertEqual('<font color="theme:primary">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0400
     * @tc.name testFontcolor004
     * @tc.desc Verify fontcolor() with named color "red"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("red");
      expect(result).assertEqual('<font color="red">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0500
     * @tc.name testFontcolor005
     * @tc.desc Verify fontcolor() with named color "blue"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("blue");
      expect(result).assertEqual('<font color="blue">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0600
     * @tc.name testFontcolor006
     * @tc.desc Verify fontcolor() with named color "green"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("green");
      expect(result).assertEqual('<font color="green">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0700
     * @tc.name testFontcolor007
     * @tc.desc Verify fontcolor() with mixed-case color name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("DarkBlue");
      expect(result).assertEqual('<font color="DarkBlue">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0800
     * @tc.name testFontcolor008
     * @tc.desc Verify fontcolor() with non-existent color name still generates tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("notacolor");
      expect(result).assertEqual('<font color="notacolor">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_0900
     * @tc.name testFontcolor009
     * @tc.desc Verify fontcolor() with standard 6-digit hex color #FF0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("#FF0000");
      expect(result).assertEqual('<font color="#FF0000">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1000
     * @tc.name testFontcolor010
     * @tc.desc Verify fontcolor() with lowercase 6-digit hex color #ff0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("#ff0000");
      expect(result).assertEqual('<font color="#ff0000">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1100
     * @tc.name testFontcolor011
     * @tc.desc Verify fontcolor() with 3-digit shorthand hex color #F00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("#F00");
      expect(result).assertEqual('<font color="#F00">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1200
     * @tc.name testFontcolor012
     * @tc.desc Verify fontcolor() with 8-digit hex color with alpha #FF000080
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("#FF000080");
      expect(result).assertEqual('<font color="#FF000080">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1300
     * @tc.name testFontcolor013
     * @tc.desc Verify fontcolor() with standard rgb() format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("rgb(255,0,0)");
      expect(result).assertEqual('<font color="rgb(255,0,0)">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1400
     * @tc.name testFontcolor014
     * @tc.desc Verify fontcolor() with rgba() format with alpha
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("rgba(255,0,0,0.5)");
      expect(result).assertEqual('<font color="rgba(255,0,0,0.5)">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1500
     * @tc.name testFontcolor015
     * @tc.desc Verify fontcolor() with rgb(0,0,0) boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("rgb(0,0,0)");
      expect(result).assertEqual('<font color="rgb(0,0,0)">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1600
     * @tc.name testFontcolor016
     * @tc.desc Verify fontcolor() with rgb(255,255,255) boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("rgb(255,255,255)");
      expect(result).assertEqual('<font color="rgb(255,255,255)">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1700
     * @tc.name testFontcolor017
     * @tc.desc Verify fontcolor() with empty string color
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("");
      expect(result).assertEqual('<font color="">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1800
     * @tc.name testFontcolor018
     * @tc.desc Verify fontcolor() with whitespace-only color string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("   ");
      expect(result).assertEqual('<font color="   ">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_1900
     * @tc.name testFontcolor019
     * @tc.desc Verify fontcolor() preserves tag-closing script injection in color without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor('red"><script>alert(1)</script>');
      expect(result).assertEqual('<font color="red"><script>alert(1)</script>">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2000
     * @tc.name testFontcolor020
     * @tc.desc Verify fontcolor() result starts with <font color= and ends with </font>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello".fontcolor("red");
      expect(result.startsWith('<font color="red">')).assertTrue();
      let ends: boolean = result.endsWith("</font>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2100
     * @tc.name testFontcolor021
     * @tc.desc Verify fontcolor("red") returns <font color="red">hello</font>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello".fontcolor("red");
      expect(result).assertEqual('<font color="red">hello</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2200
     * @tc.name testFontcolor022
     * @tc.desc Verify fontcolor() preserves color value as-is without conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("#ABCDEF");
      expect(result).assertEqual('<font color="#ABCDEF">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2300
     * @tc.name testFontcolor023
     * @tc.desc Verify fontcolor() preserves status message content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Warning: disk full".fontcolor("red");
      expect(result).assertEqual('<font color="red">Warning: disk full</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2400
     * @tc.name testFontcolor024
     * @tc.desc Verify fontcolor() preserves HTML tags in original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "<b>bold</b>".fontcolor("red");
      expect(result).assertEqual('<font color="red"><b>bold</b></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2500
     * @tc.name testFontcolor025
     * @tc.desc Verify fontcolor() with Chinese original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".fontcolor("red");
      expect(result).assertEqual('<font color="red">中文测试</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2600
     * @tc.name testFontcolor026
     * @tc.desc Verify fontcolor() with emoji original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀🎉".fontcolor("red");
      expect(result).assertEqual('<font color="red">😀🎉</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2700
     * @tc.name testFontcolor027
     * @tc.desc Verify fontcolor() with empty string call returns font tag with empty content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".fontcolor("red");
      expect(result).assertEqual('<font color="red"></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2800
     * @tc.name testFontcolor028
     * @tc.desc Verify fontcolor() with long color string (10000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longColor: string = "a".repeat(10000);
      let result: string = "text".fontcolor(longColor);
      expect(result.startsWith('<font color="')).assertTrue();
      let ends: boolean = result.endsWith("</font>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_2900
     * @tc.name testFontcolor029
     * @tc.desc Verify fontcolor() with long original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let result: string = longStr.fontcolor("red");
      expect(result.startsWith('<font color="red">')).assertTrue();
      let ends: boolean = result.endsWith("</font>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3000
     * @tc.name testFontcolor030
     * @tc.desc Verify fontcolor() with carriage return \\r in color parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("re\r");
      let starts: boolean = result.startsWith('<font color="');
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3100
     * @tc.name testFontcolor031
     * @tc.desc Verify fontcolor() with emoji in text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀".fontcolor("red");
      expect(result).assertEqual('<font color="red">😀</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3200
     * @tc.name testFontcolor032
     * @tc.desc Verify fontcolor() result indexOf finds error code text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ERR_500".fontcolor("blue");
      let pos: int = result.indexOf("ERR_500");
      expect(pos).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3300
     * @tc.name testFontcolor033
     * @tc.desc Verify fontcolor() with CSS named color "cyan" on status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "status:ok".fontcolor("cyan");
      expect(result).assertEqual('<font color="cyan">status:ok</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3400
     * @tc.name testFontcolor034
     * @tc.desc Verify fontcolor() with hsl() format color value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("hsl(120,100%,50%)");
      expect(result).assertEqual('<font color="hsl(120,100%,50%)">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3500
     * @tc.name testFontcolor035
     * @tc.desc Verify fontcolor() preserves double-quote event-handler injection in color without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("red\" onmouseover=\"alert(1)\"");
      expect(result).assertEqual('<font color="red" onmouseover="alert(1)"">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3600
     * @tc.name testFontcolor036
     * @tc.desc Verify fontcolor() preserves NUL byte inside color parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("red\0blue");
      expect(result.charCodeAt(16)).assertEqual(0);
      expect(result).assertEqual('<font color="red\0blue">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3700
     * @tc.name testFontcolor037
     * @tc.desc Verify fontcolor() with single character color "r"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("r");
      expect(result).assertEqual('<font color="r">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3800
     * @tc.name testFontcolor038
     * @tc.desc Verify fontcolor() with bare hash as color value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontcolor("#");
      expect(result).assertEqual('<font color="#">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_3900
     * @tc.name testFontcolor039
     * @tc.desc Verify fontcolor() handles isolated low surrogate U+DC04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uDC04");
      let result: string = source.fontcolor("red");
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_4000
     * @tc.name testFontcolor040
     * @tc.desc Verify Fontcolor handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.fontcolor("red");
      expect(result).assertEqual("<font color=\"red\">" + source.toString() + "</font>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR_4100
     * @tc.name testFontcolor041
     * @tc.desc Verify Fontcolor handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontcolor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.fontcolor("blue");
      expect(result).assertEqual("<font color=\"blue\">" + source.toString() + "</font>");
    });
  });
}
