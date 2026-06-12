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

function charFromCode(code: double): char {
  return Int.toChar(Double.toInt(code));
}

function invokeIsLowerCaseNoArg(): boolean {
  return (Char.isLowerCase as Object as (() => boolean))();
}

function invokeIsLowerCaseWithParam(ch: Object | null): boolean {
  return (Char.isLowerCase as Object as ((param: Object | null) => boolean))(ch);
}

export default function CharIsLowerCaseStaticCharTest(): void {
  describe('CharIsLowerCaseStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0100
     * @tc.name testCharIsLowerCaseStaticChar0001
     * @tc.desc Verify that a char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLowerCase(c'a');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0200
     * @tc.name testCharIsLowerCaseStaticChar0002
     * @tc.desc Verify that passing no argument throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeIsLowerCaseNoArg();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0300
     * @tc.name testCharIsLowerCaseStaticChar0003
     * @tc.desc Verify lowercase letters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLowerCase(c'm')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0400
     * @tc.name testCharIsLowerCaseStaticChar0004
     * @tc.desc Verify uppercase letters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isLowerCase(c'M')).assertFalse();
      expect(Char.isLowerCase(c'Z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0500
     * @tc.name testCharIsLowerCaseStaticChar0005
     * @tc.desc Verify non-letter characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'0')).assertFalse();
      expect(Char.isLowerCase(c'9')).assertFalse();
      expect(Char.isLowerCase(c'+')).assertFalse();
      expect(Char.isLowerCase(c'@')).assertFalse();
      expect(Char.isLowerCase(c' ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0600
     * @tc.name testCharIsLowerCaseStaticChar0006
     * @tc.desc Verify special characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c' ')).assertFalse();
      expect(Char.isLowerCase(c'\t')).assertFalse();
      expect(Char.isLowerCase(c'\n')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0700
     * @tc.name testCharIsLowerCaseStaticChar0007
     * @tc.desc Verify passing invalid value (null) throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeIsLowerCaseWithParam(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0800
     * @tc.name testCharIsLowerCaseStaticChar0008
     * @tc.desc Verify boundaries of lowercase letters a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'`')).assertFalse();
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
      expect(Char.isLowerCase(c'{')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_0900
     * @tc.name testCharIsLowerCaseStaticChar0009
     * @tc.desc Verify boundaries of uppercase letters A-Z are not lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'@')).assertFalse();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isLowerCase(c'Z')).assertFalse();
      expect(Char.isLowerCase(c'[')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1000
     * @tc.name testCharIsLowerCaseStaticChar0010
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLowerCase(c'a');
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1100
     * @tc.name testCharIsLowerCaseStaticChar0011
     * @tc.desc Verify a-z returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1200
     * @tc.name testCharIsLowerCaseStaticChar0012
     * @tc.desc Verify other characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertFalse();
      }
      for (let i = 0x30; i <= 0x39; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertFalse();
      }
      expect(Char.isLowerCase(c'@')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1300
     * @tc.name testCharIsLowerCaseStaticChar0013
     * @tc.desc Verify case sensitivity between uppercase and lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLowerCase(c'b')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isLowerCase(c'B')).assertFalse();
      expect(Char.isLowerCase(c'Z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1400
     * @tc.name testCharIsLowerCaseStaticChar0014
     * @tc.desc Verify non-letter characters are not lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'0')).assertFalse();
      expect(Char.isLowerCase(c'9')).assertFalse();
      expect(Char.isLowerCase(c'@')).assertFalse();
      expect(Char.isLowerCase(c'[')).assertFalse();
      expect(Char.isLowerCase(c'`')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1500
     * @tc.name testCharIsLowerCaseStaticChar0015
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isLowerCase(c'a');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1600
     * @tc.name testCharIsLowerCaseStaticChar0016
     * @tc.desc Verify only a-z returns true (full ASCII precision)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const expected = (i >= 0x61 && i <= 0x7A);
        expect(Char.isLowerCase(ch)).assertEqual(expected);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_1800
     * @tc.name testCharIsLowerCaseStaticChar0018
     * @tc.desc Verify passing wrong type parameter may throw an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeIsLowerCaseWithParam(123 as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2000
     * @tc.name testCharIsLowerCaseStaticChar0020
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isLowerCase(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2100
     * @tc.name testCharIsLowerCaseStaticChar0021
     * @tc.desc Verify isLowerCase is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase !== undefined && Char.isLowerCase !== null).assertTrue();
      const result = Char.isLowerCase(c'a');
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2300
     * @tc.name testCharIsLowerCaseStaticChar0023
     * @tc.desc Verify isLowerCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isLowerCase(c'a');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2400
     * @tc.name testCharIsLowerCaseStaticChar0024
     * @tc.desc Verify lowercase letters are a subset of letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLetter(c'a')).assertTrue();
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLetter(c'z')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isLowerCase(c'A')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2500
     * @tc.name testCharIsLowerCaseStaticChar0025
     * @tc.desc Verify lowercase letters subset relationship with isLetter (full ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const isLower = Char.isLowerCase(ch);
        const isLetter = Char.isLetter(ch);
        if (isLower) {
          expect(isLetter).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2600
     * @tc.name testCharIsLowerCaseStaticChar0026
     * @tc.desc Verify lowercase and uppercase are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isLowerCase(c'0')).assertFalse();
      expect(Char.isUpperCase(c'0')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2700
     * @tc.name testCharIsLowerCaseStaticChar0027
     * @tc.desc Verify lowercase and uppercase are never both true (full ASCII)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        expect(!(Char.isLowerCase(ch) && Char.isUpperCase(ch))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_2800
     * @tc.name testCharIsLowerCaseStaticChar0028
     * @tc.desc Verify a-f are both lowercase and hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isLowerCase(c'f')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isLowerCase(c'g')).assertTrue();
      expect(Char.isHexDigit(c'g')).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3000
     * @tc.name testCharIsLowerCaseStaticChar0030
     * @tc.desc Verify other characters are not lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertFalse();
      }
      for (let i = 0x30; i <= 0x39; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3100
     * @tc.name testCharIsLowerCaseStaticChar0031
     * @tc.desc Verify case classification for all letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x61; i <= 0x7A; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertTrue();
        expect(Char.isUpperCase(ch)).assertFalse();
        expect(Char.isLetter(ch)).assertTrue();
      }
      for (let i = 0x41; i <= 0x5A; i++) {
        const ch = charFromCode(i);
        expect(Char.isLowerCase(ch)).assertFalse();
        expect(Char.isUpperCase(ch)).assertTrue();
        expect(Char.isLetter(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3200
     * @tc.name testCharIsLowerCaseStaticChar0032
     * @tc.desc Verify ASCII boundary character test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'`')).assertFalse();
      expect(Char.isLowerCase(c'a')).assertTrue();
      expect(Char.isLowerCase(c'm')).assertTrue();
      expect(Char.isLowerCase(c'z')).assertTrue();
      expect(Char.isLowerCase(c'{')).assertFalse();
      expect(Char.isLowerCase(c'@')).assertFalse();
      expect(Char.isLowerCase(c'A')).assertFalse();
      expect(Char.isLowerCase(c'Z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3300
     * @tc.name testCharIsLowerCaseStaticChar0033
     * @tc.desc Verify Unicode characters are not lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isLowerCase(c'中')).assertFalse();
      expect(Char.isLowerCase(c'文')).assertFalse();
      expect(Char.isLowerCase(c'α')).assertFalse();
      expect(Char.isLowerCase(c'Α')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3400
     * @tc.name testCharIsLowerCaseStaticChar0034
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'a';
      const result1 = Char.isLowerCase(ch);
      const result2 = Char.isLowerCase(ch);
      const result3 = Char.isLowerCase(ch);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3500
     * @tc.name testCharIsLowerCaseStaticChar0035
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isLowerCase(c'a')).assertTrue();
        expect(Char.isLowerCase(c'A')).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3700
     * @tc.name testCharIsLowerCaseStaticChar0037
     * @tc.desc Verify case classification consistency with other methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0', c'@'];
      for (const ch of testChars) {
        const isLower = Char.isLowerCase(ch);
        const isUpper = Char.isUpperCase(ch);
        const isLetter = Char.isLetter(ch);
        if (isLower) {
          expect(isLetter).assertTrue();
          expect(isUpper).assertFalse();
        }
        if (isUpper) {
          expect(isLetter).assertTrue();
          expect(isLower).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISLOWERCASESTATICCHARTEST_3800
     * @tc.name testCharIsLowerCaseStaticChar0038
     * @tc.desc Verify static and instance method results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsLowerCaseStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isLowerCase(ch);
        const instanceResult = c.isLowerCase();
        expect(staticResult).assertEqual(instanceResult);
      }
    });

  });
}
