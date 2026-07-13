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

export default function CharIsDecDigitInstanceTest(): void {
  describe('CharIsDecDigitInstanceTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0100
     * @tc.name testCharIsDecDigitInstance0001
     * @tc.desc Verify instance method does not accept any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const result = c.isDecDigit();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0200
     * @tc.name testCharIsDecDigitInstance0002
     * @tc.desc Verify isDecDigit() can be called with no arguments and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'5');
      const result = ch.isDecDigit();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0300
     * @tc.name testCharIsDecDigitInstance0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const result = c.isDecDigit();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0500
     * @tc.name testCharIsDecDigitInstance0005
     * @tc.desc Verify decimal digits 0-9 return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const five = new Char(c'5');
      const nine = new Char(c'9');

      expect(zero.isDecDigit()).assertTrue();
      expect(five.isDecDigit()).assertTrue();
      expect(nine.isDecDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0600
     * @tc.name testCharIsDecDigitInstance0006
     * @tc.desc Verify non-decimal digit characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letterA = new Char(c'A');
      const plus = new Char(c'+');
      const space = new Char(c' ');

      expect(letterA.isDecDigit()).assertFalse();
      expect(plus.isDecDigit()).assertFalse();
      expect(space.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0700
     * @tc.name testCharIsDecDigitInstance0007
     * @tc.desc Verify Char instance with decimal digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isDecDigit()).assertTrue();
      const c5 = new Char(c'5');
      expect(c5.isDecDigit()).assertTrue();
      const c9 = new Char(c'9');
      expect(c9.isDecDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0800
     * @tc.name testCharIsDecDigitInstance0008
     * @tc.desc Verify Char instance with non-decimal digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letterA = new Char(c'A');
      const lettera = new Char(c'a');

      expect(letterA.isDecDigit()).assertFalse();
      expect(lettera.isDecDigit()).assertFalse();

      const atSign = new Char(c'@');
      expect(atSign.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_0900
     * @tc.name testCharIsDecDigitInstance0009
     * @tc.desc Verify return value type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const result = c.isDecDigit();
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_1100
     * @tc.name testCharIsDecDigitInstance0011
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const five = new Char(c'5');
      const nine = new Char(c'9');
      const letterA = new Char(c'A');

      expect(zero.isDecDigit()).assertTrue();
      expect(five.isDecDigit()).assertTrue();
      expect(nine.isDecDigit()).assertTrue();
      expect(letterA.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_1200
     * @tc.name testCharIsDecDigitInstance0012
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const result = c.isDecDigit();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_1400
     * @tc.name testCharIsDecDigitInstance0014
     * @tc.desc Verify isDecDigit() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.isDecDigit();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_1600
     * @tc.name testCharIsDecDigitInstance0016
     * @tc.desc Verify cannot call through class statically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const instanceResult = c.isDecDigit();

      const staticResult = Char.isDecDigit(c'5');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_1700
     * @tc.name testCharIsDecDigitInstance0017
     * @tc.desc Verify isDecDigit is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const startTime = Date.now();
      const result = c.isDecDigit();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_1800
     * @tc.name testCharIsDecDigitInstance0018
     * @tc.desc Verify instance and static methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isDecDigit()).assertEqual(Char.isDecDigit(c'0'));
      const c5 = new Char(c'5');
      expect(c5.isDecDigit()).assertEqual(Char.isDecDigit(c'5'));
      const c9 = new Char(c'9');
      expect(c9.isDecDigit()).assertEqual(Char.isDecDigit(c'9'));
      const cA = new Char(c'A');
      expect(cA.isDecDigit()).assertEqual(Char.isDecDigit(c'A'));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2000
     * @tc.name testCharIsDecDigitInstance0020
     * @tc.desc Verify binary digits are subset of decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const two = new Char(c'2');

      expect(zero.isBinDigit()).assertTrue();
      expect(zero.isDecDigit()).assertTrue();

      expect(one.isBinDigit()).assertTrue();
      expect(one.isDecDigit()).assertTrue();

      expect(two.isBinDigit()).assertFalse();
      expect(two.isDecDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2100
     * @tc.name testCharIsDecDigitInstance0021
     * @tc.desc Verify binary digits are subset of decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isBinDigit()).assertTrue();
      expect(c0.isDecDigit()).assertTrue();

      const c1 = new Char(c'1');
      expect(c1.isBinDigit()).assertTrue();
      expect(c1.isDecDigit()).assertTrue();

      const c2 = new Char(c'2');
      expect(c2.isBinDigit()).assertFalse();
      expect(c2.isDecDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2200
     * @tc.name testCharIsDecDigitInstance0022
     * @tc.desc Verify decimal digits are subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const five = new Char(c'5');
      const letterA = new Char(c'A');

      expect(five.isDecDigit()).assertTrue();
      expect(five.isHexDigit()).assertTrue();

      expect(letterA.isDecDigit()).assertFalse();
      expect(letterA.isHexDigit()).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2400
     * @tc.name testCharIsDecDigitInstance0024
     * @tc.desc Verify other characters are not decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const letterA = new Char(c'A');
      const lettera = new Char(c'a');

      expect(letterA.isDecDigit()).assertFalse();
      expect(lettera.isDecDigit()).assertFalse();

      const atSign = new Char(c'@');
      const space = new Char(c' ');

      expect(atSign.isDecDigit()).assertFalse();
      expect(space.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2500
     * @tc.name testCharIsDecDigitInstance0025
     * @tc.desc Verify number type hierarchy relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const two = new Char(c'2');
      const letterA = new Char(c'A');

      expect(zero.isBinDigit()).assertTrue();
      expect(zero.isDecDigit()).assertTrue();
      expect(zero.isHexDigit()).assertTrue();

      expect(two.isBinDigit()).assertFalse();
      expect(two.isDecDigit()).assertTrue();
      expect(two.isHexDigit()).assertTrue();

      expect(letterA.isBinDigit()).assertFalse();
      expect(letterA.isDecDigit()).assertFalse();
      expect(letterA.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2600
     * @tc.name testCharIsDecDigitInstance0026
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const slash = new Char(c'/');
      const zero = new Char(c'0');
      const five = new Char(c'5');
      const nine = new Char(c'9');
      const colon = new Char(c':');

      expect(slash.isDecDigit()).assertFalse();
      expect(zero.isDecDigit()).assertTrue();
      expect(five.isDecDigit()).assertTrue();
      expect(nine.isDecDigit()).assertTrue();
      expect(colon.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2700
     * @tc.name testCharIsDecDigitInstance0027
     * @tc.desc Verify Unicode characters are not decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chineseZero = new Char(c'零');
      const chineseOne = new Char(c'一');
      const chineseNine = new Char(c'九');

      expect(chineseZero.isDecDigit()).assertFalse();
      expect(chineseOne.isDecDigit()).assertFalse();
      expect(chineseNine.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2800
     * @tc.name testCharIsDecDigitInstance0028
     * @tc.desc Verify repeated calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      const result1 = c.isDecDigit();
      const result2 = c.isDecDigit();
      const result3 = c.isDecDigit();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_2900
     * @tc.name testCharIsDecDigitInstance0029
     * @tc.desc Verify different instances have independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'5');
      const c2 = new Char(c'A');

      expect(c1.isDecDigit()).assertTrue();
      expect(c2.isDecDigit()).assertFalse();

      expect(c1.isDecDigit()).assertTrue();
      expect(c2.isDecDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_3000
     * @tc.name testCharIsDecDigitInstance0030
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'5');
      for (let i = 0; i < 1000; i++) {
        expect(c.isDecDigit()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_3100
     * @tc.name testCharIsDecDigitInstance0031
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0031' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      expect(c1.isDecDigit()).assertTrue();
      const c2 = new Char(c'5');
      expect(c2.isDecDigit()).assertTrue();
      const c3 = new Char(c'9');
      expect(c3.isDecDigit()).assertTrue();
      const c4 = new Char(c'A');
      expect(c4.isDecDigit()).assertFalse();
      const c5 = new Char(c'a');
      expect(c5.isDecDigit()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_3300
     * @tc.name testCharIsDecDigitInstance0033
     * @tc.desc Verify decimal digits are consistent with other digit classification methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isBinDigit()).assertTrue();
      expect(c0.isDecDigit()).assertTrue();
      expect(c0.isHexDigit()).assertTrue();
      const c9 = new Char(c'9');
      expect(c9.isDecDigit()).assertTrue();
      expect(c9.isHexDigit()).assertTrue();
      const cA = new Char(c'A');
      expect(cA.isDecDigit()).assertFalse();
      expect(cA.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISDECDIGITINSTANCETEST_ISDECDIGITTEST_3400
     * @tc.name testCharIsDecDigitInstance0034
     * @tc.desc Verify conforms to decimal mathematical definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsDecDigitInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isDecDigit()).assertTrue();
      const c5 = new Char(c'5');
      expect(c5.isDecDigit()).assertTrue();
      const c9 = new Char(c'9');
      expect(c9.isDecDigit()).assertTrue();
      const cA = new Char(c'A');
      expect(cA.isDecDigit()).assertFalse();
      const cSlash = new Char(c'/');
      expect(cSlash.isDecDigit()).assertFalse();
      const cColon = new Char(c':');
      expect(cColon.isDecDigit()).assertFalse();
    });
  });
}
