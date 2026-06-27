'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class UnescapeToStringHelper {
  toString(): string {
    return "%41";
  }
}

export default function UnescapeTest(): void {
  describe('UnescapeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0100
     * @tc.name testUnescape001
     * @tc.desc Verify unescape decodes to space when passing '%20'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%20");
      expect(result).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0200
     * @tc.name testUnescape002
     * @tc.desc Verify unescape correct decode when passing 'hello%20world'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("hello%20world");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0300
     * @tc.name testUnescape003
     * @tc.desc Verify unescape empty string is returned when passing empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0400
     * @tc.name testUnescape004
     * @tc.desc Verify unescape correct decode when passing %XX ASCII escape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%41%42%43");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0500
     * @tc.name testUnescape005
     * @tc.desc Verify unescape correct decode when passing mixed %uXXXX and %XX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%u4E2D%41%u6587%42");
      expect(result).assertEqual("中A文B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0600
     * @tc.name testUnescape006
     * @tc.desc Verify unescape handling when passing incomplete %u sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%u4E2");
      expect(result).assertEqual("%u4E2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0700
     * @tc.name testUnescape007
     * @tc.desc Verify unescape handling when passing incomplete % sequence %2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%2");
      expect(result).assertEqual("%2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0800
     * @tc.name testUnescape008
     * @tc.desc Verify unescape handling when passing '%%' or '%%%'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: string = unescape("%%");
      expect(result1).assertEqual("%%");
      let result2: string = unescape("%%%");
      expect(result2).assertEqual("%%%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_0900
     * @tc.name testUnescape009
     * @tc.desc Verify unescape decodes newline, tab, and related percent escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: string = unescape("%0A");
      expect(result1).assertEqual("\n");
      let result2: string = unescape("%09");
      expect(result2).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1000
     * @tc.name testUnescape010
     * @tc.desc Verify unescape throws ClassCastError when passing undefined (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(undefined as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1100
     * @tc.name testUnescape011
     * @tc.desc Verify unescape throws ClassCastError when passing boolean true (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(true as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1200
     * @tc.name testUnescape012
     * @tc.desc Verify unescape throws ClassCastError when passing boolean false (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(false as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1300
     * @tc.name testUnescape013
     * @tc.desc Verify unescape throws ClassCastError when passing object (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape({} as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1400
     * @tc.name testUnescape014
     * @tc.desc Verify %uXXXX decodes to correct Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%u4E2D");
      expect(result).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1500
     * @tc.name testUnescape015
     * @tc.desc Verify string with both %uXXXX and %XX decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("hello%20%u4E16%u754C");
      expect(result).assertEqual("hello 世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1600
     * @tc.name testUnescape016
     * @tc.desc Verify digit escapes decode correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%30%31%32%33%34%35%36%37%38%39");
      expect(result).assertEqual("0123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1700
     * @tc.name testUnescape017
     * @tc.desc Verify Unicode across code ranges decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let japanese: string = unescape("%u3053%u3093%u306B%u3061%u306F");
      expect(japanese).assertEqual("こんにちは");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1800
     * @tc.name testUnescape018
     * @tc.desc Verify unescape unchanged return when passing plain string without %
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("abcABC123");
      expect(result).assertEqual("abcABC123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_1900
     * @tc.name testUnescape019
     * @tc.desc Verify unescape handling when passing 'hello%'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("hello%");
      expect(result).assertEqual("hello%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2000
     * @tc.name testUnescape020
     * @tc.desc Verify unescape decodes to A when passing %41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%41");
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2100
     * @tc.name testUnescape021
     * @tc.desc Verify decode across Unicode ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let latin: string = unescape("%u0041%u005A");
      expect(latin).assertEqual("AZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2200
     * @tc.name testUnescape022
     * @tc.desc Verify %u0000 decodes to U+0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = unescape("%u0000");
      expect(result).assertEqual("\u0000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2300
     * @tc.name testUnescape023
     * @tc.desc Verify mixed ASCII and CJK round-trip via unescape(escape)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ArkTS_中文_123";
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2400
     * @tc.name testUnescape024
     * @tc.desc Verify unescape decodes %25 to percent sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%25")).assertEqual("%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2500
     * @tc.name testUnescape025
     * @tc.desc Verify lowercase hex in %2f decodes to slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%2f")).assertEqual("/");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2600
     * @tc.name testUnescape026
     * @tc.desc Verify unescape decodes %uXXXX surrogate pair to emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%uD83D%uDE00")).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2700
     * @tc.name testUnescape027
     * @tc.desc Verify unescape inverts escape on percent-literal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "100%25";
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2800
     * @tc.name testUnescape028
     * @tc.desc Verify unescape throws ClassCastError when passing empty array (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      expect((): void => {
        unescape(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_2900
     * @tc.name testUnescape029
     * @tc.desc Verify unescape throws ClassCastError when passing function (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(((): void => {}) as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3000
     * @tc.name testUnescape030
     * @tc.desc Verify unescape %uXXXX vs decodeURIComponent UTF-8 for same Chinese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%u4E2D%u6587")).assertEqual("中文");
      expect(decodeURIComponent("%E4%B8%AD%E6%96%87")).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3100
     * @tc.name testUnescape031
     * @tc.desc Verify unescape restores escape output for form feed and vertical tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "a\fb\vc";
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3200
     * @tc.name testUnescape032
     * @tc.desc Verify unescape decodes escape output of arkts-sta-functions.md full URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "https://example.test/search?q=ArkTS 文档";
      expect(unescape(escape(raw))).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3300
     * @tc.name testUnescape033
     * @tc.desc Verify unescape decodes escape output of arkts-sta-functions.md component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("ArkTS%20%u6587%u6863")).assertEqual("ArkTS 文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3400
     * @tc.name testUnescape034
     * @tc.desc Verify decodeURIComponent preferred over unescape for encodeURIComponent output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let component: string = "ArkTS%20%E6%96%87%E6%A1%A3";
      expect(decodeURIComponent(component)).assertEqual("ArkTS 文档");
      let legacy: string = unescape(component);
      expect(legacy).assertEqual("ArkTS \u00E6\u0096\u0087\u00E6\u00A1\u00A3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3500
     * @tc.name testUnescape035
     * @tc.desc Verify unescape decodes %0D%0A to CRLF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%0D%0A")).assertEqual("\r\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3600
     * @tc.name testUnescape036
     * @tc.desc Verify unescape decodes to two-char \n text when passing %5Cn literal backslash-n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%5Cn")).assertEqual("\\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3700
     * @tc.name testUnescape037
     * @tc.desc Verify unescape throws ClassCastError when passing -Infinity (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(Double.NEGATIVE_INFINITY as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3800
     * @tc.name testUnescape038
     * @tc.desc Verify unescape latin-1 %A2 decodes to cent sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%A2")).assertEqual("\u00A2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_3900
     * @tc.name testUnescape039
     * @tc.desc Verify unescape lone high surrogate %uD800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%uD800")).assertEqual("\uD800");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4000
     * @tc.name testUnescape040
     * @tc.desc Verify unescape literal preserved without throw when passing invalid %uZZZZ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%uZZZZ")).assertEqual("%uZZZZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4100
     * @tc.name testUnescape041
     * @tc.desc Verify long CJK string round-trip via escape/unescape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "中".repeat(500);
      expect(unescape(escape(longStr))).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4200
     * @tc.name testUnescape042
     * @tc.desc Verify unescape throws ClassCastError when passing null (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(null as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4300
     * @tc.name testUnescape043
     * @tc.desc Verify unescape throws ClassCastError when passing helper object (toString not used)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: UnescapeToStringHelper = new UnescapeToStringHelper();
      expect((): void => {
        unescape(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4400
     * @tc.name testUnescape044
     * @tc.desc Verify unescape inverts escape %u output; does not decode encodeURIComponent UTF-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ArkTS 文档";
      let legacy: string = escape(input);
      expect(unescape(legacy)).assertEqual(input);

      let modern: string = encodeURIComponent(input);
      expect(decodeURIComponent(modern)).assertEqual(input);
      expect(unescape(modern)).assertEqual("ArkTS \u00E6\u0096\u0087\u00E6\u00A1\u00A3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4500
     * @tc.name testUnescape045
     * @tc.desc Verify unescape inverts escape for slash+space; differs from encodeURIComponent UTF-8 path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "a/b c";
      let legacy: string = escape(input);
      expect(legacy).assertEqual("a/b%20c");
      expect(unescape(legacy)).assertEqual(input);
      expect(encodeURIComponent(input)).assertEqual("a%2Fb%20c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4600
     * @tc.name testUnescape046
     * @tc.desc Verify static input date boundaries 0000-00-00, 2099-12-31, 2024-02-29, 2026-13-01; unescape(escape) round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: string[] = ["0000-00-00", "2099-12-31", "2024-02-29", "2026-13-01"];
      for (let d of dates) {
        expect(unescape(escape(d))).assertEqual(d);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4700
     * @tc.name testUnescape047
     * @tc.desc Verify mixed-locale English and Chinese test string from static input data round-trips via unescape(escape)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "Test 測試";
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4800
     * @tc.name testUnescape048
     * @tc.desc Verify business URL https://www.baidu.com from static input data; unescape(escape) round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://www.baidu.com";
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_4900
     * @tc.name testUnescape049
     * @tc.desc Verify incomplete emoji lone high surrogate \uD83D from static input data; unescape %uD83D decodes to input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%uD83D")).assertEqual("\uD83D");
      expect(unescape(escape("\uD83D"))).assertEqual("\uD83D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5000
     * @tc.name testUnescape050
     * @tc.desc Verify unescape %uXXXX Japanese テスト sequence from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%u30c6%u30b9%u30c8")).assertEqual("\u30c6\u30b9\u30c8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5100
     * @tc.name testUnescape051
     * @tc.desc Verify unescape decodes Thai %uXXXX sequence from escape output (static input data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%u0E17%u0E14%u0E2A%u0E2D%u0E1A")).assertEqual("\u0E17\u0E14\u0E2A\u0E2D\u0E1A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5200
     * @tc.name testUnescape052
     * @tc.desc Verify unescape %2B decodes to plus; static input ID card digits unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%2B")).assertEqual("+");
      expect(unescape("310101199001011234")).assertEqual("310101199001011234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5300
     * @tc.name testUnescape053
     * @tc.desc Verify unescape keeps %GG literal while decodeURIComponent throws URIError on same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%GG")).assertEqual("%GG");
      expect((): void => {
        decodeURIComponent("%GG");
      }).assertThrowError("URIError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5400
     * @tc.name testUnescape054
     * @tc.desc Verify unescape decodes %08 to backspace character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%08")).assertEqual("\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5500
     * @tc.name testUnescape055
     * @tc.desc Verify unescape decodes Russian %uXXXX Cyrillic sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%u0410%u0411%u0412%u0413%u0414")).assertEqual("\u0410\u0411\u0412\u0413\u0414");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5600
     * @tc.name testUnescape056
     * @tc.desc Verify masked bank card from static input data; unescape(escape) round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "622202********1234";
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5700
     * @tc.name testUnescape057
     * @tc.desc Verify unescape decodes percent-encoded XSS script tags without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%3Cscript%3Ealert(1)%3C/script%3E")).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5800
     * @tc.name testUnescape058
     * @tc.desc Verify unescape throws ClassCastError when passing Double.NaN (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(Double.NaN as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_5900
     * @tc.name testUnescape059
     * @tc.desc Verify unescape decodes %0D to carriage return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%0D")).assertEqual("\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6000
     * @tc.name testUnescape060
     * @tc.desc Verify u+2014 em dash from static input data; unescape %u2014 decodes to em dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape("%u2014")).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6100
     * @tc.name testUnescape061
     * @tc.desc Verify unescape throws ClassCastError when passing number (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(123 as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6200
     * @tc.name testUnescape062
     * @tc.desc Verify unescape throws ClassCastError when passing positive Infinity (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        unescape(Double.POSITIVE_INFINITY as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6300
     * @tc.name testUnescape063
     * @tc.desc Verify unescape throws ClassCastError when passing non-empty array (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<string> = ["a", "b", "c"];
      expect((): void => {
        unescape(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6400
     * @tc.name testUnescape064
     * @tc.desc Verify unescape decodes 65535 spaces from escape output (static input data boundary length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = " ".repeat(65535);
      expect(unescape(escape(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6500
     * @tc.name testUnescape065
     * @tc.desc Verify unescape(escape) round-trip for invalid time 25:00:00 from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(unescape(escape("25:00:00"))).assertEqual("25:00:00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6600
     * @tc.name testUnescape066
     * @tc.desc Verify unescape(escape) round-trip for static input datetime strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: string[] = ["2026-03-05 10:30:00", "2026-03-05T10:30:00"];
      for (let input of inputs) {
        expect(unescape(escape(input))).assertEqual(input);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UNESCAPE_6700
     * @tc.name testUnescape067
     * @tc.desc Verify unescape(escape) round-trip for magnet URI with CJK dn from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnescape067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "magnet:?xt=urn:btih:abc123&dn=测试";
      expect(unescape(escape(input))).assertEqual(input);
    });
  });
}
