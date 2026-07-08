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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class EscapeToStringHelper {
  toString(): string {
    return "hello%20world";
  }
}

export default function EscapeTest(): void {
  describe('EscapeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0100
     * @tc.name testEscape001
     * @tc.desc Verify escape with one string parameter executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello");
      expect(result).assertEqual("hello");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0200
     * @tc.name testEscape002
     * @tc.desc Verify escape encodes ASCII hello world string correctly when passing 'hello world'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello world");
      expect(result).assertEqual("hello%20world");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0300
     * @tc.name testEscape003
     * @tc.desc Verify escape these are not encoded when passing string with @*_+-./
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("test@*_+-./data");
      expect(result).assertEqual("test@*_+-./data");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0400
     * @tc.name testEscape004
     * @tc.desc Verify escape empty string is returned when passing empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("");
      expect(result).assertEqual("");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0500
     * @tc.name testEscape005
     * @tc.desc Verify escape %uXXXX encoding when passing Japanese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("あいうえお");
      expect(result).assertEqual("%u3042%u3044%u3046%u3048%u304A");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0600
     * @tc.name testEscape006
     * @tc.desc Verify escape encoding behavior when passing emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("😀🎉");
      expect(result).assertEqual("%uD83D%uDE00%uD83C%uDF89");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0700
     * @tc.name testEscape007
     * @tc.desc Verify escape encoded as %09 when passing tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello\tworld");
      expect(result).assertEqual("hello%09world");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0800
     * @tc.name testEscape008
     * @tc.desc Verify escape encoded as %0A when passing newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello\nworld");
      expect(result).assertEqual("hello%0Aworld");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_0900
     * @tc.name testEscape009
     * @tc.desc Verify escape encoded as %0D when passing carriage return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello\rworld");
      expect(result).assertEqual("hello%0Dworld");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1000
     * @tc.name testEscape010
     * @tc.desc Verify escape encoding when passing special symbols !#$%&
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("!#$%&'()=");
      expect(result).assertEqual("%21%23%24%25%26%27%28%29%3D");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1100
     * @tc.name testEscape011
     * @tc.desc Verify escape throws ClassCastError when passing null (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(null as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1200
     * @tc.name testEscape012
     * @tc.desc Verify escape throws ClassCastError when passing undefined (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(undefined as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1300
     * @tc.name testEscape013
     * @tc.desc Verify escape throws ClassCastError when passing number (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(123 as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1400
     * @tc.name testEscape014
     * @tc.desc Verify escape throws ClassCastError when passing boolean true (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(true as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1500
     * @tc.name testEscape015
     * @tc.desc Verify escape special characters are encoded when passing XSS-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("<script>alert(1)</script>");
      expect(result).assertEqual("%3Cscript%3Ealert%281%29%3C/script%3E");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1600
     * @tc.name testEscape016
     * @tc.desc Verify escape encoding when passing full URL string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("https://example.com/path?name=value&key=val");
      expect(result).assertEqual("https%3A//example.com/path%3Fname%3Dvalue%26key%3Dval");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1700
     * @tc.name testEscape017
     * @tc.desc Verify escape encoding when passing zero-width characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello\u200Bworld");
      expect(result).assertEqual("hello%u200Bworld");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1800
     * @tc.name testEscape018
     * @tc.desc Verify space is encoded as %20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape(" ");
      expect(result).assertEqual("%20");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_1900
     * @tc.name testEscape019
     * @tc.desc Verify special symbols encoded as %XX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("!");
      expect(result).assertEqual("%21");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2000
     * @tc.name testEscape020
     * @tc.desc Verify <> encoded as %3C and %3E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("<>");
      expect(result).assertEqual("%3C%3E");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2100
     * @tc.name testEscape021
     * @tc.desc Verify = as %3D and ? as %3F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("=?");
      expect(result).assertEqual("%3D%3F");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2200
     * @tc.name testEscape022
     * @tc.desc Verify mixed ASCII, Chinese, and special chars encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("hello 世界!");
      expect(result).assertEqual("hello%20%u4E16%u754C%21");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2300
     * @tc.name testEscape023
     * @tc.desc Verify behavior with supplementary Unicode (surrogate pair)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("\uD83D\uDE00");
      expect(result).assertEqual("%uD83D%uDE00");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2400
     * @tc.name testEscape024
     * @tc.desc Verify escape throws ClassCastError when passing NaN (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(Double.NaN as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2500
     * @tc.name testEscape025
     * @tc.desc Verify escape throws ClassCastError when passing Infinity (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(Double.POSITIVE_INFINITY as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2600
     * @tc.name testEscape026
     * @tc.desc Verify ASCII string round-trips via unescape(escape)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello world 123";
      expect(unescape(escape(input))).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2700
     * @tc.name testEscape027
     * @tc.desc Verify lone percent sign encoded as %25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("%")).assertEqual("%25");
      expect(unescape("%25")).assertEqual("%");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2800
     * @tc.name testEscape028
     * @tc.desc Verify tilde encoded as %7E (not in @*_+-./ set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("~")).assertEqual("%7E");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_2900
     * @tc.name testEscape029
     * @tc.desc Verify backspace control char encoded as %08
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\b")).assertEqual("%08");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3000
     * @tc.name testEscape030
     * @tc.desc Verify second escape on already-safe input is stable (unescaped @*_+-./ set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "test@data/path";
      let once: string = escape(input);
      expect(once).assertEqual(input);
      expect(escape(once)).assertEqual(once);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3100
     * @tc.name testEscape031
     * @tc.desc Verify escape throws ClassCastError when passing empty array (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      expect((): void => {
        escape(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3200
     * @tc.name testEscape032
     * @tc.desc Verify escape throws ClassCastError when passing function (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(((): void => {}) as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3300
     * @tc.name testEscape033
     * @tc.desc Verify incomplete %u: leading % encoded to %25, remainder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("%u4E2")).assertEqual("%25u4E2");
      expect(unescape("%25u4E2")).assertEqual("%u4E2");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3400
     * @tc.name testEscape034
     * @tc.desc Verify escape vs encodeURI on arkts-sta-functions.md example URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "https://example.test/search?q=ArkTS 文档";
      expect(encodeURI(raw)).assertEqual("https://example.test/search?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(escape(raw)).assertEqual("https%3A//example.test/search%3Fq%3DArkTS%20%u6587%u6863");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3500
     * @tc.name testEscape035
     * @tc.desc Verify unescape(escape) round-trip for arkts-sta-functions.md component string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ArkTS 文档";
      expect(unescape(escape(input))).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3600
     * @tc.name testEscape036
     * @tc.desc Verify unescape restores escape output for pure Chinese (legacy compat)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "中文";
      expect(escape(input)).assertEqual("%u4E2D%u6587");
      expect(unescape(escape(input))).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3700
     * @tc.name testEscape037
     * @tc.desc Verify form feed and vertical tab encode as %0C and %0B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\f")).assertEqual("%0C");
      expect(escape("\v")).assertEqual("%0B");
      expect(unescape("%0C")).assertEqual("\f");
      expect(unescape("%0B")).assertEqual("\v");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3800
     * @tc.name testEscape038
     * @tc.desc Verify escape vs encodeURIComponent on arkts-sta-functions.md component string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ArkTS 文档";
      expect(escape(input)).assertEqual("ArkTS%20%u6587%u6863");
      expect(encodeURIComponent(input)).assertEqual("ArkTS%20%E6%96%87%E6%A1%A3");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_3900
     * @tc.name testEscape039
     * @tc.desc Verify escape vs encodeURI on arkts-sta-functions.md component string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ArkTS 文档";
      expect(escape(input)).assertEqual("ArkTS%20%u6587%u6863");
      expect(encodeURI(input)).assertEqual("ArkTS%20%E6%96%87%E6%A1%A3");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4000
     * @tc.name testEscape040
     * @tc.desc Verify decodeURI rejects escape output for full URI; use unescape per API doc (symmetric to DecodeUriTest)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "https://example.test/search?q=ArkTS 文档";
      let escaped: string = escape(raw);
      expect((): void => {
        decodeURI(escaped);
      }).assertThrowError('URIError');
      expect(unescape(escaped)).assertEqual(raw);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4100
     * @tc.name testEscape041
     * @tc.desc Verify unescape(escape(str)) equals str
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello 世界!@#";
      let escaped: string = escape(input);
      let unescaped: string = unescape(escaped);
      expect(unescaped).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4200
     * @tc.name testEscape042
     * @tc.desc Verify compare escape vs encodeURIComponent on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello 世界!@#";
      let escapeResult: string = escape(input);
      let encodeURIComponentResult: string = encodeURIComponent(input);
      expect(escapeResult).assertEqual("hello%20%u4E16%u754C%21@%23");
      expect(encodeURIComponentResult).assertEqual("hello%20%E4%B8%96%E7%95%8C!%40%23");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4300
     * @tc.name testEscape043
     * @tc.desc Verify cRLF sequence encoded as %0D%0A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\r\n";
      expect(escape(input)).assertEqual("%0D%0A");
      expect(unescape(escape(input))).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4400
     * @tc.name testEscape044
     * @tc.desc Verify shorter incomplete %u (%u4E): leading % encoded to %25, remainder literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("%u4E")).assertEqual("%25u4E");
      expect(unescape("%25u4E")).assertEqual("%u4E");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4500
     * @tc.name testEscape045
     * @tc.desc Verify latin-1 supplement character encoded as %XX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\u00A2")).assertEqual("%A2");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4600
     * @tc.name testEscape046
     * @tc.desc Verify escape %5Cn when passing literal backslash-n (two chars), not newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\\n")).assertEqual("%5Cn");
      expect(escape("\n")).assertEqual("%0A");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4700
     * @tc.name testEscape047
     * @tc.desc Verify escape throws ClassCastError when passing helper object (toString not used)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EscapeToStringHelper = new EscapeToStringHelper();
      expect((): void => {
        escape(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4800
     * @tc.name testEscape048
     * @tc.desc Verify mixed %u and %XX tokens: each % re-escaped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("%u4E2D%20")).assertEqual("%25u4E2D%2520");
      expect(unescape(escape("%u4E2D%20"))).assertEqual("%u4E2D%20");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_4900
     * @tc.name testEscape049
     * @tc.desc Verify escape throws ClassCastError when passing plain Object (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect((): void => {
        escape(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5000
     * @tc.name testEscape050
     * @tc.desc Verify escape %uXXXX encoding when passing Korean string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = escape("한국어");
      expect(result).assertEqual("%uD55C%uAD6D%uC5B4");
      expect(unescape(result)).assertEqual("한국어");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5100
     * @tc.name testEscape051
     * @tc.desc Verify escape special characters are encoded when passing SQL-injection-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "' OR 1=1; DROP TABLE users; --";
      let result: string = escape(input);
      expect(result).assertEqual("%27%20OR%201%3D1%3B%20DROP%20TABLE%20users%3B%20--");
      expect(unescape(result)).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5200
     * @tc.name testEscape052
     * @tc.desc Verify double escape differs from single escape because % is re-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello world";
      let once: string = escape(input);
      let twice: string = escape(once);
      expect(once).assertEqual("hello%20world");
      expect(twice).assertEqual("hello%2520world");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5300
     * @tc.name testEscape053
     * @tc.desc Verify long CJK string round-trips via unescape(escape)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "中".repeat(1000);
      expect(unescape(escape(longStr))).assertEqual(longStr);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5400
     * @tc.name testEscape054
     * @tc.desc Verify escape pure ASCII alphanumeric string is unchanged by escape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("ABCabc123")).assertEqual("ABCabc123");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5500
     * @tc.name testEscape055
     * @tc.desc Verify all ASCII printable characters (32-126) encode per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allAscii: string = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      let result: string = escape(allAscii);
      expect(result).assertEqual("%20%21%22%23%24%25%26%27%28%29*+%2C-./0123456789%3A%3B%3C%3D%3E%3F@ABCDEFGHIJKLMNOPQRSTUVWXYZ%5B%5C%5D%5E_%60abcdefghijklmnopqrstuvwxyz%7B%7C%7D%7E");
      expect(unescape(result)).assertEqual(allAscii);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5600
     * @tc.name testEscape056
     * @tc.desc Verify escape throws ClassCastError when passing non-empty array (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<string> = ["a", "b", "c"];
      expect((): void => {
        escape(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5700
     * @tc.name testEscape057
     * @tc.desc Verify escape throws ClassCastError when passing negative Infinity (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(Double.NEGATIVE_INFINITY as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5800
     * @tc.name testEscape058
     * @tc.desc Verify string with many punctuation symbols encodes per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      let result: string = escape(input);
      expect(result).assertEqual("%20%21%22%23%24%25%26%27%28%29*+%2C-./%3A%3B%3C%3D%3E%3F@%5B%5C%5D%5E_%60%7B%7C%7D%7E");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_5900
     * @tc.name testEscape059
     * @tc.desc Verify escape uses %u for Chinese; encodeURIComponent uses UTF-8 percent per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("中")).assertEqual("%u4E2D");
      expect(encodeURIComponent("中")).assertEqual("%E4%B8%AD");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6000
     * @tc.name testEscape060
     * @tc.desc Verify 65535 spaces escape to %20 each; golden value and unescape round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = " ".repeat(65535);
      let encoded: string = escape(input);
      expect(encoded.length).assertEqual(65535 * 3);
      expect(encoded).assertEqual("%20".repeat(65535));
      expect(unescape(encoded)).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6100
     * @tc.name testEscape061
     * @tc.desc Verify thai string from static input data; escape %uXXXX encoding per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0E17\u0E14\u0E2A\u0E2D\u0E1A";
      let result: string = escape(input);
      expect(result).assertEqual("%u0E17%u0E14%u0E2A%u0E2D%u0E1A");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6200
     * @tc.name testEscape062
     * @tc.desc Verify Latin-1 mojibake literal æµè¯; escape/unescape vs encodeURI/decodeURI encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "æµè¯";
      let legacy: string = escape(input);
      let standard: string = encodeURI(input);
      expect(legacy).assertEqual("%E6%B5%E8%AF");
      expect(standard).assertEqual("%C3%A6%C2%B5%C3%A8%C2%AF");
      expect(decodeURI(standard)).assertEqual(input);
      expect(unescape(legacy)).assertEqual(input);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6300
     * @tc.name testEscape063
     * @tc.desc Verify escape keeps plus unescaped in a+b; lone tab encodes as %09 per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("a+b")).assertEqual("a+b");
      expect(escape("\t")).assertEqual("%09");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6400
     * @tc.name testEscape064
     * @tc.desc Verify escape leaves numeric ID card string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("310101199001011234")).assertEqual("310101199001011234");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6500
     * @tc.name testEscape065
     * @tc.desc Verify escape percent-encodes backslash in path-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "C:\\path\\file";
      let result: string = escape(input);
      expect(result).assertEqual("C%3A%5Cpath%5Cfile");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6600
     * @tc.name testEscape066
     * @tc.desc Verify device emoji 📱📞 from static input data; escape %uXXXX surrogate pair encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "📱📞";
      let encoded: string = escape(input);
      expect(encoded).assertEqual("%uD83D%uDCF1%uD83D%uDCDE");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6700
     * @tc.name testEscape067
     * @tc.desc Verify incomplete emoji lone high surrogate \uD83D from static input data; escape to %uD83D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uD83D";
      expect(escape(input)).assertEqual("%uD83D");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6800
     * @tc.name testEscape068
     * @tc.desc Verify russian Cyrillic from static input data; escape %uXXXX encoding per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0410\u0411\u0412\u0413\u0414";
      expect(escape(input)).assertEqual("%u0410%u0411%u0412%u0413%u0414");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_6900
     * @tc.name testEscape069
     * @tc.desc Verify arabic string from static input data; escape %uXXXX encoding per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0627\u062e\u062a\u0628\u0627\u0631";
      let encoded: string = escape(input);
      expect(encoded).assertEqual("%u0627%u062E%u062A%u0628%u0627%u0631");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7000
     * @tc.name testEscape070
     * @tc.desc Verify u+FFFF escapes as %uFFFF per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\uFFFF")).assertEqual("%uFFFF");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7100
     * @tc.name testEscape071
     * @tc.desc Verify u+FFFE escapes as %uFFFE per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\uFFFE")).assertEqual("%uFFFE");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7200
     * @tc.name testEscape072
     * @tc.desc Verify escape magnet URI string; percent-encodes non-unescaped characters per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "magnet:?xt=urn:btih:abc123&dn=测试";
      expect(escape(input)).assertEqual("magnet%3A%3Fxt%3Durn%3Abtih%3Aabc123%26dn%3D%u6D4B%u8BD5");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7300
     * @tc.name testEscape073
     * @tc.desc Verify fire emoji from static input data; escape %uXXXX surrogate pair encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uD83D\uDD25";
      expect(escape(input)).assertEqual("%uD83D%uDD25");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7400
     * @tc.name testEscape074
     * @tc.desc Verify u+2014 em dash from static input data; escape %u2014 encoding per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u2014";
      expect(escape(input)).assertEqual("%u2014");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7500
     * @tc.name testEscape075
     * @tc.desc Verify escape throws ClassCastError when passing boolean false (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        escape(false as Object as string);
      }).assertThrowError('ClassCastError');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ESCAPE_7600
     * @tc.name testEscape076
     * @tc.desc Verify lone low surrogate \uDC00 escapes as %uDC00 per legacy rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEscape076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(escape("\uDC00")).assertEqual("%uDC00");
    });
  });
}
