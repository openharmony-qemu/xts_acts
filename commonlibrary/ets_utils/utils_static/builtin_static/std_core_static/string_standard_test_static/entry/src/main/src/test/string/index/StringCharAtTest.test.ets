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

export default function StringCharAtTest(): void {
  describe('StringCharAtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0100
     * @tc.name testCharAt001
     * @tc.desc Verify charAt() returns correct char at each position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      expect(text.charAt(0).toString()).assertEqual("A");
      expect(text.charAt(1).toString()).assertEqual("r");
      expect(text.charAt(4).toString()).assertEqual("S");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0200
     * @tc.name testCharAt002
     * @tc.desc Verify charAt() at first and last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      expect(text.charAt(0).toString()).assertEqual("A");
      expect(text.charAt(4).toString()).assertEqual("E");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0300
     * @tc.name testCharAt003
     * @tc.desc Verify charAt() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      expect(text.charAt(0).toString()).assertEqual("你");
      expect(text.charAt(1).toString()).assertEqual("好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0400
     * @tc.name testCharAt004
     * @tc.desc Verify charAt() with full-width character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ＦＵＬＬ");
      expect(text.charAt(0).toString()).assertEqual("Ｆ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0500
     * @tc.name testCharAt005
     * @tc.desc Verify charAt() with RTL mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtl: string = String.fromCharCode(0x200F);
      const text = new String("A" + rtl + "B");
      expect(text.charAt(1).toString()).assertEqual(rtl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0600
     * @tc.name testCharAt006
     * @tc.desc Verify charAt(0) on emoji returns high surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result = text.charAt(0);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0700
     * @tc.name testCharAt007
     * @tc.desc Verify charAt() on combining character sequence returns base char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acute: string = String.fromCharCode(769);
      const text = new String("e" + acute);
      expect(text.charAt(0).toString()).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0800
     * @tc.name testCharAt008
     * @tc.desc Verify charAt(1) on emoji returns low surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result = text.charAt(1);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0900
     * @tc.name testCharAt009
     * @tc.desc Verify charAt() on string with null byte returns null char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let result = text.charAt(1);
      let code: number = result.toString().charCodeAt(0);
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1000
     * @tc.name testCharAt010
     * @tc.desc Verify charAt() with half-width katakana returns single code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊﾝｶｸ");
      expect(text.charAt(0).toString()).assertEqual("ﾊ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1100
     * @tc.name testCharAt011
     * @tc.desc Verify charAt(0) on empty string throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      try {
        let result = text.charAt(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1200
     * @tc.name testCharAt012
     * @tc.desc Verify charAt(0) on all-spaces string returns space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      expect(text.charAt(0).toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1300
     * @tc.name testCharAt013
     * @tc.desc Verify charAt(length) throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      try {
        let result = text.charAt(2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1400
     * @tc.name testCharAt014
     * @tc.desc Verify charAt(0) on single-character string returns that character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      expect(text.charAt(0).toString()).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1500
     * @tc.name testCharAt015
     * @tc.desc Verify charAt() accepts short type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: short = 0;
      const text = new String("AB");
      expect(text.charAt(idx).toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1600
     * @tc.name testCharAt016
     * @tc.desc Verify charAt() accepts byte type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: byte = 1;
      const text = new String("AB");
      expect(text.charAt(idx).toString()).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1700
     * @tc.name testCharAt017
     * @tc.desc Verify charAt() with negative index throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AZ");
      try {
        let result = text.charAt(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1800
     * @tc.name testCharAt018
     * @tc.desc Verify charAt(1) on GBK Chinese text returns second character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      expect(text.charAt(2).toString()).assertEqual("测");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1900
     * @tc.name testCharAt019
     * @tc.desc Verify charAt(3) on ISO 8859-1 Latin text returns accented é
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      expect(text.charAt(3).toString()).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2000
     * @tc.name testCharAt020
     * @tc.desc Verify charAt(1) on string with newline returns newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb");
      let result: string = text.charAt(1).toString();
      let code: number = result.charCodeAt(0);
      expect(code).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2100
     * @tc.name testCharAt021
     * @tc.desc Verify charAt(1) on string with tab returns tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x\ty");
      let result: string = text.charAt(1).toString();
      let code: number = result.charCodeAt(0);
      expect(code).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2200
     * @tc.name testCharAt022
     * @tc.desc Verify charAt(3) on 7-char string returns middle character D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEFG");
      expect(text.charAt(3).toString()).assertEqual("D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2300
     * @tc.name testCharAt023
     * @tc.desc Verify charAt() with dynamic index variable returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let idx: int = 4;
      expect(text.charAt(idx).toString()).assertEqual("S");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2400
     * @tc.name testCharAt024
     * @tc.desc Verify charAt() returns chars at first and last valid indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let first: string = text.charAt(0).toString();
      let last: string = text.charAt(text.length - 1).toString();
      expect(first).assertEqual("A");
      expect(last).assertEqual("S");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2500
     * @tc.name testCharAt025
     * @tc.desc Verify charAt() returns the character after a C0 NUL byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let value: string = text.charAt(2).toString();
      expect(value).assertEqual("B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2600
     * @tc.name testCharAt026
     * @tc.desc Verify charAt() with computed negative boundary throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("NEG");
      let index: int = -text.length;
      try {
        let value = text.charAt(index);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2700
     * @tc.name testCharAt027
     * @tc.desc Verify charAt() with index greater than length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OVER");
      try {
        let value = text.charAt(text.length + 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2800
     * @tc.name testCharAt028
     * @tc.desc Verify charAt() reads zero-width space by positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: char = text.charAt(1);
      expect(result.toString()).assertEqual("\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2900
     * @tc.name testCharAt029
     * @tc.desc Verify charAt() reads replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: char = text.charAt(0);
      expect(result.toString()).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_3000
     * @tc.name testCharAt030
     * @tc.desc Verify charAt() reads fullwidth dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let result: char = text.charAt(0);
      expect(result.toString()).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_3100
     * @tc.name testCharAt031
     * @tc.desc Verify CharAt handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: char = source.charAt(1);
      expect(result).assertEqual(c'@');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_3200
     * @tc.name testCharAt032
     * @tc.desc Verify CharAt handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: char = source.charAt(0);
      expect(result).assertEqual(c'テ');
    });
  });
}
