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

export default function StringConcatTest(): void {
  describe('StringConcatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0100
     * @tc.name testConcat001
     * @tc.desc Verify concat() appends ASCII string to this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.concat("-Sta");
      expect(result.toString()).assertEqual("ArkTS-Sta");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0200
     * @tc.name testConcat002
     * @tc.desc Verify concat() with empty string returns this unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.concat("");
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0300
     * @tc.name testConcat003
     * @tc.desc Verify concat() with CJK Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: String = text.concat("世界");
      expect(result.toString()).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0400
     * @tc.name testConcat004
     * @tc.desc Verify concat() preserves special character in argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.concat("+B");
      expect(result.toString()).assertEqual("A+B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0500
     * @tc.name testConcat005
     * @tc.desc Verify concat() with emoji Unicode supplementary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: String = text.concat("🎉");
      expect(result.toString()).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0600
     * @tc.name testConcat006
     * @tc.desc Verify concat() concatenates multiple strings step by step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let r1: String = text.concat("B");
      let r2: String = r1.concat("C");
      expect(r2.toString()).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0700
     * @tc.name testConcat007
     * @tc.desc Verify concat() with numeric string preserves digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("v");
      let result: String = text.concat("2.0");
      expect(result.toString()).assertEqual("v2.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0800
     * @tc.name testConcat008
     * @tc.desc Verify concat() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.concat("B");
      expect(text.toString()).assertEqual("A");
      expect(result.toString()).assertEqual("AB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_0900
     * @tc.name testConcat009
     * @tc.desc Verify concat() of two empty strings returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.concat("");
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1000
     * @tc.name testConcat010
     * @tc.desc Verify concat() with newline control character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.concat("\n");
      expect(result.toString()).assertEqual("A\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1100
     * @tc.name testConcat011
     * @tc.desc Verify concat() with tab and null byte control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let r1: String = text.concat("\t");
      let r2: String = r1.concat("\0");
      let r3: String = r2.concat("B");
      expect(r3.toString()).assertEqual("A\t\0B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1200
     * @tc.name testConcat012
     * @tc.desc Verify concat() with ISO 8859-1 Latin precomposed characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: String = text.concat(" latté");
      expect(result.toString()).assertEqual("café latté");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1300
     * @tc.name testConcat013
     * @tc.desc Verify concat() with GBK Chinese text preserves both strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let result: String = text.concat("测试");
      expect(result.toString()).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1400
     * @tc.name testConcat014
     * @tc.desc Verify concat() with itself produces repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: String = text.concat(text);
      expect(result.toString()).assertEqual("ABAB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1500
     * @tc.name testConcat015
     * @tc.desc Verify concat() with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      const suffix = new String("BCDEFGHIJ");
      let result: String = text.concat(suffix);
      expect(result.toString()).assertEqual("ABCDEFGHIJ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1600
     * @tc.name testConcat016
     * @tc.desc Verify concat() with dynamic variables does not modify original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      const suffix: String = new String(" World");
      let result: String = text.concat(suffix);
      expect(text.toString()).assertEqual("Hello");
      expect(result.toString()).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1700
     * @tc.name testConcat017
     * @tc.desc Verify concat() concatenates two strings with a separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str1 = new String('Hello');
      let result: String = str1.concat(' ').concat('World');
      expect(result.toString()).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1800
     * @tc.name testConcat018
     * @tc.desc Verify concat() appends to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str = new String('Hello');
      let result: String = str.concat(' World');
      expect(result.toString()).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1900
     * @tc.name testConcat019
     * @tc.desc Verify concat() with String containing numeric text '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str = new String('Value: ');
      let result: String = str.concat(new String('42'));
      expect(result.toString()).assertEqual('Value: 42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2000
     * @tc.name testConcat020
     * @tc.desc Verify concat() with String containing boolean text 'true'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str = new String('Result: ');
      let result: String = str.concat(new String('true'));
      expect(result.toString()).assertEqual('Result: true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2100
     * @tc.name testConcat021
     * @tc.desc Verify concat() with String containing null text 'null'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str = new String('Value: ');
      let result: String = str.concat(new String('null'));
      expect(result.toString()).assertEqual('Value: null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2200
     * @tc.name testConcat022
     * @tc.desc Verify concat() builds URL query text from multiple segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const path = new String("/search");
      let result: String = path.concat("?q=").concat("arkts").concat("&page=1");
      expect(result.toString()).assertEqual("/search?q=arkts&page=1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2300
     * @tc.name testConcat023
     * @tc.desc Verify multiple concat chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a");
      let result: String = text.concat("b").concat("c").concat("d");
      expect(result.toString()).assertEqual("abcd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2400
     * @tc.name testConcat024
     * @tc.desc Verify concat() result is searchable with indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.concat(" world");
      expect(result.indexOf("world")).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2500
     * @tc.name testConcat025
     * @tc.desc Verify concat() then toUpperCase chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.concat(" world").toUpperCase();
      expect(result.toString()).assertEqual("HELLO WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2600
     * @tc.name testConcat026
     * @tc.desc Verify concat() preserves ordering across mixed character sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let step1: String = text.concat("\u4E2D");
      let step2: String = step1.concat("\u0391");
      let step3: String = step2.concat("\u0627");
      let result: String = step3.concat("\u05D0");
      expect(result.toString()).assertEqual("A\u4E2D\u0391\u0627\u05D0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2700
     * @tc.name testConcat027
     * @tc.desc Verify concat() on empty source appends argument content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.concat("suffix");
      expect(result.toString()).assertEqual("suffix");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2800
     * @tc.name testConcat028
     * @tc.desc Verify concat() preserves backslash characters in path-like text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("C:");
      let result: String = text.concat("\\temp");
      expect(result.toString()).assertEqual("C:\\temp");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2900
     * @tc.name testConcat029
     * @tc.desc Verify concat() with surrogate pair between BMP characters preserves code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: String = text.concat("\uD83D\uDE00").concat("B");
      expect(result.toString()).assertEqual("A\uD83D\uDE00B");
      expect(result.getLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_3000
     * @tc.name testConcat030
     * @tc.desc Verify concat() with long suffix preserves resulting length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let suffix: string = "b".repeat(100);
      let result: String = text.concat(suffix);
      expect(result.getLength()).assertEqual(101);
      expect(result.charAt(0)).assertEqual(c'A')
      ;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_3100
     * @tc.name testConcat031
     * @tc.desc Verify concat() handles illegal UTF-8 single-byte spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4");
      let result: string = source.concat("");
      expect(result).assertEqual("\\xe4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_3200
     * @tc.name testConcat032
     * @tc.desc Verify Concat handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.concat(" END");
      expect(result).assertEqual(source.toString() + " END");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_3300
     * @tc.name testConcat033
     * @tc.desc Verify Concat handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.concat(" END");
      expect(result).assertEqual(source.toString() + " END");
    });
  });
}
