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

export default function StringSubstrTest(): void {
  describe('StringSubstrTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0100
     * @tc.name testSubstr001
     * @tc.desc Verify substr() extracts substring from index with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.substr(0, 3);
      expect(result).assertEqual("Ark");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0200
     * @tc.name testSubstr002
     * @tc.desc Verify substr() without length extracts to end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.substr(3);
      expect(result).assertEqual("TS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0300
     * @tc.name testSubstr003
     * @tc.desc Verify substr() with negative start counts from end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.substr(-2);
      expect(result).assertEqual("TS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0400
     * @tc.name testSubstr004
     * @tc.desc Verify substr() with length exceeding remaining returns to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.substr(1, 100);
      expect(result).assertEqual("BC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0500
     * @tc.name testSubstr005
     * @tc.desc Verify substr() with zero length returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.substr(1, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0600
     * @tc.name testSubstr006
     * @tc.desc Verify substr() at position 0 with full length returns original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.substr(0, text.length);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0700
     * @tc.name testSubstr007
     * @tc.desc Verify substr() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      let result: string = text.substr(2, 2);
      expect(result).assertEqual("世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0800
     * @tc.name testSubstr008
     * @tc.desc Verify substr() with emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B");
      let result: string = text.substr(0, 1);
      expect(result).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_0900
     * @tc.name testSubstr009
     * @tc.desc Verify substr() with negative start larger than length returns from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.substr(-10);
      expect(result).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1000
     * @tc.name testSubstr010
     * @tc.desc Verify substr(-3, 2) with negative start and length extracts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEF");
      let result: string = text.substr(-3, 2);
      expect(result).assertEqual("DE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1100
     * @tc.name testSubstr011
     * @tc.desc Verify substr() across emoji surrogate pair keeps 2 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B");
      let result: string = text.substr(1, 2);
      expect(result).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1200
     * @tc.name testSubstr012
     * @tc.desc Verify substr() on combining character sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aéb");
      let result: string = text.substr(1, 1);
      expect(result).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1300
     * @tc.name testSubstr013
     * @tc.desc Verify substr() on GBK Chinese text extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: string = text.substr(2, 2);
      expect(result).assertEqual("测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1400
     * @tc.name testSubstr014
     * @tc.desc Verify substr() with C0 control characters extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb\tc");
      let result: string = text.substr(1, 2);
      expect(result).assertEqual("\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1500
     * @tc.name testSubstr015
     * @tc.desc Verify substr() with dynamic start and length variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let start: int = 4;
      let len: int = 6;
      let result: string = text.substr(start, len);
      expect(result).assertEqual("Script");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1600
     * @tc.name testSubstr016
     * @tc.desc Verify substr() with start beyond length returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.substr(10);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1700
     * @tc.name testSubstr017
     * @tc.desc Verify substr() with negative start beyond negative length returns from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.substr(-100, 2);
      expect(result).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1800
     * @tc.name testSubstr018
     * @tc.desc Verify substr() with start=0 and length=0 returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.substr(0, 0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_1900
     * @tc.name testSubstr019
     * @tc.desc Verify substr() with start at last char and no length returns last char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: string = text.substr(4);
      expect(result).assertEqual("E");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2000
     * @tc.name testSubstr020
     * @tc.desc Verify substr() with negative start of exactly -1 returns last char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.substr(-1, 1);
      expect(result).assertEqual("o");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2100
     * @tc.name testSubstr021
     * @tc.desc Verify substr() from middle to end returns suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let result: string = text.substr(6);
      expect(result).assertEqual("World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2200
     * @tc.name testSubstr022
     * @tc.desc Verify substr() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let result: string = text.substr(0, 5);
      expect(text.toString()).assertEqual("Hello World");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2300
     * @tc.name testSubstr023
     * @tc.desc Verify substr() chained with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: string = text.substr(0, 5).toUpperCase();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2400
     * @tc.name testSubstr024
     * @tc.desc Verify substr() with exact length extraction from middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdefgh");
      let result: string = text.substr(3, 3);
      expect(result).assertEqual("def");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2500
     * @tc.name testSubstr025
     * @tc.desc Verify substr() with negative start perfectly extracting suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let result: string = text.substr(-5);
      expect(result).assertEqual("World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2600
     * @tc.name testSubstr026
     * @tc.desc Verify substr() with negative start and very large length extracts suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEF");
      let result: string = text.substr(-2, 100);
      expect(result).assertEqual("EF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2700
     * @tc.name testSubstr027
     * @tc.desc Verify substr() result type is always string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let r1: string = text.substr(0, 3);
      let r2: string = text.substr(10);
      expect(r1).assertEqual("Hel");
      expect(r2).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2800
     * @tc.name testSubstr028
     * @tc.desc Verify substr() with negative length treated as 0 returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.substr(1, -5);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_2900
     * @tc.name testSubstr029
     * @tc.desc Verify substr() with negative start equal to -length returns entire string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.substr(-5);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_3000
     * @tc.name testSubstr030
     * @tc.desc Verify substr() chained with includes on extracted portion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let sub: string = text.substr(6, 5);
      let inc: boolean = sub.includes("world");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_3100
     * @tc.name testSubstr031
     * @tc.desc Verify substr() handles literal malformed Unicode escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\u malformed");
      let result: string = source.substr(0, source.length);
      expect(result).assertEqual("\\u malformed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_3200
     * @tc.name testSubstr032
     * @tc.desc Verify Substr handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.substr(0, 10);
      expect(result).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUBSTR_3300
     * @tc.name testSubstr033
     * @tc.desc Verify Substr handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSubstr033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.substr(0, 3);
      expect(result).assertEqual("テスト");
    });
  });
}
