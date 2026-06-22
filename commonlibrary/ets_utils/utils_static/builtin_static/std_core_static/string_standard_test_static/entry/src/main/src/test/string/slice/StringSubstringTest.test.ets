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

export default function StringSubstringTest(): void {
  describe('StringSubstringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0100
     * @tc.name testSubstring001
     * @tc.desc Verify substring() extracts from start to end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.substring(0, 3);
      expect(result.toString()).assertEqual("Ark");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0200
     * @tc.name testSubstring002
     * @tc.desc Verify substring() without end index extracts to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.substring(3);
      expect(result.toString()).assertEqual("TS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0300
     * @tc.name testSubstring003
     * @tc.desc Verify substring() with start equals end returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.substring(3, 3);
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0400
     * @tc.name testSubstring004
     * @tc.desc Verify substring() with emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab😀cd");
      let result: String = text.substring(0, 4);
      expect(result.toString()).assertEqual("ab😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0500
     * @tc.name testSubstring005
     * @tc.desc Verify substring() with BOM character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A﻿B");
      let result: String = text.substring(1, 3);
      expect(result.getLength()).assertEqual(2);
      expect(result.toString().charCodeAt(1)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0600
     * @tc.name testSubstring006
     * @tc.desc Verify substring(0, length) returns full string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: String = text.substring(0, text.length);
      expect(result.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0700
     * @tc.name testSubstring007
     * @tc.desc Verify substring() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      let result: String = text.substring(0, 2);
      expect(result.toString()).assertEqual("你好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0800
     * @tc.name testSubstring008
     * @tc.desc Verify substring() swaps start and end when start > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEF");
      let result: String = text.substring(4, 1);
      expect(result.toString()).assertEqual("BCD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_0900
     * @tc.name testSubstring009
     * @tc.desc Verify substring() with start exceeding length returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.substring(5);
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1000
     * @tc.name testSubstring010
     * @tc.desc Verify substring(0,1) extracts first character at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: String = text.substring(0, 1);
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1100
     * @tc.name testSubstring011
     * @tc.desc Verify substring(2,4) extracts middle section
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEF");
      let result: String = text.substring(2, 4);
      expect(result.toString()).assertEqual("CD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1200
     * @tc.name testSubstring012
     * @tc.desc Verify substring(len-2) extracts last two characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: String = text.substring(text.length - 2);
      expect(result.toString()).assertEqual("DE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1300
     * @tc.name testSubstring013
     * @tc.desc Verify substring(0,100) with end beyond length truncates to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.substring(0, 100);
      expect(result.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1400
     * @tc.name testSubstring014
     * @tc.desc Verify substring(3,0) swaps to extract from position 0 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: String = text.substring(3, 0);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1500
     * @tc.name testSubstring015
     * @tc.desc Verify substring() across emoji surrogate pair boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B");
      let result: String = text.substring(0, 2);
      expect(result.getLength()).assertEqual(2);
      expect(result.toString().charCodeAt(0)).assertEqual(65);
      expect(result.toString().charCodeAt(1)).assertEqual(0xD83D);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1600
     * @tc.name testSubstring016
     * @tc.desc Verify substring() splits combining character sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: String = text.substring(0, 1);
      expect(result.toString()).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1700
     * @tc.name testSubstring017
     * @tc.desc Verify substring() on GBK-misdecoded garbled text preserves code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb\tc");
      let result: String = text.substring(1, 3);
      expect(result.toString()).assertEqual("\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1800
     * @tc.name testSubstring018
     * @tc.desc Verify substring() on text with replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A�B�C");
      let result: String = text.substring(0, 3);
      expect(result.toString()).assertEqual("A�B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_1900
     * @tc.name testSubstring019
     * @tc.desc Verify substring(0,1) on emoji returns high surrogate half only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: String = text.substring(0, 1);
      expect(result.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2000
     * @tc.name testSubstring020
     * @tc.desc Verify substring() treats full-width CJK as single code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: String = text.substring(0, 2);
      expect(result.toString()).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2100
     * @tc.name testSubstring021
     * @tc.desc Verify substring() on ISO 8859-1 Latin text extracts accented characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("caféau");
      let result: String = text.substring(3, 5);
      expect(result.toString()).assertEqual("éa");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2200
     * @tc.name testSubstring022
     * @tc.desc Verify substring() with negative start index is coerced to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: String = text.substring(-3, 2);
      expect(result.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2300
     * @tc.name testSubstring023
     * @tc.desc Verify substring() with negative end index swaps start/end and returns "A"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: String = text.substring(1, -2);
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2400
     * @tc.name testSubstring024
     * @tc.desc Verify substring() with dynamic start and end variables extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let start: int = 4;
      let end: int = 10;
      let result: String = text.substring(start, end);
      expect(result.toString()).assertEqual("Script");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2500
     * @tc.name testSubstring025
     * @tc.desc Verify substring() with lastIndexOf to extract file extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const filename = new String("document.pdf");
      let dotIdx: int = filename.lastIndexOf(".");
      let ext: string = filename.substring(dotIdx + 1);
      expect(ext).assertEqual("pdf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2600
     * @tc.name testSubstring026
     * @tc.desc Verify chaining substring() with toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.substring(0, 5).toUpperCase();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2700
     * @tc.name testSubstring027
     * @tc.desc Verify substring() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let result: string = text.substring(0, 5);
      expect(text.toString()).assertEqual("Hello World");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2800
     * @tc.name testSubstring028
     * @tc.desc Verify substring() for date year extraction pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2024-06-10");
      let year: string = text.substring(0, 4);
      let month: string = text.substring(5, 7);
      let day: string = text.substring(8, 10);
      expect(year).assertEqual("2024");
      expect(month).assertEqual("06");
      expect(day).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_2900
     * @tc.name testSubstring029
     * @tc.desc Verify substring() for phone number masking pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("13812345678");
      let prefix: string = text.substring(0, 3);
      let suffix: string = text.substring(7, 11);
      let masked: string = prefix + "****" + suffix;
      expect(masked).assertEqual("138****5678");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3000
     * @tc.name testSubstring030
     * @tc.desc Verify substring() removes known prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("prefix_data_value");
      let data: string = text.substring(7);
      expect(data).assertEqual("data_value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3100
     * @tc.name testSubstring031
     * @tc.desc Verify nested substring() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let first: string = text.substring(0, 7);
      let second: string = first.substring(1, 4);
      expect(second).assertEqual("ell");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3200
     * @tc.name testSubstring032
     * @tc.desc Verify substring() extracts a range across mixed character sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u4E2D\u0391\u0410\u0627\u05D0Z");
      let result: string = text.substring(1, 6);
      expect(result).assertEqual("\u4E2D\u0391\u0410\u0627\u05D0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3300
     * @tc.name testSubstring033
     * @tc.desc Verify substring() handles mixed text with literal Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("test \\u4e2d\\u6587");
      let result: string = source.substring(0, source.length);
      expect(result).assertEqual("test \\u4e2d\\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3400
     * @tc.name testSubstring034
     * @tc.desc Verify substring() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: string = source.substring(0, source.length);
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3500
     * @tc.name testSubstring035
     * @tc.desc Verify Substring handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.substring(0, 10);
      expect(result).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTRING_3600
     * @tc.name testSubstring036
     * @tc.desc Verify Substring handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstring036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.substring(0, 3);
      expect(result).assertEqual("テスト");
    });
  });
}
