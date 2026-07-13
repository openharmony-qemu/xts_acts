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

export default function StringFontsizeTest(): void {
  describe('StringFontsizeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0100
     * @tc.name testFontsize001
     * @tc.desc Verify fontsize() with required argument returns <font size> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize(3);
      expect(result).assertEqual('<font size="3">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0200
     * @tc.name testFontsize002
     * @tc.desc Verify fontsize() with plus-prefixed string size preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize("+2");
      expect(result).assertEqual('<font size="+2">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0300
     * @tc.name testFontsize003
     * @tc.desc Verify fontsize() with standard size values 1-7 (number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize(1)).assertEqual('<font size="1">ArkTS</font>');
      expect(text.fontsize(4)).assertEqual('<font size="4">ArkTS</font>');
      expect(text.fontsize(7)).assertEqual('<font size="7">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0400
     * @tc.name testFontsize004
     * @tc.desc Verify fontsize() with size 0 (number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize(0);
      expect(result).assertEqual('<font size="0">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0500
     * @tc.name testFontsize005
     * @tc.desc Verify fontsize() with negative number size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize(-1);
      expect(result).assertEqual('<font size="-1">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0600
     * @tc.name testFontsize006
     * @tc.desc Verify fontsize() with out-of-range size values 8 and 100 (number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize(8)).assertEqual('<font size="8">ArkTS</font>');
      expect(text.fontsize(100)).assertEqual('<font size="100">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0700
     * @tc.name testFontsize007
     * @tc.desc Verify fontsize() with float number size 3.14 and 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize("3.14")).assertEqual('<font size="3.14">ArkTS</font>');
      expect(text.fontsize("0.5")).assertEqual('<font size="0.5">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0800
     * @tc.name testFontsize008
     * @tc.desc Verify fontsize() with +0 and -0 (both produce size 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize(0)).assertEqual('<font size="0">ArkTS</font>');
      expect(text.fontsize(-0)).assertEqual('<font size="0">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_0900
     * @tc.name testFontsize009
     * @tc.desc Verify fontsize() with string number "1" "3" "7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize("1")).assertEqual('<font size="1">ArkTS</font>');
      expect(text.fontsize("3")).assertEqual('<font size="3">ArkTS</font>');
      expect(text.fontsize("7")).assertEqual('<font size="7">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1000
     * @tc.name testFontsize010
     * @tc.desc Verify fontsize() with string "0" "8" "100" (out of HTML standard range)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize("0")).assertEqual('<font size="0">ArkTS</font>');
      expect(text.fontsize("8")).assertEqual('<font size="8">ArkTS</font>');
      expect(text.fontsize("100")).assertEqual('<font size="100">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1100
     * @tc.name testFontsize011
     * @tc.desc Verify fontsize() with negative string number "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize("-1")).assertEqual('<font size="-1">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1200
     * @tc.name testFontsize012
     * @tc.desc Verify fontsize() with decimal string "3.14"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize("3.14")).assertEqual('<font size="3.14">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1300
     * @tc.name testFontsize013
     * @tc.desc Verify fontsize() encodes double-quote event-handler injection in size to &quot;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize("5\" onclick=\"alert(1)\"");
      expect(result).assertEqual('<font size="5&quot; onclick=&quot;alert(1)&quot;">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1400
     * @tc.name testFontsize014
     * @tc.desc Verify fontsize() with empty string size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize("");
      expect(result).assertEqual('<font size="">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1500
     * @tc.name testFontsize015
     * @tc.desc Verify fontsize() with whitespace size strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      expect(text.fontsize(" ")).assertEqual('<font size=" ">ArkTS</font>');
      expect(text.fontsize("\t")).assertEqual('<font size="\t">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1600
     * @tc.name testFontsize016
     * @tc.desc Verify fontsize() encodes tag-closing script injection in size to &quot;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize('5"><script>alert(1)</script>');
      expect(result).assertEqual('<font size="5&quot;><script>alert(1)</script>">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1700
     * @tc.name testFontsize017
     * @tc.desc Verify fontsize() with Unicode string "中文"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize("中文");
      expect(result).assertEqual('<font size="中文">ArkTS</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1800
     * @tc.name testFontsize018
     * @tc.desc Verify fontsize() number 3 and string "3" produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let r1: string = text.fontsize(3);
      let r2: string = text.fontsize("3");
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_1900
     * @tc.name testFontsize019
     * @tc.desc Verify fontsize() result starts with <font size="N"> and ends with </font>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "test";
      let result: string = text.fontsize(5);
      expect(result.startsWith('<font size="5">')).assertTrue();
      expect(result.endsWith('</font>')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2000
     * @tc.name testFontsize020
     * @tc.desc Verify fontsize(3) wraps body label content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "body-copy";
      let result: string = text.fontsize(3);
      expect(result).assertEqual('<font size="3">body-copy</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2100
     * @tc.name testFontsize021
     * @tc.desc Verify fontsize() preserves heading label content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Section 2";
      let result: string = text.fontsize(2);
      expect(result).assertEqual('<font size="2">Section 2</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2200
     * @tc.name testFontsize022
     * @tc.desc Verify fontsize() preserves Unicode and emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "中文测试テスト";
      let result: string = text.fontsize(3);
      expect(result).assertEqual('<font size="3">中文测试テスト</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2300
     * @tc.name testFontsize023
     * @tc.desc Verify fontsize() with emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀🎉🔥";
      let result: string = text.fontsize(5);
      expect(result).assertEqual('<font size="5">😀🎉🔥</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2400
     * @tc.name testFontsize024
     * @tc.desc Verify fontsize() with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "";
      let result: string = text.fontsize(3);
      expect(result).assertEqual('<font size="3"></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2500
     * @tc.name testFontsize025
     * @tc.desc Verify fontsize() preserves HTML tags in original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "<b>bold</b>";
      let result: string = text.fontsize(3);
      expect(result).assertEqual('<font size="3"><b>bold</b></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2600
     * @tc.name testFontsize026
     * @tc.desc Verify fontsize() with negative float number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "test";
      let result: string = text.fontsize(-5);
      expect(result).assertEqual('<font size="-5">test</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2700
     * @tc.name testFontsize027
     * @tc.desc Verify fontsize() chained with itself produces nested tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize(3).fontsize(5);
      expect(result).assertEqual('<font size="5"><font size="3">ArkTS</font></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2800
     * @tc.name testFontsize028
     * @tc.desc Verify fontsize() chained with bold()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.fontsize(3).bold();
      expect(result).assertEqual('<b><font size="3">ArkTS</font></b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_2900
     * @tc.name testFontsize029
     * @tc.desc Verify fontsize() with very large number (999999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "test";
      let result: string = text.fontsize(999999);
      expect(result).assertEqual('<font size="999999">test</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3000
     * @tc.name testFontsize030
     * @tc.desc Verify fontsize() with long string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let longSize: string = "a".repeat(10000);
      let result: string = text.fontsize(longSize);
      expect(result.startsWith('<font size="')).assertTrue();
      expect(result.endsWith('">ArkTS</font>')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3100
     * @tc.name testFontsize031
     * @tc.desc Verify fontsize() with emoji in text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "😀";
      let result: string = text.fontsize("3");
      expect(result).assertEqual('<font size="3">😀</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3200
     * @tc.name testFontsize032
     * @tc.desc Verify fontsize() result indexOf finds token text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "badge:new";
      let result: string = text.fontsize(5);
      let pos: int = result.indexOf("badge:new");
      expect(pos).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3300
     * @tc.name testFontsize033
     * @tc.desc Verify fontsize() with full-width characters in text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ＦＷ";
      let result: string = text.fontsize(3);
      expect(result).assertEqual('<font size="3">ＦＷ</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3400
     * @tc.name testFontsize034
     * @tc.desc Verify fontsize() with leading-zero numeric string preserves zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "test";
      let result: string = text.fontsize("007");
      expect(result).assertEqual('<font size="007">test</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3500
     * @tc.name testFontsize035
     * @tc.desc Verify fontsize() with int 0 and string "0" produce equivalent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "x";
      let r1: string = text.fontsize(0);
      let r2: string = text.fontsize("0");
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3600
     * @tc.name testFontsize036
     * @tc.desc Verify fontsize() with ISO 8859-1 Latin accented content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café".fontsize(3);
      expect(result).assertEqual('<font size="3">café</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3700
     * @tc.name testFontsize037
     * @tc.desc Verify fontsize() with half-width katakana content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".fontsize(1);
      expect(result).assertEqual('<font size="1">ﾊﾝｶｸ</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3800
     * @tc.name testFontsize038
     * @tc.desc Verify fontsize() with GBK Chinese text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试".fontsize(5);
      expect(result).assertEqual('<font size="5">中文测试</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_3900
     * @tc.name testFontsize039
     * @tc.desc Verify fontsize() does NOT modify the original content string (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "ArkTS";
      let result: string = original.fontsize(4);
      expect(original).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4000
     * @tc.name testFontsize040
     * @tc.desc Verify fontsize() with dynamic size and content variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Dynamic";
      let size: int = 6;
      let result: string = text.fontsize(size);
      expect(result).assertEqual('<font size="6">Dynamic</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4100
     * @tc.name testFontsize041
     * @tc.desc Verify fontsize() chained with replace() strips tags to recover original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "data".fontsize(3);
      let result: string = r1.replace('<font size="3">', "").replace("</font>", "");
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4200
     * @tc.name testFontsize042
     * @tc.desc Verify fontsize() preserves NUL byte inside size parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".fontsize("5\0px");
      expect(result.charCodeAt(13)).assertEqual(0);
      expect(result).assertEqual('<font size="5\0px">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4300
     * @tc.name testFontsize043
     * @tc.desc Verify fontsize() with mixed ASCII + CJK + Emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hi 世界 😀".fontsize(4);
      expect(result).assertEqual('<font size="4">Hi 世界 😀</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4400
     * @tc.name testFontsize044
     * @tc.desc Verify fontsize() handles illegal UTF-8 single-byte spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4");
      let result: string = source.fontsize("3");
      expect(result.includes(source.toString())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4500
     * @tc.name testFontsize045
     * @tc.desc Verify Fontsize handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.fontsize(3);
      expect(result).assertEqual("<font size=\"3\">" + source.toString() + "</font>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE_4600
     * @tc.name testFontsize046
     * @tc.desc Verify Fontsize handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFontsize046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.fontsize(4);
      expect(result).assertEqual("<font size=\"4\">" + source.toString() + "</font>");
    });
  });
}
