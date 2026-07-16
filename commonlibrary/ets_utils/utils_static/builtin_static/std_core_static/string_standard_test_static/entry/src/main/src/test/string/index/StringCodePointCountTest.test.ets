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

export default function StringCodePointCountTest(): void {
  describe('StringCodePointCountTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0100
     * @tc.name testCodePointCount001
     * @tc.desc Verify codePointCount(0, length) on ASCII string returns correct code point count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0200
     * @tc.name testCodePointCount002
     * @tc.desc Verify codePointCount(0, length) on emoji plus ASCII returns count less than length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀A");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0300
     * @tc.name testCodePointCount003
     * @tc.desc Verify codePointCount(0, 0) on empty string returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: int = text.codePointCount(0, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0400
     * @tc.name testCodePointCount004
     * @tc.desc Verify codePointCount(0, length) on single emoji returns 1 code point for 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0500
     * @tc.name testCodePointCount005
     * @tc.desc Verify codePointCount(0, length) on CJK characters returns count equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0600
     * @tc.name testCodePointCount006
     * @tc.desc Verify codePointCount(0, length) on combining character sequence returns 2 code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0700
     * @tc.name testCodePointCount007
     * @tc.desc Verify codePointCount(0, length) on mixed emoji plus CJK plus ASCII returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀中");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0800
     * @tc.name testCodePointCount008
     * @tc.desc Verify codePointCount() on sub-range excludes characters outside range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB😀C");
      let result: int = text.codePointCount(1, 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_0900
     * @tc.name testCodePointCount009
     * @tc.desc Verify codePointCount() with beginIndex equals endIndex returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: int = text.codePointCount(2, 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1000
     * @tc.name testCodePointCount010
     * @tc.desc Verify codePointCount(0, 1) on emoji counts high surrogate as 1 code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: int = text.codePointCount(0, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1100
     * @tc.name testCodePointCount011
     * @tc.desc Verify codePointCount() with negative beginIndex throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      try {
        let result: int = text.codePointCount(-1, 2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1200
     * @tc.name testCodePointCount012
     * @tc.desc Verify codePointCount() with endIndex beyond length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      try {
        let result: int = text.codePointCount(0, 10);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1300
     * @tc.name testCodePointCount013
     * @tc.desc Verify codePointCount() with dynamic beginIndex and endIndex from variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let start: int = 0;
      let end: int = text.length;
      let result: int = text.codePointCount(start, end);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1400
     * @tc.name testCodePointCount014
     * @tc.desc Verify codePointCount(0, length) on GBK Chinese text returns count equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1500
     * @tc.name testCodePointCount015
     * @tc.desc Verify codePointCount(0, length) on half-width katakana returns count equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊﾝｶｸ");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1600
     * @tc.name testCodePointCount016
     * @tc.desc Verify codePointCount(0, length) on ISO 8859-1 Latin precomposed characters returns count equal to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1700
     * @tc.name testCodePointCount017
     * @tc.desc Verify codePointCount() on equal begin and end indices returns zero count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: int = text.codePointCount(2, 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1800
     * @tc.name testCodePointCount018
     * @tc.desc Verify codePointCount() from middle to end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let result: int = text.codePointCount(3, 6);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_1900
     * @tc.name testCodePointCount019
     * @tc.desc Verify codePointCount(0, length) on pure ASCII equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2000
     * @tc.name testCodePointCount020
     * @tc.desc Verify codePointCount() with beginIndex > endIndex throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      try {
        let result: int = text.codePointCount(7, 4);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2100
     * @tc.name testCodePointCount021
     * @tc.desc Verify codePointCount(0, 0) on non-empty string returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: int = text.codePointCount(0, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2200
     * @tc.name testCodePointCount022
     * @tc.desc Verify codePointCount() on substring portion via dynamic indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      let start: int = 4;
      let end: int = 9;
      let result: int = text.codePointCount(start, end);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2300
     * @tc.name testCodePointCount023
     * @tc.desc Verify codePointCount() counts zero-width space as one code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2400
     * @tc.name testCodePointCount024
     * @tc.desc Verify codePointCount() counts replacement character as one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2500
     * @tc.name testCodePointCount025
     * @tc.desc Verify codePointCount() counts fullwidth dash as one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2014");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2600
     * @tc.name testCodePointCount026
     * @tc.desc Verify codePointCount() counts Arabic letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2700
     * @tc.name testCodePointCount027
     * @tc.desc Verify codePointCount() counts business date string characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2800
     * @tc.name testCodePointCount028
     * @tc.desc Verify codePointCount() counts emoji pair and CJK character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00\u4E2D");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_2900
     * @tc.name testCodePointCount029
     * @tc.desc Verify codePointCount() counts masked bank card display characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_3000
     * @tc.name testCodePointCount030
     * @tc.desc Verify codePointCount() counts NUL inside ASCII text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let result: int = text.codePointCount(0, text.length);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_3100
     * @tc.name testCodePointCount031
     * @tc.desc Verify CodePointCount handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: int = source.codePointCount(0, source.length);
      expect(result).assertEqual(source.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CODEPOINTCOUNT_3200
     * @tc.name testCodePointCount032
     * @tc.desc Verify CodePointCount handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodePointCount032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: int = source.codePointCount(0, source.length);
      expect(result).assertEqual(source.length);
    });
  });
}
