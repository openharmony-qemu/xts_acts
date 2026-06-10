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

export default function CharIsLowerCaseInstanceTest(): void {
  describe('CharIsLowerCaseInstanceTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0100
     * @tc.name testCharIsLowerCaseInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result = c.isLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0200
     * @tc.name testCharIsLowerCaseInstance0002
     * @tc.desc Verify isLowerCase() can be called with no arguments and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'a');
      const result = ch.isLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0300
     * @tc.name testCharIsLowerCaseInstance0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result = c.isLowerCase();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0500
     * @tc.name testCharIsLowerCaseInstance0005
     * @tc.desc Verify lowercase letters a-z return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');

      expect(lowerA.isLowerCase()).assertTrue();
      expect(lowerM.isLowerCase()).assertTrue();
      expect(lowerZ.isLowerCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0600
     * @tc.name testCharIsLowerCaseInstance0006
     * @tc.desc Verify uppercase letters A-Z return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');

      expect(upperA.isLowerCase()).assertFalse();
      expect(upperM.isLowerCase()).assertFalse();
      expect(upperZ.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0700
     * @tc.name testCharIsLowerCaseInstance0007
     * @tc.desc Verify non-letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const atSign = new Char(c'@');

      expect(zero.isLowerCase()).assertFalse();
      expect(atSign.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0800
     * @tc.name testCharIsLowerCaseInstance0008
     * @tc.desc Verify Char instance with lowercase letter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_LOWERCASE) {
        const c = new Char(ch);
        expect(c.isLowerCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_0900
     * @tc.name testCharIsLowerCaseInstance0009
     * @tc.desc Verify Char instance with uppercase letter value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_UPPERCASE) {
        const c = new Char(ch);
        expect(c.isLowerCase()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1000
     * @tc.name testCharIsLowerCaseInstance0010
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result = c.isLowerCase();
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1200
     * @tc.name testCharIsLowerCaseInstance0012
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Char(c'a');
      const lowerZ = new Char(c'z');
      const upperA = new Char(c'A');
      const upperZ = new Char(c'Z');
      const zero = new Char(c'0');

      expect(lowerA.isLowerCase()).assertTrue();
      expect(lowerZ.isLowerCase()).assertTrue();
      expect(upperA.isLowerCase()).assertFalse();
      expect(upperZ.isLowerCase()).assertFalse();
      expect(zero.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1300
     * @tc.name testCharIsLowerCaseInstance0013
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0013' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result = c.isLowerCase();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1500
     * @tc.name testCharIsLowerCaseInstance0015
     * @tc.desc Verify finally always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.isLowerCase();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1700
     * @tc.name testCharIsLowerCaseInstance0017
     * @tc.desc Verify instance isLowerCase() returns the same result as the static Char.isLowerCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const instanceResult = c.isLowerCase();

      const staticResult = Char.isLowerCase(c'a');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1800
     * @tc.name testCharIsLowerCaseInstance0018
     * @tc.desc Verify isLowerCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const startTime = Date.now();
      const result = c.isLowerCase();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_1900
     * @tc.name testCharIsLowerCaseInstance0019
     * @tc.desc Verify instance and static methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      expect(c1.isLowerCase()).assertEqual(Char.isLowerCase(c'A'));
      const c2 = new Char(c'Z');
      expect(c2.isLowerCase()).assertEqual(Char.isLowerCase(c'Z'));
      const c3 = new Char(c'a');
      expect(c3.isLowerCase()).assertEqual(Char.isLowerCase(c'a'));
      const c4 = new Char(c'z');
      expect(c4.isLowerCase()).assertEqual(Char.isLowerCase(c'z'));
      const c5 = new Char(c'0');
      expect(c5.isLowerCase()).assertEqual(Char.isLowerCase(c'0'));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2100
     * @tc.name testCharIsLowerCaseInstance0021
     * @tc.desc Verify lowercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Char(c'a');
      const lowerZ = new Char(c'z');
      const upperA = new Char(c'A');

      expect(lowerA.isLetter()).assertTrue();
      expect(lowerA.isLowerCase()).assertTrue();

      expect(lowerZ.isLetter()).assertTrue();
      expect(lowerZ.isLowerCase()).assertTrue();

      expect(upperA.isLetter()).assertTrue();
      expect(upperA.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2200
     * @tc.name testCharIsLowerCaseInstance0022
     * @tc.desc Verify lowercase letters are a subset of letters with containment check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'a');
      expect(c1.isLowerCase()).assertTrue();
      expect(c1.isLetter()).assertTrue();

      const c2 = new Char(c'A');
      expect(c2.isLowerCase()).assertFalse();
      expect(c2.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2300
     * @tc.name testCharIsLowerCaseInstance0023
     * @tc.desc Verify lowercase and uppercase are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Char(c'a');
      const upperA = new Char(c'A');
      const zero = new Char(c'0');

      expect(lowerA.isLowerCase()).assertTrue();
      expect(lowerA.isUpperCase()).assertFalse();

      expect(upperA.isLowerCase()).assertFalse();
      expect(upperA.isUpperCase()).assertTrue();

      expect(zero.isLowerCase()).assertFalse();
      expect(zero.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2400
     * @tc.name testCharIsLowerCaseInstance0024
     * @tc.desc Verify lowercase and uppercase are never both true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'a');
      expect(c1.isLowerCase()).assertTrue();
      expect(c1.isUpperCase()).assertFalse();
      const c2 = new Char(c'A');
      expect(c2.isLowerCase()).assertFalse();
      expect(c2.isUpperCase()).assertTrue();
      const c3 = new Char(c'0');
      expect(c3.isLowerCase()).assertFalse();
      expect(c3.isUpperCase()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2600
     * @tc.name testCharIsLowerCaseInstance0026
     * @tc.desc Verify non-lowercase characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_UPPERCASE) {
        const c = new Char(ch);
        expect(c.isLowerCase()).assertFalse();
      }

      const zero = new Char(c'0');
      const nine = new Char(c'9');

      expect(zero.isLowerCase()).assertFalse();
      expect(nine.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2700
     * @tc.name testCharIsLowerCaseInstance0027
     * @tc.desc Verify case classification for all letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (const ch of ALL_LOWERCASE) {
        const c = new Char(ch);
        expect(c.isLowerCase()).assertTrue();
        expect(c.isUpperCase()).assertFalse();
        expect(c.isLetter()).assertTrue();
      }

      for (const ch of ALL_UPPERCASE) {
        const c = new Char(ch);
        expect(c.isLowerCase()).assertFalse();
        expect(c.isUpperCase()).assertTrue();
        expect(c.isLetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2800
     * @tc.name testCharIsLowerCaseInstance0028
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grave = new Char(c'`');
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');
      const leftBrace = new Char(c'{');
      const atSign = new Char(c'@');
      const upperA = new Char(c'A');

      expect(grave.isLowerCase()).assertFalse();
      expect(lowerA.isLowerCase()).assertTrue();
      expect(lowerM.isLowerCase()).assertTrue();
      expect(lowerZ.isLowerCase()).assertTrue();
      expect(leftBrace.isLowerCase()).assertFalse();
      expect(atSign.isLowerCase()).assertFalse();
      expect(upperA.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_2900
     * @tc.name testCharIsLowerCaseInstance0029
     * @tc.desc Verify Unicode characters are not lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chinese = new Char(c'中');
      expect(chinese.isLowerCase()).assertFalse();

      const greekLower = new Char(c'α');
      const greekUpper = new Char(c'Α');

      expect(greekLower.isLowerCase()).assertFalse();
      expect(greekUpper.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_3000
     * @tc.name testCharIsLowerCaseInstance0030
     * @tc.desc Verify repeated calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result1 = c.isLowerCase();
      const result2 = c.isLowerCase();
      const result3 = c.isLowerCase();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_3100
     * @tc.name testCharIsLowerCaseInstance0031
     * @tc.desc Verify different instances are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'a');
      const c2 = new Char(c'A');

      expect(c1.isLowerCase()).assertTrue();
      expect(c2.isLowerCase()).assertFalse();

      expect(c1.isLowerCase()).assertTrue();
      expect(c2.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_3200
     * @tc.name testCharIsLowerCaseInstance0032
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      for (let i = 0; i < 1000; i++) {
        expect(c.isLowerCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_3300
     * @tc.name testCharIsLowerCaseInstance0033
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0033' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      expect(c1.isLowerCase()).assertFalse();
      const c2 = new Char(c'Z');
      expect(c2.isLowerCase()).assertFalse();
      const c3 = new Char(c'a');
      expect(c3.isLowerCase()).assertTrue();
      const c4 = new Char(c'z');
      expect(c4.isLowerCase()).assertTrue();
      const c5 = new Char(c'0');
      expect(c5.isLowerCase()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_3500
     * @tc.name testCharIsLowerCaseInstance0035
     * @tc.desc Verify case classification is consistent with other methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'a');
      expect(c1.isLowerCase()).assertTrue();
      expect(c1.isUpperCase()).assertFalse();
      expect(c1.isLetter()).assertTrue();
      const c2 = new Char(c'A');
      expect(c2.isLowerCase()).assertFalse();
      expect(c2.isUpperCase()).assertTrue();
      expect(c2.isLetter()).assertTrue();
      const c3 = new Char(c'0');
      expect(c3.isLowerCase()).assertFalse();
      expect(c3.isUpperCase()).assertFalse();
      expect(c3.isLetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLOWERCASEINSTANCETEST_ISLOWERCASETEST_3600
     * @tc.name testCharIsLowerCaseInstance0036
     * @tc.desc Verify conformance to ASCII lowercase definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseInstance0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerSet = new Set<Char>(ALL_LOWERCASE);
      const allAsciiPrintable: Char[] = [
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
      for (const ch of allAsciiPrintable) {
        const c = new Char(ch);
        const expected = lowerSet.has(ch);
        const result = c.isLowerCase();
        expect(result).assertEqual(expected);
      }
    });
  });
}
