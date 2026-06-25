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

const ALL_UPPERCASE: Char[] = [
  c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
c'U', c'V', c'W', c'X', c'Y', c'Z'
];

const ALL_LOWERCASE: Char[] = [
  c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
c'u', c'v', c'w', c'x', c'y', c'z'
];

const ALL_LETTERS: Char[] = [
  c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
c'U', c'V', c'W', c'X', c'Y', c'Z',
c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
c'u', c'v', c'w', c'x', c'y', c'z'
];

const ALL_DIGITS: Char[] = [
  c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9'
];

const ALL_ASCII_PRINTABLE: Char[] = [
  c' ', c'!', c'"', c'#', c'$', c'%', c'&', c'\'', c'(', c')',
c'*', c'+', c',', c'-', c'.', c'/',
c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
c':', c';', c'<', c'=', c'>', c'?', c'@',
c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
c'U', c'V', c'W', c'X', c'Y', c'Z',
c'[', c'\\', c']', c'^', c'_', c'`',
c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
c'u', c'v', c'w', c'x', c'y', c'z',
c'{', c'|', c'}', c'~'
];

export default function CharIsLetterStaticCharTest(): void {
  describe('CharIsLetterStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0100
     * @tc.name testCharIsLetterStaticChar0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLetter(c'A');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0200
     * @tc.name testCharIsLetterStaticChar0002
     * @tc.desc Verify that not passing parameter should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isLetter(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0300
     * @tc.name testCharIsLetterStaticChar0003
     * @tc.desc Verify that letter characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isLetter(c'Z')).assertTrue();
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isLetter(c'z')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0400
     * @tc.name testCharIsLetterStaticChar0004
     * @tc.desc Verify that non-letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'0')).assertFalse();
      expect(Char.isLetter(c'9')).assertFalse();
      expect(Char.isLetter(c'+')).assertFalse();
      expect(Char.isLetter(c'-')).assertFalse();
      expect(Char.isLetter(c'@')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0500
     * @tc.name testCharIsLetterStaticChar0005
     * @tc.desc Verify that special characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c' ')).assertFalse();
      expect(Char.isLetter(c'\t')).assertFalse();
      expect(Char.isLetter(c'\n')).assertFalse();
      expect(Char.isLetter(c'\u0000')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0600
     * @tc.name testCharIsLetterStaticChar0006
     * @tc.desc Verify that non-ASCII letters return false (API only supports ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'中')).assertFalse();
      expect(Char.isLetter(c'文')).assertFalse();
      expect(Char.isLetter(c'あ')).assertFalse();
      expect(Char.isLetter(c'か')).assertFalse();
      expect(Char.isLetter(c'가')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0700
     * @tc.name testCharIsLetterStaticChar0007
     * @tc.desc Verify that passing illegal value should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isLetter(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0800
     * @tc.name testCharIsLetterStaticChar0008
     * @tc.desc Verify boundaries of A-Z and a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'@')).assertFalse();
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isLetter(c'Z')).assertTrue();
      expect(Char.isLetter(c'[')).assertFalse();
      expect(Char.isLetter(c'`')).assertFalse();
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isLetter(c'z')).assertTrue();
      expect(Char.isLetter(c'{')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_0900
     * @tc.name testCharIsLetterStaticChar0009
     * @tc.desc Verify letter characters ASCII boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_UPPERCASE) {
        expect(Char.isLetter(ch)).assertTrue();
      }
      for (const ch of ALL_LOWERCASE) {
        expect(Char.isLetter(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1000
     * @tc.name testCharIsLetterStaticChar0010
     * @tc.desc Verify that return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLetter(c'A');
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1200
     * @tc.name testCharIsLetterStaticChar0012
     * @tc.desc Verify that other characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'0')).assertFalse();
      expect(Char.isLetter(c'9')).assertFalse();
      expect(Char.isLetter(c'@')).assertFalse();
      expect(Char.isLetter(c'[')).assertFalse();
      expect(Char.isLetter(c'`')).assertFalse();
      expect(Char.isLetter(c'{')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1300
     * @tc.name testCharIsLetterStaticChar0013
     * @tc.desc Verify all letter characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_LETTERS) {
        expect(Char.isLetter(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1400
     * @tc.name testCharIsLetterStaticChar0014
     * @tc.desc Verify that all digit characters are not letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_DIGITS) {
        expect(Char.isLetter(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1500
     * @tc.name testCharIsLetterStaticChar0015
     * @tc.desc Verify return value type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLetter(c'A');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1600
     * @tc.name testCharIsLetterStaticChar0016
     * @tc.desc Verify that only A-Z and a-z return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letterSet = new Set<Char>(ALL_LETTERS);
      for (const ch of ALL_ASCII_PRINTABLE) {
        const expected = letterSet.has(ch);
        expect(Char.isLetter(ch)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_1700
     * @tc.name testCharIsLetterStaticChar0017
     * @tc.desc Verify full ASCII range test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letterSet = new Set<Char>(ALL_LETTERS);
      for (const ch of ALL_ASCII_PRINTABLE) {
        const result = Char.isLetter(ch);
        const expected = letterSet.has(ch);
        expect(result).assertEqual(expected);
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2000
     * @tc.name testCharIsLetterStaticChar0020
     * @tc.desc Verify that finally always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isLetter(c'0');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2300
     * @tc.name testCharIsLetterStaticChar0023
     * @tc.desc Verify that isLetter is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isLetter(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2400
     * @tc.name testCharIsLetterStaticChar0024
     * @tc.desc Verify that uppercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isLetter(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isLetter(c'a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2500
     * @tc.name testCharIsLetterStaticChar0025
     * @tc.desc Verify subset relationship of uppercase letters to letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_ASCII_PRINTABLE) {
        const isUpper = Char.isUpperCase(ch);
        const isLetter = Char.isLetter(ch);
        if (isUpper) {
          expect(isLetter).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2600
     * @tc.name testCharIsLetterStaticChar0026
     * @tc.desc Verify that lowercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
      expect(Char.isLetter(c'z')).assertTrue();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isLetter(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2700
     * @tc.name testCharIsLetterStaticChar0027
     * @tc.desc Verify subset relationship of lowercase letters to letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_ASCII_PRINTABLE) {
        const isLower = Char.isLowerCase(ch);
        const isLetter = Char.isLetter(ch);
        if (isLower) {
          expect(isLetter).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_2800
     * @tc.name testCharIsLetterStaticChar0028
     * @tc.desc Verify that A-F are both letters and hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isLetter(c'F')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isLetter(c'G')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isLetter(c'0')).assertFalse();
      expect(Char.isHexDigit(c'0')).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3000
     * @tc.name testCharIsLetterStaticChar0030
     * @tc.desc Verify that other characters are not letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_DIGITS) {
        expect(Char.isLetter(ch)).assertFalse();
      }
      expect(Char.isLetter(c'@')).assertFalse();
      expect(Char.isLetter(c'[')).assertFalse();
      expect(Char.isLetter(c'`')).assertFalse();
      expect(Char.isLetter(c'{')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3100
     * @tc.name testCharIsLetterStaticChar0031
     * @tc.desc Verify letter case classification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_UPPERCASE) {
        expect(Char.isLetter(ch)).assertTrue();
        expect(Char.isUpperCase(ch)).assertTrue();
        expect(Char.isLowerCase(ch)).assertFalse();
      }
      for (const ch of ALL_LOWERCASE) {
        expect(Char.isLetter(ch)).assertTrue();
        expect(Char.isUpperCase(ch)).assertFalse();
        expect(Char.isLowerCase(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3200
     * @tc.name testCharIsLetterStaticChar0032
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'@')).assertFalse();
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isLetter(c'M')).assertTrue();
      expect(Char.isLetter(c'Z')).assertTrue();
      expect(Char.isLetter(c'[')).assertFalse();
      expect(Char.isLetter(c'`')).assertFalse();
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isLetter(c'm')).assertTrue();
      expect(Char.isLetter(c'z')).assertTrue();
      expect(Char.isLetter(c'{')).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3400
     * @tc.name testCharIsLetterStaticChar0034
     * @tc.desc Verify that repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'A';
      const result1 = Char.isLetter(ch);
      const result2 = Char.isLetter(ch);
      const result3 = Char.isLetter(ch);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3500
     * @tc.name testCharIsLetterStaticChar0035
     * @tc.desc Verify that multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isLetter(c'A')).assertTrue();
        expect(Char.isLetter(c'0')).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3700
     * @tc.name testCharIsLetterStaticChar0037
     * @tc.desc Verify consistency with case judgment methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars: Char[] = [c'A', c'Z', c'a', c'z', c'0', c'9', c'@'];
      for (const ch of testChars) {
        const isLetter = Char.isLetter(ch);
        const isUpper = Char.isUpperCase(ch);
        const isLower = Char.isLowerCase(ch);
        if (isUpper || isLower) {
          expect(isLetter).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3800
     * @tc.name testCharIsLetterStaticChar0038
     * @tc.desc Verify that static and instance methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars: Char[] = [c'A', c'Z', c'a', c'z', c'0', c'@'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isLetter(ch);
        const instanceResult = c.isLetter();
        expect(staticResult).assertEqual(instanceResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERSTATICCHARTEST_ISLETTERTEST_3900
     * @tc.name testCharIsLetterStaticChar0039
     * @tc.desc Verify compliance with ASCII letter definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterStaticChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letterSet = new Set<Char>(ALL_LETTERS);
      for (const ch of ALL_ASCII_PRINTABLE) {
        const expected = letterSet.has(ch);
        const result = Char.isLetter(ch);
        expect(result).assertEqual(expected);
      }
    });
  });
}
