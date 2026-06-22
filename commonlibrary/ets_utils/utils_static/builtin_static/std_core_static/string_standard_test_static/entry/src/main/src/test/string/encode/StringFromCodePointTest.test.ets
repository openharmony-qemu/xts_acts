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

export default function StringFromCodePointTest(): void {
  describe('StringFromCodePointTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0100
     * @tc.name testFromCodePoint001
     * @tc.desc Verify String.fromCodePoint(65) returns ASCII uppercase A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(65);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0200
     * @tc.name testFromCodePoint002
     * @tc.desc Verify String.fromCodePoint(128512) returns Unicode supplementary plane emoji 😀
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(128512);
      expect(result).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0300
     * @tc.name testFromCodePoint003
     * @tc.desc Verify String.fromCodePoint(20013) returns CJK Unicode BMP character 中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(20013);
      expect(result).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0400
     * @tc.name testFromCodePoint004
     * @tc.desc Verify String.fromCodePoint(0) returns C0 control NUL character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0);
      expect(result).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0500
     * @tc.name testFromCodePoint005
     * @tc.desc Verify String.fromCodePoint(32) returns ASCII space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(32);
      expect(result).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0600
     * @tc.name testFromCodePoint006
     * @tc.desc Verify String.fromCodePoint(9) returns C0 control tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(9);
      expect(result).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0700
     * @tc.name testFromCodePoint007
     * @tc.desc Verify String.fromCodePoint(10) returns C0 control newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(10);
      expect(result).assertEqual("\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0800
     * @tc.name testFromCodePoint008
     * @tc.desc Verify String.fromCodePoint(13) returns C0 control carriage-return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(13);
      expect(result).assertEqual("\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_0900
     * @tc.name testFromCodePoint009
     * @tc.desc Verify String.fromCodePoint(233) returns ISO 8859-1 Latin precomposed é
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(233);
      expect(result).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1000
     * @tc.name testFromCodePoint010
     * @tc.desc Verify String.fromCodePoint(65418) returns half-width katakana ﾊ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(65418);
      expect(result).assertEqual("ﾊ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1100
     * @tc.name testFromCodePoint011
     * @tc.desc Verify String.fromCodePoint(65535) returns BMP boundary character U+FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(65535);
      expect(result).assertEqual("￿");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1200
     * @tc.name testFromCodePoint012
     * @tc.desc Verify String.fromCodePoint(769) returns combining acute accent mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(769);
      let code: int = result.codePointAt(0)!;
      expect(code).assertEqual(769);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1300
     * @tc.name testFromCodePoint013
     * @tc.desc Verify String.fromCodePoint(27721) returns GBK Chinese character 汉
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(27721);
      expect(result).assertEqual("汉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1400
     * @tc.name testFromCodePoint014
     * @tc.desc Verify String.fromCodePoint() with multiple code points returns concatenated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(72, 105, 33);
      expect(result).assertEqual("Hi!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1500
     * @tc.name testFromCodePoint015
     * @tc.desc Verify String.fromCodePoint() with mixed BMP and supplementary code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(65, 128512, 66);
      expect(result).assertEqual("A😀B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1600
     * @tc.name testFromCodePoint016
     * @tc.desc Verify String.fromCodePoint() with dynamic variable code point parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: int = 98;
      let result: string = String.fromCodePoint(cp);
      expect(result).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1700
     * @tc.name testFromCodePoint017
     * @tc.desc Verify String.fromCodePoint() with negative code point throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: string = String.fromCodePoint(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1800
     * @tc.name testFromCodePoint018
     * @tc.desc Verify String.fromCodePoint() with code point exceeding U+10FFFF throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: string = String.fromCodePoint(0x110000);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_1900
     * @tc.name testFromCodePoint019
     * @tc.desc Verify String.fromCodePoint() with no parameters returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2000
     * @tc.name testFromCodePoint020
     * @tc.desc Verify String.fromCodePoint() creates word from code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(72, 101, 108, 108, 111);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2100
     * @tc.name testFromCodePoint021
     * @tc.desc Verify String.fromCodePoint() builds a protocol token from mixed code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(79, 75, 45, 20013);
      expect(result).assertEqual("OK-中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2200
     * @tc.name testFromCodePoint022
     * @tc.desc Verify String.fromCodePoint() with Euro sign U+20AC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x20AC);
      expect(result.length).assertEqual(1);
      expect(result).assertEqual("€");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2300
     * @tc.name testFromCodePoint023
     * @tc.desc Verify String.fromCodePoint() with maximum valid code point U+10FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x10FFFF);
      expect(result.length).assertLarger(0);
      expect(result.codePointAt(0)!).assertEqual(0x10FFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2400
     * @tc.name testFromCodePoint024
     * @tc.desc Verify String.fromCodePoint() with escape control character U+001B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x001B);
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(0x001B);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2500
     * @tc.name testFromCodePoint025
     * @tc.desc Verify String.fromCodePoint() builds Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x4E2D, 0x6587);
      expect(result).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2600
     * @tc.name testFromCodePoint026
     * @tc.desc Verify String.fromCodePoint() builds zero-width space between ASCII letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(65, 0x200B, 66);
      expect(result).assertEqual("A\u200BB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2700
     * @tc.name testFromCodePoint027
     * @tc.desc Verify String.fromCodePoint() builds replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0xFFFD);
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2800
     * @tc.name testFromCodePoint028
     * @tc.desc Verify String.fromCodePoint() builds fullwidth dash U+2014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x2014);
      expect(result).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_2900
     * @tc.name testFromCodePoint029
     * @tc.desc Verify String.fromCodePoint() builds Arabic letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x0627, 0x0628);
      expect(result).assertEqual("\u0627\u0628");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_3000
     * @tc.name testFromCodePoint030
     * @tc.desc Verify String.fromCodePoint() builds star emoji U+1F31F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String.fromCodePoint(0x1F31F);
      expect(result.length).assertEqual(2);
      expect(result.codePointAt(0)!).assertEqual(0x1F31F);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_3100
     * @tc.name testFromCodePoint031
     * @tc.desc Verify FromCodePoint handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      let result: string = String.fromCodePoint(33, 64, 35, 36, 60, 62, 92);
      expect(result).assertEqual("!@#$<>\\");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FROMCODEPOINT_3200
     * @tc.name testFromCodePoint032
     * @tc.desc Verify FromCodePoint handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFromCodePoint032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = String.fromCodePoint(0x0410, 0x0411, 0x0412, 0x0413, 0x0414);
      expect(result).assertEqual("АБВГД");
    });
  });
}
