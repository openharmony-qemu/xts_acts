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
     * @tc.desc Verify + operator concatenates two strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: string = 'Hello';
      let str2: string = 'World';
      let result: string = str1 + ' ' + str2;
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1800
     * @tc.name testConcat018
     * @tc.desc Verify += operator appends to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello';
      str += ' World';
      expect(str).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_1900
     * @tc.name testConcat019
     * @tc.desc Verify + operator concatenates string with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Value: ' + 42;
      expect(str).assertEqual('Value: 42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2000
     * @tc.name testConcat020
     * @tc.desc Verify + operator concatenates string with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Result: ' + true;
      expect(str).assertEqual('Result: true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2100
     * @tc.name testConcat021
     * @tc.desc Verify + operator concatenates string with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Value: ' + null;
      expect(str).assertEqual('Value: null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONCAT_2200
     * @tc.name testConcat022
     * @tc.desc Verify + operator with mixed single/double quote strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConcat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: string = 'Hello';
      let str2: string = "World";
      let result: string = str1 + ' ' + str2;
      expect(result).assertEqual('Hello World');
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
  });
}
