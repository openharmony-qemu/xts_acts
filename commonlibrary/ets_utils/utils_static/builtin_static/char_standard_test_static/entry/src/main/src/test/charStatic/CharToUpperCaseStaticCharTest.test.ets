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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function CharToUpperCaseStaticCharTest(): void {
  describe('CharToUpperCaseStaticCharTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0100
     * @tc.name testCharToUpperCaseStaticChar0001
     * @tc.desc Verify that one char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toUpperCase(c'a');
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0200
     * @tc.name testCharToUpperCaseStaticChar0002
     * @tc.desc Verify that passing valid parameter does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isThrowError = false;
      try {
        const result = Char.toUpperCase(c'a');
      } catch (error) {
        expect(error.name.length > 0).assertTrue();
        isThrowError = true;
      }
      expect(isThrowError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0300
     * @tc.name testCharToUpperCaseStaticChar0003
     * @tc.desc Verify lowercase letters are converted to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'a').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'm').toString()).assertEqual("M");
      expect(Char.toUpperCase(c'z').toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0400
     * @tc.name testCharToUpperCaseStaticChar0004
     * @tc.desc Verify uppercase letters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'A').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'M').toString()).assertEqual("M");
      expect(Char.toUpperCase(c'Z').toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0500
     * @tc.name testCharToUpperCaseStaticChar0005
     * @tc.desc Verify non-letter characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'0').toString()).assertEqual("0");
      expect(Char.toUpperCase(c'9').toString()).assertEqual("9");
      expect(Char.toUpperCase(c'+').toString()).assertEqual("+");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
      expect(Char.toUpperCase(c' ').toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0600
     * @tc.name testCharToUpperCaseStaticChar0006
     * @tc.desc Verify special characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c' ').toString()).assertEqual(" ");
      expect(Char.toUpperCase(c'\t').toString()).assertEqual("\t");
      expect(Char.toUpperCase(c'\n').toString()).assertEqual("\n");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0800
     * @tc.name testCharToUpperCaseStaticChar0008
     * @tc.desc Verify letter boundary conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'a').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'z').toString()).assertEqual("Z");
      expect(Char.toUpperCase(c'A').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'Z').toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_0900
     * @tc.name testCharToUpperCaseStaticChar0009
     * @tc.desc Verify characters outside letter boundaries remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'`').toString()).assertEqual("`");
      expect(Char.toUpperCase(c'{').toString()).assertEqual("{");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
      expect(Char.toUpperCase(c'[').toString()).assertEqual("[");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1000
     * @tc.name testCharToUpperCaseStaticChar0010
     * @tc.desc Verify return value is Char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toUpperCase(c'a');
      expect(result instanceof Char).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1100
     * @tc.name testCharToUpperCaseStaticChar0011
     * @tc.desc Verify a-z are converted to A-Z using character codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < lower.length; i++) {
        expect(Char.toUpperCase(lower[i]).toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1200
     * @tc.name testCharToUpperCaseStaticChar0012
     * @tc.desc Verify A-Z remain A-Z using character codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < upper.length; i++) {
        expect(Char.toUpperCase(upper[i]).toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1300
     * @tc.name testCharToUpperCaseStaticChar0013
     * @tc.desc Verify non-letter characters remain unchanged in return value test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'0').toString()).assertEqual("0");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
      expect(Char.toUpperCase(c' ').toString()).assertEqual(" ");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1500
     * @tc.name testCharToUpperCaseStaticChar0015
     * @tc.desc Verify handling of different character types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'a').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'A').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'0').toString()).assertEqual("0");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1600
     * @tc.name testCharToUpperCaseStaticChar0016
     * @tc.desc Verify return value is Char type and has toChar method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toUpperCase(c'a');
      expect(result instanceof Char).assertTrue();
      expect(typeof result.toChar).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1700
     * @tc.name testCharToUpperCaseStaticChar0017
     * @tc.desc Verify returned Char object can be operated on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toUpperCase(c'a');
      expect(result.isUpperCase()).assertTrue();
      expect(result.isLowerCase()).assertFalse();
      expect(result.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_1800
     * @tc.name testCharToUpperCaseStaticChar0018
     * @tc.desc Verify all ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'a').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'z').toString()).assertEqual("Z");
      expect(Char.toUpperCase(c'A').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'0').toString()).assertEqual("0");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2100
     * @tc.name testCharToUpperCaseStaticChar0021
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let finallyExecuted = false;
      try {
        const result = Char.toUpperCase(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2200
     * @tc.name testCharToUpperCaseStaticChar0022
     * @tc.desc Verify toUpperCase is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Char.toUpperCase).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2400
     * @tc.name testCharToUpperCaseStaticChar0024
     * @tc.desc Verify return new instance without modifying original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = c'a';
      const result = Char.toUpperCase(original);
      expect(original).assertEqual(c'a');
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2500
     * @tc.name testCharToUpperCaseStaticChar0025
     * @tc.desc Verify toUpperCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const startTime = Date.now();
      const result = Char.toUpperCase(c'a');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2600
     * @tc.name testCharToUpperCaseStaticChar0026
     * @tc.desc Verify uppercase and lowercase conversion are opposite operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper = Char.toUpperCase(c'a');
      expect(upper.toString()).assertEqual("A");
      expect(upper.isUpperCase()).assertTrue();
      const lower = Char.toLowerCase(c'A');
      expect(lower.toString()).assertEqual("a");
      expect(lower.isLowerCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2700
     * @tc.name testCharToUpperCaseStaticChar0027
     * @tc.desc Verify lowercase to uppercase then back to lowercase returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = c'a';
      const upper = Char.toUpperCase(original);
      const lower = Char.toLowerCase(upper.toChar());
      expect(lower.toChar()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2800
     * @tc.name testCharToUpperCaseStaticChar0028
     * @tc.desc Verify converted character is uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toUpperCase(c'a');
      expect(result.isUpperCase()).assertTrue();
      expect(Char.isUpperCase(result.toChar())).assertTrue();
      const result2 = Char.toUpperCase(c'A');
      expect(result2.isUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_2900
     * @tc.name testCharToUpperCaseStaticChar0029
     * @tc.desc Verify static method and instance method produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = c'a';
      const c = new Char(ch);
      const staticResult = Char.toUpperCase(ch);
      const instanceResult = c.toUpperCase();
      expect(staticResult.toString()).assertEqual(instanceResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3000
     * @tc.name testCharToUpperCaseStaticChar0030
     * @tc.desc Verify all lowercase letters a-z are converted to A-Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < lower.length; i++) {
        const result = Char.toUpperCase(lower[i]);
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isUpperCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3100
     * @tc.name testCharToUpperCaseStaticChar0031
     * @tc.desc Verify all uppercase letters A-Z remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < upper.length; i++) {
        const result = Char.toUpperCase(upper[i]);
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isUpperCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3200
     * @tc.name testCharToUpperCaseStaticChar0032
     * @tc.desc Verify non-letter characters remain unchanged with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const digits: char[] = [c'0', c'5', c'9'];
      const expected: string[] = ["0", "5", "9"];
      for (let i = 0; i < digits.length; i++) {
        expect(Char.toUpperCase(digits[i]).toString()).assertEqual(expected[i]);
      }
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
      expect(Char.toUpperCase(c'[').toString()).assertEqual("[");
      expect(Char.toUpperCase(c'`').toString()).assertEqual("`");
      expect(Char.toUpperCase(c'{').toString()).assertEqual("{");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3300
     * @tc.name testCharToUpperCaseStaticChar0033
     * @tc.desc Verify ASCII boundary character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'a').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'm').toString()).assertEqual("M");
      expect(Char.toUpperCase(c'z').toString()).assertEqual("Z");
      expect(Char.toUpperCase(c'A').toString()).assertEqual("A");
      expect(Char.toUpperCase(c'M').toString()).assertEqual("M");
      expect(Char.toUpperCase(c'Z').toString()).assertEqual("Z");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
      expect(Char.toUpperCase(c'[').toString()).assertEqual("[");
      expect(Char.toUpperCase(c'`').toString()).assertEqual("`");
      expect(Char.toUpperCase(c'{').toString()).assertEqual("{");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3400
     * @tc.name testCharToUpperCaseStaticChar0034
     * @tc.desc Verify Unicode characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(c'1').toString()).assertEqual("1");
      expect(Char.toUpperCase(c'@').toString()).assertEqual("@");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3500
     * @tc.name testCharToUpperCaseStaticChar0035
     * @tc.desc Verify multiple calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = c'a';
      const result1 = Char.toUpperCase(ch);
      const result2 = Char.toUpperCase(ch);
      const result3 = Char.toUpperCase(ch);
      expect(result1.toString()).assertEqual(result2.toString());
      expect(result2.toString()).assertEqual(result3.toString());
      expect(result1.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3600
     * @tc.name testCharToUpperCaseStaticChar0036
     * @tc.desc Verify multiple conversions keep uppercase unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = Char.toUpperCase(c'a');
      expect(result.toString()).assertEqual("A");
      result = Char.toUpperCase(result.toChar());
      expect(result.toString()).assertEqual("A");
      result = Char.toUpperCase(result.toChar());
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3700
     * @tc.name testCharToUpperCaseStaticChar0037
     * @tc.desc Verify batch conversion returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 10; i++) {
        expect(Char.toUpperCase(c'a').toString()).assertEqual("A");
        expect(Char.toUpperCase(c'A').toString()).assertEqual("A");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3800
     * @tc.name testCharToUpperCaseStaticChar0038
     * @tc.desc Verify ASCII difference between lowercase and uppercase is 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower: char[] = [c'a', c'm', c'z'];
      const upper: char[] = [c'A', c'M', c'Z'];
      for (let i = 0; i < lower.length; i++) {
        expect(Char.toUpperCase(lower[i]).toChar()).assertEqual(upper[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_3900
     * @tc.name testCharToUpperCaseStaticChar0039
     * @tc.desc Verify case properties are correct after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'a', c'z', c'A', c'Z', c'0'];
      for (const ch of testChars) {
        const result = Char.toUpperCase(ch);
        if (Char.isLetter(ch)) {
          expect(result.isUpperCase()).assertTrue();
          expect(result.isLowerCase()).assertFalse();
        }
        else {
          expect(result.toChar()).assertEqual(ch);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_4000
     * @tc.name testCharToUpperCaseStaticChar0040
     * @tc.desc Verify that toUpperCase().toLowerCase() produces valid
     * lowercase letters within basic Latin range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new Char(c'a').toUpperCase().toLowerCase().toChar()).assertEqual(c'a');
      expect(new Char(c'z').toUpperCase().toLowerCase().toChar()).assertEqual(c'z');
      expect(new Char(c'A').toUpperCase().toLowerCase().toChar()).assertEqual(c'a');
      expect(new Char(c'Z').toUpperCase().toLowerCase().toChar()).assertEqual(c'z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASESTATICCHARTEST_4100
     * @tc.name testCharToUpperCaseStaticChar0041
     * @tc.desc Verify static method and instance method produce consistent results with multiple characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseStaticChar0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'a', c'm', c'z', c'A', c'M', c'Z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.toUpperCase(ch);
        const instanceResult = c.toUpperCase();
        expect(staticResult.toString()).assertEqual(instanceResult.toString());
      }
    });
  });
}
