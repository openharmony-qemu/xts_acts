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

export default function StringContainsTest(): void {
  describe('StringContainsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0100
     * @tc.name testContains001
     * @tc.desc Verify includes() returns true for contained substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1 = new String("ArkTS");
      let inc: boolean = text1.includes("rk");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0200
     * @tc.name testContains002
     * @tc.desc Verify includes() returns false for non-contained substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text2 = new String("ArkTS");
      let inc: boolean = text2.includes("XYZ");
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0300
     * @tc.name testContains003
     * @tc.desc Verify includes() with position parameter starts search at index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text3 = new String("ABAB");
      let inc: boolean = text3.includes("AB", 2);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0400
     * @tc.name testContains004
     * @tc.desc Verify includes() with empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text4 = new String("ArkTS");
      let inc: boolean = text4.includes("");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0500
     * @tc.name testContains005
     * @tc.desc Verify includes() with C0 control carriage-return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text5 = new String("a\rb");
      let inc: boolean = text5.includes("\r");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0600
     * @tc.name testContains006
     * @tc.desc Verify includes() with Unicode supplementary plane emoji substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text6 = new String("hello😀world");
      let inc: boolean = text6.includes("😀");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0700
     * @tc.name testContains007
     * @tc.desc Verify includes() with CJK Unicode BMP Chinese substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text7 = new String("你好世界");
      let inc: boolean = text7.includes("世界");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0800
     * @tc.name testContains008
     * @tc.desc Verify includes() with position beyond match returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text8 = new String("hello");
      let inc: boolean = text8.includes("he", 3);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_0900
     * @tc.name testContains009
     * @tc.desc Verify includes() with whitespace substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text9 = new String("hello world");
      let inc: boolean = text9.includes(" ");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1000
     * @tc.name testContains010
     * @tc.desc Verify includes() with C0 control tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text10 = new String("a\tb");
      let inc: boolean = text10.includes("\t");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1100
     * @tc.name testContains011
     * @tc.desc Verify includes() with substring spanning emoji boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = new String("A😀B");
      let inc: boolean = text.includes("A😀");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1200
     * @tc.name testContains012
     * @tc.desc Verify includes() with GBK Chinese substring spanning two characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let inc: boolean = text.includes("文测");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1300
     * @tc.name testContains013
     * @tc.desc Verify includes() with ISO 8859-1 Latin precomposed accented characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café latte");
      let inc: boolean = text.includes("fé");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1400
     * @tc.name testContains014
     * @tc.desc Verify includes() with C0 control NUL character in middle of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\0b");
      let inc: boolean = text.includes("\0");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1500
     * @tc.name testContains015
     * @tc.desc Verify includes() with newline C0 control character returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2");
      let inc: boolean = text.includes("\n");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1600
     * @tc.name testContains016
     * @tc.desc Verify includes() with search string equal to the entire text returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HarmonyOS");
      let inc: boolean = text.includes("HarmonyOS");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1700
     * @tc.name testContains017
     * @tc.desc Verify includes() with position equal to length returns false for non-empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let inc: boolean = text.includes("c", 3);
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1800
     * @tc.name testContains018
     * @tc.desc Verify includes() with dynamic search string and position variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let search: string = "Script";
      let pos: int = 4;
      let inc: boolean = text.includes(search, pos);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_1900
     * @tc.name testContains019
     * @tc.desc Verify includes() with negative position treats it as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let inc: boolean = text.includes("Hello", -1);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2000
     * @tc.name testContains020
     * @tc.desc Verify includes() with empty search and position greater than length returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let inc: boolean = text.includes("", 10);
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2100
     * @tc.name testContains021
     * @tc.desc Verify includes() with search string longer than source returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let inc: boolean = text.includes("Hello World");
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2200
     * @tc.name testContains022
     * @tc.desc Verify includes() with empty source and empty search returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let inc: boolean = text.includes("");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2300
     * @tc.name testContains023
     * @tc.desc Verify includes() with empty source and non-empty search returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let inc: boolean = text.includes("a");
      expect(inc).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2400
     * @tc.name testContains024
     * @tc.desc Verify includes() is case-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Blue Whale");
      expect(text.includes("blue")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2500
     * @tc.name testContains025
     * @tc.desc Verify includes() case-insensitive via toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Blue Whale");
      let lower: string = text.toLowerCase();
      const text11 = new String(lower);
      let inc: boolean = text11.includes("blue");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2600
     * @tc.name testContains026
     * @tc.desc Verify includes() with orphan high surrogate in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\uD800b");
      let inc: boolean = text.includes("\uD800");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS_2700
     * @tc.name testContains027
     * @tc.desc Verify includes() with non-breaking space U+00A0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContains027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nbsp: string = String.fromCharCode(0x00A0);
      const text = new String("Hello" + nbsp + "World");
      let inc: boolean = text.includes(nbsp);
      expect(inc).assertTrue();
    });
  });
}
