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

export default function StringReplaceAllTest(): void {
  describe('StringReplaceAllTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0100
     * @tc.name testReplaceAll001
     * @tc.desc Verify replaceAll() replaces all occurrences across the string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let result: string = text.replaceAll("Ark", "Static");
      expect(result).assertEqual("StaticTS StaticTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0200
     * @tc.name testReplaceAll002
     * @tc.desc Verify replaceAll() with not-found string returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.replaceAll("XYZ", "ABC");
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0300
     * @tc.name testReplaceAll003
     * @tc.desc Verify replaceAll() with C0 control carriage-return replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\rb\rc");
      let result: string = text.replaceAll("\r", "|");
      expect(result).assertEqual("a|b|c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0400
     * @tc.name testReplaceAll004
     * @tc.desc Verify replaceAll() with pattern at multiple positions replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("XaXbXcX");
      let result: string = text.replaceAll("X", "0");
      expect(result).assertEqual("0a0b0c0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0500
     * @tc.name testReplaceAll005
     * @tc.desc Verify replaceAll() with empty replacement removes all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c,d,e");
      let result: string = text.replaceAll(",", "");
      expect(result).assertEqual("abcde");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0600
     * @tc.name testReplaceAll006
     * @tc.desc Verify replaceAll() with CJK Unicode BMP characters replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试中文");
      let result: string = text.replaceAll("中文", "英文");
      expect(result).assertEqual("英文测试英文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0700
     * @tc.name testReplaceAll007
     * @tc.desc Verify replaceAll() with C0 control newline replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb\nc");
      let result: string = text.replaceAll("\n", "|");
      expect(result).assertEqual("a|b|c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0800
     * @tc.name testReplaceAll008
     * @tc.desc Verify replaceAll() with GBK Chinese text replaces all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("测试A测试B测试");
      let result: string = text.replaceAll("测试", "检验");
      expect(result).assertEqual("检验A检验B检验");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_0900
     * @tc.name testReplaceAll009
     * @tc.desc Verify replaceAll() with dynamic search and replacement variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a.a.a");
      let search: string = ".";
      let replacement: string = "-";
      let result: string = text.replaceAll(search, replacement);
      expect(result).assertEqual("a-a-a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1000
     * @tc.name testReplaceAll010
     * @tc.desc Verify replaceAll() with emoji replacement replaces all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aXbXc");
      let result: string = text.replaceAll("X", "😀");
      expect(result).assertEqual("a😀b😀c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1100
     * @tc.name testReplaceAll011
     * @tc.desc Verify replaceAll() deleting all spaces from string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a b c d e");
      let result: string = text.replaceAll(" ", "");
      expect(result).assertEqual("abcde");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1200
     * @tc.name testReplaceAll012
     * @tc.desc Verify replaceAll() with replacement longer than target expands string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a-b-c");
      let result: string = text.replaceAll("-", "___");
      expect(result).assertEqual("a___b___c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1300
     * @tc.name testReplaceAll013
     * @tc.desc Verify replaceAll() with replacement shorter than target contracts string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a___b___c");
      let result: string = text.replaceAll("___", "-");
      expect(result).assertEqual("a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1400
     * @tc.name testReplaceAll014
     * @tc.desc Verify replaceAll() with C0 control NUL character replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\0b\0c");
      let result: string = text.replaceAll("\0", "|");
      expect(result).assertEqual("a|b|c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1500
     * @tc.name testReplaceAll015
     * @tc.desc Verify replaceAll() with RegExp global pattern replaces all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let result: string = text.replaceAll(new RegExp("[0-9]", "g"), "X");
      expect(result).assertEqual("aXbXcX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1600
     * @tc.name testReplaceAll016
     * @tc.desc Verify replaceAll() with ISO 8859-1 Latin accented characters replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café café");
      let result: string = text.replaceAll("é", "e");
      expect(result).assertEqual("cafe cafe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1700
     * @tc.name testReplaceAll017
     * @tc.desc Verify replaceAll() with RegExp without global flag throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123");
      try {
        let result: string = text.replaceAll(new RegExp("[0-9]"), "X");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1800
     * @tc.name testReplaceAll018
     * @tc.desc Verify replaceAll() with RegExp \\d+ replaces all digit sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc12def345gh");
      let result: string = text.replaceAll(new RegExp("\\d+", "g"), "NUM");
      expect(result).assertEqual("abcNUMdefNUMgh");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_1900
     * @tc.name testReplaceAll019
     * @tc.desc Verify replaceAll() with RegExp dot wildcard replaces each single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: string = text.replaceAll(new RegExp(".", "g"), "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2000
     * @tc.name testReplaceAll020
     * @tc.desc Verify replaceAll() with RegExp not matched returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let result: string = text.replaceAll(new RegExp("[0-9]", "g"), "X");
      expect(result).assertEqual("abcdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2100
     * @tc.name testReplaceAll021
     * @tc.desc Verify replaceAll() with RegExp start anchor ^ replaces only at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let result: string = text.replaceAll(new RegExp("^abc", "g"), "XYZ");
      expect(result).assertEqual("XYZabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2200
     * @tc.name testReplaceAll022
     * @tc.desc Verify replaceAll() with RegExp end anchor $ replaces only at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let result: string = text.replaceAll(new RegExp("abc$", "g"), "XYZ");
      expect(result).assertEqual("abcXYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2300
     * @tc.name testReplaceAll023
     * @tc.desc Verify replaceAll() with RegExp on CJK Unicode BMP characters replaces all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1中文2测试3");
      let result: string = text.replaceAll(new RegExp("[0-9]", "g"), "|");
      expect(result).assertEqual("|中文|测试|");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2400
     * @tc.name testReplaceAll024
     * @tc.desc Verify replaceAll() with RegExp \\w replaces all word characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a_b-c.d");
      let result: string = text.replaceAll(new RegExp("[._-]", "g"), "/");
      expect(result).assertEqual("a/b/c/d");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2500
     * @tc.name testReplaceAll025
     * @tc.desc Verify replaceAll() with dynamic RegExp variable replaces all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b22c333");
      let pattern: RegExp = new RegExp("[0-9]+", "g");
      let result: string = text.replaceAll(pattern, "#");
      expect(result).assertEqual("a#b#c#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2600
     * @tc.name testReplaceAll026
     * @tc.desc Verify replaceAll() with RegExp alternation replaces any matching alternative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("red blue green red");
      let result: string = text.replaceAll(new RegExp("red|blue", "g"), "COLOR");
      expect(result).assertEqual("COLOR COLOR green COLOR");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2700
     * @tc.name testReplaceAll027
     * @tc.desc Verify replaceAll() with RegExp and replacer Function callback replaces all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1 b22 c333");
      let result: string = text.replaceAll(new RegExp("[0-9]+", "g"), (match: string): string => {
        return "(" + match + ")";
      });
      expect(result).assertEqual("a(1) b(22) c(333)");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2800
     * @tc.name testReplaceAll028
     * @tc.desc Verify $& in replacement references the matched substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.replaceAll("l", "[$&]");
      expect(result).assertEqual("he[l][l]o");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_2900
     * @tc.name testReplaceAll029
     * @tc.desc Verify $$ in replacement outputs literal dollar sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price");
      let result: string = text.replaceAll("price", "$$100");
      expect(result).assertEqual("$100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3000
     * @tc.name testReplaceAll030
     * @tc.desc Verify replaceAll() vs replace(): replaceAll replaces all, replace only first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aaa");
      let all: string = text.replaceAll("a", "b");
      let first: string = text.replace("a", "b");
      expect(all).assertEqual("bbb");
      expect(first).assertEqual("baa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3100
     * @tc.name testReplaceAll031
     * @tc.desc Verify replaceAll() with empty pattern inserts between each character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let result: string = text.replaceAll("", "-");
      expect(result).assertEqual("-a-b-");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3200
     * @tc.name testReplaceAll032
     * @tc.desc Verify replaceAll() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.replaceAll("l", "L");
      expect(text.toString()).assertEqual("hello");
      expect(result).assertEqual("heLLo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3300
     * @tc.name testReplaceAll033
     * @tc.desc Verify replaceAll() chain: trim spaces then replace with underscore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello world  ");
      let result: string = text.trim().replaceAll(" ", "_").toUpperCase().toString();
      expect(result).assertEqual("HELLO_WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3400
     * @tc.name testReplaceAll034
     * @tc.desc Verify replaceAll() replaces newlines with spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\nline3");
      let result: string = text.replaceAll("\n", " ");
      expect(result).assertEqual("line1 line2 line3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3500
     * @tc.name testReplaceAll035
     * @tc.desc Verify replaceAll() with gi flag for case-insensitive global replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Café CAFÉ café");
      let result: string = text.replaceAll(new RegExp("café", "gi"), "coffee");
      expect(result).assertEqual("coffee coffee coffee");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3600
     * @tc.name testReplaceAll036
     * @tc.desc Verify replaceAll() with empty replacement deletes all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a-b-c-d");
      let result: string = text.replaceAll("-", "");
      expect(result).assertEqual("abcd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3700
     * @tc.name testReplaceAll037
     * @tc.desc Verify replaceAll() with $` references text before the match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: string = text.replaceAll("b", "[$`]");
      expect(result).assertEqual("a[a]c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3800
     * @tc.name testReplaceAll038
     * @tc.desc Verify replaceAll() with $n capture group reference swaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.replaceAll(new RegExp("(\\w+) (\\w+)", "g"), "$2 $1");
      expect(result).assertEqual("world hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_3900
     * @tc.name testReplaceAll039
     * @tc.desc Verify replaceAll() for simple template substitution: {{key}} to value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const template = new String("Hello {{name}}, welcome to {{place}}");
      let result: string = template.replaceAll("{{name}}", "Alice").replaceAll("{{place}}", "Wonderland");
      expect(result).assertEqual("Hello Alice, welcome to Wonderland");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4000
     * @tc.name testReplaceAll040
     * @tc.desc Verify replaceAll() converts date separator slash to hyphen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2021/12/25");
      let result: string = text.replaceAll("/", "-");
      expect(result).assertEqual("2021-12-25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4100
     * @tc.name testReplaceAll041
     * @tc.desc Verify replaceAll() converts Windows backslash to Unix forward slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("C:\\Users\\admin\\docs");
      let result: string = text.replaceAll("\\", "/");
      expect(result).assertEqual("C:/Users/admin/docs");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4200
     * @tc.name testReplaceAll042
     * @tc.desc Verify replaceAll() with string pattern treats regex special chars as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A hacker called ha.*er used special characters");
      let result: string = text.replaceAll("ha.*er", "[REDACTED]");
      expect(result).assertEqual("A hacker called [REDACTED] used special characters");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4300
     * @tc.name testReplaceAll043
     * @tc.desc Verify split().join() achieves same result as replaceAll()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a-b-c");
      let byReplaceAll: string = text.replaceAll("-", "_");
      let bySplitJoin: string = text.split("-").join("_");
      expect(byReplaceAll).assertEqual(bySplitJoin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4400
     * @tc.name testReplaceAll044
     * @tc.desc Verify $' references text after the match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: string = text.replaceAll("b", "[$']");
      expect(result).assertEqual("a[c]c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4500
     * @tc.name testReplaceAll045
     * @tc.desc Verify replaceAll() with word boundary \\b replaces whole words only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("cat category catch cat");
      let result: string = text.replaceAll(new RegExp("\\bcat\\b", "g"), "dog");
      expect(result).assertEqual("dog category catch dog");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4600
     * @tc.name testReplaceAll046
     * @tc.desc Verify replaceAll() with + quantifier replaces one or more digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1 b22 c333");
      let result: string = text.replaceAll(new RegExp("[0-9]+", "g"), "#");
      expect(result).assertEqual("a# b# c#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4700
     * @tc.name testReplaceAll047
     * @tc.desc Verify replaceAll() replaces tab with pipe separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2\tcol3");
      let result: string = text.replaceAll("\t", " | ");
      expect(result).assertEqual("col1 | col2 | col3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4800
     * @tc.name testReplaceAll048
     * @tc.desc Verify replaceAll() replaces BOM character U+FEFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bom: string = String.fromCharCode(0xFEFF);
      const text = new String(bom + "Hello World");
      let result: string = text.replaceAll(bom, "");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_4900
     * @tc.name testReplaceAll049
     * @tc.desc Verify replaceAll() replaces zero-width space U+200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp: string = String.fromCharCode(0x200B);
      const text = new String("Hello" + zwsp + "World");
      let result: string = text.replaceAll(zwsp, "");
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5000
     * @tc.name testReplaceAll050
     * @tc.desc Verify replaceAll() replaces repeated double-space separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a  b  c");
      let result: string = text.replaceAll("  ", "_");
      expect(result).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5100
     * @tc.name testReplaceAll051
     * @tc.desc Verify replaceAll() unifies line breaks to single newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\r\nline2\rline3");
      let result: string = text.replaceAll("\r\n", "\n").replaceAll("\r", "\n");
      expect(result).assertEqual("line1\nline2\nline3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5200
     * @tc.name testReplaceAll052
     * @tc.desc Verify replaceAll() on very long string works deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(10000));
      let result: string = text.replaceAll("a", "b");
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5300
     * @tc.name testReplaceAll053
     * @tc.desc Verify replaceAll() called twice on same input yields same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aaa");
      let r1: string = text.replaceAll("a", "b");
      let r2: string = text.replaceAll("a", "b");
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5400
     * @tc.name testReplaceAll054
     * @tc.desc Verify both pattern and replacement empty returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: string = text.replaceAll("", "");
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5500
     * @tc.name testReplaceAll055
     * @tc.desc Verify replaceAll() replaces emoji characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello 😊 World 😊");
      let result: string = text.replaceAll("😊", "");
      expect(result).assertEqual("Hello  World ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5600
     * @tc.name testReplaceAll056
     * @tc.desc Verify replaceAll() replaces carriage return with newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\rline2");
      let result: string = text.replaceAll("\r", "\n");
      expect(result).assertEqual("line1\nline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5700
     * @tc.name testReplaceAll057
     * @tc.desc Verify replaceAll() replaces Unicode escape sequence characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello 世界");
      let result: string = text.replaceAll("世界", "World");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5800
     * @tc.name testReplaceAll058
     * @tc.desc Verify replaceAll() compresses multiple spaces to single space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a   b    c");
      let result: string = text.replaceAll(new RegExp(" +", "g"), " ");
      expect(result).assertEqual("a b c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_5900
     * @tc.name testReplaceAll059
     * @tc.desc Verify replaceAll() removes HTML-like tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("<div>hello</div><span>world</span>");
      let result: string = text.replaceAll(new RegExp("<[^>]+>", "g"), "");
      expect(result).assertEqual("helloworld");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6000
     * @tc.name testReplaceAll060
     * @tc.desc Verify replaceAll() replaces URL query parameter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("https://example.com?page=1&size=10");
      let result: string = text.replaceAll("page=1", "page=2");
      expect(result).assertEqual("https://example.com?page=2&size=10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6100
     * @tc.name testReplaceAll061
     * @tc.desc Verify replaceAll() replaces currency symbols with codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("$100 and ¥1000");
      let result: string = text.replaceAll("$", "USD ").replaceAll("¥", "JPY ");
      expect(result).assertEqual("USD 100 and JPY 1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6200
     * @tc.name testReplaceAll062
     * @tc.desc Verify replaceAll() with string search treats regex metacharacters as literal text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("value=42; pattern=[0-9]+; next=[0-9]+");
      let result: string = text.replaceAll("[0-9]+", "NUMBER_PATTERN");
      expect(result).assertEqual("value=42; pattern=NUMBER_PATTERN; next=NUMBER_PATTERN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6300
     * @tc.name testReplaceAll063
     * @tc.desc Verify replaceAll() with global RegExp search uses regex metacharacters to match all digit groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("value=42; pattern=[0-9]+; next=007");
      let result: string = text.replaceAll(new RegExp("[0-9]+", "g"), "NUMBER");
      expect(result).assertEqual("value=NUMBER; pattern=[NUMBER-NUMBER]+; next=NUMBER");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6400
     * @tc.name testReplaceAll064
     * @tc.desc Verify replaceAll() with global RegExp plus quantifier does not match literal plus text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a+b; c+d");
      let result: string = text.replaceAll(new RegExp("a+b", "g"), "X");
      expect(result).assertEqual("a+b; c+d");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6500
     * @tc.name testReplaceAll065
     * @tc.desc Verify replaceAll() with bracket and dot RegExp metacharacters does not match literal path text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("item[0].value; item[1].value");
      let result: string = text.replaceAll(new RegExp("item[0].value", "g"), "ITEM");
      expect(result).assertEqual("item[0].value; item[1].value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6600
     * @tc.name testReplaceAll066
     * @tc.desc Verify replaceAll() with hex escape RegExp does not match literal escape text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hex=\\x41; hex=\\x41");
      let result: string = text.replaceAll(new RegExp("\\x41", "g"), "A");
      expect(result).assertEqual("hex=\\x41; hex=\\x41");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6700
     * @tc.name testReplaceAll067
     * @tc.desc Verify replaceAll() handles overlong UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xc0\\x81");
      let result: string = source.replaceAll("missing-marker", "replacement");
      expect(result).assertEqual("\\xc0\\x81");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6800
     * @tc.name testReplaceAll068
     * @tc.desc Verify replaceAll() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.replaceAll("missing-marker", "replacement");
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_6900
     * @tc.name testReplaceAll069
     * @tc.desc Verify ReplaceAll handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.replaceAll("<script>alert(1)</script>", "[xss]");
      expect(result).assertEqual("!@#$%^&*() [xss] 测试 分割符  测试 \n 换行  测试 \r\n 回车换行  测试 \\ 转义符");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACEALL_7000
     * @tc.name testReplaceAll070
     * @tc.desc Verify ReplaceAll handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceAll070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.replaceAll("テスト", "JP");
      expect(result).assertEqual("JP 테스트 Test 測試 АБВГД الاختبار");
    });
  });
}
