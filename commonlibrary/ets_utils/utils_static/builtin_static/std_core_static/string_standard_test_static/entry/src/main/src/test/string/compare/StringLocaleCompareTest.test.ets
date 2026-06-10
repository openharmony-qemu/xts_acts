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
      let result: number = text.localeCompare("الاختبار");
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
      let result: number = text.localeCompare("你好");
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
      let result: number = text.localeCompare("テスト");
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
      let result: number = text.localeCompare("АБВ");
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
      let result: number = text.localeCompare("😀🎉");
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
      let result: number = text.localeCompare("café");
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
      let result: number = text.localeCompare("中文测试");
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
     * @tc.desc Verify localeCompare() with dynamic variable returns correct comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLocaleCompare014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("ArkTS");
      let other: string = "ArkTS";
      let result: number = text.localeCompare(other);
      expect(result).assertEqual(0);
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
  });
}
