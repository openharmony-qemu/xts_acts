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

export default function StringPadEndTest(): void {
  describe('StringPadEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0100
     * @tc.name testPadEnd001
     * @tc.desc Verify padEnd() pads ASCII string to target length with single char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padEnd(3, "0");
      expect(result).assertEqual("A00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0200
     * @tc.name testPadEnd002
     * @tc.desc Verify padEnd() when target equals length returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.padEnd(3, "X");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0300
     * @tc.name testPadEnd003
     * @tc.desc Verify padEnd() repeats multi-char pad string to fill target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padEnd(4, "bc");
      expect(result).assertEqual("Abcb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0400
     * @tc.name testPadEnd004
     * @tc.desc Verify padEnd() with emoji pad string pads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padEnd(3, "😀");
      expect(result).assertEqual("A😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0500
     * @tc.name testPadEnd005
     * @tc.desc Verify padEnd() when targetLength is shorter than string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.padEnd(3, "0");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0600
     * @tc.name testPadEnd006
     * @tc.desc Verify padEnd() with CJK Unicode BMP pad string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padEnd(3, "中");
      expect(result).assertEqual("A中中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0700
     * @tc.name testPadEnd007
     * @tc.desc Verify padEnd() with empty pad string uses space as default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padEnd(5);
      expect(result).assertEqual("AB   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0800
     * @tc.name testPadEnd008
     * @tc.desc Verify padEnd() with GBK Chinese text pads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let result: string = text.padEnd(4, "！");
      expect(result).assertEqual("中文！！");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_0900
     * @tc.name testPadEnd009
     * @tc.desc Verify padEnd() with dynamic targetLength and padString variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let target: int = 4;
      let pad: string = "-";
      let result: string = text.padEnd(target, pad);
      expect(result).assertEqual("X---");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1000
     * @tc.name testPadEnd010
     * @tc.desc Verify padEnd() with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let result: string = text.padEnd(-1, "0");
      expect(result).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1100
     * @tc.name testPadEnd011
     * @tc.desc Verify padEnd() with targetLength 0 returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.padEnd(0, "X");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1200
     * @tc.name testPadEnd012
     * @tc.desc Verify padEnd() truncates long padString to fit target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padEnd(4, "BCDEFG");
      expect(result).assertEqual("ABCD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1300
     * @tc.name testPadEnd013
     * @tc.desc Verify padEnd() for ID zero-filling pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let result: string = text.padEnd(5, "0");
      expect(result).assertEqual("42000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1400
     * @tc.name testPadEnd014
     * @tc.desc Verify padEnd() combined with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.toUpperCase().padEnd(8, "!");
      // toUpperCase returns String object in ArkTS, padEnd returns primitive string
      expect(result).assertEqual("HELLO!!!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1500
     * @tc.name testPadEnd015
     * @tc.desc Verify padEnd() result starts with original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("data");
      let result: string = text.padEnd(10, ".");
      let prefix: string = result.substring(0, 4);
      expect(prefix).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1600
     * @tc.name testPadEnd016
     * @tc.desc Verify padEnd() on empty string creates padding-only result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.padEnd(3, "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1700
     * @tc.name testPadEnd017
     * @tc.desc Verify padEnd() result length equals targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padEnd(5, "0");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1800
     * @tc.name testPadEnd018
     * @tc.desc Verify padEnd() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padEnd(5, "0");
      expect(text.toString()).assertEqual("AB");
      expect(result).assertEqual("AB000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_1900
     * @tc.name testPadEnd019
     * @tc.desc Verify padEnd() with large targetLength pads to requested length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padEnd(100, "0");
      expect(result.length).assertEqual(100);
      expect(result.startsWith("AB")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2000
     * @tc.name testPadEnd020
     * @tc.desc Verify padEnd() for table column alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const col1 = new String("Name");
      const col2 = new String("Score");
      let row: string = col1.padEnd(10, " ") + col2.padEnd(8, " ");
      expect(row.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2100
     * @tc.name testPadEnd021
     * @tc.desc Verify padEnd() for progress bar pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bar = new String("#");
      let progress: string = bar.padEnd(10, "#");
      expect(progress).assertEqual("##########");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2200
     * @tc.name testPadEnd022
     * @tc.desc Verify padEnd() for log level alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level = new String("ERROR");
      let formatted: string = level.padEnd(8, " ");
      expect(formatted).assertEqual("ERROR   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2300
     * @tc.name testPadEnd023
     * @tc.desc Verify padEnd() with single space default pad
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("left");
      let result: string = text.padEnd(10);
      expect(result).assertEqual("left      ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2400
     * @tc.name testPadEnd024
     * @tc.desc Verify padEnd pads business date string with spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: string = text.padEnd(12, " ");
      expect(result).assertEqual("2026-03-05  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2500
     * @tc.name testPadEnd025
     * @tc.desc Verify padEnd pads hexadecimal-looking string with zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: string = text.padEnd(7, "0");
      expect(result).assertEqual("0x12300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2600
     * @tc.name testPadEnd026
     * @tc.desc Verify padEnd pads email string only when target is longer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: string = text.padEnd(18, ".");
      expect(result.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2700
     * @tc.name testPadEnd027
     * @tc.desc Verify padEnd with zero-width pad string uses it as content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padEnd(3, "\u200B");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2800
     * @tc.name testPadEnd028
     * @tc.desc Verify padEnd pads binary-looking string with underscore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0b1010");
      let result: string = text.padEnd(8, "_");
      expect(result).assertEqual("0b1010__");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_2900
     * @tc.name testPadEnd029
     * @tc.desc Verify padEnd keeps CJK source content before padding boundary check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: string = text.padEnd(4, "*");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_3000
     * @tc.name testPadEnd030
     * @tc.desc Verify padEnd pads scientific-notation-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let result: string = text.padEnd(10, " ");
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_3100
     * @tc.name testPadEnd031
     * @tc.desc Verify padEnd() handles isolated low surrogate U+DC04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uDC04");
      let result: string = source.padEnd(source.length, "#");
      expect(result).assertEqual("\uDC04");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_3200
     * @tc.name testPadEnd032
     * @tc.desc Verify PadEnd handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.padEnd(source.length + 2, "!");
      expect(result).assertEqual(source.toString() + "!!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND_3300
     * @tc.name testPadEnd033
     * @tc.desc Verify PadEnd handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadEnd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.padEnd(source.length + 1, "!");
      expect(result).assertEqual(source.toString() + "!");
    });
  });
}
