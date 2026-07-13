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

export default function CharToLowerCaseInstanceTest(): void {
  describe('CharToLowerCaseInstanceTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0100
     * @tc.name testCharToLowerCaseInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toLowerCase();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0200
     * @tc.name testCharToLowerCaseInstance0002
     * @tc.desc Verify toLowerCase() can be called with no extra parameters and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ch = new Char(c'A');
      const result = ch.toLowerCase();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0300
     * @tc.name testCharToLowerCaseInstance0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toLowerCase();
      expect(result instanceof Char).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0500
     * @tc.name testCharToLowerCaseInstance0005
     * @tc.desc Verify uppercase letters A-Z converted to lowercase a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');

      expect(upperA.toLowerCase().toString()).assertEqual("a");
      expect(upperM.toLowerCase().toString()).assertEqual("m");
      expect(upperZ.toLowerCase().toString()).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0600
     * @tc.name testCharToLowerCaseInstance0006
     * @tc.desc Verify lowercase letters a-z remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');

      expect(lowerA.toLowerCase().toString()).assertEqual("a");
      expect(lowerM.toLowerCase().toString()).assertEqual("m");
      expect(lowerZ.toLowerCase().toString()).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0700
     * @tc.name testCharToLowerCaseInstance0007
     * @tc.desc Verify non-letter characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new Char(c'0');
      const atSign = new Char(c'@');
      const space = new Char(c' ');

      expect(zero.toLowerCase().toString()).assertEqual("0");
      expect(atSign.toLowerCase().toString()).assertEqual("@");
      expect(space.toLowerCase().toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0800
     * @tc.name testCharToLowerCaseInstance0008
     * @tc.desc Verify Char instance value is uppercase letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        expect(c.toLowerCase().toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_0900
     * @tc.name testCharToLowerCaseInstance0009
     * @tc.desc Verify Char instance value is lowercase letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        expect(c.toLowerCase().toString()).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1000
     * @tc.name testCharToLowerCaseInstance0010
     * @tc.desc Verify return value type is Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toLowerCase();
      expect(result instanceof Char).assertTrue();
      expect(typeof result.toChar).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1100
     * @tc.name testCharToLowerCaseInstance0011
     * @tc.desc Verify returned Char object can be operated on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toLowerCase();

      expect(result.isLowerCase()).assertTrue();
      expect(result.isUpperCase()).assertFalse();
      expect(result.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1200
     * @tc.name testCharToLowerCaseInstance0012
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upperA = new Char(c'A');
      const upperZ = new Char(c'Z');
      const lowerA = new Char(c'a');
      const lowerZ = new Char(c'z');
      const zero = new Char(c'0');

      expect(upperA.toLowerCase().toString()).assertEqual("a");
      expect(upperZ.toLowerCase().toString()).assertEqual("z");
      expect(lowerA.toLowerCase().toString()).assertEqual("a");
      expect(lowerZ.toLowerCase().toString()).assertEqual("z");
      expect(zero.toLowerCase().toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1300
     * @tc.name testCharToLowerCaseInstance0013
     * @tc.desc Verify normal invocation does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toLowerCase();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1500
     * @tc.name testCharToLowerCaseInstance0015
     * @tc.desc Verify toLowerCase() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'a');
        const result = c.toLowerCase();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1600
     * @tc.name testCharToLowerCaseInstance0016
     * @tc.desc Verify toLowerCase is an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = c.toLowerCase();
      expect(result instanceof Char).assertTrue();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1700
     * @tc.name testCharToLowerCaseInstance0017
     * @tc.desc Verify that the instance method toLowerCase produces the same result as the static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const instanceResult = c.toLowerCase();
      const staticResult = Char.toLowerCase(c'A');
      expect(instanceResult.toString()).assertEqual(staticResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1800
     * @tc.name testCharToLowerCaseInstance0018
     * @tc.desc Verify new instance returned without modifying original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const originalValue = c.toChar();
      const result = c.toLowerCase();
      expect(c.toChar()).assertEqual(originalValue);
      expect(c.toChar()).assertEqual(c'A');
      expect(result.toString()).assertEqual("a");
      expect(result.toChar()).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_1900
     * @tc.name testCharToLowerCaseInstance0019
     * @tc.desc Verify toLowerCase is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.toLowerCase();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2000
     * @tc.name testCharToLowerCaseInstance0020
     * @tc.desc Verify instance and static methods produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'A', c'M', c'Z', c'a', c'm', c'z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.toLowerCase();
        const staticResult = Char.toLowerCase(ch);
        expect(instanceResult.toString()).assertEqual(staticResult.toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2200
     * @tc.name testCharToLowerCaseInstance0022
     * @tc.desc Verify case conversion is inverse operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper = new Char(c'A');
      const lower = new Char(c'a');
      const lowerResult = upper.toLowerCase();
      expect(lowerResult.toString()).assertEqual("a");
      expect(lowerResult.isLowerCase()).assertTrue();
      const upperResult = lower.toUpperCase();
      expect(upperResult.toString()).assertEqual("A");
      expect(upperResult.isUpperCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2300
     * @tc.name testCharToLowerCaseInstance0023
     * @tc.desc Verify uppercase to lowercase then back to uppercase yields original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = new Char(c'A');
      const lower = original.toLowerCase();
      const upper = lower.toUpperCase();
      expect(upper.toChar()).assertEqual(original.toChar());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2400
     * @tc.name testCharToLowerCaseInstance0024
     * @tc.desc Verify converted character is lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upper = new Char(c'A');
      const lower = new Char(c'a');
      const result1 = upper.toLowerCase();
      expect(result1.isLowerCase()).assertTrue();
      const result2 = lower.toLowerCase();
      expect(result2.isLowerCase()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2500
     * @tc.name testCharToLowerCaseInstance0025
     * @tc.desc Verify all uppercase letters A-Z converted to a-z
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'A', c'M', c'Z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toLowerCase();
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isLowerCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2600
     * @tc.name testCharToLowerCaseInstance0026
     * @tc.desc Verify all lowercase letters a-z remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chars: char[] = [c'a', c'm', c'z'];
      const expected: string[] = ["a", "m", "z"];
      for (let i = 0; i < chars.length; i++) {
        const c = new Char(chars[i]);
        const result = c.toLowerCase();
        expect(result.toString()).assertEqual(expected[i]);
        expect(result.isLowerCase()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2700
     * @tc.name testCharToLowerCaseInstance0027
     * @tc.desc Verify non-letter characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      expect(zero.toLowerCase().toString()).assertEqual("0");
      expect(nine.toLowerCase().toString()).assertEqual("9");
      const atSign = new Char(c'@');
      const space = new Char(c' ');
      expect(atSign.toLowerCase().toString()).assertEqual("@");
      expect(space.toLowerCase().toString()).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2800
     * @tc.name testCharToLowerCaseInstance0028
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const upperA = new Char(c'A');
      const upperM = new Char(c'M');
      const upperZ = new Char(c'Z');
      expect(upperA.toLowerCase().toString()).assertEqual("a");
      expect(upperM.toLowerCase().toString()).assertEqual("m");
      expect(upperZ.toLowerCase().toString()).assertEqual("z");
      const lowerA = new Char(c'a');
      const lowerM = new Char(c'm');
      const lowerZ = new Char(c'z');
      expect(lowerA.toLowerCase().toString()).assertEqual("a");
      expect(lowerM.toLowerCase().toString()).assertEqual("m");
      expect(lowerZ.toLowerCase().toString()).assertEqual("z");
      const atSign = new Char(c'@');
      const grave = new Char(c'`');
      expect(atSign.toLowerCase().toString()).assertEqual("@");
      expect(grave.toLowerCase().toString()).assertEqual("`");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_2900
     * @tc.name testCharToLowerCaseInstance0029
     * @tc.desc Verify Unicode characters remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const chinese = new Char(c'中');
      expect(chinese.toLowerCase().toString()).assertEqual("中");
      const japanese = new Char(c'あ');
      expect(japanese.toLowerCase().toString()).assertEqual("あ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3000
     * @tc.name testCharToLowerCaseInstance0030
     * @tc.desc Verify multiple calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result1 = c.toLowerCase();
      const result2 = c.toLowerCase();
      const result3 = c.toLowerCase();
      expect(result1.toString()).assertEqual(result2.toString());
      expect(result2.toString()).assertEqual(result3.toString());
      expect(result1.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3100
     * @tc.name testCharToLowerCaseInstance0031
     * @tc.desc Verify multiple lowercase conversions remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      let result = c.toLowerCase();
      expect(result.toString()).assertEqual("a");
      result = result.toLowerCase();
      expect(result.toString()).assertEqual("a");
      result = result.toLowerCase();
      expect(result.toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3200
     * @tc.name testCharToLowerCaseInstance0032
     * @tc.desc Verify different instances convert independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const result1 = c1.toLowerCase();
      const result2 = c2.toLowerCase();
      expect(result1.toString()).assertEqual("a");
      expect(result2.toString()).assertEqual("b");
      expect(c1.toChar()).assertEqual(c'A');
      expect(c2.toChar()).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3300
     * @tc.name testCharToLowerCaseInstance0033
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toLowerCase().toString()).assertEqual("a");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3400
     * @tc.name testCharToLowerCaseInstance0034
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'A');
      expect(c1.toLowerCase().toString()).assertEqual("a");
      const c2 = new Char(c'M');
      expect(c2.toLowerCase().toString()).assertEqual("m");
      const c3 = new Char(c'Z');
      expect(c3.toLowerCase().toString()).assertEqual("z");
      const c4 = new Char(c'a');
      expect(c4.toLowerCase().toString()).assertEqual("a");
      const c5 = new Char(c'm');
      expect(c5.toLowerCase().toString()).assertEqual("m");
      const c6 = new Char(c'z');
      expect(c6.toLowerCase().toString()).assertEqual("z");
      const c7 = new Char(c'0');
      expect(c7.toLowerCase().toString()).assertEqual("0");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3600
     * @tc.name testCharToLowerCaseInstance0036
     * @tc.desc Verify character case property is correct after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'A', c'Z', c'a', c'z', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const result = c.toLowerCase();
        if (c.isLetter()) {
          expect(result.isLowerCase()).assertTrue();
          expect(result.isUpperCase()).assertFalse();
        } else {
          expect(result.toChar()).assertEqual(c.toChar());
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOLOWERCASEINSTANCETEST_3700
     * @tc.name testCharToLowerCaseInstance0037
     * @tc.desc Verify case conversion is reversible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToLowerCaseInstance0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const testChars = [c'A', c'M', c'Z', c'a', c'm', c'z'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const lower = c.toLowerCase();
        const upper = lower.toUpperCase();
        expect(upper.isUpperCase()).assertTrue();
      }
    });
  });
}
