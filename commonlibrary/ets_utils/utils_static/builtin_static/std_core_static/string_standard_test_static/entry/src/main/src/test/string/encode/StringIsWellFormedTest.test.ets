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

export default function StringIsWellFormedTest(): void {
  describe('StringIsWellFormedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0100
     * @tc.name testIsWellFormed001
     * @tc.desc Verify isWellFormed() on ASCII string with only BMP characters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0200
     * @tc.name testIsWellFormed002
     * @tc.desc Verify isWellFormed() on unpaired high surrogate (0xD800) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0300
     * @tc.name testIsWellFormed003
     * @tc.desc Verify isWellFormed() on no-arg constructed empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0400
     * @tc.name testIsWellFormed004
     * @tc.desc Verify isWellFormed() with valid surrogate pair emoji returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0500
     * @tc.name testIsWellFormed005
     * @tc.desc Verify isWellFormed() on unpaired low surrogate (0xDC00) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDC00");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0600
     * @tc.name testIsWellFormed006
     * @tc.desc Verify isWellFormed() with isolated high surrogate at end of ASCII string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB\uD800");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0700
     * @tc.name testIsWellFormed007
     * @tc.desc Verify isWellFormed() with unpaired surrogate between ASCII characters returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD800C");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0800
     * @tc.name testIsWellFormed008
     * @tc.desc Verify isWellFormed() on CJK Unicode BMP characters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_0900
     * @tc.name testIsWellFormed009
     * @tc.desc Verify isWellFormed() on ISO 8859-1 Latin precomposed characters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1000
     * @tc.name testIsWellFormed010
     * @tc.desc Verify isWellFormed() on combining character sequence returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1100
     * @tc.name testIsWellFormed011
     * @tc.desc Verify isWellFormed() on GBK Chinese text returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1200
     * @tc.name testIsWellFormed012
     * @tc.desc Verify isWellFormed() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\uD800");
      let wf: boolean = text.isWellFormed();
      expect(wf).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1300
     * @tc.name testIsWellFormed013
     * @tc.desc Verify isWellFormed() returns true for plain ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("12345!@#$%");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1400
     * @tc.name testIsWellFormed014
     * @tc.desc Verify isWellFormed() on empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1500
     * @tc.name testIsWellFormed015
     * @tc.desc Verify isWellFormed() accepts an API payload with a valid emoji surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("message=\uD83D\uDE00;status=ok");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1600
     * @tc.name testIsWellFormed016
     * @tc.desc Verify isWellFormed() rejects reversed surrogate order in imported data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDE00\uD83D");
      expect(text.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1700
     * @tc.name testIsWellFormed017
     * @tc.desc Verify isWellFormed() rejects a truncated surrogate before a CSV delimiter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("id=7\uD800,name=ark");
      expect(text.isWellFormed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1800
     * @tc.name testIsWellFormed018
     * @tc.desc Verify isWellFormed() accepts multiple valid emoji pairs in notification text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00\uD83D\uDE03 ready");
      expect(text.isWellFormed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_1900
     * @tc.name testIsWellFormed019
     * @tc.desc Verify isWellFormed() accepts Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2000
     * @tc.name testIsWellFormed020
     * @tc.desc Verify isWellFormed() accepts zero-width space text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2100
     * @tc.name testIsWellFormed021
     * @tc.desc Verify isWellFormed() rejects isolated low surrogate in encoded text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uDC04");
      let result: boolean = text.isWellFormed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2200
     * @tc.name testIsWellFormed022
     * @tc.desc Verify isWellFormed() accepts replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2300
     * @tc.name testIsWellFormed023
     * @tc.desc Verify isWellFormed() accepts maximum BMP noncharacter U+FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFF");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2400
     * @tc.name testIsWellFormed024
     * @tc.desc Verify isWellFormed() rejects high surrogate before space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD800 ");
      let result: boolean = text.isWellFormed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2500
     * @tc.name testIsWellFormed025
     * @tc.desc Verify isWellFormed() accepts emoji followed by CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00\u4E2D");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2600
     * @tc.name testIsWellFormed026
     * @tc.desc Verify isWellFormed() accepts Japanese Katakana text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u30C6\u30B9\u30C8");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2700
     * @tc.name testIsWellFormed027
     * @tc.desc Verify isWellFormed() accepts Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2800
     * @tc.name testIsWellFormed028
     * @tc.desc Verify isWellFormed() rejects isolated high surrogate at end of phone field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("13800138000\uD800");
      let result: boolean = text.isWellFormed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_2900
     * @tc.name testIsWellFormed029
     * @tc.desc Verify isWellFormed() accepts date-format ASCII field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_3000
     * @tc.name testIsWellFormed030
     * @tc.desc Verify isWellFormed() accepts escaped NUL inside ASCII text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let result: boolean = text.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_3100
     * @tc.name testIsWellFormed031
     * @tc.desc Verify IsWellFormed handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: boolean = source.isWellFormed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISWELLFORMED_3200
     * @tc.name testIsWellFormed032
     * @tc.desc Verify IsWellFormed handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsWellFormed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: boolean = source.isWellFormed();
      expect(result).assertTrue();
    });
  });
}
