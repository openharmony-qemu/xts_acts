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


function charFromCode(code: number): char {
  return Int.toChar(Double.toInt(code));
}

export default function CharIsUpperCaseInstanceTest(): void {
  describe('CharIsUpperCaseInstanceTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0100
     * @tc.name testCharIsUpperCaseInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isUpperCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0300
     * @tc.name testCharIsUpperCaseInstance0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isUpperCase();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0500
     * @tc.name testCharIsUpperCaseInstance0005
     * @tc.desc Verify uppercase letters A-Z return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');
      expect(upperA.isUpperCase()).assertTrue();
      expect(upperM.isUpperCase()).assertTrue();
      expect(upperZ.isUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0600
     * @tc.name testCharIsUpperCaseInstance0006
     * @tc.desc Verify lowercase letters a-z return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');
      expect(lowerA.isUpperCase()).assertFalse();
      expect(lowerM.isUpperCase()).assertFalse();
      expect(lowerZ.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0700
     * @tc.name testCharIsUpperCaseInstance0007
     * @tc.desc Verify non-letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const atSign = new Char(c'@');
      expect(zero.isUpperCase()).assertFalse();
      expect(atSign.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0800
     * @tc.name testCharIsUpperCaseInstance0008
     * @tc.desc Verify Char instance value is uppercase letter (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isUpperCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_0900
     * @tc.name testCharIsUpperCaseInstance0009
     * @tc.desc Verify Char instance value is lowercase letter (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isUpperCase()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1100
     * @tc.name testCharIsUpperCaseInstance0011
     * @tc.desc Verify can only be called through Char instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      let result: boolean;
      result = c.isUpperCase();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1200
     * @tc.name testCharIsUpperCaseInstance0012
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperZ = new Char(c'Z');
      const lowerA = new Char(c'a');
      const lowerZ = new Char(c'z');
      const zero = new Char(c'0');
      expect(upperA.isUpperCase()).assertTrue();
      expect(upperZ.isUpperCase()).assertTrue();
      expect(lowerA.isUpperCase()).assertFalse();
      expect(lowerZ.isUpperCase()).assertFalse();
      expect(zero.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1300
     * @tc.name testCharIsUpperCaseInstance0013
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isUpperCase();
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1500
     * @tc.name testCharIsUpperCaseInstance0015
     * @tc.desc Verify normal execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'a');
      const result = c.isUpperCase();
      expect(result).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1700
     * @tc.name testCharIsUpperCaseInstance0017
     * @tc.desc Verify instance isUpperCase() returns the same result as the static Char.isUpperCase()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.isUpperCase();
      const staticResult = Char.isUpperCase(c'A');
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1800
     * @tc.name testCharIsUpperCaseInstance0018
     * @tc.desc Verify isUpperCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.isUpperCase();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_1900
     * @tc.name testCharIsUpperCaseInstance0019
     * @tc.desc Verify instance and static methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (let i = 0; i < testChars.length; i++) {
        const ch = testChars[i];
        const c = new Char(ch);
        const instanceResult = c.isUpperCase();
        const staticResult = Char.isUpperCase(ch);
        expect(instanceResult).assertEqual(staticResult);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2100
     * @tc.name testCharIsUpperCaseInstance0021
     * @tc.desc Verify uppercase letters are subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperZ = new Char(c'Z');
      const lowerA = new Char(c'a');
      expect(upperA.isLetter()).assertTrue();
      expect(upperA.isUpperCase()).assertTrue();
      expect(upperZ.isLetter()).assertTrue();
      expect(upperZ.isUpperCase()).assertTrue();
      expect(lowerA.isLetter()).assertTrue();
      expect(lowerA.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2200
     * @tc.name testCharIsUpperCaseInstance0022
     * @tc.desc Verify uppercase letters are subset of letters with inclusion relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (let i = 0; i < testChars.length; i++) {
        const ch = testChars[i];
        const c = new Char(ch);
        const isUpper = c.isUpperCase();
        const isLetter = c.isLetter();
        if (isUpper) {
          expect(isLetter).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2300
     * @tc.name testCharIsUpperCaseInstance0023
     * @tc.desc Verify uppercase and lowercase are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const lowerA = new Char(c'a');
      const zero = new Char(c'0');
      expect(upperA.isUpperCase()).assertTrue();
      expect(upperA.isLowerCase()).assertFalse();
      expect(lowerA.isUpperCase()).assertFalse();
      expect(lowerA.isLowerCase()).assertTrue();
      expect(zero.isUpperCase()).assertFalse();
      expect(zero.isLowerCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2400
     * @tc.name testCharIsUpperCaseInstance0024
     * @tc.desc Verify uppercase and lowercase are not both true simultaneously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (let i = 0; i < testChars.length; i++) {
        const ch = testChars[i];
        const c = new Char(ch);
        const isUpper = c.isUpperCase();
        const isLower = c.isLowerCase();
        expect(!(isUpper && isLower)).assertTrue();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2600
     * @tc.name testCharIsUpperCaseInstance0026
     * @tc.desc Verify other characters are not uppercase letters (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isUpperCase()).assertFalse();
      }
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      expect(zero.isUpperCase()).assertFalse();
      expect(nine.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2700
     * @tc.name testCharIsUpperCaseInstance0027
     * @tc.desc Verify case classification of all letters (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isUpperCase()).assertTrue();
        expect(c.isLowerCase()).assertFalse();
        expect(c.isLetter()).assertTrue();
      }
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        expect(c.isUpperCase()).assertFalse();
        expect(c.isLowerCase()).assertTrue();
        expect(c.isLetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2800
     * @tc.name testCharIsUpperCaseInstance0028
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const atSign = new Char(c'@');
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');
      const leftBracket = new Char(c'[');
      const grave = new Char(c'`');
      const lowerA = new Char(c'a');
      expect(atSign.isUpperCase()).assertFalse();
      expect(upperA.isUpperCase()).assertTrue();
      expect(upperM.isUpperCase()).assertTrue();
      expect(upperZ.isUpperCase()).assertTrue();
      expect(leftBracket.isUpperCase()).assertFalse();
      expect(grave.isUpperCase()).assertFalse();
      expect(lowerA.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_2900
     * @tc.name testCharIsUpperCaseInstance0029
     * @tc.desc Verify Unicode characters are not uppercase letters (API only supports ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chinese = new Char(c'中');
      expect(chinese.isUpperCase()).assertFalse();
      const greekUpper = new Char(c'Α');
      const greekLower = new Char(c'α');
      expect(greekUpper.isUpperCase()).assertFalse();
      expect(greekLower.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_3000
     * @tc.name testCharIsUpperCaseInstance0030
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.isUpperCase();
      const result2 = c.isUpperCase();
      const result3 = c.isUpperCase();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_3100
     * @tc.name testCharIsUpperCaseInstance0031
     * @tc.desc Verify different instances have independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'a');
      expect(c1.isUpperCase()).assertTrue();
      expect(c2.isUpperCase()).assertFalse();
      expect(c1.isUpperCase()).assertTrue();
      expect(c2.isUpperCase()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_3200
     * @tc.name testCharIsUpperCaseInstance0032
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.isUpperCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_3300
     * @tc.name testCharIsUpperCaseInstance0033
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cA = new Char(c'A');
      const cZ = new Char(c'Z');
      const ca = new Char(c'a');
      const cz = new Char(c'z');
      const c0 = new Char(c'0');

      expect(cA.isUpperCase()).assertTrue();
      expect(cZ.isUpperCase()).assertTrue();
      expect(ca.isUpperCase()).assertFalse();
      expect(cz.isUpperCase()).assertFalse();
      expect(c0.isUpperCase()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_3500
     * @tc.name testCharIsUpperCaseInstance0035
     * @tc.desc Verify case classification is consistent with other methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (let i = 0; i < testChars.length; i++) {
        const ch = testChars[i];
        const c = new Char(ch);
        const isUpper = c.isUpperCase();
        const isLower = c.isLowerCase();
        const isLetter = c.isLetter();
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISUPPERCASEINSTANCETEST_3600
     * @tc.name testCharIsUpperCaseInstance0036
     * @tc.desc Verify compliance with ASCII uppercase letter definition (full traversal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsUpperCaseInstance0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const c = new Char(ch);
        const expected = (i >= 0x41 && i <= 0x5A);
        expect(c.isUpperCase()).assertEqual(expected);
      }
    });
  });
}
