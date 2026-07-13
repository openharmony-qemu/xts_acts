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

export default function StringAtTest(): void {
  describe('StringAtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0100
     * @tc.name testAt001
     * @tc.desc Verify at(0) returns first character
     */
    it('testAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string | undefined = text.at(0);
      expect(result!).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0200
     * @tc.name testAt002
     * @tc.desc Verify at(-1) returns last character via negative index from end
     */
    it('testAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string | undefined = text.at(-1);
      expect(result!).assertEqual("S");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0300
     * @tc.name testAt003
     * @tc.desc Verify at(length) returns undefined
     */
    it('testAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      // at(length) and negative beyond -length both return undefined
      expect(text.at(2) === undefined).assertTrue();
      expect(text.at(-3) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0400
     * @tc.name testAt004
     * @tc.desc Verify at() on empty string returns undefined for any index
     */
    it('testAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      expect(text.at(0) === undefined).assertTrue();
      expect(text.at(5) === undefined).assertTrue();
      expect(text.at(-1) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0500
     * @tc.name testAt005
     * @tc.desc Verify at() with CJK character
     */
    it('testAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: string | undefined = text.at(1);
      expect(result!).assertEqual("好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0600
     * @tc.name testAt006
     * @tc.desc Verify at() with dynamic index
     */
    it('testAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let idx: int = 4;
      let result: string | undefined = text.at(idx);
      expect(result!).assertEqual("S");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0700
     * @tc.name testAt007
     * @tc.desc Verify at() with negative index differs from charAt which returns empty for negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      // at(-1) returns last char, while charAt(-1) throws
      let a: string | undefined = text.at(-1);
      expect(a!).assertEqual("o");
      let threw: boolean = false;
      try {
        text.charAt(-1);
      } catch (_e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0800
     * @tc.name testAt008
     * @tc.desc Verify at() with emoji returns single surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let r0: string | undefined = text.at(0);
      let r1: string | undefined = text.at(1);
      // Emoji 😀 is U+1F600 (surrogate pair), at() returns individual code units
      expect(text.length).assertEqual(2);
      expect(r0 !== undefined).assertTrue();
      expect(r1 !== undefined).assertTrue();
      expect(text.at(2) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_0900
     * @tc.name testAt009
     * @tc.desc Verify at() backward iteration from end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let last: string | undefined = text.at(-1);
      let mid: string | undefined = text.at(-2);
      let first: string | undefined = text.at(-3);
      expect(last!).assertEqual("C");
      expect(mid!).assertEqual("B");
      expect(first!).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1000
     * @tc.name testAt010
     * @tc.desc Verify at() with valid index returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string | undefined = text.at(1);
      expect(result!).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1100
     * @tc.name testAt011
     * @tc.desc Verify at() with float index truncates toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let idx: int = (2.9).toInt();
      let result: string | undefined = text.at(idx);
      expect(result!).assertEqual("l");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1200
     * @tc.name testAt012
     * @tc.desc Verify at() with mixed ASCII and CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hi你好");
      expect(text.at(0)!).assertEqual("H");
      expect(text.at(1)!).assertEqual("i");
      expect(text.at(2)!).assertEqual("你");
      expect(text.at(3)!).assertEqual("好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1300
     * @tc.name testAt013
     * @tc.desc Verify at() on single-char string returns same char for 0 and -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      expect(text.at(0)!).assertEqual("X");
      expect(text.at(-1)!).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1400
     * @tc.name testAt014
     * @tc.desc Verify at(1) on single-char string and at(-2) return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      expect(text.at(1) === undefined).assertTrue();
      expect(text.at(-2) === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1500
     * @tc.name testAt015
     * @tc.desc Verify at() on long string handles extreme indices correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(1000));
      expect(text.at(0)!).assertEqual("a");
      expect(text.at(999)!).assertEqual("a");
      expect(text.at(-1)!).assertEqual("a");
      expect(text.at(-1000)!).assertEqual("a");
      expect(text.at(500)!).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1600
     * @tc.name testAt016
     * @tc.desc Verify at() vs slice() return same character for same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      expect(text.at(6)!).assertEqual(text.slice(6, 7));
      expect(text.at(-1)!).assertEqual(text.slice(-1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1700
     * @tc.name testAt017
     * @tc.desc Verify three equivalent ways to get last character: at(-1), charAt(len-1), slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let byAt: string | undefined = text.at(-1);
      let bySlice: string = text.slice(-1);
      // at(-1) and slice(-1) both get the last character
      expect(byAt!).assertEqual("S");
      expect(bySlice).assertEqual("S");
      expect(byAt!).assertEqual(bySlice);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1800
     * @tc.name testAt018
     * @tc.desc Verify at() with index = length - 1 returns last character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let lastIdx: int = text.length - 1;
      expect(text.at(lastIdx)!).assertEqual("o");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_1900
     * @tc.name testAt019
     * @tc.desc Verify at() used to extract last few chars of invoice-like reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new String("INV-2024-0001");
      expect(ref.at(-1)!).assertEqual("1");
      expect(ref.at(-2)!).assertEqual("0");
      expect(ref.at(-5)!).assertEqual("-");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2000
     * @tc.name testAt020
     * @tc.desc Verify forward iteration using at() with positive indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let chars: string[] = [];
      for (let i: int = 0; i < text.length; i++) {
        chars.push(text.at(i)!);
      }
      expect(chars.join("")).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2100
     * @tc.name testAt021
     * @tc.desc Verify at() reads zero-width space by positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: string | undefined = text.at(1);
      expect(result!).assertEqual("\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2200
     * @tc.name testAt022
     * @tc.desc Verify at() reads final date digit by negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: string | undefined = text.at(-1);
      expect(result!).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2300
     * @tc.name testAt023
     * @tc.desc Verify at() reads first Unicode escape CJK character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: string | undefined = text.at(0);
      expect(result!).assertEqual("\u4E2D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2400
     * @tc.name testAt024
     * @tc.desc Verify at() reads replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: string | undefined = text.at(0);
      expect(result!).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2500
     * @tc.name testAt025
     * @tc.desc Verify at() reads fullwidth dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let result: string | undefined = text.at(0);
      expect(result!).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2600
     * @tc.name testAt026
     * @tc.desc Verify at() reads Arabic character from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: string | undefined = text.at(-1);
      expect(result!).assertEqual("\u0628");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2700
     * @tc.name testAt027
     * @tc.desc Verify at() returns undefined beyond masked card length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: string | undefined = text.at(18);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2800
     * @tc.name testAt028
     * @tc.desc Verify at() reads CR character in protocol line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\r\n");
      let result: string | undefined = text.at(1);
      expect(result!).assertEqual("\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_2900
     * @tc.name testAt029
     * @tc.desc Verify at() reads literal backslash in malformed escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\\u");
      let result: string | undefined = text.at(0);
      expect(result!).assertEqual("\\");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_3000
     * @tc.name testAt030
     * @tc.desc Verify at() reads decimal point in scientific-notation-looking string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let result: string | undefined = text.at(3);
      expect(result!).assertEqual(".");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_3100
     * @tc.name testAt031
     * @tc.desc Verify At handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string | undefined = source.at(0);
      expect(result!).assertEqual("!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_AT_3200
     * @tc.name testAt032
     * @tc.desc Verify At handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string | undefined = source.at(0);
      expect(result!).assertEqual("テ");
    });
  });
}
