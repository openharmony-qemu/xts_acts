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

export default function StringCharCodeAtTest(): void {
  describe('StringCharCodeAtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0100
     * @tc.name testCharCodeAt001
     * @tc.desc Verify charCodeAt(0) on ASCII A returns 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0200
     * @tc.name testCharCodeAt002
     * @tc.desc Verify charCodeAt(2) on ASCII C returns 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: number = text.charCodeAt(2);
      expect(result).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0300
     * @tc.name testCharCodeAt003
     * @tc.desc Verify charCodeAt(0) on emoji returns high surrogate 55357
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0400
     * @tc.name testCharCodeAt004
     * @tc.desc Verify charCodeAt(1) on emoji returns low surrogate 56832
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: number = text.charCodeAt(1);
      expect(result).assertEqual(56832);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0500
     * @tc.name testCharCodeAt005
     * @tc.desc Verify charCodeAt(0) on CJK returns 20013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0600
     * @tc.name testCharCodeAt006
     * @tc.desc Verify charCodeAt(0) on digit 0 returns 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0700
     * @tc.name testCharCodeAt007
     * @tc.desc Verify charCodeAt(0) on space returns 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String(" ");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0800
     * @tc.name testCharCodeAt008
     * @tc.desc Verify charCodeAt(0) on combining char returns base e (101)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_0900
     * @tc.name testCharCodeAt009
     * @tc.desc Verify charCodeAt(1) on combining char returns accent (769)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: number = text.charCodeAt(1);
      expect(result).assertEqual(769);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1000
     * @tc.name testCharCodeAt010
     * @tc.desc Verify charCodeAt(0) on half-width katakana returns 65418
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊ");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(65418);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1100
     * @tc.name testCharCodeAt011
     * @tc.desc Verify charCodeAt(0) on BOM returns 65279
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("﻿ABC");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(65279);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1200
     * @tc.name testCharCodeAt012
     * @tc.desc Verify charCodeAt(0) on empty string throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      try {
        let result = text.charCodeAt(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1300
     * @tc.name testCharCodeAt013
     * @tc.desc Verify charCodeAt(0) on GBK Chinese 汉 returns 27721
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("汉");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(27721);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1400
     * @tc.name testCharCodeAt014
     * @tc.desc Verify charCodeAt(0) on ISO 8859-1 é returns 233
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(233);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1500
     * @tc.name testCharCodeAt015
     * @tc.desc Verify charCodeAt(0) on tab returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1600
     * @tc.name testCharCodeAt016
     * @tc.desc Verify charCodeAt(0) on newline returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1700
     * @tc.name testCharCodeAt017
     * @tc.desc Verify charCodeAt(0) on carriage return returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\r");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1800
     * @tc.name testCharCodeAt018
     * @tc.desc Verify charCodeAt() at length index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      try {
        let result = text.charCodeAt(2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_1900
     * @tc.name testCharCodeAt019
     * @tc.desc Verify charCodeAt() with negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ERR");
      try {
        let result = text.charCodeAt(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2000
     * @tc.name testCharCodeAt020
     * @tc.desc Verify charCodeAt() on last valid index returns correct code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEF");
      let lastIdx: int = text.length - 1;
      let result: number = text.charCodeAt(lastIdx);
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2100
     * @tc.name testCharCodeAt021
     * @tc.desc Verify charCodeAt() with dynamic index variable returns correct code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("GitHub");
      let idx: int = 3;
      let result: number = text.charCodeAt(idx);
      expect(result).assertEqual(72);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2200
     * @tc.name testCharCodeAt022
     * @tc.desc Verify charCodeAt() in loop collects all ASCII codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let codes: number[] = [];
      for (let i: int = 0; i < text.length; i++) {
        codes.push(text.charCodeAt(i));
      }
      expect(codes[0]).assertEqual(65);
      expect(codes[1]).assertEqual(66);
      expect(codes[2]).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2300
     * @tc.name testCharCodeAt023
     * @tc.desc Verify charCodeAt() returns correct code point for ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2400
     * @tc.name testCharCodeAt024
     * @tc.desc Verify charCodeAt() finds max code in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let maxCode: number = 0;
      for (let i: int = 0; i < text.length; i++) {
        let code: number = text.charCodeAt(i);
        if (code > maxCode) {
          maxCode = code;
        }
      }
      expect(maxCode).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2500
     * @tc.name testCharCodeAt025
     * @tc.desc Verify charCodeAt() reads zero-width space code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: number = text.charCodeAt(1);
      expect(result).assertEqual(0x200B);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2600
     * @tc.name testCharCodeAt026
     * @tc.desc Verify charCodeAt() reads replacement character code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(0xFFFD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2700
     * @tc.name testCharCodeAt027
     * @tc.desc Verify charCodeAt() reads fullwidth dash code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(0x2014);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2800
     * @tc.name testCharCodeAt028
     * @tc.desc Verify charCodeAt() reads Arabic alef code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(0x0627);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_2900
     * @tc.name testCharCodeAt029
     * @tc.desc Verify charCodeAt() reads backslash from malformed escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\\u");
      let result: number = text.charCodeAt(0);
      expect(result).assertEqual(92);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_3000
     * @tc.name testCharCodeAt030
     * @tc.desc Verify charCodeAt() reads asterisk in masked bank card
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: number = text.charCodeAt(6);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_3100
     * @tc.name testCharCodeAt031
     * @tc.desc Verify CharCodeAt handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: number = source.charCodeAt(2);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARCODEAT_3200
     * @tc.name testCharCodeAt032
     * @tc.desc Verify CharCodeAt handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCodeAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: number = source.charCodeAt(0);
      expect(result).assertEqual(0x30C6);
    });
  });
}
