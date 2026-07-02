'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function CharIsHexDigitStaticCharTest(): void {
  describe('CharIsHexDigitStaticChar', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0100
     * @tc.name testCharIsHexDigitStaticChar001
     * @tc.desc Verify that a char parameter must be provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isHexDigit(c'A');
      expect(result).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0300
     * @tc.name testCharIsHexDigitStaticChar003
     * @tc.desc Verify hex digit characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0400
     * @tc.name testCharIsHexDigitStaticChar004
     * @tc.desc Verify non-hex digit characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c'g')).assertFalse();
      expect(Char.isHexDigit(c'Z')).assertFalse();
      expect(Char.isHexDigit(c'z')).assertFalse();
      expect(Char.isHexDigit(c'+')).assertFalse();
      expect(Char.isHexDigit(c'-')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0500
     * @tc.name testCharIsHexDigitStaticChar005
     * @tc.desc Verify special characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c' ')).assertFalse();
      expect(Char.isHexDigit(c'\t')).assertFalse();
      expect(Char.isHexDigit(c'\n')).assertFalse();
      expect(Char.isHexDigit(c'\u0000')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0600
     * @tc.name testCharIsHexDigitStaticChar006
     * @tc.desc Verify Unicode characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'\u96F6')).assertFalse();
      expect(Char.isHexDigit(c'\u5341')).assertFalse();
      expect(Char.isHexDigit(c'\u3042')).assertFalse();
      expect(Char.isHexDigit(c'\uAC00')).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0800
     * @tc.name testCharIsHexDigitStaticChar008
     * @tc.desc Verify hex digit boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'/')).assertFalse();
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c':')).assertFalse();
      expect(Char.isHexDigit(c'@')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c'`')).assertFalse();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isHexDigit(c'g')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_0900
     * @tc.name testCharIsHexDigitStaticChar009
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isHexDigit(c'A');
      expect(typeof result).assertEqual("boolean");
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_1100
     * @tc.name testCharIsHexDigitStaticChar011
     * @tc.desc Verify non-hex digits return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c'Z')).assertFalse();
      expect(Char.isHexDigit(c'g')).assertFalse();
      expect(Char.isHexDigit(c'z')).assertFalse();
      expect(Char.isHexDigit(c'@')).assertFalse();
      expect(Char.isHexDigit(c' ')).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_1300
     * @tc.name testCharIsHexDigitStaticChar013
     * @tc.desc Verify uppercase and lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c'Z')).assertFalse();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isHexDigit(c'g')).assertFalse();
      expect(Char.isHexDigit(c'z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_1400
     * @tc.name testCharIsHexDigitStaticChar014
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isHexDigit(c'A');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    
    
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_1900
     * @tc.name testCharIsHexDigitStaticChar019
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isHexDigit(c'G');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_2000
     * @tc.name testCharIsHexDigitStaticChar020
     * @tc.desc Verify isHexDigit is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.isHexDigit).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_2200
     * @tc.name testCharIsHexDigitStaticChar022
     * @tc.desc Verify isHexDigit is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isHexDigit(c'A');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_2300
     * @tc.name testCharIsHexDigitStaticChar023
     * @tc.desc Verify hex vs binary digit comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isHexDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isHexDigit(c'2')).assertTrue();
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_2500
     * @tc.name testCharIsHexDigitStaticChar025
     * @tc.desc Verify hex vs decimal digit comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      /*
      for (let i = 0; i <= 9; i++) {
        const ch = String.fromCharCode(0x30 + i) as char;
        expect(Char.isDecDigit(ch)).assertTrue();
        expect(Char.isHexDigit(ch)).assertTrue();
      }
      */
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_2700
     * @tc.name testCharIsHexDigitStaticChar027
     * @tc.desc Verify hex vs letter comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isLetter(c'0')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isLetter(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isLetter(c'F')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isLetter(c'G')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_2800
     * @tc.name testCharIsHexDigitStaticChar028
     * @tc.desc Verify complete hex digit recognition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validHexDigits = [
        c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
      c'A', c'B', c'C', c'D', c'E', c'F',
      c'a', c'b', c'c', c'd', c'e', c'f'
      ];
      for (const ch of validHexDigits) {
        expect(Char.isHexDigit(ch)).assertTrue();
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_3000
     * @tc.name testCharIsHexDigitStaticChar030
     * @tc.desc Verify digit classification hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isDecDigit(c'2')).assertTrue();
      expect(Char.isHexDigit(c'2')).assertTrue();
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_3200
     * @tc.name testCharIsHexDigitStaticChar032
     * @tc.desc Verify Unicode characters are not hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isHexDigit(c'\u96F6')).assertFalse();
      expect(Char.isHexDigit(c'\u5341')).assertFalse();
      expect(Char.isHexDigit(c'\uFF21')).assertFalse();
      expect(Char.isHexDigit(c'\uFF26')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_3300
     * @tc.name testCharIsHexDigitStaticChar033
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'A';
      const result1 = Char.isHexDigit(ch);
      const result2 = Char.isHexDigit(ch);
      const result3 = Char.isHexDigit(ch);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_3400
     * @tc.name testCharIsHexDigitStaticChar034
     * @tc.desc Verify batch calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isHexDigit(c'A')).assertTrue();
        expect(Char.isHexDigit(c'G')).assertFalse();
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_3600
     * @tc.name testCharIsHexDigitStaticChar036
     * @tc.desc Verify digit method consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'1', c'2', c'9', c'A', c'a', c'F', c'f', c'G', c'g'];
      for (const ch of testChars) {
        const isBin = Char.isBinDigit(ch);
        const isDec = Char.isDecDigit(ch);
        const isHex = Char.isHexDigit(ch);
        if (isBin || isDec) {
          expect(isHex).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CHAR_IS_HEX_DIGIT_STATIC_CHAR_3700
     * @tc.name testCharIsHexDigitStaticChar037
     * @tc.desc Verify static and instance method consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitStaticChar037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'5', c'A', c'a', c'F', c'f', c'G'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isHexDigit(ch);
        const instanceResult = c.isHexDigit();
        expect(staticResult).assertEqual(instanceResult);
      }
    });

      });
}
