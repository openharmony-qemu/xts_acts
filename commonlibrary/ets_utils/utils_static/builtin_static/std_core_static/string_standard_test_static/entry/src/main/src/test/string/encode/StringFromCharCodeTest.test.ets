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

export default function StringFromCharCodeTest(): void {
  describe('StringFromCharCodeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0100
     * @tc.name testFromCharCode001
     * @tc.desc Verify String.fromCharCode(65) returns ASCII uppercase A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0200
     * @tc.name testFromCharCode002
     * @tc.desc Verify String.fromCharCode() with multiple parameters returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65, 97, 48);
      expect(result).assertEqual("Aa0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0300
     * @tc.name testFromCharCode003
     * @tc.desc Verify String.fromCharCode() accepts Unicode noncharacter code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(64976);
      expect(result).assertEqual("﷐");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0400
     * @tc.name testFromCharCode004
     * @tc.desc Verify String.fromCharCode() handles negative wrap and overflow truncation in the same call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(-1, 65536);
      expect(result).assertEqual("￿\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0500
     * @tc.name testFromCharCode005
     * @tc.desc Verify String.fromCharCode(32) returns ASCII space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(32);
      expect(result).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0600
     * @tc.name testFromCharCode006
     * @tc.desc Verify String.fromCharCode(10) returns C0 control newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(10);
      expect(result).assertEqual("\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0700
     * @tc.name testFromCharCode007
     * @tc.desc Verify String.fromCharCode(9) returns C0 control tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(9);
      expect(result).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0800
     * @tc.name testFromCharCode008
     * @tc.desc Verify String.fromCharCode(13) returns C0 control carriage-return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(13);
      expect(result).assertEqual("\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_0900
     * @tc.name testFromCharCode009
     * @tc.desc Verify String.fromCharCode(20013) returns CJK Unicode BMP character 中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(20013);
      expect(result).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1000
     * @tc.name testFromCharCode010
     * @tc.desc Verify String.fromCharCode(233) returns ISO 8859-1 Latin precomposed é
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(233);
      expect(result).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1100
     * @tc.name testFromCharCode011
     * @tc.desc Verify String.fromCharCode(65418) returns half-width katakana ﾊ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65418);
      expect(result).assertEqual("ﾊ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1200
     * @tc.name testFromCharCode012
     * @tc.desc Verify String.fromCharCode() returns BMP boundary character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65535);
      expect(result).assertEqual("￿");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1300
     * @tc.name testFromCharCode013
     * @tc.desc Verify String.fromCharCode() with multiple code units returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(72, 105, 33);
      expect(result).assertEqual("Hi!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1400
     * @tc.name testFromCharCode014
     * @tc.desc Verify String.fromCharCode() with surrogate pair code units returns emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(55357, 56832);
      expect(result).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1500
     * @tc.name testFromCharCode015
     * @tc.desc Verify String.fromCharCode() with dynamic variable code unit parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code: int = 66;
      let result: string = String.fromCharCode(code);
      expect(result).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1600
     * @tc.name testFromCharCode016
     * @tc.desc Verify String.fromCharCode() wraps negative value to unsigned 16-bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(-1);
      expect(result).assertEqual("￿");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1700
     * @tc.name testFromCharCode017
     * @tc.desc Verify String.fromCharCode() with no parameters returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1800
     * @tc.name testFromCharCode018
     * @tc.desc Verify String.fromCharCode() truncates overflow per argument in mixed valid and overflow parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65, 65536, 67);
      expect(result).assertEqual("A\0C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_1900
     * @tc.name testFromCharCode019
     * @tc.desc Verify String.fromCharCode() truncates value exceeding BMP range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65536);
      expect(result).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2000
     * @tc.name testFromCharCode020
     * @tc.desc Verify String.fromCharCode() builds a compact date token from numeric code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(50, 48, 50, 54, 45, 48, 54, 45, 49, 50);
      expect(result).assertEqual("2026-06-12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2100
     * @tc.name testFromCharCode021
     * @tc.desc Verify String.fromCharCode() builds Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0x4E2D, 0x6587);
      expect(result).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2200
     * @tc.name testFromCharCode022
     * @tc.desc Verify String.fromCharCode() builds zero-width space between ASCII letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(65, 0x200B, 66);
      expect(result).assertEqual("A\u200BB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2300
     * @tc.name testFromCharCode023
     * @tc.desc Verify String.fromCharCode() builds replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0xFFFD);
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2400
     * @tc.name testFromCharCode024
     * @tc.desc Verify String.fromCharCode() builds hexadecimal-looking token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(48, 120, 49, 50, 51);
      expect(result).assertEqual("0x123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2500
     * @tc.name testFromCharCode025
     * @tc.desc Verify String.fromCharCode() builds email separator at sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(116, 64, 101);
      expect(result).assertEqual("t@e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2600
     * @tc.name testFromCharCode026
     * @tc.desc Verify String.fromCharCode() builds CRLF sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(13, 10);
      expect(result).assertEqual("\r\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2700
     * @tc.name testFromCharCode027
     * @tc.desc Verify String.fromCharCode() builds fullwidth dash U+2014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0x2014);
      expect(result).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2800
     * @tc.name testFromCharCode028
     * @tc.desc Verify String.fromCharCode() builds Arabic letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0x0627, 0x0628);
      expect(result).assertEqual("\u0627\u0628");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_2900
     * @tc.name testFromCharCode029
     * @tc.desc Verify String.fromCharCode() builds masked-card asterisk sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(42, 42, 42, 42);
      expect(result).assertEqual("****");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_3000
     * @tc.name testFromCharCode030
     * @tc.desc Verify String.fromCharCode() truncates 0x1F600 to low 16-bit code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCharCode(0x1F600);
      expect(result.charCodeAt(0)).assertEqual(0xF600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_3100
     * @tc.name testFromCharCode031
     * @tc.desc Verify FromCharCode handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      let result: string = String.fromCharCode(33, 64, 35, 36);
      expect(result).assertEqual("!@#$");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCHARCODE_3200
     * @tc.name testFromCharCode032
     * @tc.desc Verify FromCharCode handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCharCode032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = String.fromCharCode(0x30C6, 0x30B9, 0x30C8);
      expect(result).assertEqual("テスト");
    });
  });
}
