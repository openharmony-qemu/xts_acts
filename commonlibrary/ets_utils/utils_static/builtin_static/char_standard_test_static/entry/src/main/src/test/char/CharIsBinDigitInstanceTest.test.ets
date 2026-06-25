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

export default function CharIsBinDigitInstanceTest(): void {
  describe('CharIsBinDigitInstanceTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0100
     * @tc.name testCharIsBinDigitInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      const result = c.isBinDigit();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0200
     * @tc.name testCharIsBinDigitInstance0002
     * @tc.desc Verify isBinDigit() can be called with no arguments and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'1');
      const result = ch.isBinDigit();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0300
     * @tc.name testCharIsBinDigitInstance0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'0');
      const result = c.isBinDigit();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0400
     * @tc.name testCharIsBinDigitInstance0004
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      const result = c.isBinDigit();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0500
     * @tc.name testCharIsBinDigitInstance0005
     * @tc.desc Verify binary digits 0 and 1 return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');

      expect(zero.isBinDigit()).assertTrue();
      expect(one.isBinDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0600
     * @tc.name testCharIsBinDigitInstance0006
     * @tc.desc Verify non-binary characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const two = new Char(c'2');
      const nine = new Char(c'9');
      const letterA = new Char(c'A');

      expect(two.isBinDigit()).assertFalse();
      expect(nine.isBinDigit()).assertFalse();
      expect(letterA.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0700
     * @tc.name testCharIsBinDigitInstance0007
     * @tc.desc Verify Char instance with binary digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryDigits = [c'0', c'1'];
      for (const ch of binaryDigits) {
        const c = new Char(ch);
        expect(c.isBinDigit()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0800
     * @tc.name testCharIsBinDigitInstance0008
     * @tc.desc Verify Char instance with non-binary digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nonBinDigits: Char[] = [c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9'];
      for (const ch of nonBinDigits) {
        const c = new Char(ch);
        expect(c.isBinDigit()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_0900
     * @tc.name testCharIsBinDigitInstance0009
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      const result = c.isBinDigit();
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_1100
     * @tc.name testCharIsBinDigitInstance0011
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const two = new Char(c'2');
      const letterA = new Char(c'A');

      expect(zero.isBinDigit()).assertTrue();
      expect(one.isBinDigit()).assertTrue();
      expect(two.isBinDigit()).assertFalse();
      expect(letterA.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_1200
     * @tc.name testCharIsBinDigitInstance0012
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const c = new Char(c'1');
        const result = c.isBinDigit();
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_1600
     * @tc.name testCharIsBinDigitInstance0016
     * @tc.desc Verify instance isBinDigit() returns the same result as the static Char.isBinDigit()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      const instanceResult = c.isBinDigit();

      const staticResult = Char.isBinDigit(c'1');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_1700
     * @tc.name testCharIsBinDigitInstance0017
     * @tc.desc Verify isBinDigit is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      const startTime = Date.now();
      const result = c.isBinDigit();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_1800
     * @tc.name testCharIsBinDigitInstance0018
     * @tc.desc Verify instance method and static method return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'1', c'2', c'A'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.isBinDigit();
        const staticResult = Char.isBinDigit(ch);

        expect(instanceResult).assertEqual(staticResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2000
     * @tc.name testCharIsBinDigitInstance0020
     * @tc.desc Verify binary digits are subset of decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const two = new Char(c'2');

      expect(zero.isBinDigit()).assertTrue();
      expect(one.isBinDigit()).assertTrue();
      expect(two.isBinDigit()).assertFalse();

      expect(zero.isDecDigit()).assertTrue();
      expect(one.isDecDigit()).assertTrue();
      expect(two.isDecDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2100
     * @tc.name testCharIsBinDigitInstance0021
     * @tc.desc Verify binary digits are subset of decimal digits with inclusion relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'1', c'2', c'9'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const isBin = c.isBinDigit();
        const isDec = c.isDecDigit();

        if (isBin) {
          expect(isDec).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2200
     * @tc.name testCharIsBinDigitInstance0022
     * @tc.desc Verify binary digits are subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const letterA = new Char(c'A');

      expect(zero.isBinDigit()).assertTrue();
      expect(one.isBinDigit()).assertTrue();
      expect(letterA.isBinDigit()).assertFalse();

      expect(zero.isHexDigit()).assertTrue();
      expect(one.isHexDigit()).assertTrue();
      expect(letterA.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2300
     * @tc.name testCharIsBinDigitInstance0023
     * @tc.desc Verify only 0 and 1 are binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const validBinDigits = [c'0', c'1'];
      for (const ch of validBinDigits) {
        const c = new Char(ch);
        expect(c.isBinDigit()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2400
     * @tc.name testCharIsBinDigitInstance0024
     * @tc.desc Verify other characters are not binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nonBinDigits: Char[] = [c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9'];
      for (const ch of nonBinDigits) {
        const c = new Char(ch);
        expect(c.isBinDigit()).assertFalse();
      }

      const letterA = new Char(c'A');
      expect(letterA.isBinDigit()).assertFalse();

      const lettera = new Char(c'a');
      expect(lettera.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2500
     * @tc.name testCharIsBinDigitInstance0025
     * @tc.desc Verify relationship between digit types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const two = new Char(c'2');

      expect(zero.isBinDigit()).assertTrue();
      expect(zero.isDecDigit()).assertTrue();
      expect(zero.isHexDigit()).assertTrue();

      expect(one.isBinDigit()).assertTrue();
      expect(one.isDecDigit()).assertTrue();
      expect(one.isHexDigit()).assertTrue();

      expect(two.isBinDigit()).assertFalse();
      expect(two.isDecDigit()).assertTrue();
      expect(two.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2600
     * @tc.name testCharIsBinDigitInstance0026
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const slash = new Char(c'/');
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const two = new Char(c'2');
      const colon = new Char(c':');

      expect(slash.isBinDigit()).assertFalse();
      expect(zero.isBinDigit()).assertTrue();
      expect(one.isBinDigit()).assertTrue();
      expect(two.isBinDigit()).assertFalse();
      expect(colon.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2700
     * @tc.name testCharIsBinDigitInstance0027
     * @tc.desc Verify Unicode characters are not binary digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chineseZero = new Char(c'\u96F6');
      const chineseOne = new Char(c'\u4E00');
      const chineseTwo = new Char(c'\u4E8C');

      expect(chineseZero.isBinDigit()).assertFalse();
      expect(chineseOne.isBinDigit()).assertFalse();
      expect(chineseTwo.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2800
     * @tc.name testCharIsBinDigitInstance0028
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      const result1 = c.isBinDigit();
      const result2 = c.isBinDigit();
      const result3 = c.isBinDigit();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_2900
     * @tc.name testCharIsBinDigitInstance0029
     * @tc.desc Verify different instances have independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'1');
      const c2 = new Char(c'2');

      expect(c1.isBinDigit()).assertTrue();
      expect(c2.isBinDigit()).assertFalse();

      expect(c1.isBinDigit()).assertTrue();
      expect(c2.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_3000
     * @tc.name testCharIsBinDigitInstance0030
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'1');
      for (let i = 0; i < 1000; i++) {
        expect(c.isBinDigit()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_3100
     * @tc.name testCharIsBinDigitInstance0031
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0031' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      expect(c1.isBinDigit()).assertTrue();
      const c2 = new Char(c'1');
      expect(c2.isBinDigit()).assertTrue();
      const c3 = new Char(c'2');
      expect(c3.isBinDigit()).assertFalse();
      const c4 = new Char(c'9');
      expect(c4.isBinDigit()).assertFalse();
      const c5 = new Char(c'A');
      expect(c5.isBinDigit()).assertFalse();
      const c6 = new Char(c'a');
      expect(c6.isBinDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_3200
     * @tc.name testCharIsBinDigitInstance0032
     * @tc.desc Verify instance and static methods return consistent results for same characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'1', c'2', c'A', c'a', c'F', c'f'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const instanceResult = c.isBinDigit();
        const staticResult = Char.isBinDigit(ch);

        expect(instanceResult).assertEqual(staticResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_3300
     * @tc.name testCharIsBinDigitInstance0033
     * @tc.desc Verify binary digit classification is consistent with other digit methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars = [c'0', c'1', c'2', c'9', c'A', c'a'];

      for (const ch of testChars) {
        const c = new Char(ch);
        const isBin = c.isBinDigit();
        const isDec = c.isDecDigit();
        const isHex = c.isHexDigit();

        if (isBin) {
          expect(isDec).assertTrue();
          expect(isHex).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISBINDIGITINSTANCETEST_ISBINDIGITTEST_3400
     * @tc.name testCharIsBinDigitInstance0034
     * @tc.desc Verify conforms to binary mathematical definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsBinDigitInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isBinDigit()).assertTrue();
      const c1 = new Char(c'1');
      expect(c1.isBinDigit()).assertTrue();
      const c2 = new Char(c'2');
      expect(c2.isBinDigit()).assertFalse();
      const cA = new Char(c'A');
      expect(cA.isBinDigit()).assertFalse();
    });
  });
}
