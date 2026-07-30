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

export default function StringPadStartTest(): void {
  describe('StringPadStartTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0100
     * @tc.name testPadStart001
     * @tc.desc Verify padStart() pads ASCII string to target length with single char at beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(3, "0");
      expect(result).assertEqual("00A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0200
     * @tc.name testPadStart002
     * @tc.desc Verify padStart() when target equals length returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.padStart(3, "0");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0300
     * @tc.name testPadStart003
     * @tc.desc Verify padStart() when targetLength is shorter than string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.padStart(3, "0");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0400
     * @tc.name testPadStart004
     * @tc.desc Verify padStart() with default space padding when padString omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(3);
      expect(result).assertEqual("  A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0500
     * @tc.name testPadStart005
     * @tc.desc Verify padStart() with emoji pad string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("B");
      let result: string = text.padStart(3, "😀");
      expect(result).assertEqual("😀B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0600
     * @tc.name testPadStart006
     * @tc.desc Verify padStart() with CJK Unicode BMP pad string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let result: string = text.padStart(3, "中");
      expect(result).assertEqual("中中X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0700
     * @tc.name testPadStart007
     * @tc.desc Verify padStart() with GBK Chinese text pads correctly at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let result: string = text.padStart(4, "！");
      expect(result).assertEqual("！！中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0800
     * @tc.name testPadStart008
     * @tc.desc Verify padStart() with multi-char pad string repeats correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(4, "bc");
      expect(result).assertEqual("bcbA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_0900
     * @tc.name testPadStart009
     * @tc.desc Verify padStart() with dynamic targetLength and padString variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Y");
      let target: int = 5;
      let pad: string = "*";
      let result: string = text.padStart(target, pad);
      expect(result).assertEqual("****Y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1000
     * @tc.name testPadStart010
     * @tc.desc Verify padStart() with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let result: string = text.padStart(-1, "0");
      expect(result).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1100
     * @tc.name testPadStart011
     * @tc.desc Verify padStart() with targetLength 0 returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.padStart(0, "X");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1200
     * @tc.name testPadStart012
     * @tc.desc Verify padStart() truncates long padString to fit target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(4, "BCDEFG");
      expect(result).assertEqual("BCDA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1300
     * @tc.name testPadStart013
     * @tc.desc Verify padStart() for number zero-padding pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let result: string = text.padStart(5, "0");
      expect(result).assertEqual("00042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1400
     * @tc.name testPadStart014
     * @tc.desc Verify padStart() combined with toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let result: string = text.toLowerCase().padStart(8, ".");
      expect(result).assertEqual("...hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1500
     * @tc.name testPadStart015
     * @tc.desc Verify padStart() result ends with original string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("data");
      let result: string = text.padStart(10, ".");
      let suffix: string = result.substring(result.length - 4);
      expect(suffix).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1600
     * @tc.name testPadStart016
     * @tc.desc Verify padStart() on empty string creates padding-only result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.padStart(3, "*");
      expect(result).assertEqual("***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1700
     * @tc.name testPadStart017
     * @tc.desc Verify padStart() result length equals targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padStart(5, "0");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1800
     * @tc.name testPadStart018
     * @tc.desc Verify padStart() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.padStart(5, "0");
      expect(text.toString()).assertEqual("AB");
      expect(result).assertEqual("000AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_1900
     * @tc.name testPadStart019
     * @tc.desc Verify padStart() with large targetLength does not crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.padStart(10000, "0");
      expect(result.length).assertEqual(10000);
      expect(result.startsWith("0".repeat(9995))).assertTrue();
      expect(result.endsWith("Hello")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2000
     * @tc.name testPadStart020
     * @tc.desc Verify padStart() for fixed-width number formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num = new String("7");
      let formatted: string = num.padStart(3, "0");
      expect(formatted).assertEqual("007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2100
     * @tc.name testPadStart021
     * @tc.desc Verify padStart() for right-aligned text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("right");
      let aligned: string = text.padStart(10);
      expect(aligned).assertEqual("     right");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2200
     * @tc.name testPadStart022
     * @tc.desc Verify padStart() with default space padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x");
      let result: string = text.padStart(3);
      expect(result).assertEqual("  x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2300
     * @tc.name testPadStart023
     * @tc.desc Verify padStart pads business date string with spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: string = text.padStart(12, " ");
      expect(result).assertEqual("  2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2400
     * @tc.name testPadStart024
     * @tc.desc Verify padStart pads hexadecimal-looking string with zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: string = text.padStart(7, "0");
      expect(result).assertEqual("000x123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2500
     * @tc.name testPadStart025
     * @tc.desc Verify padStart pads email string only when target is longer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: string = text.padStart(18, ".");
      expect(result.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2600
     * @tc.name testPadStart026
     * @tc.desc Verify padStart with zero-width pad string uses it as content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.padStart(3, "\u200B");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2700
     * @tc.name testPadStart027
     * @tc.desc Verify padStart pads binary-looking string with underscore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0b1010");
      let result: string = text.padStart(8, "_");
      expect(result).assertEqual("__0b1010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2800
     * @tc.name testPadStart028
     * @tc.desc Verify padStart keeps CJK source content before padding boundary check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: string = text.padStart(4, "*");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_2900
     * @tc.name testPadStart029
     * @tc.desc Verify padStart pads scientific-notation-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let result: string = text.padStart(10, " ");
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_3000
     * @tc.name testPadStart030
     * @tc.desc Verify padStart pads empty string with multi-character pad sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.padStart(5, "ab");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_3100
     * @tc.name testPadStart031
     * @tc.desc Verify padStart() handles illegal UTF-8 single-byte spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4");
      let result: string = source.padStart(source.length, "#");
      expect(result).assertEqual("\\xe4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_3200
     * @tc.name testPadStart032
     * @tc.desc Verify PadStart handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.padStart(source.length + 2, "!");
      expect(result).assertEqual("!!" + source.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART_3300
     * @tc.name testPadStart033
     * @tc.desc Verify PadStart handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadStart033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.padStart(source.length + 1, "!");
      expect(result).assertEqual("!" + source.toString());
    });
  });
}
