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

export default function StringCompareToTest(): void {
  describe('StringCompareToTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0100
     * @tc.name testCompareTo001
     * @tc.desc Verify compareTo() returns 0 for equal ASCII strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new String("abc");
      const b1 = new String("abc");
      let result: int = a1.compareTo(b1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0200
     * @tc.name testCompareTo002
     * @tc.desc Verify compareTo() returns negative when this string is lexicographically before
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a2 = new String("abc");
      const b2 = new String("xyz");
      let result: int = a2.compareTo(b2);
      expect(result).assertEqual(-23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0300
     * @tc.name testCompareTo003
     * @tc.desc Verify compareTo() returns positive when this string is lexicographically after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a3 = new String("xyz");
      const b3 = new String("abc");
      let result: int = a3.compareTo(b3);
      expect(result).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0400
     * @tc.name testCompareTo004
     * @tc.desc Verify compareTo() with same prefix returns exact character difference at first mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a4 = new String("abc");
      const b4 = new String("abd");
      let result: int = a4.compareTo(b4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0500
     * @tc.name testCompareTo005
     * @tc.desc Verify compareTo() with empty string versus non-empty returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a5 = new String("");
      const b5 = new String("a");
      let result: int = a5.compareTo(b5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0600
     * @tc.name testCompareTo006
     * @tc.desc Verify compareTo() with two empty strings returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a6 = new String("");
      const b6 = new String("");
      let result: int = a6.compareTo(b6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0700
     * @tc.name testCompareTo007
     * @tc.desc Verify compareTo() with numeric strings uses lexicographic order not numeric order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a7 = new String("10");
      const b7 = new String("2");
      let result: int = a7.compareTo(b7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0800
     * @tc.name testCompareTo008
     * @tc.desc Verify compareTo() with uppercase versus lowercase returns exact code point difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a8 = new String("ABC");
      const b8 = new String("abc");
      let result: int = a8.compareTo(b8);
      expect(result).assertEqual(-32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_0900
     * @tc.name testCompareTo009
     * @tc.desc Verify compareTo() with identical CJK strings returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a9 = new String("你好");
      const b9 = new String("你好");
      let result: int = a9.compareTo(b9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1000
     * @tc.name testCompareTo010
     * @tc.desc Verify compareTo() with same prefix where this is shorter returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a10 = new String("abc");
      const b10 = new String("abcd");
      let result: int = a10.compareTo(b10);
      let lt: boolean = result < 0;
      expect(lt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1100
     * @tc.name testCompareTo011
     * @tc.desc Verify compareTo() with first character greater returns exact difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a11 = new String("b");
      const b11 = new String("a");
      let result: int = a11.compareTo(b11);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1200
     * @tc.name testCompareTo012
     * @tc.desc Verify compareTo() with emoji strings compares by code point order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a12 = new String("😀");
      const b12 = new String("🎉");
      let result: int = a12.compareTo(b12);
      let gt: boolean = result > 0;
      expect(gt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1300
     * @tc.name testCompareTo013
     * @tc.desc Verify compareTo() with CJK versus ASCII returns positive as CJK code point is higher
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a13 = new String("中");
      const b13 = new String("A");
      let result: int = a13.compareTo(b13);
      expect(result).assertEqual(19948);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1400
     * @tc.name testCompareTo014
     * @tc.desc Verify compareTo() lowercase versus uppercase returns exact difference 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a14 = new String("a");
      const b14 = new String("A");
      let result: int = a14.compareTo(b14);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1500
     * @tc.name testCompareTo015
     * @tc.desc Verify compareTo() with ISO 8859-1 Latin precomposed character versus ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a15 = new String("é");
      const b15 = new String("f");
      let result: int = a15.compareTo(b15);
      expect(result).assertEqual(131);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1600
     * @tc.name testCompareTo016
     * @tc.desc Verify compareTo() with GBK Chinese characters compares by Unicode code point order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a16 = new String("啊");
      const b16 = new String("吧");
      let result: int = a16.compareTo(b16);
      expect(result).assertEqual(291);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1700
     * @tc.name testCompareTo017
     * @tc.desc Verify compareTo() with itself returns 0 even when string is non-ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀中A");
      let result: int = text.compareTo(text);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1800
     * @tc.name testCompareTo018
     * @tc.desc Verify compareTo() with dynamic variables returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str1: String = new String("hello");
      const str2: String = new String("world");
      let result: int = str1.compareTo(str2);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_1900
     * @tc.name testCompareTo019
     * @tc.desc Verify compareTo() with tab versus space returns negative as tab code point is lower
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a17 = new String("\t");
      const b17 = new String(" ");
      let result: int = a17.compareTo(b17);
      expect(result).assertEqual(-23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2000
     * @tc.name testCompareTo020
     * @tc.desc Verify compareTo() with newline versus carriage return returns exact difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a18 = new String("\n");
      const b18 = new String("\r");
      let result: int = a18.compareTo(b18);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2100
     * @tc.name testCompareTo021
     * @tc.desc Verify compareTo() with null byte versus space returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a19 = new String("\0");
      const b19 = new String(" ");
      let result: int = a19.compareTo(b19);
      expect(result).assertEqual(-32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2200
     * @tc.name testCompareTo022
     * @tc.desc Verify compareTo() with same prefix then newline versus tab returns positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a20 = new String("a\n");
      const b20 = new String("a\t");
      let result: int = a20.compareTo(b20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2300
     * @tc.name testCompareTo023
     * @tc.desc Verify compareTo() for filename ordering: file10 vs file2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new String("file10.txt");
      const b1 = new String("file2.txt");
      let r1: int = a1.compareTo(b1);
      const a2 = new String("backup_01.zip");
      const b2 = new String("backup_02.zip");
      let r2: int = a2.compareTo(b2);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2400
     * @tc.name testCompareTo024
     * @tc.desc Verify compareTo() with time strings: lexical order across date boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new String("23:59:59");
      const b1 = new String("00:00:00");
      let r1: int = a1.compareTo(b1);
      const a2 = new String("2024-12-31");
      const b2 = new String("2025-01-01");
      let r2: int = a2.compareTo(b2);
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2500
     * @tc.name testCompareTo025
     * @tc.desc Verify compareTo() orders zero-width space after ASCII A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new String("\u200B");
      const right = new String("A");
      let result: int = left.compareTo(right);
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2600
     * @tc.name testCompareTo026
     * @tc.desc Verify compareTo() orders fullwidth dash after halfwidth dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new String("\u2014");
      const right = new String("-");
      let result: int = left.compareTo(right);
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2700
     * @tc.name testCompareTo027
     * @tc.desc Verify compareTo() returns zero for equal business date strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new String("2026-03-05");
      const right = new String("2026-03-05");
      let result: int = left.compareTo(right);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2800
     * @tc.name testCompareTo028
     * @tc.desc Verify compareTo() orders replacement character after ASCII question mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new String("\uFFFD");
      const right = new String("?");
      let result: int = left.compareTo(right);
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_2900
     * @tc.name testCompareTo029
     * @tc.desc Verify compareTo() orders Arabic text after ASCII text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new String("\u0627");
      const right = new String("z");
      let result: int = left.compareTo(right);
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_3000
     * @tc.name testCompareTo030
     * @tc.desc Verify compareTo() orders CR before LF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new String("\r");
      const right = new String("\n");
      let result: int = left.compareTo(right);
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_3100
     * @tc.name testCompareTo031
     * @tc.desc Verify CompareTo handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const source = new String(expected);
      let result: int = source.compareTo(new String(expected));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO_3200
     * @tc.name testCompareTo032
     * @tc.desc Verify CompareTo handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCompareTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const source = new String(expected);
      let result: int = source.compareTo(new String(expected));
      expect(result).assertEqual(0);
    });
  });
}
