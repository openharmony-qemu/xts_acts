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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function CharToUpperCaseInstanceTest(): void {
  describe('CharToUpperCaseInstanceTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0100
     * @tc.name testCharToUpperCaseInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const result = c.toUpperCase();
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0200
     * @tc.name testCharToUpperCaseInstance0002
     * @tc.desc Verify toUpperCase() can be called with no extra parameters and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isThrowError = false;
      try {
        const ch = new Char(c'a');
        const result = ch.toUpperCase();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
      expect(isThrowError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0300
     * @tc.name testCharToUpperCaseInstance0003
     * @tc.desc Verify no parameters are needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const result = c.toUpperCase();
      expect(result instanceof Char).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0500
     * @tc.name testCharToUpperCaseInstance0005
     * @tc.desc Verify lowercase a-z converts to uppercase A-Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');

      expect(lowerA.toUpperCase().toString()).assertEqual("A");
      expect(lowerM.toUpperCase().toString()).assertEqual("M");
      expect(lowerZ.toUpperCase().toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0600
     * @tc.name testCharToUpperCaseInstance0006
     * @tc.desc Verify uppercase A-Z remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');

      expect(upperA.toUpperCase().toString()).assertEqual("A");
      expect(upperM.toUpperCase().toString()).assertEqual("M");
      expect(upperZ.toUpperCase().toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0700
     * @tc.name testCharToUpperCaseInstance0007
     * @tc.desc Verify non-letter characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new Char(c'0');
      const atSign = new Char(c'@');
      const space = new Char(c' ');

      expect(zero.toUpperCase().toString()).assertEqual("0");
      expect(atSign.toUpperCase().toString()).assertEqual("@");
      expect(space.toUpperCase().toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0800
     * @tc.name testCharToUpperCaseInstance0008
     * @tc.desc Verify Char instance with lowercase letter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        expect(c.toUpperCase().toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_0900
     * @tc.name testCharToUpperCaseInstance0009
     * @tc.desc Verify Char instance with uppercase letter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        expect(c.toUpperCase().toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1000
     * @tc.name testCharToUpperCaseInstance0010
     * @tc.desc Verify return value type is Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const result = c.toUpperCase();
      expect(result instanceof Char).assertTrue();
      expect(typeof result.toChar).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1100
     * @tc.name testCharToUpperCaseInstance0011
     * @tc.desc Verify returned Char object is operable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const result = c.toUpperCase();

      expect(result.isUpperCase()).assertTrue();
      expect(result.isLowerCase()).assertFalse();
      expect(result.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1200
     * @tc.name testCharToUpperCaseInstance0012
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lowerA = new Char(c'a');
      const lowerZ = new Char(c'z');
      const upperA = new Char(c'A');
      const upperZ = new Char(c'Z');
      const zero = new Char(c'0');

      expect(lowerA.toUpperCase().toString()).assertEqual("A");
      expect(lowerZ.toUpperCase().toString()).assertEqual("Z");
      expect(upperA.toUpperCase().toString()).assertEqual("A");
      expect(upperZ.toUpperCase().toString()).assertEqual("Z");
      expect(zero.toUpperCase().toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1300
     * @tc.name testCharToUpperCaseInstance0013
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const result = c.toUpperCase();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1500
     * @tc.name testCharToUpperCaseInstance0015
     * @tc.desc Verify toUpperCase() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.toUpperCase();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1700
     * @tc.name testCharToUpperCaseInstance0017
     * @tc.desc Verify instance and static method results are equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const instanceResult = c.toUpperCase();
      const staticResult = Char.toUpperCase(c'a');

      expect(instanceResult.toString()).assertEqual(staticResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1800
     * @tc.name testCharToUpperCaseInstance0018
     * @tc.desc Verify new instance is returned without modifying original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const originalValue = c.toChar();
      const result = c.toUpperCase();

      expect(c.toChar()).assertEqual(originalValue);
      expect(c.toChar()).assertEqual(c'a');
      expect(result.toString()).assertEqual("A");
      expect(result.toChar()).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_1900
     * @tc.name testCharToUpperCaseInstance0019
     * @tc.desc Verify toUpperCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const startTime = Date.now();
      const result = c.toUpperCase();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2000
     * @tc.name testCharToUpperCaseInstance0020
     * @tc.desc Verify instance and static methods produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'a', c'm', c'z', c'A', c'M', c'Z', c'0'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.toUpperCase();
        const staticResult = Char.toUpperCase(ch);

        expect(instanceResult.toString()).assertEqual(staticResult.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2200
     * @tc.name testCharToUpperCaseInstance0022
     * @tc.desc Verify uppercase and lowercase conversion are opposite operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower = new Char(c'a');
      const upper = new Char(c'A');

      const upperResult = lower.toUpperCase();
      expect(upperResult.toString()).assertEqual("A");
      expect(upperResult.isUpperCase()).assertTrue();

      const lowerResult = upper.toLowerCase();
      expect(lowerResult.toString()).assertEqual("a");
      expect(lowerResult.isLowerCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2300
     * @tc.name testCharToUpperCaseInstance0023
     * @tc.desc Verify bidirectional conversion between uppercase and lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = new Char(c'a');
      const upper = original.toUpperCase();
      const lower = upper.toLowerCase();

      expect(lower.toChar()).assertEqual(original.toChar());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2400
     * @tc.name testCharToUpperCaseInstance0024
     * @tc.desc Verify converted characters are uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lower = new Char(c'a');
      const upper = new Char(c'A');

      const result1 = lower.toUpperCase();
      expect(result1.isUpperCase()).assertTrue();

      const result2 = upper.toUpperCase();
      expect(result2.isUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2500
     * @tc.name testCharToUpperCaseInstance0025
     * @tc.desc Verify complete lowercase alphabet converts to uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toUpperCase();
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isUpperCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2600
     * @tc.name testCharToUpperCaseInstance0026
     * @tc.desc Verify complete uppercase alphabet remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["A", "M", "Z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toUpperCase();
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isUpperCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2700
     * @tc.name testCharToUpperCaseInstance0027
     * @tc.desc Verify digits and special characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      expect(zero.toUpperCase().toString()).assertEqual("0");
      expect(nine.toUpperCase().toString()).assertEqual("9");

      const atSign = new Char(c'@');
      const space = new Char(c' ');
      expect(atSign.toUpperCase().toString()).assertEqual("@");
      expect(space.toUpperCase().toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2800
     * @tc.name testCharToUpperCaseInstance0028
     * @tc.desc Verify ASCII boundary character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');

      expect(lowerA.toUpperCase().toString()).assertEqual("A");
      expect(lowerM.toUpperCase().toString()).assertEqual("M");
      expect(lowerZ.toUpperCase().toString()).assertEqual("Z");

      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');

      expect(upperA.toUpperCase().toString()).assertEqual("A");
      expect(upperM.toUpperCase().toString()).assertEqual("M");
      expect(upperZ.toUpperCase().toString()).assertEqual("Z");

      const atSign = new Char(c'@');
      const grave = new Char(c'`');

      expect(atSign.toUpperCase().toString()).assertEqual("@");
      expect(grave.toUpperCase().toString()).assertEqual("`");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_2900
     * @tc.name testCharToUpperCaseInstance0029
     * @tc.desc Verify that non-alphabetic characters remain unchanged after toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const char1 = new Char(c'1');
      expect(char1.toUpperCase().toString()).assertEqual("1");

      const char2 = new Char(c'@');
      expect(char2.toUpperCase().toString()).assertEqual("@");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3000
     * @tc.name testCharToUpperCaseInstance0030
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const result1 = c.toUpperCase();
      const result2 = c.toUpperCase();
      const result3 = c.toUpperCase();

      expect(result1.toString()).assertEqual(result2.toString());
      expect(result2.toString()).assertEqual(result3.toString());
      expect(result1.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3100
     * @tc.name testCharToUpperCaseInstance0031
     * @tc.desc Verify multiple conversions keep uppercase unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      let result = c.toUpperCase();
      expect(result.toString()).assertEqual("A");

      result = result.toUpperCase();
      expect(result.toString()).assertEqual("A");

      result = result.toUpperCase();
      expect(result.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3200
     * @tc.name testCharToUpperCaseInstance0032
     * @tc.desc Verify different instances transform independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'a');
      const c2 = new Char(c'b');

      const result1 = c1.toUpperCase();
      const result2 = c2.toUpperCase();

      expect(result1.toString()).assertEqual("A");
      expect(result2.toString()).assertEqual("B");
      expect(c1.toChar()).assertEqual(c'a');
      expect(c2.toChar()).assertEqual(c'b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3300
     * @tc.name testCharToUpperCaseInstance0033
     * @tc.desc Verify batch conversion returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      for (let i = 0; i < 10; i++) {
        expect(c.toUpperCase().toString()).assertEqual("A");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3400
     * @tc.name testCharToUpperCaseInstance034
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'a');
      expect(c1.toUpperCase().toString()).assertEqual("A");
      const c2 = new Char(c'm');
      expect(c2.toUpperCase().toString()).assertEqual("M");
      const c3 = new Char(c'z');
      expect(c3.toUpperCase().toString()).assertEqual("Z");
      const c4 = new Char(c'A');
      expect(c4.toUpperCase().toString()).assertEqual("A");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3600
     * @tc.name testCharToUpperCaseInstance0036
     * @tc.desc Verify case attribute is correct after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'a', c'z', c'A', c'Z', c'0'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const result = c.toUpperCase();

        if (c.isLetter()) {
          expect(result.isUpperCase()).assertTrue();
          expect(result.isLowerCase()).assertFalse();
        } else {
          expect(result.toChar()).assertEqual(c.toChar());
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOUPPERCASEINSTANCETEST_3700
     * @tc.name testCharToUpperCaseInstance0037
     * @tc.desc Verify case conversion is reversible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToUpperCaseInstance0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'a', c'm', c'z', c'A', c'M', c'Z'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const upper = c.toUpperCase();
        const lower = upper.toLowerCase();

        expect(lower.isLowerCase()).assertTrue();
      }
    });
  });
}
