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

export default function StringLocaleCompareTest(): void {
  describe('StringLocaleCompareTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0100
     * @tc.name testLocaleCompare001
     * @tc.desc Verify localeCompare() returns 0 for equal ASCII strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: number = text.localeCompare("ArkTS");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0200
     * @tc.name testLocaleCompare002
     * @tc.desc Verify localeCompare() returns 0 for equal Arabic RTL text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("الاختبار");
      let result: number = text.localeCompare("الاختبار", "ar-SA");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0300
     * @tc.name testLocaleCompare003
     * @tc.desc Verify localeCompare() returns 0 for equal CJK Unicode BMP strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: number = text.localeCompare("你好", "zh-Hans-CN");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0400
     * @tc.name testLocaleCompare004
     * @tc.desc Verify localeCompare() with different strings returns non-zero and opposite signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let r1: number = text.localeCompare("xyz");
      const text1 = new String("xyz");
      let r2: number = text1.localeCompare("abc");
      let oppSign: boolean = (r1 < 0 && r2 > 0) || (r1 > 0 && r2 < 0);
      expect(oppSign).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0500
     * @tc.name testLocaleCompare005
     * @tc.desc Verify localeCompare() with empty string versus non-empty returns negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: number = text.localeCompare("a");
      let lt: boolean = result < 0;
      expect(lt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0600
     * @tc.name testLocaleCompare006
     * @tc.desc Verify localeCompare() returns 0 for equal numeric strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123");
      let result: number = text.localeCompare("123");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0700
     * @tc.name testLocaleCompare007
     * @tc.desc Verify localeCompare() returns 0 for equal Japanese katakana text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("テスト");
      let result: number = text.localeCompare("テスト", "ja-JP");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0800
     * @tc.name testLocaleCompare008
     * @tc.desc Verify localeCompare() returns 0 for equal Russian Cyrillic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("АБВ");
      let result: number = text.localeCompare("АБВ", "ru-RU");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_0900
     * @tc.name testLocaleCompare009
     * @tc.desc Verify localeCompare() returns 0 for equal emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀🎉");
      let result: number = text.localeCompare("😀🎉", "en-US");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1000
     * @tc.name testLocaleCompare010
     * @tc.desc Verify localeCompare() returns 0 for equal ISO 8859-1 Latin accented text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: number = text.localeCompare("café", "en-US");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1100
     * @tc.name testLocaleCompare011
     * @tc.desc Verify localeCompare() returns 0 for equal GBK Chinese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: number = text.localeCompare("中文测试", "zh-Hans-CN");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1200
     * @tc.name testLocaleCompare012
     * @tc.desc Verify localeCompare() with dynamic variables returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("Node");
      let other: string = "Node";
      let result: number = text.localeCompare(other);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1300
     * @tc.name testLocaleCompare013
     * @tc.desc Verify localeCompare() with locales parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("z");
      let other: string = "a";
      let result: number = text.localeCompare(other, "zh-Hans-CN");
      let gt: boolean = result > 0;
      expect(gt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1400
     * @tc.name testLocaleCompare014
     * @tc.desc Verify localeCompare() without locale parameter matches explicit default locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let defaultLocale: string = Intl.DateTimeFormat().resolvedOptions().locale;
      let result: number = text.localeCompare("hello");
      let explicitResult: number = text.localeCompare("hello", defaultLocale);
      expect(result).assertEqual(explicitResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1500
     * @tc.name testLocaleCompare015
     * @tc.desc Verify localeCompare() returns negative when this comes before argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a");
      let result: number = text.localeCompare("b");
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1600
     * @tc.name testLocaleCompare016
     * @tc.desc Verify localeCompare() returns positive when this comes after argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("b");
      let result: number = text.localeCompare("a");
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1700
     * @tc.name testLocaleCompare017
     * @tc.desc Verify localeCompare() compares explicit null string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("null");
      let converted: string = String(null);
      let result: number = text.localeCompare(converted);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1800
     * @tc.name testLocaleCompare018
     * @tc.desc Verify localeCompare() compares explicit undefined string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("undefined");
      let converted: string = String(undefined);
      let result: number = text.localeCompare(converted);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_1900
     * @tc.name testLocaleCompare019
     * @tc.desc Verify localeCompare() accepts locales as a string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let locales: string[] = ["en-US"];
      let result: number = text.localeCompare("abc", locales);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2000
     * @tc.name testLocaleCompare020
     * @tc.desc Verify localeCompare() with German de-DE locale returns 0 for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Straße");
      let result: number = text.localeCompare("Straße", "de-DE");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2100
     * @tc.name testLocaleCompare021
     * @tc.desc Verify localeCompare() with Turkish tr-TR locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("İstanbul");
      let result: number = text.localeCompare("İstanbul", "tr-TR");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2200
     * @tc.name testLocaleCompare022
     * @tc.desc Verify localeCompare() with Korean ko-KR locale returns 0 for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("한국어");
      let result: number = text.localeCompare("한국어", "ko-KR");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2300
     * @tc.name testLocaleCompare023
     * @tc.desc Verify localeCompare() with French fr-FR locale returns 0 for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("français");
      let result: number = text.localeCompare("français", "fr-FR");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2400
     * @tc.name testLocaleCompare024
     * @tc.desc Verify localeCompare() accepts locales as array with multiple fallback locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let locales: string[] = ["de-DE", "en-US"];
      let result: number = text.localeCompare("hello", locales);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2500
     * @tc.name testLocaleCompare025
     * @tc.desc Verify localeCompare() with non-existent locale falls back gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: number = text.localeCompare("hello", "xx-XX");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2600
     * @tc.name testLocaleCompare026
     * @tc.desc Verify localeCompare() with empty string locale falls back gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: number = text.localeCompare("xyz", "");
      let lt: boolean = result < 0;
      expect(lt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2700
     * @tc.name testLocaleCompare027
     * @tc.desc Verify localeCompare() returns zero for equal Unicode escape CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: number = text.localeCompare("\u4E2D\u6587", "zh-Hans-CN");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2800
     * @tc.name testLocaleCompare028
     * @tc.desc Verify localeCompare() returns zero for equal Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: number = text.localeCompare("\u0627\u0628", "ar-SA");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_2900
     * @tc.name testLocaleCompare029
     * @tc.desc Verify localeCompare() handles zero-width space against empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u200B");
      let result: number = text.localeCompare("");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_3000
     * @tc.name testLocaleCompare030
     * @tc.desc Verify localeCompare() returns zero for equal date-format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: number = text.localeCompare("2026-03-05", "en-US");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_3100
     * @tc.name testLocaleCompare031
     * @tc.desc Verify localeCompare() handles isolated low surrogate U+DC04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uDC04");
      let result: number = source.localeCompare(source.toString());
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_3200
     * @tc.name testLocaleCompare032
     * @tc.desc Verify LocaleCompare handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const source = new String(expected);
      let result: number = source.localeCompare(expected);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE_3300
     * @tc.name testLocaleCompare033
     * @tc.desc Verify LocaleCompare handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const source = new String(expected);
      let result: number = source.localeCompare(expected);
      expect(result).assertEqual(0);
    });
  });
}
