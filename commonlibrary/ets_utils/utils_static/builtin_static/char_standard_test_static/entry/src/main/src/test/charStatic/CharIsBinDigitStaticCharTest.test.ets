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

export default function CharIsBinDigitStaticCharTest(): void {
  describe('CharIsBinDigitStaticCharTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0100
     * @tc.name testCharIsBinDigitStaticChar0001
     * @tc.desc Verify that one char parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isBinDigit(c'1');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0200
     * @tc.name testCharIsBinDigitStaticChar0002
     * @tc.desc Verify that no parameter passed should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isBinDigit(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0300
     * @tc.name testCharIsBinDigitStaticChar0003
     * @tc.desc Verify that binary digit characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();

      expect(Char.isBinDigit(c'1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0400
     * @tc.name testCharIsBinDigitStaticChar0004
     * @tc.desc Verify that non binary digit characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'9')).assertFalse();

      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c'a')).assertFalse();

      expect(Char.isBinDigit(c'+')).assertFalse();
      expect(Char.isBinDigit(c'-')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0500
     * @tc.name testCharIsBinDigitStaticChar0005
     * @tc.desc Verify that special characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c' ')).assertFalse();

      expect(Char.isBinDigit(c'\t')).assertFalse();

      expect(Char.isBinDigit(c'\n')).assertFalse();

      expect(Char.isBinDigit(c'\u0000')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0600
     * @tc.name testCharIsBinDigitStaticChar0006
     * @tc.desc Verify that Unicode characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'零')).assertFalse();
      expect(Char.isBinDigit(c'一')).assertFalse();

      expect(Char.isBinDigit(c'あ')).assertFalse();
      expect(Char.isBinDigit(c'가')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0700
     * @tc.name testCharIsBinDigitStaticChar0007
     * @tc.desc Verify that passing illegal value should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.isBinDigit(null as Char);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0800
     * @tc.name testCharIsBinDigitStaticChar0008
     * @tc.desc Verify that binary digits are only 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();

      expect(Char.isBinDigit(c'1')).assertTrue();

      expect(Char.isBinDigit(c'/')).assertFalse();
      expect(Char.isBinDigit(c'2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_0900
     * @tc.name testCharIsBinDigitStaticChar0009
     * @tc.desc Verify digit character ASCII boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'3')).assertFalse();
      expect(Char.isBinDigit(c'8')).assertFalse();
      expect(Char.isBinDigit(c'9')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1000
     * @tc.name testCharIsBinDigitStaticChar0010
     * @tc.desc Verify that return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isBinDigit(c'1');
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1200
     * @tc.name testCharIsBinDigitStaticChar0012
     * @tc.desc Verify that other characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'5')).assertFalse();
      expect(Char.isBinDigit(c'9')).assertFalse();

      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c'z')).assertFalse();

      expect(Char.isBinDigit(c'@')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1300
     * @tc.name testCharIsBinDigitStaticChar0013
     * @tc.desc Verify all digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'5')).assertFalse();
      expect(Char.isBinDigit(c'9')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1400
     * @tc.name testCharIsBinDigitStaticChar0014
     * @tc.desc Verify that uppercase and lowercase letters are not binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c'B')).assertFalse();

      expect(Char.isBinDigit(c'a')).assertFalse();
      expect(Char.isBinDigit(c'b')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1500
     * @tc.name testCharIsBinDigitStaticChar0015
     * @tc.desc Verify that return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.isBinDigit(c'1');
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1600
     * @tc.name testCharIsBinDigitStaticChar0016
     * @tc.desc Verify that only 0 and 1 return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c'/')).assertFalse();
      expect(Char.isBinDigit(c':')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_1700
     * @tc.name testCharIsBinDigitStaticChar0017
     * @tc.desc Verify complete ASCII range test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c'a')).assertFalse();
      expect(Char.isBinDigit(c' ')).assertFalse();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2000
     * @tc.name testCharIsBinDigitStaticChar0020
     * @tc.desc Verify that finally always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.isBinDigit(c'A');
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2100
     * @tc.name testCharIsBinDigitStaticChar0021
     * @tc.desc Verify that isBinDigit is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.isBinDigit).assertEqual("function");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2300
     * @tc.name testCharIsBinDigitStaticChar0023
     * @tc.desc Verify that isBinDigit is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.isBinDigit(c'1');
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2400
     * @tc.name testCharIsBinDigitStaticChar0024
     * @tc.desc Verify that binary digits are a subset of decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();

      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'1')).assertTrue();
      expect(Char.isDecDigit(c'2')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2500
     * @tc.name testCharIsBinDigitStaticChar0025
     * @tc.desc Verify that binary digits are a subset of decimal digits by inclusion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isBin0 = Char.isBinDigit(c'0');
      const isDec0 = Char.isDecDigit(c'0');
      expect(isBin0).assertEqual(isDec0);
      const isBin1 = Char.isBinDigit(c'1');
      const isDec1 = Char.isDecDigit(c'1');
      expect(isBin1).assertEqual(isDec1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2600
     * @tc.name testCharIsBinDigitStaticChar0026
     * @tc.desc Verify that binary digits are a subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();

      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'1')).assertTrue();

      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isBinDigit(c'A')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2700
     * @tc.name testCharIsBinDigitStaticChar0027
     * @tc.desc Verify that binary digits are a subset of hexadecimal digits by inclusion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isBin0 = Char.isBinDigit(c'0');
      const isHex0 = Char.isHexDigit(c'0');
      expect(isBin0).assertEqual(isHex0);
      const isBin1 = Char.isBinDigit(c'1');
      const isHex1 = Char.isHexDigit(c'1');
      expect(isBin1).assertEqual(isHex1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2800
     * @tc.name testCharIsBinDigitStaticChar0028
     * @tc.desc Verify that binary digits are not letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isLetter(c'0')).assertFalse();

      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isLetter(c'1')).assertFalse();

      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isLetter(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_2900
     * @tc.name testCharIsBinDigitStaticChar0029
     * @tc.desc Verify that only 0 and 1 are binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validBinDigits = [c'0', c'1'];
      for (const ch of validBinDigits) {
        expect(Char.isBinDigit(ch)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3000
     * @tc.name testCharIsBinDigitStaticChar0030
     * @tc.desc Verify that other characters are not binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'5')).assertFalse();
      expect(Char.isBinDigit(c'9')).assertFalse();
      expect(Char.isBinDigit(c'A')).assertFalse();
      expect(Char.isBinDigit(c'a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3100
     * @tc.name testCharIsBinDigitStaticChar0031
     * @tc.desc Verify the relationship between digit types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isDecDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'0')).assertTrue();

      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isDecDigit(c'1')).assertTrue();
      expect(Char.isHexDigit(c'1')).assertTrue();

      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isDecDigit(c'2')).assertTrue();
      expect(Char.isHexDigit(c'2')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3200
     * @tc.name testCharIsBinDigitStaticChar0032
     * @tc.desc Verify ASCII boundary character test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'/')).assertFalse();

      expect(Char.isBinDigit(c'0')).assertTrue();

      expect(Char.isBinDigit(c'1')).assertTrue();

      expect(Char.isBinDigit(c'2')).assertFalse();

      expect(Char.isBinDigit(c':')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3300
     * @tc.name testCharIsBinDigitStaticChar0033
     * @tc.desc Verify that Unicode characters are not binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'零')).assertFalse();
      expect(Char.isBinDigit(c'一')).assertFalse();
      expect(Char.isBinDigit(c'二')).assertFalse();

      expect(Char.isBinDigit(c'０')).assertFalse();
      expect(Char.isBinDigit(c'１')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3400
     * @tc.name testCharIsBinDigitStaticChar0034
     * @tc.desc Verify that repeated calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = c'1';
      const result1 = Char.isBinDigit(ch);
      const result2 = Char.isBinDigit(ch);
      const result3 = Char.isBinDigit(ch);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3500
     * @tc.name testCharIsBinDigitStaticChar0035
     * @tc.desc Verify that multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        expect(Char.isBinDigit(c'1')).assertTrue();
        expect(Char.isBinDigit(c'2')).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3800
     * @tc.name testCharIsBinDigitStaticChar0038
     * @tc.desc Verify that static method and instance method produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'1', c'2', c'A', c'a'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const staticResult = Char.isBinDigit(ch);
        const instanceResult = c.isBinDigit();

        expect(staticResult).assertEqual(instanceResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITSTATICCHARTEST_ISBINDIGITTEST_3900
     * @tc.name testCharIsBinDigitStaticChar0039
     * @tc.desc Verify that results conform to binary mathematical definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitStaticChar0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      expect(Char.isBinDigit(c'1')).assertTrue();
      expect(Char.isBinDigit(c'2')).assertFalse();
      expect(Char.isBinDigit(c'A')).assertFalse();
    });
  });
}
