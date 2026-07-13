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

interface LetterTestCase {
  ch: Char;
  expected: boolean;
}

export default function CharIsLetterInstanceTest(): void {
  describe('CharIsLetterInstanceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_0100
     * @tc.name testCharIsLetterInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isLetter();
      expect(result).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_0300
     * @tc.name testCharIsLetterInstance0003
     * @tc.desc Verify no parameter is needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isLetter();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_0500
     * @tc.name testCharIsLetterInstance0005
     * @tc.desc Verify A-Z and a-z return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperZ = new Char(c'Z');
      const lowerA = new Char(c'a');
      const lowerZ = new Char(c'z');
      expect(upperA.isLetter()).assertTrue();
      expect(upperZ.isLetter()).assertTrue();
      expect(lowerA.isLetter()).assertTrue();
      expect(lowerZ.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_0600
     * @tc.name testCharIsLetterInstance0006
     * @tc.desc Verify non-letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      const atSign = new Char(c'@');
      expect(zero.isLetter()).assertFalse();
      expect(nine.isLetter()).assertFalse();
      expect(atSign.isLetter()).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_0800
     * @tc.name testCharIsLetterInstance0008
     * @tc.desc Verify Char instance value is not a letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      expect(zero.isLetter()).assertFalse();
      expect(nine.isLetter()).assertFalse();
      const atSign = new Char(c'@');
      const space = new Char(c' ');
      expect(atSign.isLetter()).assertFalse();
      expect(space.isLetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_0900
     * @tc.name testCharIsLetterInstance0009
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isLetter();
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_1100
     * @tc.name testCharIsLetterInstance0011
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');
      const lowerA = new Char(c'a');
      const zero = new Char(c'0');
      const atSign = new Char(c'@');
      expect(upperA.isLetter()).assertTrue();
      expect(upperM.isLetter()).assertTrue();
      expect(upperZ.isLetter()).assertTrue();
      expect(lowerA.isLetter()).assertTrue();
      expect(zero.isLetter()).assertFalse();
      expect(atSign.isLetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_1200
     * @tc.name testCharIsLetterInstance0012
     * @tc.desc Verify normal invocation does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isLetter();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_1400
     * @tc.name testCharIsLetterInstance0014
     * @tc.desc Verify isLetter() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'0');
        const result = c.isLetter();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_1600
     * @tc.name testCharIsLetterInstance0016
     * @tc.desc Verify instance isLetter() returns the same result as the static Char.isLetter()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.isLetter();
      const staticResult = Char.isLetter(c'A');
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_1700
     * @tc.name testCharIsLetterInstance0017
     * @tc.desc Verify isLetter is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.isLetter();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_1800
     * @tc.name testCharIsLetterInstance0018
     * @tc.desc Verify instance and static methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0', c'@'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.isLetter();
        const staticResult = Char.isLetter(ch);
        expect(instanceResult).assertEqual(staticResult);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2000
     * @tc.name testCharIsLetterInstance0020
     * @tc.desc Verify uppercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2100
     * @tc.name testCharIsLetterInstance0021
     * @tc.desc Verify uppercase letters are a subset of letters via containment check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const isUpper = c.isUpperCase();
        const isLetter = c.isLetter();
        if (isUpper) {
          expect(isLetter).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2200
     * @tc.name testCharIsLetterInstance0022
     * @tc.desc Verify lowercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2300
     * @tc.name testCharIsLetterInstance0023
     * @tc.desc Verify A-F are both letters and hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      const upperF = new Char(c'F');
      const upperG = new Char(c'G');
      const zero = new Char(c'0');
      expect(upperA.isLetter()).assertTrue();
      expect(upperA.isHexDigit()).assertTrue();
      expect(upperF.isLetter()).assertTrue();
      expect(upperF.isHexDigit()).assertTrue();
      expect(upperG.isLetter()).assertTrue();
      expect(upperG.isHexDigit()).assertFalse();
      expect(zero.isLetter()).assertFalse();
      expect(zero.isHexDigit()).assertTrue();
    });

    

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2700
     * @tc.name testCharIsLetterInstance0027
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const atSign = new Char(c'@');
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');
      const leftBracket = new Char(c'[');
      const grave = new Char(c'`');
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');
      const leftBrace = new Char(c'{');
      expect(atSign.isLetter()).assertFalse();
      expect(upperA.isLetter()).assertTrue();
      expect(upperM.isLetter()).assertTrue();
      expect(upperZ.isLetter()).assertTrue();
      expect(leftBracket.isLetter()).assertFalse();
      expect(grave.isLetter()).assertFalse();
      expect(lowerA.isLetter()).assertTrue();
      expect(lowerM.isLetter()).assertTrue();
      expect(lowerZ.isLetter()).assertTrue();
      expect(leftBrace.isLetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2800
     * @tc.name testCharIsLetterInstance0028
     * @tc.desc Verify that non-ASCII letters return false (API only supports ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chinese1 = new Char(c'中');
      const chinese2 = new Char(c'文');
      expect(chinese1.isLetter()).assertFalse();
      expect(chinese2.isLetter()).assertFalse();
      const japanese = new Char(c'あ');
      expect(japanese.isLetter()).assertFalse();
      const korean = new Char(c'가');
      expect(korean.isLetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_2900
     * @tc.name testCharIsLetterInstance0029
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.isLetter();
      const result2 = c.isLetter();
      const result3 = c.isLetter();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_3000
     * @tc.name testCharIsLetterInstance0030
     * @tc.desc Verify different instances have independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'0');
      expect(c1.isLetter()).assertTrue();
      expect(c2.isLetter()).assertFalse();
      expect(c1.isLetter()).assertTrue();
      expect(c2.isLetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_3100
     * @tc.name testCharIsLetterInstance0031
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.isLetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_3200
     * @tc.name testCharIsLetterInstance0032
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: LetterTestCase[] = [
        { ch: c'A', expected: true },
        { ch: c'Z', expected: true },
        { ch: c'a', expected: true },
        { ch: c'z', expected: true },
        { ch: c'0', expected: false },
        { ch: c'9', expected: false },
        { ch: c'@', expected: false }
      ];
      for (const testCase of testCases) {
        const c = new Char(testCase.ch);
        expect(c.isLetter()).assertEqual(testCase.expected);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISLETTERINSTANCETEST_ISLETTERTEST_3400
     * @tc.name testCharIsLetterInstance0034
     * @tc.desc Verify letter and case check methods are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLetterInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0', c'@'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const isLetter = c.isLetter();
        const isUpper = c.isUpperCase();
        const isLower = c.isLowerCase();
        if (isUpper || isLower) {
          expect(isLetter).assertTrue();
        }
      }
    });

      });
}
