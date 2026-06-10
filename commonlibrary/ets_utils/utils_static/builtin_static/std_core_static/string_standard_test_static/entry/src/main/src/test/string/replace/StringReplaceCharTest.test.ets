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

export default function StringReplaceCharTest(): void {
  describe('StringReplaceCharTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0100
     * @tc.name testReplaceChar001
     * @tc.desc Verify replaceChar() replaces all occurrences of a char in ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.replaceChar(c'A', c'a');
      expect(result.toString()).assertEqual("arkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0200
     * @tc.name testReplaceChar002
     * @tc.desc Verify replaceChar() with not-found char returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: String = text.replaceChar(c'Z', c'X');
      expect(result.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0300
     * @tc.name testReplaceChar003
     * @tc.desc Verify replaceChar() at beginning of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Xabc");
      let result: String = text.replaceChar(c'X', c'Y');
      expect(result.toString()).assertEqual("Yabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0400
     * @tc.name testReplaceChar004
     * @tc.desc Verify replaceChar() at end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcX");
      let result: String = text.replaceChar(c'X', c'Z');
      expect(result.toString()).assertEqual("abcZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0500
     * @tc.name testReplaceChar005
     * @tc.desc Verify replaceChar() replaces all occurrences of repeated char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABAB");
      let result: String = text.replaceChar(c'A', c'a');
      expect(result.toString()).assertEqual("aBaB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0600
     * @tc.name testReplaceChar006
     * @tc.desc Verify replaceChar() in middle of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String = text.replaceChar(c'B', c'X');
      expect(result.toString()).assertEqual("AXC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0700
     * @tc.name testReplaceChar007
     * @tc.desc Verify replaceChar() replaces space char with underscore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: String = text.replaceChar(c' ', c'_');
      expect(result.toString()).assertEqual("hello_world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0800
     * @tc.name testReplaceChar008
     * @tc.desc Verify replaceChar() replaces C0 control tab with space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\tb\tc");
      let result: String = text.replaceChar(c'\t', c',');
      expect(result.toString()).assertEqual("a,b,c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_0900
     * @tc.name testReplaceChar009
     * @tc.desc Verify replaceChar() replaces C0 control newline with space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2");
      let result: String = text.replaceChar(c'\n', c'|');
      expect(result.toString()).assertEqual("line1|line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1000
     * @tc.name testReplaceChar010
     * @tc.desc Verify replaceChar() replaces C0 control NUL with placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\0b\0c");
      let result: String = text.replaceChar(c'\0', c'#');
      expect(result.toString()).assertEqual("a#b#c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1100
     * @tc.name testReplaceChar011
     * @tc.desc Verify replaceChar() with CJK Unicode BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文中");
      let result: String = text.replaceChar(c'中', c'大');
      expect(result.toString()).assertEqual("大文大");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1200
     * @tc.name testReplaceChar012
     * @tc.desc Verify replaceChar() with GBK Chinese characters replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("测试测试");
      let result: String = text.replaceChar(c'测', c'检');
      expect(result.toString()).assertEqual("检试检试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1300
     * @tc.name testReplaceChar013
     * @tc.desc Verify replaceChar() replaces digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let result: String = text.replaceChar(c'1', c'X');
      expect(result.toString()).assertEqual("aXb2c3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1400
     * @tc.name testReplaceChar014
     * @tc.desc Verify replaceChar() with dynamic char variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let oldChar: char = c'l';
      let newChar: char = c'L';
      let result: String = text.replaceChar(oldChar, newChar);
      expect(result.toString()).assertEqual("heLLo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1500
     * @tc.name testReplaceChar015
     * @tc.desc Verify replaceChar() with char not found returns original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      let result: String = text.replaceChar(c'z', c'X');
      expect(result.toString()).assertEqual("OpenHarmony");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1600
     * @tc.name testReplaceChar016
     * @tc.desc Verify replaceChar() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String = text.replaceChar(c'a', c'b');
      expect(result.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR_1700
     * @tc.name testReplaceChar017
     * @tc.desc Verify replaceChar() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReplaceChar017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let result: String = text.replaceChar(c'T', c't');
      expect(text.toString()).assertEqual("TypeScript");
      expect(result.toString()).assertEqual("typeScript");
    });
  });
}
