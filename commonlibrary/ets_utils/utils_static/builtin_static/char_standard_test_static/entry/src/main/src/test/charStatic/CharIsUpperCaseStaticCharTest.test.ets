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

function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharIsUpperCaseStaticCharTest(): void {
  describe('CharIsUpperCaseStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0100
     * @tc.name testCharIsUpperCaseStaticChar0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0001' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isUpperCase(c'A');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0200
     * @tc.name testCharIsUpperCaseStaticChar0002
     * @tc.desc Verify that calling without parameters throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isUpperCase(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0300
     * @tc.name testCharIsUpperCaseStaticChar0003
     * @tc.desc Verify that uppercase letter characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0003' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0400
     * @tc.name testCharIsUpperCaseStaticChar0004
     * @tc.desc Verify that lowercase letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0004' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'm')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0500
     * @tc.name testCharIsUpperCaseStaticChar0005
     * @tc.desc Verify that non-letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0005' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'0')).assertFalse();
      expect(Char.isUpperCase(c'9')).assertFalse();
      expect(Char.isUpperCase(c'+')).assertFalse();
      expect(Char.isUpperCase(c'@')).assertFalse();
      expect(Char.isUpperCase(c' ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0600
     * @tc.name testCharIsUpperCaseStaticChar0006
     * @tc.desc Verify that special characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0006' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c' ')).assertFalse();
      expect(Char.isUpperCase(c'\t')).assertFalse();
      expect(Char.isUpperCase(c'\n')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0700
     * @tc.name testCharIsUpperCaseStaticChar0007
     * @tc.desc Verify that passing illegal value throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isUpperCase(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0800
     * @tc.name testCharIsUpperCaseStaticChar0008
     * @tc.desc Verify boundaries of uppercase letters A-Z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0008' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'@')).assertFalse();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'[')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_0900
     * @tc.name testCharIsUpperCaseStaticChar0009
     * @tc.desc Verify boundaries of lowercase letters a-z are not uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0009' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'`')).assertFalse();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
      expect(Char.isUpperCase(c'{')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1000
     * @tc.name testCharIsUpperCaseStaticChar0010
     * @tc.desc Verify that return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0010' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isUpperCase(c'A');
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1100
     * @tc.name testCharIsUpperCaseStaticChar0011
     * @tc.desc Verify that A-Z returns true (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0011' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1200
     * @tc.name testCharIsUpperCaseStaticChar0012
     * @tc.desc Verify that other characters return false (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertFalse();
      }
      for (let i = 0x30; i <= 0x39; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertFalse();
      }
      expect(Char.isUpperCase(c'@')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1300
     * @tc.name testCharIsUpperCaseStaticChar0013
     * @tc.desc Verify uppercase and lowercase letters are distinguished
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0013' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'B')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'b')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1400
     * @tc.name testCharIsUpperCaseStaticChar0014
     * @tc.desc Verify that non-letter characters are not uppercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0014' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'0')).assertFalse();
      expect(Char.isUpperCase(c'9')).assertFalse();
      expect(Char.isUpperCase(c'@')).assertFalse();
      expect(Char.isUpperCase(c'[')).assertFalse();
      expect(Char.isUpperCase(c'`')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1500
     * @tc.name testCharIsUpperCaseStaticChar0015
     * @tc.desc Verify that return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0015' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isUpperCase(c'A');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_1600
     * @tc.name testCharIsUpperCaseStaticChar0016
     * @tc.desc Verify that only A-Z returns true (full ASCII precision)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0016' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const expected = (i >= 0x41 && i <= 0x5A);
        expect(Char.isUpperCase(ch)).assertEqual(expected);
      }
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2000
     * @tc.name testCharIsUpperCaseStaticChar0020
     * @tc.desc Verify finally always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0020' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isUpperCase(c'a');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2100
     * @tc.name testCharIsUpperCaseStaticChar0021
     * @tc.desc Verify that isUpperCase is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0021' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase !== undefined && Char.isUpperCase !== null).assertTrue();
      const result = Char.isUpperCase(c'A');
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2300
     * @tc.name testCharIsUpperCaseStaticChar0023
     * @tc.desc Verify that isUpperCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0023' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isUpperCase(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2400
     * @tc.name testCharIsUpperCaseStaticChar0024
     * @tc.desc Verify uppercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0024' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isLetter(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2500
     * @tc.name testCharIsUpperCaseStaticChar0025
     * @tc.desc Verify uppercase letters are a subset of letters with containment check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0025' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        const isUpper = Char.isUpperCase(ch);
        const isLetter = Char.isLetter(ch);
        expect(isUpper).assertTrue();
        expect(isLetter).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2600
     * @tc.name testCharIsUpperCaseStaticChar0026
     * @tc.desc Verify uppercase and lowercase are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0026' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isUpperCase(c'0')).assertFalse();
      expect(Char.isLowerCase(c'0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2700
     * @tc.name testCharIsUpperCaseStaticChar0027
     * @tc.desc Verify uppercase and lowercase are never both true (full ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0027' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const isUpper = Char.isUpperCase(ch);
        const isLower = Char.isLowerCase(ch);
        expect(!(isUpper && isLower)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_2800
     * @tc.name testCharIsUpperCaseStaticChar0028
     * @tc.desc Verify A-F are both uppercase and hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0028' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isUpperCase(c'F')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isUpperCase(c'G')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3000
     * @tc.name testCharIsUpperCaseStaticChar0030
     * @tc.desc Verify other characters are not uppercase letters (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0030' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertFalse();
      }
      for (let i = 0x30; i <= 0x39; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3100
     * @tc.name testCharIsUpperCaseStaticChar0031
     * @tc.desc Verify case classification of all letters (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0031' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertTrue();
        expect(Char.isLowerCase(ch)).assertFalse();
        expect(Char.isLetter(ch)).assertTrue();
      }
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        expect(Char.isUpperCase(ch)).assertFalse();
        expect(Char.isLowerCase(ch)).assertTrue();
        expect(Char.isLetter(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3200
     * @tc.name testCharIsUpperCaseStaticChar0032
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'@')).assertFalse();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'[')).assertFalse();
      expect(Char.isUpperCase(c'`')).assertFalse();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3300
     * @tc.name testCharIsUpperCaseStaticChar0033
     * @tc.desc Verify Unicode characters are not uppercase letters (API only supports ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0033' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'中')).assertFalse();
      expect(Char.isUpperCase(c'文')).assertFalse();
      expect(Char.isUpperCase(c'Α')).assertFalse();
      expect(Char.isUpperCase(c'α')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3400
     * @tc.name testCharIsUpperCaseStaticChar0034
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0034' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'A';
      const result1 = Char.isUpperCase(ch);
      const result2 = Char.isUpperCase(ch);
      const result3 = Char.isUpperCase(ch);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3500
     * @tc.name testCharIsUpperCaseStaticChar0035
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0035' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isUpperCase(c'A')).assertTrue();
        expect(Char.isUpperCase(c'a')).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3700
     * @tc.name testCharIsUpperCaseStaticChar0037
     * @tc.desc Verify case classification is consistent with other methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0037' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0', c'@'];
      for (const ch of testChars) {
        const isUpper = Char.isUpperCase(ch);
        const isLower = Char.isLowerCase(ch);
        const isLetter = Char.isLetter(ch);
        if (isUpper) {
          expect(isLetter).assertTrue();
          expect(isLower).assertFalse();
        }
        if (isLower) {
          expect(isLetter).assertTrue();
          expect(isUpper).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASESTATICCHARTEST_3800
     * @tc.name testCharIsUpperCaseStaticChar0038
     * @tc.desc Verify static and instance methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseStaticChar0038' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isUpperCase(ch);
        const instanceResult = c.isUpperCase();
        expect(staticResult).assertEqual(instanceResult);
      }
    });

  });
}
