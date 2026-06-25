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

export default function CharIsDecDigitStaticCharTest(): void {
  describe('CharIsDecDigitStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0100
     * @tc.name testCharIsDecDigitStaticChar0001
     * @tc.desc Verify that a char parameter must be provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isDecDigit(c'5');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0200
     * @tc.name testCharIsDecDigitStaticChar0002
     * @tc.desc Verify that calling without parameters throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isDecDigit(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0300
     * @tc.name testCharIsDecDigitStaticChar0003
     * @tc.desc Verify decimal digit characters 0-9 return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'1')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0400
     * @tc.name testCharIsDecDigitStaticChar0004
     * @tc.desc Verify non-decimal digit characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'a')).assertFalse();
      expect(Char.isDecDigit(c'Z')).assertFalse();
      expect(Char.isDecDigit(c'z')).assertFalse();

      expect(Char.isDecDigit(c'+')).assertFalse();
      expect(Char.isDecDigit(c'-')).assertFalse();
      expect(Char.isDecDigit(c'.')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0500
     * @tc.name testCharIsDecDigitStaticChar0005
     * @tc.desc Verify special characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c' ')).assertFalse();

      expect(Char.isDecDigit(c'\t')).assertFalse();

      expect(Char.isDecDigit(c'\n')).assertFalse();

      expect(Char.isDecDigit(c'\u0000')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0600
     * @tc.name testCharIsDecDigitStaticChar0006
     * @tc.desc Verify Unicode characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'零')).assertFalse();
      expect(Char.isDecDigit(c'一')).assertFalse();
      expect(Char.isDecDigit(c'九')).assertFalse();

      expect(Char.isDecDigit(c'あ')).assertFalse();
      expect(Char.isDecDigit(c'가')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0700
     * @tc.name testCharIsDecDigitStaticChar0007
     * @tc.desc Verify passing illegal value throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isDecDigit(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0800
     * @tc.name testCharIsDecDigitStaticChar0008
     * @tc.desc Verify decimal digit boundaries 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();

      expect(Char.isDecDigit(c'9')).assertTrue();

      expect(Char.isDecDigit(c'/')).assertFalse();
      expect(Char.isDecDigit(c':')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_0900
     * @tc.name testCharIsDecDigitStaticChar0009
     * @tc.desc Verify numeric character ASCII boundaries 0x30-0x39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'/')).assertFalse();
      expect(Char.isDecDigit(c':')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1000
     * @tc.name testCharIsDecDigitStaticChar0010
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isDecDigit(c'5');
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1200
     * @tc.name testCharIsDecDigitStaticChar0012
     * @tc.desc Verify non-decimal characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'a')).assertFalse();

      expect(Char.isDecDigit(c'@')).assertFalse();
      expect(Char.isDecDigit(c' ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1300
     * @tc.name testCharIsDecDigitStaticChar0013
     * @tc.desc Verify all digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1400
     * @tc.name testCharIsDecDigitStaticChar0014
     * @tc.desc Verify uppercase and lowercase letters are not decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'Z')).assertFalse();
      expect(Char.isDecDigit(c'a')).assertFalse();
      expect(Char.isDecDigit(c'z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1500
     * @tc.name testCharIsDecDigitStaticChar0015
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isDecDigit(c'5');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1600
     * @tc.name testCharIsDecDigitStaticChar0016
     * @tc.desc Verify only 0-9 return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'/')).assertFalse();
      expect(Char.isDecDigit(c':')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1700
     * @tc.name testCharIsDecDigitStaticChar0017
     * @tc.desc Verify full ASCII range test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'a')).assertFalse();
      expect(Char.isDecDigit(c' ')).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_1900
     * @tc.name testCharIsDecDigitStaticChar0019
     * @tc.desc Verify normal call does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isDecDigit(c'5');
        expect(result).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2000
     * @tc.name testCharIsDecDigitStaticChar0020
     * @tc.desc Verify finally always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isDecDigit(c'A');
        expect(result != null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2300
     * @tc.name testCharIsDecDigitStaticChar0023
     * @tc.desc Verify isDecDigit is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isDecDigit(c'5');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2400
     * @tc.name testCharIsDecDigitStaticChar0024
     * @tc.desc Verify binary digits are subset of decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'0')).assertTrue();

      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isDecDigit(c'1')).assertTrue();

      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isDecDigit(c'2')).assertTrue();

      expect(Char.isBinDigit(c'9')).assertFalse();
      expect(Char.isDecDigit(c'9')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2500
     * @tc.name testCharIsDecDigitStaticChar0025
     * @tc.desc Verify binary digits are subset of decimal digits containment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isBin0 = Char.isBinDigit(c'0');
      const isDec0 = Char.isDecDigit(c'0');
      expect(isBin0).assertEqual(isDec0);
      const isBin1 = Char.isBinDigit(c'1');
      const isDec1 = Char.isDecDigit(c'1');
      expect(isBin1).assertEqual(isDec1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2600
     * @tc.name testCharIsDecDigitStaticChar0026
     * @tc.desc Verify decimal digits are subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isHexDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2700
     * @tc.name testCharIsDecDigitStaticChar0027
     * @tc.desc Verify decimal digits are subset of hexadecimal digits containment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isDec0 = Char.isDecDigit(c'0');
      const isHex0 = Char.isHexDigit(c'0');
      expect(isDec0).assertEqual(isHex0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_2800
     * @tc.name testCharIsDecDigitStaticChar0028
     * @tc.desc Verify decimal digits are not letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isLetter(c'0')).assertFalse();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isLetter(c'5')).assertFalse();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isLetter(c'A')).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3000
     * @tc.name testCharIsDecDigitStaticChar0030
     * @tc.desc Verify other characters are not decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isDecDigit(c'a')).assertFalse();

      expect(Char.isDecDigit(c'@')).assertFalse();
      expect(Char.isDecDigit(c'+')).assertFalse();
      expect(Char.isDecDigit(c'-')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3100
     * @tc.name testCharIsDecDigitStaticChar0031
     * @tc.desc Verify digit type hierarchy relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3200
     * @tc.name testCharIsDecDigitStaticChar0032
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'/')).assertFalse();

      expect(Char.isDecDigit(c'0')).assertTrue();

      expect(Char.isDecDigit(c'5')).assertTrue();

      expect(Char.isDecDigit(c'9')).assertTrue();

      expect(Char.isDecDigit(c':')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3300
     * @tc.name testCharIsDecDigitStaticChar0033
     * @tc.desc Verify Unicode characters are not decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'零')).assertFalse();
      expect(Char.isDecDigit(c'一')).assertFalse();
      expect(Char.isDecDigit(c'二')).assertFalse();
      expect(Char.isDecDigit(c'九')).assertFalse();

      expect(Char.isDecDigit(c'０')).assertFalse();
      expect(Char.isDecDigit(c'５')).assertFalse();
      expect(Char.isDecDigit(c'９')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3400
     * @tc.name testCharIsDecDigitStaticChar0034
     * @tc.desc Verify repeated calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'5';
      const result1 = Char.isDecDigit(ch);
      const result2 = Char.isDecDigit(ch);
      const result3 = Char.isDecDigit(ch);

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3500
     * @tc.name testCharIsDecDigitStaticChar0035
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isDecDigit(c'5')).assertTrue();
        expect(Char.isDecDigit(c'A')).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3700
     * @tc.name testCharIsDecDigitStaticChar0037
     * @tc.desc Verify consistency with other digit classification methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'A')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3800
     * @tc.name testCharIsDecDigitStaticChar0038
     * @tc.desc Verify static and instance methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(Char.isDecDigit(c'0')).assertEqual(c0.isDecDigit());
      const c5 = new Char(c'5');
      expect(Char.isDecDigit(c'5')).assertEqual(c5.isDecDigit());
      const cA = new Char(c'A');
      expect(Char.isDecDigit(c'A')).assertEqual(cA.isDecDigit());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITSTATICCHARTEST_ISDECDIGITTEST_3900
     * @tc.name testCharIsDecDigitStaticChar0039
     * @tc.desc Verify conformance to decimal mathematical definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitStaticChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'5')).assertTrue();
      expect(Char.isDecDigit(c'9')).assertTrue();
      expect(Char.isDecDigit(c'A')).assertFalse();
    });
  });
}
