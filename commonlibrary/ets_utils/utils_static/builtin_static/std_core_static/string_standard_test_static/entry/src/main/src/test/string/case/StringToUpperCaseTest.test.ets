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

export default function StringToUpperCaseTest(): void {
  describe('StringToUpperCaseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0100
     * @tc.name testToUpperCase001
     * @tc.desc Verify toUpperCase() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("arkts");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("ARKTS");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0200
     * @tc.name testToUpperCase002
     * @tc.desc Verify toUpperCase() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0300
     * @tc.name testToUpperCase003
     * @tc.desc Verify toUpperCase() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ARKTS");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("ARKTS");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0400
     * @tc.name testToUpperCase004
     * @tc.desc Verify toUpperCase() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("abc123xyz");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("ABC123XYZ");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0500
     * @tc.name testToUpperCase005
     * @tc.desc Verify toUpperCase() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("z");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0600
     * @tc.name testToUpperCase006
     * @tc.desc Verify toUpperCase() on emoji returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀abc");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("😀ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0700
     * @tc.name testToUpperCase007
     * @tc.desc Verify toUpperCase() on CJK and GBK characters returns unchanged while ASCII converts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试abc");
      let result: String = str.toUpperCase();
      expect(result.toString()).assertEqual("中文测试ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0800
     * @tc.name testToUpperCase008
     * @tc.desc Verify toUpperCase() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("MiXeD");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("MIXED");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_0900
     * @tc.name testToUpperCase009
     * @tc.desc Verify toUpperCase() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: String = text.toUpperCase();
      expect(text.toString()).assertEqual("hello");
      expect(result.toString()).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1000
     * @tc.name testToUpperCase010
     * @tc.desc Verify case-insensitive equality using toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new String("hello");
      const b = new String("HELLO");
      expect(a.toUpperCase().toString()).assertEqual(b.toUpperCase().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1100
     * @tc.name testToUpperCase011
     * @tc.desc Verify toUpperCase() preserves punctuation and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello, world! 123");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("HELLO, WORLD! 123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1200
     * @tc.name testToUpperCase012
     * @tc.desc Verify toUpperCase() on already uppercase returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ARKTS");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("ARKTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1300
     * @tc.name testToUpperCase013
     * @tc.desc Verify toUpperCase() on single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("HELLO WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1400
     * @tc.name testToUpperCase014
     * @tc.desc Verify case-insensitive search using toUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let upper: string = text.toUpperCase().toString();
      const text1 = new String(upper);
      let inc: boolean = text1.includes("HELLO");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1500
     * @tc.name testToUpperCase015
     * @tc.desc Verify toUpperCase() called twice gives same result (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let once: String = text.toUpperCase();
      let twice: String = once.toUpperCase();
      expect(twice.toString()).assertEqual(once.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1600
     * @tc.name testToUpperCase016
     * @tc.desc Verify toUpperCase() chained with substring extracts and transforms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let firstWord: string = text.substring(0, 5).toUpperCase().toString();
      expect(firstWord).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1700
     * @tc.name testToUpperCase017
     * @tc.desc Verify toUpperCase() on full-width lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ａｂｃ");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("ＡＢＣ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1800
     * @tc.name testToUpperCase018
     * @tc.desc Verify toUpperCase() on string with leading/trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("  HELLO  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_1900
     * @tc.name testToUpperCase019
     * @tc.desc Verify toUpperCase() on string with newlines and tabs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\tend");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("LINE1\nLINE2\tEND");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2000
     * @tc.name testToUpperCase020
     * @tc.desc Verify toUpperCase() on very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdefghij".repeat(10));
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("ABCDEFGHIJ".repeat(10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2100
     * @tc.name testToUpperCase021
     * @tc.desc Verify toUpperCase() on mixed scripts preserves non-Latin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello中文123");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("HELLO中文123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2200
     * @tc.name testToUpperCase022
     * @tc.desc Verify toUpperCase() on string with special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price: $100 @store");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("PRICE: $100 @STORE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2300
     * @tc.name testToUpperCase023
     * @tc.desc Verify toUpperCase() with numbers only returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1234567890");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2400
     * @tc.name testToUpperCase024
     * @tc.desc Verify toUpperCase() with underscore-separated identifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("user_name_input");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("USER_NAME_INPUT");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2500
     * @tc.name testToUpperCase025
     * @tc.desc Verify toUpperCase() with camelCase identifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("camelCaseIdentifier");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("CAMELCASEIDENTIFIER");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2600
     * @tc.name testToUpperCase026
     * @tc.desc Verify toUpperCase() preserves surrogate pairs in emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a😀b");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("A😀B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2700
     * @tc.name testToUpperCase027
     * @tc.desc Verify toUpperCase() on all-lowercase alphabet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdefghijklmnopqrstuvwxyz");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2800
     * @tc.name testToUpperCase028
     * @tc.desc Verify chaining toUpperCase() with trim()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trim().toUpperCase().toString();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_2900
     * @tc.name testToUpperCase029
     * @tc.desc Verify toUpperCase() returned string is independent of original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let upper: String = text.toUpperCase();
      expect(text.toString()).assertEqual("hello");
      expect(upper.toString()).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3000
     * @tc.name testToUpperCase030
     * @tc.desc Verify toUpperCase() on string with only symbols returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!@#$%^&*()");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOUPPERCASE_3100
     * @tc.name testToUpperCase031
     * @tc.desc Verify toUpperCase() on ISO 8859-1 Latin accented lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToUpperCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: String = text.toUpperCase();
      expect(result.toString()).assertEqual("CAFÉ");
    });
  });
}
