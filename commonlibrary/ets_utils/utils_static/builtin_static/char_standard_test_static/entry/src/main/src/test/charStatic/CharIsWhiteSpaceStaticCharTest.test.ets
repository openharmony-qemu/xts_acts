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

export default function CharIsWhiteSpaceStaticCharTest(): void {
  describe('CharIsWhiteSpaceStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0100
     * @tc.name testCharIsWhiteSpaceStaticChar0001
     * @tc.desc Verify must pass one char parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isWhiteSpace(c' ');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0200
     * @tc.name testCharIsWhiteSpaceStaticChar0002
     * @tc.desc Verify calling without parameters throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isWhiteSpace(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0300
     * @tc.name testCharIsWhiteSpaceStaticChar0003
     * @tc.desc Verify whitespace characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c' ')).assertTrue();
      expect(Char.isWhiteSpace(c'\t')).assertTrue();
      expect(Char.isWhiteSpace(c'\n')).assertTrue();
      expect(Char.isWhiteSpace(c'\r')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0400
     * @tc.name testCharIsWhiteSpaceStaticChar0004
     * @tc.desc Verify non-whitespace characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'A')).assertFalse();
      expect(Char.isWhiteSpace(c'a')).assertFalse();
      expect(Char.isWhiteSpace(c'0')).assertFalse();
      expect(Char.isWhiteSpace(c'@')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0500
     * @tc.name testCharIsWhiteSpaceStaticChar0005
     * @tc.desc Verify other control characters may not be whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'\v')).assertTrue();
      expect(Char.isWhiteSpace(c'\f')).assertTrue();
      expect(Char.isWhiteSpace(c'\u0000')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0600
     * @tc.name testCharIsWhiteSpaceStaticChar0006
     * @tc.desc Verify passing illegal value throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0006' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isWhiteSpace(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0700
     * @tc.name testCharIsWhiteSpaceStaticChar0007
     * @tc.desc Verify whitespace character boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c' ')).assertTrue();
      expect(Char.isWhiteSpace(c'\t')).assertTrue();
      expect(Char.isWhiteSpace(c'\n')).assertTrue();
      expect(Char.isWhiteSpace(c'\v')).assertTrue();
      expect(Char.isWhiteSpace(c'\f')).assertTrue();
      expect(Char.isWhiteSpace(c'\r')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0800
     * @tc.name testCharIsWhiteSpaceStaticChar0008
     * @tc.desc Verify visible characters are not whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'\u001F')).assertFalse();
      expect(Char.isWhiteSpace(c' ')).assertTrue();
      expect(Char.isWhiteSpace(c'!')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_0900
     * @tc.name testCharIsWhiteSpaceStaticChar0009
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isWhiteSpace(c' ');
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1100
     * @tc.name testCharIsWhiteSpaceStaticChar0011
     * @tc.desc Verify visible characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'A')).assertFalse();
      expect(Char.isWhiteSpace(c'a')).assertFalse();
      expect(Char.isWhiteSpace(c'0')).assertFalse();
      expect(Char.isWhiteSpace(c'9')).assertFalse();
      expect(Char.isWhiteSpace(c'@')).assertFalse();
      expect(Char.isWhiteSpace(c'!')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1200
     * @tc.name testCharIsWhiteSpaceStaticChar0012
     * @tc.desc Verify control characters whitespace check (Note: \\v and \\f are whitespace per this API, unlike Java Character.isWhitespace)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'\t')).assertTrue();
      expect(Char.isWhiteSpace(c'\n')).assertTrue();
      expect(Char.isWhiteSpace(c'\v')).assertTrue();
      expect(Char.isWhiteSpace(c'\f')).assertTrue();
      expect(Char.isWhiteSpace(c'\r')).assertTrue();
      expect(Char.isWhiteSpace(c'\u0000')).assertFalse();
      expect(Char.isWhiteSpace(c'\u0001')).assertFalse();
      expect(Char.isWhiteSpace(c'\u0007')).assertFalse();
      expect(Char.isWhiteSpace(c'\u0008')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1300
     * @tc.name testCharIsWhiteSpaceStaticChar0013
     * @tc.desc Verify NBSP (U+00A0) is whitespace (Note: unlike Java Character.isWhitespace where NBSP is not whitespace)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'\u00A0')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1400
     * @tc.name testCharIsWhiteSpaceStaticChar0014
     * @tc.desc Verify return value type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isWhiteSpace(c' ');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1500
     * @tc.name testCharIsWhiteSpaceStaticChar0015
     * @tc.desc Verify whitespace character judgment accuracy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const whiteSpaceChars = [c' ', c'\t', c'\n', c'\v', c'\f', c'\r'];
      for (const ch of whiteSpaceChars) {
        expect(Char.isWhiteSpace(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1600
     * @tc.name testCharIsWhiteSpaceStaticChar0016
     * @tc.desc Verify ASCII control character range whitespace check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x00; i <= 0x1F; i++) {
        const ch = charFromCode(i);
        if (i >= 0x09 && i <= 0x0D) {
          expect(Char.isWhiteSpace(ch)).assertTrue();
        } else {
          expect(Char.isWhiteSpace(ch)).assertFalse();
        }
      }
      expect(Char.isWhiteSpace(c' ')).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_1900
     * @tc.name testCharIsWhiteSpaceStaticChar0019
     * @tc.desc Verify finally always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isWhiteSpace(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2000
     * @tc.name testCharIsWhiteSpaceStaticChar0020
     * @tc.desc Verify isWhiteSpace is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.isWhiteSpace).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2200
     * @tc.name testCharIsWhiteSpaceStaticChar0022
     * @tc.desc Verify isWhiteSpace is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isWhiteSpace(c' ');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2300
     * @tc.name testCharIsWhiteSpaceStaticChar0023
     * @tc.desc Verify whitespace characters are not letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c' ')).assertTrue();
      expect(Char.isLetter(c' ')).assertFalse();
      expect(Char.isWhiteSpace(c'\t')).assertTrue();
      expect(Char.isLetter(c'\t')).assertFalse();
      expect(Char.isWhiteSpace(c'A')).assertFalse();
      expect(Char.isLetter(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2400
     * @tc.name testCharIsWhiteSpaceStaticChar0024
     * @tc.desc Verify whitespace and letter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 128; i++) {
        const ch = charFromCode(i);
        const isWS = Char.isWhiteSpace(ch);
        const isLetter = Char.isLetter(ch);
        if (isWS) {
          expect(isLetter).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2500
     * @tc.name testCharIsWhiteSpaceStaticChar0025
     * @tc.desc Verify whitespace characters are not digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c' ')).assertTrue();
      expect(Char.isDecDigit(c' ')).assertFalse();
      expect(Char.isWhiteSpace(c'0')).assertFalse();
      expect(Char.isDecDigit(c'0')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2600
     * @tc.name testCharIsWhiteSpaceStaticChar0026
     * @tc.desc Verify static method and instance method return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c' ', c'\t', c'\n', c'A', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isWhiteSpace(ch);
        const instanceResult = c.isWhiteSpace();
        expect(staticResult).assertEqual(instanceResult);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2800
     * @tc.name testCharIsWhiteSpaceStaticChar0028
     * @tc.desc Verify other characters are not whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'A')).assertFalse();
      expect(Char.isWhiteSpace(c'a')).assertFalse();
      expect(Char.isWhiteSpace(c'0')).assertFalse();
      expect(Char.isWhiteSpace(c'@')).assertFalse();
      expect(Char.isWhiteSpace(c'_')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_2900
     * @tc.name testCharIsWhiteSpaceStaticChar0029
     * @tc.desc Verify only some control characters are whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x09; i <= 0x0D; i++) {
        const ch = charFromCode(i);
        expect(Char.isWhiteSpace(ch)).assertTrue();
      }
      const nonWhiteSpaceControl = [c'\u0000', c'\u0001', c'\u0002', c'\u0007', c'\u0008', c'\u000E', c'\u001F'];
      for (const ch of nonWhiteSpaceControl) {
        expect(Char.isWhiteSpace(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_3000
     * @tc.name testCharIsWhiteSpaceStaticChar0030
     * @tc.desc Verify ASCII control character boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isWhiteSpace(c'\u0008')).assertFalse();
      expect(Char.isWhiteSpace(c'\t')).assertTrue();
      expect(Char.isWhiteSpace(c'\r')).assertTrue();
      expect(Char.isWhiteSpace(c'\u000E')).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_3200
     * @tc.name testCharIsWhiteSpaceStaticChar0032
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c' ';
      const result1 = Char.isWhiteSpace(ch);
      const result2 = Char.isWhiteSpace(ch);
      const result3 = Char.isWhiteSpace(ch);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_3300
     * @tc.name testCharIsWhiteSpaceStaticChar0033
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isWhiteSpace(c' ')).assertTrue();
        expect(Char.isWhiteSpace(c'A')).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_3500
     * @tc.name testCharIsWhiteSpaceStaticChar0035
     * @tc.desc Verify whitespace characters are not letters or digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const whiteSpaceChars = [c' ', c'\t', c'\n', c'\r'];
      for (const ch of whiteSpaceChars) {
        const isWS = Char.isWhiteSpace(ch);
        expect(isWS).assertTrue();
        expect(Char.isLetter(ch)).assertFalse();
        expect(Char.isDecDigit(ch)).assertFalse();
        expect(Char.isBinDigit(ch)).assertFalse();
        expect(Char.isHexDigit(ch)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_3600
     * @tc.name testCharIsWhiteSpaceStaticChar0036
     * @tc.desc Verify static and instance methods are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c' ', c'\t', c'\n', c'\r', c'A', c'0'];
      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isWhiteSpace(ch);
        const instanceResult = c.isWhiteSpace();
        expect(staticResult).assertEqual(instanceResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_ISWHITESPACESTATICCHARTEST_3700
     * @tc.name testCharIsWhiteSpaceStaticChar0037
     * @tc.desc Verify conformance to Unicode whitespace definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsWhiteSpaceStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const whiteSpaceChars = [c'\t', c'\n', c'\v', c'\f', c'\r', c' '];
      for (const ch of whiteSpaceChars) {
        expect(Char.isWhiteSpace(ch)).assertTrue();
      }
      expect(Char.isWhiteSpace(c'A')).assertFalse();
      expect(Char.isWhiteSpace(c'0')).assertFalse();
    });
  });
}
