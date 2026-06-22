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

export default function StringAnchorTest(): void {
  describe('StringAnchorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0010
     * @tc.name testAnchor001
     * @tc.desc Verify anchor() with 1 string argument returns <a name> wrapped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("top");
      expect(result).assertEqual('<a name="top">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0020
     * @tc.name testAnchor002
     * @tc.desc Verify anchor() with percent sign in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("20%25");
      expect(result).assertEqual('<a name="20%25">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0030
     * @tc.name testAnchor003
     * @tc.desc Verify anchor() with at-sign in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("@mention");
      expect(result).assertEqual('<a name="@mention">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0040
     * @tc.name testAnchor004
     * @tc.desc Verify anchor() with empty string name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("");
      expect(result).assertEqual('<a name="">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0050
     * @tc.name testAnchor005
     * @tc.desc Verify anchor() with all-spaces name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("   ");
      expect(result).assertEqual('<a name="   ">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0060
     * @tc.name testAnchor006
     * @tc.desc Verify anchor() with tab character in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("\t");
      expect(result).assertEqual('<a name="\t">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0070
     * @tc.name testAnchor007
     * @tc.desc Verify anchor() with newline character in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("\n");
      expect(result).assertEqual('<a name="\n">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0080
     * @tc.name testAnchor008
     * @tc.desc Verify anchor() with zero-width space in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("​");
      expect(result).assertEqual('<a name="​">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0090
     * @tc.name testAnchor009
     * @tc.desc Verify anchor() with special symbols in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("!@#$%^&*()");

      expect(result).assertEqual('<a name="!@#$%^&*()">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0100
     * @tc.name testAnchor010
     * @tc.desc Verify anchor() with slash-containing name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("a/b\\c");

      expect(result).assertEqual('<a name="a/b\\c">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0110
     * @tc.name testAnchor011
     * @tc.desc Verify anchor() with XSS script tag string as name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("<script>alert(1)</script>");

      expect(result).assertEqual('<a name="<script>alert(1)</script>">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0120
     * @tc.name testAnchor012
     * @tc.desc Verify anchor() with HTML img tag injection as name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("<img src=x onerror=alert(1)>");

      expect(result).assertEqual('<a name="<img src=x onerror=alert(1)>">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0130
     * @tc.name testAnchor013
     * @tc.desc Verify anchor() with double quote in name (attribute value conflict)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("test\"quote");

      expect(result).assertEqual('<a name="test\"quote">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0140
     * @tc.name testAnchor014
     * @tc.desc Verify anchor() with single quote in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("test'quote");

      expect(result).assertEqual('<a name="test\'quote">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0150
     * @tc.name testAnchor015
     * @tc.desc Verify anchor() with angle brackets in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("<banner>");

      expect(result).assertEqual('<a name="<banner>">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0160
     * @tc.name testAnchor016
     * @tc.desc Verify anchor() return value format with hyphenated name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Header";
      let result: string = text.anchor("chapter-1");

      expect(result).assertEqual('<a name="chapter-1">Header</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0170
     * @tc.name testAnchor017
     * @tc.desc Verify anchor() wraps documentation section id without changing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Overview";
      let result: string = text.anchor("docs-overview");
      expect(result).assertEqual('<a name="docs-overview">Overview</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0180
     * @tc.name testAnchor018
     * @tc.desc Verify anchor() preserves release note title content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Release Notes";
      let result: string = text.anchor("release-notes");
      expect(result).assertEqual('<a name="release-notes">Release Notes</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0190
     * @tc.name testAnchor019
     * @tc.desc Verify anchor() preserves HTML special chars in original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "<div>test</div>";
      let result: string = text.anchor("pos");
      expect(result).assertEqual('<a name="pos"><div>test</div></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0200
     * @tc.name testAnchor020
     * @tc.desc Verify anchor() with empty string preserves empty content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "";
      let result: string = text.anchor("pos");
      expect(result).assertEqual('<a name="pos"></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0210
     * @tc.name testAnchor021
     * @tc.desc Verify anchor() multiple calls return different new strings, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result1: string = text.anchor("top");
      let result2: string = text.anchor("bottom");
      expect(text).assertEqual("ArkTS");
      expect(result1).assertEqual('<a name="top">ArkTS</a>');
      expect(result2).assertEqual('<a name="bottom">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0220
     * @tc.name testAnchor022
     * @tc.desc Verify anchor() chained with toUpperCase() transforms entire result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("top").toUpperCase();
      expect(result).assertEqual('<A NAME="TOP">ARKTS</A>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0230
     * @tc.name testAnchor023
     * @tc.desc Verify anchor() called twice produces nested <a> tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("top").anchor("bottom");
      expect(result).assertEqual('<a name="bottom"><a name="top">ArkTS</a></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0240
     * @tc.name testAnchor024
     * @tc.desc Verify anchor() with carriage return \\r in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let name: string = "top\rbottom";
      let result: string = text.anchor(name);
      expect(result).assertEqual('<a name="top\rbottom">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0250
     * @tc.name testAnchor025
     * @tc.desc Verify anchor() with backslash in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("a\\b");

      expect(result).assertEqual('<a name="a\\b">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0260
     * @tc.name testAnchor026
     * @tc.desc Verify anchor() with null character \\0 in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("a\0b");
      expect(result.length).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0270
     * @tc.name testAnchor027
     * @tc.desc Verify anchor() with isolated surrogate pair \\udc04 in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("\udc04");

      expect(result).assertEqual('<a name="\udc04">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0280
     * @tc.name testAnchor028
     * @tc.desc Verify anchor() with ampersand in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("a&b");

      expect(result).assertEqual('<a name="a&b">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0290
     * @tc.name testAnchor029
     * @tc.desc Verify anchor() with HTML entity in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("&lt;script&gt;");

      expect(result).assertEqual('<a name="&lt;script&gt;">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0300
     * @tc.name testAnchor030
     * @tc.desc Verify anchor() with SQL injection string in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("'; DROP TABLE users;--");

      expect(result).assertEqual('<a name="\'; DROP TABLE users;--">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0310
     * @tc.name testAnchor031
     * @tc.desc Verify anchor() with backtick in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("say`hello`");

      expect(result).assertEqual('<a name="say`hello`">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0320
     * @tc.name testAnchor032
     * @tc.desc Verify anchor() result indexOf finds name substring position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("mySection");
      let pos: int = result.indexOf("mySection");
      expect(pos).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0330
     * @tc.name testAnchor033
     * @tc.desc Verify anchor() result includes original text substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "HelloWorld";
      let result: string = text.anchor("pos");
      let inc: boolean = result.includes("HelloWorld");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0340
     * @tc.name testAnchor034
     * @tc.desc Verify anchor() with bold() chain produces correct nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.bold().anchor("top");
      expect(result).assertEqual('<a name="top"><b>ArkTS</b></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0350
     * @tc.name testAnchor035
     * @tc.desc Verify anchor() with 65535-character name (database varchar limit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let longName: string = "b".repeat(65535);
      let result: string = text.anchor(longName);
      let starts: boolean = result.startsWith('<a name="');
      expect(starts).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0360
     * @tc.name testAnchor036
     * @tc.desc Verify anchor() with vertical tab \\v in name parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("top\vsection");

      expect(result).assertEqual('<a name="top\vsection">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0370
     * @tc.name testAnchor037
     * @tc.desc Verify anchor() with form feed \\f in name parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("top\fsection");

      expect(result).assertEqual('<a name="top\fsection">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0380
     * @tc.name testAnchor038
     * @tc.desc Verify anchor() with replacement character U+FFFD in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("sec�tion");

      expect(result).assertEqual('<a name="sec�tion">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0390
     * @tc.name testAnchor039
     * @tc.desc Verify anchor() preserves double-quote onclick injection in name without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "safe";
      let name: string = "a\" onclick=\"alert(1)\"";
      let result: string = text.anchor(name);
      expect(result).assertEqual('<a name="a" onclick="alert(1)"">safe</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0400
     * @tc.name testAnchor040
     * @tc.desc Verify anchor() with equal sign in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("a=b");

      expect(result).assertEqual('<a name="a=b">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0410
     * @tc.name testAnchor041
     * @tc.desc Verify anchor() with pure number as text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "007";
      let result: string = text.anchor("top");
      expect(result).assertEqual('<a name="top">007</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0420
     * @tc.name testAnchor042
     * @tc.desc Verify anchor() with bell character \\a in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("beep\a");

      expect(result).assertEqual('<a name="beep\a">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0430
     * @tc.name testAnchor043
     * @tc.desc Verify anchor() with illegal non-character U+FFFE in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "ArkTS";
      let result: string = text.anchor("￾abc");

      expect(result).assertEqual('<a name="￾abc">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0440
     * @tc.name testAnchor044
     * @tc.desc Verify anchor() with long text content (10000 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "A".repeat(10000);
      let result: string = text.anchor("pos");
      let starts: boolean = result.startsWith('<a name="pos">');
      expect(starts).assertTrue();
      let ends: boolean = result.endsWith("</a>");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0450
     * @tc.name testAnchor045
     * @tc.desc Verify anchor() with text that itself contains <a> tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "<a href='x'>link</a>";
      let result: string = text.anchor("pos");
      expect(result).assertEqual('<a name="pos"><a href=\'x\'>link</a></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0460
     * @tc.name testAnchor046
     * @tc.desc Verify anchor() with null byte \\0 in text content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "A\0B";
      let result: string = text.anchor("pos");
      expect(result.length).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0470
     * @tc.name testAnchor047
     * @tc.desc Verify anchor() preserves tag-closing script injection in name without encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "safe";
      let result: string = text.anchor('a"><script>alert(1)</script>');
      expect(result).assertEqual('<a name="a"><script>alert(1)</script>">safe</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0480
     * @tc.name testAnchor048
     * @tc.desc Verify anchor() with CJK Unicode BMP name wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".anchor("锚点");
      expect(result).assertEqual('<a name="锚点">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0490
     * @tc.name testAnchor049
     * @tc.desc Verify anchor() with GBK Chinese name wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello".anchor("中文锚点");
      expect(result).assertEqual('<a name="中文锚点">Hello</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0500
     * @tc.name testAnchor050
     * @tc.desc Verify anchor() with emoji name preserves emoji in name attribute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "X".anchor("😀");
      expect(result).assertEqual('<a name="😀">X</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0510
     * @tc.name testAnchor051
     * @tc.desc Verify anchor() with ISO 8859-1 Latin accented name wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("café");
      expect(result).assertEqual('<a name="café">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0520
     * @tc.name testAnchor052
     * @tc.desc Verify anchor() with half-width katakana name wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("ﾊﾝｶｸ");
      expect(result).assertEqual('<a name="ﾊﾝｶｸ">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0530
     * @tc.name testAnchor053
     * @tc.desc Verify anchor() with CJK Unicode BMP content wrapped in anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "你好世界".anchor("top");
      expect(result).assertEqual('<a name="top">你好世界</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0540
     * @tc.name testAnchor054
     * @tc.desc Verify anchor() with GBK Chinese content wrapped in anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文测试内容".anchor("a");
      expect(result).assertEqual('<a name="a">中文测试内容</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0550
     * @tc.name testAnchor055
     * @tc.desc Verify anchor() with emoji content wrapped in anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀🎉".anchor("top");
      expect(result).assertEqual('<a name="top">😀🎉</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0560
     * @tc.name testAnchor056
     * @tc.desc Verify anchor() with ISO 8859-1 Latin accented content wrapped in anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "café au lait".anchor("a");
      expect(result).assertEqual('<a name="a">café au lait</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0570
     * @tc.name testAnchor057
     * @tc.desc Verify anchor() with half-width katakana content wrapped in anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ﾊﾝｶｸ".anchor("a");
      expect(result).assertEqual('<a name="a">ﾊﾝｶｸ</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0580
     * @tc.name testAnchor058
     * @tc.desc Verify anchor() with full-width characters in content wrapped in anchor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ＦＵＬＬ".anchor("pos");
      expect(result).assertEqual('<a name="pos">ＦＵＬＬ</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0590
     * @tc.name testAnchor059
     * @tc.desc Verify anchor() with CJK name and CJK content together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文内容".anchor("中文锚点");
      expect(result).assertEqual('<a name="中文锚点">中文内容</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0600
     * @tc.name testAnchor060
     * @tc.desc Verify anchor() with emoji name and emoji content together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "😀".anchor("🎉");
      expect(result).assertEqual('<a name="🎉">😀</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0610
     * @tc.name testAnchor061
     * @tc.desc Verify anchor() with GBK name and GBK content together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "中文内容".anchor("中文测试");
      expect(result).assertEqual('<a name="中文测试">中文内容</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0620
     * @tc.name testAnchor062
     * @tc.desc Verify anchor() with newline character in text content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "line1\nline2".anchor("sec");
      expect(result).assertEqual('<a name="sec">line1\nline2</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0630
     * @tc.name testAnchor063
     * @tc.desc Verify anchor() with tab character in text content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "col1\tcol2".anchor("tbl");
      expect(result).assertEqual('<a name="tbl">col1\tcol2</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0640
     * @tc.name testAnchor064
     * @tc.desc Verify anchor() with carriage-return in text content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a\rb".anchor("pos");
      expect(result).assertEqual('<a name="pos">a\rb</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0650
     * @tc.name testAnchor065
     * @tc.desc Verify anchor() with leading and trailing spaces in content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = " hello ".anchor("id");
      expect(result).assertEqual('<a name="id"> hello </a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0660
     * @tc.name testAnchor066
     * @tc.desc Verify anchor() with mixed ASCII and CJK in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello你好World世界".anchor("pos");
      expect(result).assertEqual('<a name="pos">Hello你好World世界</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0670
     * @tc.name testAnchor067
     * @tc.desc Verify anchor() with mixed ASCII and emoji in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Party🎉Time".anchor("p");
      expect(result).assertEqual('<a name="p">Party🎉Time</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0680
     * @tc.name testAnchor068
     * @tc.desc Verify anchor() with dynamic name variable from parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = "dynamicSection";
      let result: string = "ArkTS".anchor(name);
      expect(result).assertEqual('<a name="dynamicSection">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0690
     * @tc.name testAnchor069
     * @tc.desc Verify anchor() with dynamic text content variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Variable";
      let result: string = text.anchor("pos");
      expect(result).assertEqual('<a name="pos">Variable</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0700
     * @tc.name testAnchor070
     * @tc.desc Verify anchor() with both name and text as dynamic variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "content";
      let name: string = "anchor";
      let result: string = text.anchor(name);
      expect(result).assertEqual('<a name="anchor">content</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0710
     * @tc.name testAnchor071
     * @tc.desc Verify anchor() result length equals content length plus name length plus 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = "Hi";
      let name: string = "x";
      let result: string = text.anchor(name);
      let expectedLen: int = 2 + 1 + 15;
      expect(result.length).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0720
     * @tc.name testAnchor072
     * @tc.desc Verify anchor() result format: starts with <a name=\" and ends with </a>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "test".anchor("id");
      let starts: boolean = result.startsWith('<a name="');
      let ends: boolean = result.endsWith('</a>');
      expect(starts).assertTrue();
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0730
     * @tc.name testAnchor073
     * @tc.desc Verify anchor() with dot character in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".anchor("section.1");
      expect(result).assertEqual('<a name="section.1">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0740
     * @tc.name testAnchor074
     * @tc.desc Verify anchor() with colon character in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".anchor("ch:1");
      expect(result).assertEqual('<a name="ch:1">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0750
     * @tc.name testAnchor075
     * @tc.desc Verify anchor() with hyphen and underscore in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ArkTS".anchor("my-section_id");
      expect(result).assertEqual('<a name="my-section_id">ArkTS</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0760
     * @tc.name testAnchor076
     * @tc.desc Verify anchor() with URL-like name preserves slashes and colons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "link".anchor("https://example.com/page");
      expect(result).assertEqual('<a name="https://example.com/page">link</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0770
     * @tc.name testAnchor077
     * @tc.desc Verify anchor() with regex metacharacter star in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("a*b");
      expect(result).assertEqual('<a name="a*b">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0780
     * @tc.name testAnchor078
     * @tc.desc Verify anchor() with regex metacharacter plus in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("a+b");
      expect(result).assertEqual('<a name="a+b">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0790
     * @tc.name testAnchor079
     * @tc.desc Verify anchor() with regex metacharacter question in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("a?");
      expect(result).assertEqual('<a name="a?">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0800
     * @tc.name testAnchor080
     * @tc.desc Verify anchor() with regex metacharacter pipe in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("a|b");
      expect(result).assertEqual('<a name="a|b">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0810
     * @tc.name testAnchor081
     * @tc.desc Verify anchor() with regex metacharacter caret in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("^start");
      expect(result).assertEqual('<a name="^start">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0820
     * @tc.name testAnchor082
     * @tc.desc Verify anchor() with regex metacharacter dollar in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("end$");
      expect(result).assertEqual('<a name="end$">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0830
     * @tc.name testAnchor083
     * @tc.desc Verify anchor() with bracket characters in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("[section]");
      expect(result).assertEqual('<a name="[section]">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0840
     * @tc.name testAnchor084
     * @tc.desc Verify anchor() with curly brace characters in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("{code}");
      expect(result).assertEqual('<a name="{code}">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0850
     * @tc.name testAnchor085
     * @tc.desc Verify anchor() with leading spaces in content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "  leading".anchor("a");
      expect(result).assertEqual('<a name="a">  leading</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0860
     * @tc.name testAnchor086
     * @tc.desc Verify anchor() with trailing spaces in content preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "trailing  ".anchor("a");
      expect(result).assertEqual('<a name="a">trailing  </a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0870
     * @tc.name testAnchor087
     * @tc.desc Verify anchor() with only punctuation marks in content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "!@#$%".anchor("punct");
      expect(result).assertEqual('<a name="punct">!@#$%</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0880
     * @tc.name testAnchor088
     * @tc.desc Verify anchor() with ampersand entity in content preserved without escaping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a&b".anchor("x");
      expect(result).assertEqual('<a name="x">a&b</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0890
     * @tc.name testAnchor089
     * @tc.desc Verify anchor() with Unicode escape sequence \u0041\u0042 in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("\u0041\u0042");
      expect(result).assertEqual('<a name="AB">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0900
     * @tc.name testAnchor090
     * @tc.desc Verify anchor() with hash fragment identifier style name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("#fragment");
      expect(result).assertEqual('<a name="#fragment">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0910
     * @tc.name testAnchor091
     * @tc.desc Verify anchor() with single character content and single character name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "X".anchor("Y");
      expect(result).assertEqual('<a name="Y">X</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0920
     * @tc.name testAnchor092
     * @tc.desc Verify anchor() with single digit content and single digit name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "7".anchor("1");
      expect(result).assertEqual('<a name="1">7</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0930
     * @tc.name testAnchor093
     * @tc.desc Verify anchor() with whitespace-only content wraps correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "   ".anchor("sp");
      expect(result).assertEqual('<a name="sp">   </a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0940
     * @tc.name testAnchor094
     * @tc.desc Verify anchor() with name containing spaces at start and end preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor(" a ");
      expect(result).assertEqual('<a name=" a ">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0950
     * @tc.name testAnchor095
     * @tc.desc Verify anchor() result contains the name substring at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Hello".anchor("xyz");
      let nameStart: int = result.indexOf('name="') + 6;
      let nameEnd: int = result.indexOf('">');
      let nameLen: int = nameEnd - nameStart;
      expect(nameLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0960
     * @tc.name testAnchor096
     * @tc.desc Verify anchor() result can be split on anchor tag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "data".anchor("mid");
      let parts: string[] = result.split("\"");
      expect(parts[1].toString()).assertEqual("mid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0970
     * @tc.name testAnchor097
     * @tc.desc Verify anchor() called on string literal directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "Literal".anchor("lit");
      expect(result).assertEqual('<a name="lit">Literal</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0980
     * @tc.name testAnchor098
     * @tc.desc Verify anchor() with semicolon in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "text".anchor("a;b");
      expect(result).assertEqual('<a name="a;b">text</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_0990
     * @tc.name testAnchor099
     * @tc.desc Verify Anchor handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.anchor("specialAnchor");
      expect(result).assertEqual("<a name=\"specialAnchor\">" + source.toString() + "</a>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR_1000
     * @tc.name testAnchor100
     * @tc.desc Verify Anchor handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAnchor100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.anchor("multiLang");
      expect(result).assertEqual("<a name=\"multiLang\">" + source.toString() + "</a>");
    });
  });
}
