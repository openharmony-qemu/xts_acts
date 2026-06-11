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

export default function StringToLocaleLowerCaseTest(): void {
  describe('StringToLocaleLowerCaseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0100
     * @tc.name testToLocaleLowerCase001
     * @tc.desc Verify toLocaleLowerCase() converts ASCII uppercase to lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO World");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0200
     * @tc.name testToLocaleLowerCase002
     * @tc.desc Verify toLocaleLowerCase() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0300
     * @tc.name testToLocaleLowerCase003
     * @tc.desc Verify toLocaleLowerCase() on already-lowercase string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("arkts");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("arkts");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0400
     * @tc.name testToLocaleLowerCase004
     * @tc.desc Verify toLocaleLowerCase() on CJK and numbers returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试123");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("中文测试123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0500
     * @tc.name testToLocaleLowerCase005
     * @tc.desc Verify toLocaleLowerCase() with GBK Chinese and mixed case ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文ABC测试");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("中文abc测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0600
     * @tc.name testToLocaleLowerCase006
     * @tc.desc Verify toLocaleLowerCase() with full-width uppercase returns full-width lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ＡＢＣ");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("ａｂｃ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0700
     * @tc.name testToLocaleLowerCase007
     * @tc.desc Verify toLocaleLowerCase() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("MiXeD");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("mixed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0800
     * @tc.name testToLocaleLowerCase008
     * @tc.desc Verify toLocaleLowerCase() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let result: string = text.toLocaleLowerCase();
      expect(text.toString()).assertEqual("HELLO");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_0900
     * @tc.name testToLocaleLowerCase009
     * @tc.desc Verify toLocaleLowerCase() called twice gives same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let once: string = text.toLocaleLowerCase();
      const text1 = new String(once);
      let twice: string = text1.toLocaleLowerCase();
      expect(twice).assertEqual(once);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1000
     * @tc.name testToLocaleLowerCase010
     * @tc.desc Verify toLocaleLowerCase() preserves return value length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.toLocaleLowerCase();
      expect(result.length).assertEqual(text.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1100
     * @tc.name testToLocaleLowerCase011
     * @tc.desc Verify toLocaleLowerCase() on single uppercase character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1200
     * @tc.name testToLocaleLowerCase012
     * @tc.desc Verify toLocaleLowerCase() on only-spaces string preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1300
     * @tc.name testToLocaleLowerCase013
     * @tc.desc Verify toLocaleLowerCase() on numbers-only returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1234567890");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("1234567890");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1400
     * @tc.name testToLocaleLowerCase014
     * @tc.desc Verify toLocaleLowerCase() preserves symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("PRICE: $100 @STORE");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("price: $100 @store");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1500
     * @tc.name testToLocaleLowerCase015
     * @tc.desc Verify toLocaleLowerCase() for case-insensitive search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Blue Whale");
      let lowered: string = text.toLocaleLowerCase();
      const text2 = new String(lowered);
      let inc: boolean = text2.includes("blue");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1600
     * @tc.name testToLocaleLowerCase016
     * @tc.desc Verify toLocaleLowerCase() chained with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  HELLO  ");
      let result: string = text.trim().toLocaleLowerCase();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1700
     * @tc.name testToLocaleLowerCase017
     * @tc.desc Verify toLocaleLowerCase() chained with substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO WORLD");
      let result: string = text.substring(0, 5).toLocaleLowerCase();
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1800
     * @tc.name testToLocaleLowerCase018
     * @tc.desc Verify toLocaleLowerCase() with accented uppercase characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("CAFÉ");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_1900
     * @tc.name testToLocaleLowerCase019
     * @tc.desc Verify toLocaleLowerCase() vs toLowerCase() for ASCII gives same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO WORLD");
      let localeResult: string = text.toLocaleLowerCase();
      let lowerResult: String = text.toLowerCase();
      expect(localeResult).assertEqual(lowerResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2000
     * @tc.name testToLocaleLowerCase020
     * @tc.desc Verify toLocaleLowerCase() on all-uppercase alphabet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("abcdefghijklmnopqrstuvwxyz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2100
     * @tc.name testToLocaleLowerCase021
     * @tc.desc Verify toLocaleLowerCase() on very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEFGHIJ".repeat(10));
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("abcdefghij".repeat(10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2200
     * @tc.name testToLocaleLowerCase022
     * @tc.desc Verify toLocaleLowerCase() on already lowercase string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("already lowercase text");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("already lowercase text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2300
     * @tc.name testToLocaleLowerCase023
     * @tc.desc Verify toLocaleLowerCase() on numbers and symbols only returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2024-06-10 !@#$");
      let result: string = text.toLocaleLowerCase();
      expect(result).assertEqual("2024-06-10 !@#$");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2400
     * @tc.name testToLocaleLowerCase024
     * @tc.desc Verify toLocaleLowerCase("tr") handles Turkish I/i (dotted/dotless) correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("İSTANBUL");
      let result: string = text.toLocaleLowerCase("tr");
      expect(result).assertEqual("istanbul");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2500
     * @tc.name testToLocaleLowerCase025
     * @tc.desc Verify toLocaleLowerCase("de") converts German STRASSE with ß
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("STRAßE");
      let result: string = text.toLocaleLowerCase("de");
      expect(result).assertEqual("straße");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2600
     * @tc.name testToLocaleLowerCase026
     * @tc.desc Verify toLocaleLowerCase("el") converts Greek text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ΚΑΛΗΜΕΡΑ");
      let result: string = text.toLocaleLowerCase("el");
      expect(result).assertEqual("καλημερα");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2700
     * @tc.name testToLocaleLowerCase027
     * @tc.desc Verify toLocaleLowerCase() with non-existent locale falls back gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HELLO");
      let result: string = text.toLocaleLowerCase("zz-ZZ");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TOLOCALELOWERCASE_2800
     * @tc.name testToLocaleLowerCase028
     * @tc.desc Verify toLocaleLowerCase() with empty string locale falls back gracefully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testToLocaleLowerCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.toLocaleLowerCase("");
      expect(result).assertEqual("abc");
    });
  });
}
