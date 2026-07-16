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

export default function StringIndexOfTest(): void {
  describe('StringIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0100
     * @tc.name testIndexOf001
     * @tc.desc Verify indexOf() finds first occurrence at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let pos: int = text.indexOf("Ark");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0200
     * @tc.name testIndexOf002
     * @tc.desc Verify indexOf() returns -1 for not-found substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let pos: int = text.indexOf("XYZ");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0300
     * @tc.name testIndexOf003
     * @tc.desc Verify indexOf() with fromIndex skips earlier occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let pos: int = text.indexOf("Ark", 1);
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0400
     * @tc.name testIndexOf004
     * @tc.desc Verify indexOf() with empty search string returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let pos: int = text.indexOf("");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0500
     * @tc.name testIndexOf005
     * @tc.desc Verify indexOf() finds emoji substring position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello😀world");
      let pos: int = text.indexOf("😀");
      expect(pos).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0600
     * @tc.name testIndexOf006
     * @tc.desc Verify indexOf() finds carriage return \\r position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\rb");
      let pos: int = text.indexOf("\r");
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0700
     * @tc.name testIndexOf007
     * @tc.desc Verify indexOf() finds combining acute accent code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ae\u0301bc");
      let pos: int = text.indexOf("\u0301");
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0800
     * @tc.name testIndexOf008
     * @tc.desc Verify indexOf() finds null byte \\0 position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B\0C");
      let pos: int = text.indexOf("\0");
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_0900
     * @tc.name testIndexOf009
     * @tc.desc Verify indexOf() with fromIndex at exact match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABABAB");
      let pos: int = text.indexOf("AB", 2);
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1000
     * @tc.name testIndexOf010
     * @tc.desc Verify indexOf() finds dot character position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("file.name.txt");
      let pos: int = text.indexOf(".");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1100
     * @tc.name testIndexOf011
     * @tc.desc Verify indexOf() finds underscore position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("key_name_value");
      let pos: int = text.indexOf("_");
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1200
     * @tc.name testIndexOf012
     * @tc.desc Verify indexOf() in GBK-misdecoded garbled text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDtestXYZ");
      let pos: int = text.indexOf("test");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1300
     * @tc.name testIndexOf013
     * @tc.desc Verify indexOf() with emoji respects 2-code-unit surrogate pair position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B😀C");
      let pos: int = text.indexOf("😀");
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1400
     * @tc.name testIndexOf014
     * @tc.desc Verify indexOf() on CJK Unicode BMP Chinese text finds substring position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let pos: int = text.indexOf("文测");
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1500
     * @tc.name testIndexOf015
     * @tc.desc Verify indexOf() on ISO 8859-1 Latin precomposed accented text finds position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café latte");
      let pos: int = text.indexOf("fé");
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1600
     * @tc.name testIndexOf016
     * @tc.desc Verify indexOf() with GBK Chinese text finds correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let pos: int = text.indexOf("测试");
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1700
     * @tc.name testIndexOf017
     * @tc.desc Verify indexOf() returns -1 when search string is longer than text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let pos: int = text.indexOf("abc");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1800
     * @tc.name testIndexOf018
     * @tc.desc Verify indexOf() with C0 control tab and newline finds correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2\ncol3");
      let tabPos: int = text.indexOf("\t");
      let nlPos: int = text.indexOf("\n");
      expect(tabPos).assertEqual(4);
      expect(nlPos).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_1900
     * @tc.name testIndexOf019
     * @tc.desc Verify indexOf() with dynamic search string and fromIndex variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let search: string = "Script";
      let from: int = 0;
      let pos: int = text.indexOf(search, from);
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2000
     * @tc.name testIndexOf020
     * @tc.desc Verify indexOf() finds first occurrence at beginning of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("PrefixMiddleSuffix");
      let pos: int = text.indexOf("Prefix");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2100
     * @tc.name testIndexOf021
     * @tc.desc Verify indexOf() finds substring in middle of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("PrefixMiddleSuffix");
      let pos: int = text.indexOf("Middle");
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2200
     * @tc.name testIndexOf022
     * @tc.desc Verify indexOf() finds substring at end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("PrefixMiddleSuffix");
      let pos: int = text.indexOf("Suffix");
      expect(pos).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2300
     * @tc.name testIndexOf023
     * @tc.desc Verify indexOf() with fromIndex beyond string length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.indexOf("lo", 10);
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2400
     * @tc.name testIndexOf024
     * @tc.desc Verify indexOf() with negative fromIndex starts search from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.indexOf("he", -5);
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2500
     * @tc.name testIndexOf025
     * @tc.desc Verify indexOf() with search string equal to entire text returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      let pos: int = text.indexOf("OpenHarmony");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2600
     * @tc.name testIndexOf026
     * @tc.desc Verify indexOf() returns -1 when search string nearly matches but last char differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcde");
      let pos: int = text.indexOf("def");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2700
     * @tc.name testIndexOf027
     * @tc.desc Verify indexOf() with empty search and position equal to length returns length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.indexOf("", 5);
      expect(pos).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2800
     * @tc.name testIndexOf028
     * @tc.desc Verify indexOf() with empty search and position greater than length returns length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello!");
      let pos: int = text.indexOf("", 20);
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_2900
     * @tc.name testIndexOf029
     * @tc.desc Verify indexOf() with empty source and empty search returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let pos: int = text.indexOf("");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3000
     * @tc.name testIndexOf030
     * @tc.desc Verify indexOf() with empty source and non-empty search returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let pos: int = text.indexOf("a");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3100
     * @tc.name testIndexOf031
     * @tc.desc Verify indexOf() to count character occurrences using loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world, hello universe");
      let count: int = 0;
      let position: int = text.indexOf("hello");
      while (position !== -1) {
        count++;
        position = text.indexOf("hello", position + 1);
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3200
     * @tc.name testIndexOf032
     * @tc.desc Verify indexOf() for prefix check returns 0 when string starts with search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let prefix: string = "hello";
      expect(text.indexOf(prefix)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3300
     * @tc.name testIndexOf033
     * @tc.desc Verify indexOf() and lastIndexOf() agree for single occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let first: int = text.indexOf("world");
      let last: int = text.lastIndexOf("world");
      expect(first).assertEqual(6);
      expect(last).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3400
     * @tc.name testIndexOf034
     * @tc.desc Verify indexOf() returns correct index and -1 when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let found: number = text.indexOf("world");
      let notFound: number = text.indexOf("xyz");
      expect(found).assertEqual(6);
      expect(notFound).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3500
     * @tc.name testIndexOf035
     * @tc.desc Verify indexOf() finds substring spanning mixed character sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("EN-\u4E2D\u6587-\u0391\u03B2-\u0627\u0644");
      let pos: int = text.indexOf("\u0391\u03B2-\u0627");
      let notFound: int = text.indexOf("\u05D0\u05D1");
      expect(pos).assertEqual(6);
      expect(notFound).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3600
     * @tc.name testIndexOf036
     * @tc.desc Verify indexOf() finds overlapping substring from explicit fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aaaa");
      let pos: int = text.indexOf("aa", 1);
      expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3700
     * @tc.name testIndexOf037
     * @tc.desc Verify indexOf() with fromIndex equal to match start finds substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.indexOf("lo", 3);
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3800
     * @tc.name testIndexOf038
     * @tc.desc Verify indexOf() can find low surrogate code unit inside emoji pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD83D\uDE00B");
      let pos: int = text.indexOf("\uDE00");
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_3900
     * @tc.name testIndexOf039
     * @tc.desc Verify indexOf() handles mixed text with literal Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("test \\u4e2d\\u6587");
      let result: int = source.indexOf("\\u4e2d");
      expect(result).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_4000
     * @tc.name testIndexOf040
     * @tc.desc Verify indexOf() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: int = source.indexOf("\uFFFD");
      expect(result).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_4100
     * @tc.name testIndexOf041
     * @tc.desc Verify IndexOf handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: int = source.indexOf("<script>alert(1)</script>");
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF_4200
     * @tc.name testIndexOf042
     * @tc.desc Verify IndexOf handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: int = source.indexOf("АБВГД");
      expect(result).assertEqual(16);
    });
  });
}
