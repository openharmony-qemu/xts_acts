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

export default function StringPadRightTest(): void {
  describe('StringPadRightTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0100
     * @tc.name testPadRight001
     * @tc.desc Verify padRight() pads string on right with specified char to target length
     */
    it('testPadRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("42");
      let result: String = text.padRight(c'0', 5);
      expect(result.toString()).assertEqual("42000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0200
     * @tc.name testPadRight002
     * @tc.desc Verify padRight() when string already reaches or exceeds target length returns original
     */
    it('testPadRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.padRight(c'*', 3);
      expect(result.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0300
     * @tc.name testPadRight003
     * @tc.desc Verify padRight() aligns a CSV header field to fixed display width
     */
    it('testPadRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col");
      let result: String = text.padRight(c' ', 5);
      expect(result.toString()).assertEqual("col  ");
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0400
     * @tc.name testPadRight004
     * @tc.desc Verify padRight() with GBK Chinese char as padChar
     */
    it('testPadRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("标题");
      let result: String = text.padRight(c'。', 4);
      expect(result.toString()).assertEqual("标题。。");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0500
     * @tc.name testPadRight005
     * @tc.desc Verify padRight() with empty string pads fully
     */
    it('testPadRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.padRight(c'-', 3);
      expect(result.toString()).assertEqual("---");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0600
     * @tc.name testPadRight006
     * @tc.desc Verify padRight() with dynamic variables
     */
    it('testPadRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let len: int = 3;
      let pad: char = c'=';
      let result: String = text.padRight(pad, len);
      expect(result.toString()).assertEqual("X==");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0700
     * @tc.name testPadRight007
     * @tc.desc Verify padRight() with targetLength 0 returns original
     */
    it('testPadRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.padRight(c'0', 0);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0800
     * @tc.name testPadRight008
     * @tc.desc Verify padRight() with negative targetLength returns original
     */
    it('testPadRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padRight(c'0', -1);
      expect(result.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_0900
     * @tc.name testPadRight009
     * @tc.desc Verify padRight() does not modify original string
     */
    it('testPadRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padRight(c'0', 5);
      expect(text.toString()).assertEqual("AB");
      expect(result.toString()).assertEqual("AB000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1000
     * @tc.name testPadRight010
     * @tc.desc Verify padRight() result length equals targetLength
     */
    it('testPadRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.padRight(c'0', 5);
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1100
     * @tc.name testPadRight011
     * @tc.desc Verify padRight() with targetLength equal to string length returns original
     */
    it('testPadRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.padRight(c'*', 3);
      expect(result.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1200
     * @tc.name testPadRight012
     * @tc.desc Verify padRight() formats a log level column without changing the token
     */
    it('testPadRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level = new String("WARN");
      let result: String = level.padRight(c' ', 7);
      expect(result.toString()).assertEqual("WARN   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1300
     * @tc.name testPadRight013
     * @tc.desc Verify padRight() preserves ISO 8859-1 Latin-1 source content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Caf\u00E9");
      let result: String = text.padRight(c'-', 6);
      expect(result.toString()).assertEqual("Caf\u00E9--");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1400
     * @tc.name testPadRight014
     * @tc.desc Verify padRight() can use a Unicode BMP char as padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.padRight(c'\u4E2D', 3);
      expect(result.toString()).assertEqual("A\u4E2D\u4E2D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1500
     * @tc.name testPadRight015
     * @tc.desc Verify padRight() can use tab as a C0 control padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      let result: String = text.padRight(c'\t', 3);
      expect(result.toString()).assertEqual("X\t\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1600
     * @tc.name testPadRight016
     * @tc.desc Verify padRight() formats a version prefix into a fixed-width label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const version = new String("v1");
      let result: String = version.padRight(c'.', 4);
      expect(result.toString()).assertEqual("v1..");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1700
     * @tc.name testPadRight017
     * @tc.desc Verify padRight() aligns a command token in a fixed-width terminal column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const command = new String("RUN");
      let result: String = command.padRight(c' ', 6);
      expect(result.toString()).assertEqual("RUN   ");
      expect(result.charCodeAt(5)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1800
     * @tc.name testPadRight018
     * @tc.desc Verify padRight() can use NUL as a C0 control padChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.padRight(c'\0', 3);
      expect(result.getLength()).assertEqual(3);
      expect(result.charCodeAt(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_1900
     * @tc.name testPadRight019
     * @tc.desc Verify padRight pads phone number to fixed width with spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("13800138000");
      let result: String = text.padRight(c' ', 13);
      expect(result.getLength()).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2000
     * @tc.name testPadRight020
     * @tc.desc Verify padRight pads hexadecimal-looking string with zero char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let result: String = text.padRight(c'0', 7);
      expect(result.toString()).assertEqual("0x12300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2100
     * @tc.name testPadRight021
     * @tc.desc Verify padRight pads date string with underscore char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: String = text.padRight(c'_', 12);
      expect(result.getLength()).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2200
     * @tc.name testPadRight022
     * @tc.desc Verify padRight pads binary-looking string with dot char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0b1010");
      let result: String = text.padRight(c'.', 8);
      expect(result.toString()).assertEqual("0b1010..");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2300
     * @tc.name testPadRight023
     * @tc.desc Verify padRight pads empty string with tab char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.padRight(c'\t', 2);
      expect(result.getLength()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2400
     * @tc.name testPadRight024
     * @tc.desc Verify padRight preserves Unicode source while padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D");
      let result: String = text.padRight(c'*', 3);
      expect(result.getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2500
     * @tc.name testPadRight025
     * @tc.desc Verify padRight pads masked bank card string to display width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: String = text.padRight(c' ', 20);
      expect(result.getLength()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2600
     * @tc.name testPadRight026
     * @tc.desc Verify padRight leaves longer email string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let result: String = text.padRight(c'.', 5);
      expect(result.toString()).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2700
     * @tc.name testPadRight027
     * @tc.desc Verify padRight pads single dash with dash char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("-");
      let result: String = text.padRight(c'-', 3);
      expect(result.getLength()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2800
     * @tc.name testPadRight028
     * @tc.desc Verify padRight pads replacement character string with question mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: String = text.padRight(c'?', 2);
      expect(result.getLength()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_2900
     * @tc.name testPadRight029
     * @tc.desc Verify padRight pads ASCII word with carriage-return char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.padRight(c'\r', 2);
      expect(result.getLength()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_3000
     * @tc.name testPadRight030
     * @tc.desc Verify padRight pads scientific notation token with plus char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let result: String = text.padRight(c'+', 9);
      expect(result.getLength()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_3100
     * @tc.name testPadRight031
     * @tc.desc Verify PadRight handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      let result: String = new String("X").padRight(c'!', 3);
      expect(result.toString()).assertEqual("X!!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT_3200
     * @tc.name testPadRight032
     * @tc.desc Verify PadRight handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPadRight032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: String = new String("X").padRight(c'テ', 3);
      expect(result.toString()).assertEqual("Xテテ");
    });
  });
}
