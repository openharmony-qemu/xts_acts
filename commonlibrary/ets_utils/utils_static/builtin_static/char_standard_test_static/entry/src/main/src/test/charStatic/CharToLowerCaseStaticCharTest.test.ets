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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function CharToLowerCaseStaticCharTest(): void {
  describe('CharToLowerCaseStaticCharTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0100
     * @tc.name testCharToLowerCaseStaticChar001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toLowerCase(c'A');
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0200
     * @tc.name testCharToLowerCaseStaticChar0002
     * @tc.desc Verify that omitting parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const result = Char.toLowerCase(null as char);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0300
     * @tc.name testCharToLowerCaseStaticChar0003
     * @tc.desc Verify uppercase letters are converted to lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'A').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'M').toString()).assertEqual("m");
      expect(Char.toLowerCase(c'Z').toString()).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0400
     * @tc.name testCharToLowerCaseStaticChar0004
     * @tc.desc Verify lowercase letters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'a').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'm').toString()).assertEqual("m");
      expect(Char.toLowerCase(c'z').toString()).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0500
     * @tc.name testCharToLowerCaseStaticChar0005
     * @tc.desc Verify non-letter characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'0').toString()).assertEqual("0");
      expect(Char.toLowerCase(c'9').toString()).assertEqual("9");
      expect(Char.toLowerCase(c'+').toString()).assertEqual("+");
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
      expect(Char.toLowerCase(c' ').toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0600
     * @tc.name testCharToLowerCaseStaticChar0006
     * @tc.desc Verify special characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c' ').toString()).assertEqual(" ");
      expect(Char.toLowerCase(c'\t').toString()).assertEqual("\t");
      expect(Char.toLowerCase(c'\n').toString()).assertEqual("\n");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0800
     * @tc.name testCharToLowerCaseStaticChar0008
     * @tc.desc Verify letter boundary conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'A').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'Z').toString()).assertEqual("z");
      expect(Char.toLowerCase(c'a').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'z').toString()).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_0900
     * @tc.name testCharToLowerCaseStaticChar0009
     * @tc.desc Verify non-letter characters at boundaries remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
      expect(Char.toLowerCase(c'[').toString()).assertEqual("[");
      expect(Char.toLowerCase(c'`').toString()).assertEqual("`");
      expect(Char.toLowerCase(c'{').toString()).assertEqual("{");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1000
     * @tc.name testCharToLowerCaseStaticChar0010
     * @tc.desc Verify return value is Char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toLowerCase(c'A');
      expect(result instanceof Char).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1100
     * @tc.name testCharToLowerCaseStaticChar0011
     * @tc.desc Verify A-Z are converted to a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < upper.length; i++) {
        expect(Char.toLowerCase(upper[i]).toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1200
     * @tc.name testCharToLowerCaseStaticChar0012
     * @tc.desc Verify a-z remain a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < lower.length; i++) {
        expect(Char.toLowerCase(lower[i]).toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1300
     * @tc.name testCharToLowerCaseStaticChar0013
     * @tc.desc Verify non-letter characters remain unchanged in return value tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'0').toString()).assertEqual("0");
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
      expect(Char.toLowerCase(c' ').toString()).assertEqual(" ");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1500
     * @tc.name testCharToLowerCaseStaticChar0015
     * @tc.desc Verify handling of different character types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'A').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'a').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'0').toString()).assertEqual("0");
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1600
     * @tc.name testCharToLowerCaseStaticChar0016
     * @tc.desc Verify return value is Char type with method check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toLowerCase(c'A');
      expect(result instanceof Char).assertTrue();
      expect(typeof result.toChar).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1700
     * @tc.name testCharToLowerCaseStaticChar0017
     * @tc.desc Verify returned Char object can be operated on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toLowerCase(c'A');
      expect(result.isLowerCase()).assertTrue();
      expect(result.isUpperCase()).assertFalse();
      expect(result.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_1800
     * @tc.name testCharToLowerCaseStaticChar0018
     * @tc.desc Verify all ASCII characters conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'A').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'Z').toString()).assertEqual("z");
      expect(Char.toLowerCase(c'a').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'0').toString()).assertEqual("0");
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2100
     * @tc.name testCharToLowerCaseStaticChar0021
     * @tc.desc Verify finally always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let finallyExecuted = false;
      try {
        const result = Char.toLowerCase(c'a');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2200
     * @tc.name testCharToLowerCaseStaticChar0022
     * @tc.desc Verify toLowerCase is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Char.toLowerCase).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2400
     * @tc.name testCharToLowerCaseStaticChar0024
     * @tc.desc Verify return new instance without modifying original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = c'A';
      const result = Char.toLowerCase(original);
      expect(original).assertEqual(c'A');
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2500
     * @tc.name testCharToLowerCaseStaticChar0025
     * @tc.desc Verify toLowerCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const startTime = Date.now();
      const result = Char.toLowerCase(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2600
     * @tc.name testCharToLowerCaseStaticChar0026
     * @tc.desc Verify case conversion is inverse operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower = Char.toLowerCase(c'A');
      expect(lower.toString()).assertEqual("a");
      expect(lower.isLowerCase()).assertTrue();
      const upper = Char.toUpperCase(c'a');
      expect(upper.toString()).assertEqual("A");
      expect(upper.isUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2700
     * @tc.name testCharToLowerCaseStaticChar0027
     * @tc.desc Verify uppercase to lowercase then back to uppercase yields original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = c'A';
      const lower = Char.toLowerCase(original);
      const upper = Char.toUpperCase(lower.toChar());
      expect(upper.toChar()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2800
     * @tc.name testCharToLowerCaseStaticChar0028
     * @tc.desc Verify converted character is lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = Char.toLowerCase(c'A');
      expect(result.isLowerCase()).assertTrue();
      expect(Char.isLowerCase(result.toChar())).assertTrue();
      const result2 = Char.toLowerCase(c'a');
      expect(result2.isLowerCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_2900
     * @tc.name testCharToLowerCaseStaticChar0029
     * @tc.desc Verify static and instance methods produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = c'A';
      const c = new Char(ch);
      const staticResult = Char.toLowerCase(ch);
      const instanceResult = c.toLowerCase();
      expect(staticResult.toString()).assertEqual(instanceResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3000
     * @tc.name testCharToLowerCaseStaticChar0030
     * @tc.desc Verify all A-Z are converted to a-z in conversion test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < upper.length; i++) {
        const result = Char.toLowerCase(upper[i]);
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isLowerCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3100
     * @tc.name testCharToLowerCaseStaticChar0031
     * @tc.desc Verify all a-z remain unchanged in conversion test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < lower.length; i++) {
        const result = Char.toLowerCase(lower[i]);
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isLowerCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3200
     * @tc.name testCharToLowerCaseStaticChar0032
     * @tc.desc Verify non-letter characters remain unchanged in conversion test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const digits: char[] = [c'0', c'5', c'9'];
      const expected: string[] = ["0", "5", "9"];
      for (let i = 0; i < digits.length; i++) {
        expect(Char.toLowerCase(digits[i]).toString()).assertEqual(expected[i]);
      }
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
      expect(Char.toLowerCase(c'[').toString()).assertEqual("[");
      expect(Char.toLowerCase(c'`').toString()).assertEqual("`");
      expect(Char.toLowerCase(c'{').toString()).assertEqual("{");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3300
     * @tc.name testCharToLowerCaseStaticChar0033
     * @tc.desc Verify ASCII boundary character test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toLowerCase(c'A').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'M').toString()).assertEqual("m");
      expect(Char.toLowerCase(c'Z').toString()).assertEqual("z");
      expect(Char.toLowerCase(c'a').toString()).assertEqual("a");
      expect(Char.toLowerCase(c'm').toString()).assertEqual("m");
      expect(Char.toLowerCase(c'z').toString()).assertEqual("z");
      expect(Char.toLowerCase(c'@').toString()).assertEqual("@");
      expect(Char.toLowerCase(c'[').toString()).assertEqual("[");
      expect(Char.toLowerCase(c'`').toString()).assertEqual("`");
      expect(Char.toLowerCase(c'{').toString()).assertEqual("{");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3500
     * @tc.name testCharToLowerCaseStaticChar0035
     * @tc.desc Verify repeated calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = c'A';
      const result1 = Char.toLowerCase(ch);
      const result2 = Char.toLowerCase(ch);
      const result3 = Char.toLowerCase(ch);
      expect(result1.toString()).assertEqual(result2.toString());
      expect(result2.toString()).assertEqual(result3.toString());
      expect(result1.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3600
     * @tc.name testCharToLowerCaseStaticChar0036
     * @tc.desc Verify multiple conversions to lowercase remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = Char.toLowerCase(c'A');
      expect(result.toString()).assertEqual("a");
      result = Char.toLowerCase(result.toChar());
      expect(result.toString()).assertEqual("a");
      result = Char.toLowerCase(result.toChar());
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3700
     * @tc.name testCharToLowerCaseStaticChar0037
     * @tc.desc Verify multiple calls return correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 10; i++) {
        expect(Char.toLowerCase(c'A').toString()).assertEqual("a");
        expect(Char.toLowerCase(c'a').toString()).assertEqual("a");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3800
     * @tc.name testCharToLowerCaseStaticChar0038
     * @tc.desc Verify uppercase and lowercase differ by 32 (0x20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper: char[] = [c'A', c'M', c'Z'];
      const lower: char[] = [c'a', c'm', c'z'];
      for (let i = 0; i < upper.length; i++) {
        expect(Char.toLowerCase(upper[i]).toChar()).assertEqual(lower[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_3900
     * @tc.name testCharToLowerCaseStaticChar0039
     * @tc.desc Verify character case properties after conversion are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars: char[] = [c'A', c'Z', c'a', c'z', c'0'];
      for (const ch of testChars) {
        const result = Char.toLowerCase(ch);
        if (Char.isLetter(ch)) {
          expect(result.isLowerCase()).assertTrue();
          expect(result.isUpperCase()).assertFalse();
        } else {
          expect(result.toChar()).assertEqual(ch);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_4000
     * @tc.name testCharToLowerCaseStaticChar0040
     * @tc.desc Verify conversion is reversible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Char.toUpperCase(Char.toLowerCase(c'A').toChar()).toChar()).assertEqual(c'A');
      expect(Char.toUpperCase(Char.toLowerCase(c'Z').toChar()).toChar()).assertEqual(c'Z');
      expect(Char.toLowerCase(Char.toUpperCase(c'a').toChar()).toChar()).assertEqual(c'a');
      expect(Char.toLowerCase(Char.toUpperCase(c'z').toChar()).toChar()).assertEqual(c'z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASESTATICCHARTEST_4100
     * @tc.name testCharToLowerCaseStaticChar0041
     * @tc.desc Verify static and instance methods produce consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseStaticChar0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars: char[] = [c'A', c'M', c'Z', c'a', c'm', c'z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.toLowerCase(ch);
        const instanceResult = c.toLowerCase();
        expect(staticResult.toString()).assertEqual(instanceResult.toString());
      }
    });
  });
}
