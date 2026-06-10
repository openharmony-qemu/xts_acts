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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringReplaceTest(): void {
  describe('StringReplaceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0100
     * @tc.name testReplace001
     * @tc.desc Verify replace() replaces first occurrence of search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let result: string = text.replace("Ark", "Static");
      expect(result).assertEqual("StaticTS ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0200
     * @tc.name testReplace002
     * @tc.desc Verify replace() with not-found string returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.replace("XYZ", "ABC");
      expect(result).assertEqual("ArkTS");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0300
     * @tc.name testReplace003
     * @tc.desc Verify replaceAll() replaces all occurrences of search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let result: string = text.replaceAll("Ark", "Static");
      expect(result).assertEqual("StaticTS StaticTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0400
     * @tc.name testReplace004
     * @tc.desc Verify replaceAll() with not-found string returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.replaceAll("XYZ", "ABC");
      expect(result).assertEqual("ArkTS");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0600
     * @tc.name testReplace005
     * @tc.desc Verify replace() with empty search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.replace("", "X");
      expect(result).assertEqual("XArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0700
     * @tc.name testReplace006
     * @tc.desc Verify replace() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      let result: string = text.replace("世界", "ArkTS");
      expect(result).assertEqual("你好ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_0900
     * @tc.name testReplace007
     * @tc.desc Verify replace() with emoji replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.replace("world", "😀");
      expect(result).assertEqual("hello 😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_800
     * @tc.name testReplace008
     * @tc.desc Verify replaceAll() with carriage return \\r
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\rb\rc");
      let result: string = text.replaceAll("\r", "|");
      expect(result).assertEqual("a|b|c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_500
     * @tc.name testReplace009
     * @tc.desc Verify replace() with combining character target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: string = text.replace("é", "e");
      expect(result).assertEqual("cafe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_800
     * @tc.name testReplace010
     * @tc.desc Verify replaceAll() with BOM character U+FEFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("﻿A﻿");
      let result: string = text.replaceAll("﻿", "");
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace011
     * @tc.desc Verify replace() with vertical tab \\v target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\vb");
      let result: string = text.replace("\v", "|");
      expect(result).assertEqual("a|b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_800
     * @tc.name testReplace012
     * @tc.desc Verify replace() at the beginning of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCdefABC");
      let result: string = text.replace("ABC", "XYZ");
      expect(result).assertEqual("XYZdefABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace013
     * @tc.desc Verify replace() at the end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("startXYZend");
      let result: string = text.replace("end", "FINISH");
      expect(result).assertEqual("startXYZFINISH");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_800
     * @tc.name testReplace014
     * @tc.desc Verify replace() in the middle of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AAABBBCCC");
      let result: string = text.replace("BBB", "DDD");
      expect(result).assertEqual("AAADDDCCC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace015
     * @tc.desc Verify replace() with numeric substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("order-12345-done");
      let result: string = text.replace("12345", "67890");
      expect(result).assertEqual("order-67890-done");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace016
     * @tc.desc Verify replace() with date format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("date:2026-06-08,time:10:30");
      let result: string = text.replace("2026-06-08", "2026-12-31");
      expect(result).assertEqual("date:2026-12-31,time:10:30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace017
     * @tc.desc Verify replaceAll() with pattern appearing at start, middle and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("XaXbXcX");
      let result: string = text.replaceAll("X", "0");
      expect(result).assertEqual("0a0b0c0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace018
     * @tc.desc Verify replace() matching entire string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.replace("hello", "world");
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace019
     * @tc.desc Verify replace() with replacement longer than target (expansion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a-b-c");
      let result: string = text.replace("-", "____");
      expect(result).assertEqual("a____b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace020
     * @tc.desc Verify replace() with replacement shorter than target (contraction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a____b");
      let result: string = text.replace("____", "-");
      expect(result).assertEqual("a-b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace021
     * @tc.desc Verify replaceAll() replacing all digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("tel:13800138000");
      let result: string = text.replace("13800138000", "13900139000");
      expect(result).assertEqual("tel:13900139000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace022
     * @tc.desc Verify replace() with same value replacement (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("unchanged");
      let result: string = text.replace("unchanged", "unchanged");
      expect(result).assertEqual("unchanged");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_2300
     * @tc.name testReplace023
     * @tc.desc Verify replaceAll() removing all occurrences of a character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c,d,e");
      let result: string = text.replaceAll(",", "");
      expect(result).assertEqual("abcde");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_2400
     * @tc.name testReplace024
     * @tc.desc Verify replace() with RegExp pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123def");
      let result: string = text.replace(new RegExp("[0-9]+"), "NUM");
      expect(result).assertEqual("abcNUMdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace025
     * @tc.desc Verify replaceAll() with RegExp pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let result: string = text.replaceAll(new RegExp("[0-9]", "g"), "X");
      expect(result).assertEqual("aXbXcX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace026
     * @tc.desc Verify replace() with literal dot character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("file.txt");
      let result: string = text.replace(".", "_");
      expect(result).assertEqual("file_txt");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_2300
     * @tc.name testReplace027
     * @tc.desc Verify replaceAll() with asterisk wildcard character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a*b*c");
      let result: string = text.replaceAll("*", "+");
      expect(result).assertEqual("a+b+c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_2400
     * @tc.name testReplace028
     * @tc.desc Verify replaceAll() with tab and newline sequence replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2\ncol3");
      let result: string = text.replaceAll("\t", ",");
      let result2: string = result.replaceAll("\n", ";");
      expect(result2).assertEqual("col1,col2;col3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace029
     * @tc.desc Verify replaceAll() deleting all spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a b c d e");
      let result: string = text.replaceAll(" ", "");
      expect(result).assertEqual("abcde");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace030
     * @tc.desc Verify replace() with RegExp matching multiple digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price:100,year:2026");
      let result: string = text.replace(new RegExp("[0-9]+"), "#");
      expect(result).assertEqual("price:#,year:2026");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_2300
     * @tc.name testReplace031
     * @tc.desc Verify replace() with question mark character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("done?maybe");
      let result: string = text.replace("?", "!");
      expect(result).assertEqual("done!maybe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_2400
     * @tc.name testReplace032
     * @tc.desc Verify replaceAll() with underscore to space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("snake_case_name");
      let result: string = text.replaceAll("_", " ");
      expect(result).assertEqual("snake case name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace033
     * @tc.desc Verify replaceAll() with RegExp removing all non-digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("tel:138-0013-8000");
      let result: string = text.replaceAll(new RegExp("[^0-9]", "g"), "");
      expect(result).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace034
     * @tc.desc Verify replace() with backslash character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("path\\to\\file");
      let result: string = text.replace("\\", "/");
      expect(result).assertEqual("path/to\\file");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace035
     * @tc.desc Verify replaceAll() with square bracket characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("[tag]content[/tag]");
      let r1: string = text.replaceAll("[", "<");
      let result: string = r1.replaceAll("]", ">");
      expect(result).assertEqual("<tag>content</tag>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace036
     * @tc.desc Verify replace() with dollar sign in replacement string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price:100");
      let result: string = text.replace("100", "$100");
      expect(result).assertEqual("price:$100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace037
     * @tc.desc Verify replace() with caret and pipe characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a^b|c");
      let r1: string = text.replace("^", "X");
      let result: string = r1.replace("|", "Y");
      expect(result).assertEqual("aXbYc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace038
     * @tc.desc Verify replace() with GBK Chinese text replaces correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试中文");
      let result: string = text.replace("测试", "考试");
      expect(result).assertEqual("中文考试中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace039
     * @tc.desc Verify replace() with dynamic search and replacement variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let search: string = "world";
      let replacement: string = "ArkTS";
      let result: string = text.replace(search, replacement);
      expect(result).assertEqual("hello ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace040
     * @tc.desc Verify replace() with RegExp dot wildcard matches any single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcXdef");
      let result: string = text.replace(new RegExp("c.d"), "C-D");
      expect(result).assertEqual("abC-Def");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace041
     * @tc.desc Verify replace() with RegExp start anchor ^ matches only at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let result: string = text.replace(new RegExp("^abc"), "XYZ");
      expect(result).assertEqual("XYZabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace042
     * @tc.desc Verify replace() with RegExp end anchor $ matches only at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let result: string = text.replace(new RegExp("abc$"), "XYZ");
      expect(result).assertEqual("abcXYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace043
     * @tc.desc Verify replace() with RegExp alternation pipe matches first alternative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.replace(new RegExp("hello|world"), "REPL");
      expect(result).assertEqual("REPL world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace044
     * @tc.desc Verify replace() with string pattern and replacer Function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1 b2 c3");
      let result: string = text.replace(new RegExp("[0-9]+", "g"), (match: string): string => {
        return "[" + match + "]";
      });
      expect(result).assertEqual("a[1] b[2] c[3]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace045
     * @tc.desc Verify $& references the entire matched substring in replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.replace("ll", "[$&]");
      expect(result).assertEqual("he[ll]o");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace046
     * @tc.desc Verify $n references capture groups in replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.replace(new RegExp("(\\w+) (\\w+)"), "$2 $1");
      expect(result).assertEqual("world hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace047
     * @tc.desc Verify replace() only replaces first occurrence, unlike replaceAll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aaa");
      let r1: string = text.replace("a", "b");
      let r2: string = text.replaceAll("a", "b");
      expect(r1).assertEqual("baa");
      expect(r2).assertEqual("bbb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace048
     * @tc.desc Verify replace() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.replace("h", "H");
      expect(text.toString()).assertEqual("hello");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace049
     * @tc.desc Verify replace() compresses multiple spaces to single space with regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a   b    c");
      let result: string = text.replace(new RegExp(" +", "g"), " ");
      expect(result).assertEqual("a b c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace050
     * @tc.desc Verify replace() converts camelCase to kebab-case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("camelCaseString");
      let result: string = text.replace(new RegExp("([A-Z])", "g"), "-$1").toLowerCase();
      expect(result).assertEqual("camel-case-string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace051
     * @tc.desc Verify replace() keeps only alphanumeric characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello, World! 123");
      let result: string = text.replace(new RegExp("[^a-zA-Z0-9]", "g"), "");
      expect(result).assertEqual("HelloWorld123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace052
     * @tc.desc Verify replace() converts date format YYYY-MM-DD to DD/MM/YYYY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2021-12-25");
      let result: string = text.replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"), "$3/$2/$1");
      expect(result).assertEqual("25/12/2021");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace053
     * @tc.desc Verify replace() returns string type even for no-match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.replace("xyz", "abc");
      expect(typeof result).assertEqual("string");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace054
     * @tc.desc Verify replace() with m flag: ^ matches start of each line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\nline3");
      let result: string = text.replace(new RegExp("^", "gm"), "> ");
      expect(result).assertEqual("> line1\n> line2\n> line3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace055
     * @tc.desc Verify replace() converts kebab-case to camelCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("kebab-case-string");
      let result: string = text.replace(new RegExp("-([a-z])", "g"), (match: string, captures: Array<Object>): string => {
        return (captures[0] as string).toUpperCase();
      });
      expect(result).assertEqual("kebabCaseString");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace056
     * @tc.desc Verify replace() masks middle 4 digits of a phone-like number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("13812345678");
      let result: string = text.replace(new RegExp("(\\d{3})\\d{4}(\\d{4})"), "$1****$2");
      expect(result).assertEqual("138****5678");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace057
     * @tc.desc Verify replace() normalizes different newline formats to \\n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\r\nline2\rline3");
      let result: string = text.replace(new RegExp("\r\n", "g"), "\n").replace(new RegExp("\r", "g"), "\n");
      expect(result).assertEqual("line1\nline2\nline3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace058
     * @tc.desc Verify replace() on string with only spaces returns original when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      let result: string = text.replace("x", "y");
      expect(result).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace059
     * @tc.desc Verify replace() with very long string does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(10000));
      let result: string = text.replace("a", "b");
      expect(result.length).assertEqual(10000);
      expect(String(result.charAt(1))).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace060
     * @tc.desc Verify replace() with s flag: dot matches newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb\nc");
      let result: string = text.replace(new RegExp("a.b", "s"), "X");
      expect(result).assertEqual("X\nc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace061
     * @tc.desc Verify replace() for template variable substitution: {{key}} → value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello {{name}}, your score is {{score}}");
      let result: string = text.replace("{{name}}", "Alice").replace("{{score}}", "95");
      expect(result).assertEqual("Hello Alice, your score is 95");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_800
     * @tc.name testReplace062
     * @tc.desc Verify replace() converts snake_case to camelCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("snake_case_string");
      let result: string = text.replace(new RegExp("_([a-z])", "g"), (_m: string, caps: Array<Object>): string => {
        return (caps[0] as string).toUpperCase();
      });
      expect(result).assertEqual("snakeCaseString");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2300
     * @tc.name testReplace063
     * @tc.desc Verify replace() handles string with only special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!@#$%");
      let result: string = text.replace("#", "X");
      expect(result).assertEqual("!@X$%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_2400
     * @tc.name testReplace064
     * @tc.desc Verify chaining multiple replace() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a-b-c");
      let result: string = text.replace("a", "A").replace("b", "B").replace("c", "C");
      expect(result).assertEqual("A-B-C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_500
     * @tc.name testReplace065
     * @tc.desc Verify replace escape characters: tab to space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplace065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2\tcol3");
      let result: string = text.replace(new RegExp("\t", "g"), "    ");
      expect(result).assertEqual("col1    col2    col3");
    });
  });
}
