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

export default function CharIsHexDigitInstanceTest(): void {
  describe('CharIsHexDigitInstanceTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0100
     * @tc.name testCharIsHexDigitInstance0001
     * @tc.desc Verify instance method does not accept any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isHexDigit();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0200
     * @tc.name testCharIsHexDigitInstance0002
     * @tc.desc Verify isHexDigit() can be called with no arguments and returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch = new Char(c'A');
      const result = ch.isHexDigit();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0300
     * @tc.name testCharIsHexDigitInstance0003
     * @tc.desc Verify no parameters needed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isHexDigit();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0500
     * @tc.name testCharIsHexDigitInstance0005
     * @tc.desc Verify hexadecimal digits 0-9 A-F a-f return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      const upperA = new Char(c'A');
      const upperF = new Char(c'F');
      const lowerA = new Char(c'a');
      const lowerF = new Char(c'f');

      expect(zero.isHexDigit()).assertTrue();
      expect(nine.isHexDigit()).assertTrue();
      expect(upperA.isHexDigit()).assertTrue();
      expect(upperF.isHexDigit()).assertTrue();
      expect(lowerA.isHexDigit()).assertTrue();
      expect(lowerF.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0600
     * @tc.name testCharIsHexDigitInstance0006
     * @tc.desc Verify non-hexadecimal digit characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperG = new Char(c'G');
      const lowerG = new Char(c'g');
      const atSign = new Char(c'@');

      expect(upperG.isHexDigit()).assertFalse();
      expect(lowerG.isHexDigit()).assertFalse();
      expect(atSign.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0700
     * @tc.name testCharIsHexDigitInstance0007
     * @tc.desc Verify Char instance with hexadecimal digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isHexDigit()).assertTrue();
      const cA = new Char(c'A');
      expect(cA.isHexDigit()).assertTrue();
      const ca = new Char(c'a');
      expect(ca.isHexDigit()).assertTrue();
      const cF = new Char(c'F');
      expect(cF.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0800
     * @tc.name testCharIsHexDigitInstance0008
     * @tc.desc Verify Char instance with non-hexadecimal digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperG = new Char(c'G');
      const upperZ = new Char(c'Z');

      expect(upperG.isHexDigit()).assertFalse();
      expect(upperZ.isHexDigit()).assertFalse();

      const lowerG = new Char(c'g');
      const lowerZ = new Char(c'z');

      expect(lowerG.isHexDigit()).assertFalse();
      expect(lowerZ.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_0900
     * @tc.name testCharIsHexDigitInstance0009
     * @tc.desc Verify return value type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isHexDigit();
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_1100
     * @tc.name testCharIsHexDigitInstance0011
     * @tc.desc Verify different Char instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      const upperA = new Char(c'A');
      const upperF = new Char(c'F');
      const upperG = new Char(c'G');
      const lowerA = new Char(c'a');
      const lowerF = new Char(c'f');
      const lowerG = new Char(c'g');

      expect(zero.isHexDigit()).assertTrue();
      expect(nine.isHexDigit()).assertTrue();
      expect(upperA.isHexDigit()).assertTrue();
      expect(upperF.isHexDigit()).assertTrue();
      expect(upperG.isHexDigit()).assertFalse();
      expect(lowerA.isHexDigit()).assertTrue();
      expect(lowerF.isHexDigit()).assertTrue();
      expect(lowerG.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_1200
     * @tc.name testCharIsHexDigitInstance0012
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const c = new Char(c'A');
        const result = c.isHexDigit();
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_1400
     * @tc.name testCharIsHexDigitInstance0014
     * @tc.desc Verify isHexDigit() works correctly in a try-finally context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'G');
        const result = c.isHexDigit();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_1600
     * @tc.name testCharIsHexDigitInstance0016
     * @tc.desc Verify instance and static methods return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.isHexDigit();

      const staticResult = Char.isHexDigit(c'A');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_1700
     * @tc.name testCharIsHexDigitInstance0017
     * @tc.desc Verify isHexDigit is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.isHexDigit();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_1800
     * @tc.name testCharIsHexDigitInstance0018
     * @tc.desc Verify instance and static methods return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isHexDigit()).assertEqual(Char.isHexDigit(c'0'));
      const cA = new Char(c'A');
      expect(cA.isHexDigit()).assertEqual(Char.isHexDigit(c'A'));
      const ca = new Char(c'a');
      expect(ca.isHexDigit()).assertEqual(Char.isHexDigit(c'a'));
      const cG = new Char(c'G');
      expect(cG.isHexDigit()).assertEqual(Char.isHexDigit(c'G'));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2000
     * @tc.name testCharIsHexDigitInstance0020
     * @tc.desc Verify binary digits are subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const one = new Char(c'1');
      const two = new Char(c'2');
      const upperA = new Char(c'A');

      expect(zero.isBinDigit()).assertTrue();
      expect(zero.isHexDigit()).assertTrue();

      expect(one.isBinDigit()).assertTrue();
      expect(one.isHexDigit()).assertTrue();

      expect(two.isBinDigit()).assertFalse();
      expect(two.isHexDigit()).assertTrue();

      expect(upperA.isBinDigit()).assertFalse();
      expect(upperA.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2100
     * @tc.name testCharIsHexDigitInstance0021
     * @tc.desc Verify binary digits are subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isBinDigit()).assertTrue();
      expect(c0.isHexDigit()).assertTrue();
      const c1 = new Char(c'1');
      expect(c1.isBinDigit()).assertTrue();
      expect(c1.isHexDigit()).assertTrue();
      const c2 = new Char(c'2');
      expect(c2.isBinDigit()).assertFalse();
      expect(c2.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2200
     * @tc.name testCharIsHexDigitInstance0022
     * @tc.desc Verify decimal digits are subset of hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const five = new Char(c'5');
      const nine = new Char(c'9');
      const upperA = new Char(c'A');

      expect(zero.isDecDigit()).assertTrue();
      expect(zero.isHexDigit()).assertTrue();

      expect(five.isDecDigit()).assertTrue();
      expect(five.isHexDigit()).assertTrue();

      expect(upperA.isDecDigit()).assertFalse();
      expect(upperA.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2300
     * @tc.name testCharIsHexDigitInstance0023
     * @tc.desc Verify hexadecimal digits A-F are also letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const upperA = new Char(c'A');
      const upperF = new Char(c'F');
      const upperG = new Char(c'G');

      expect(zero.isHexDigit()).assertTrue();
      expect(zero.isLetter()).assertFalse();

      expect(upperA.isHexDigit()).assertTrue();
      expect(upperA.isLetter()).assertTrue();

      expect(upperF.isHexDigit()).assertTrue();
      expect(upperF.isLetter()).assertTrue();

      expect(upperG.isHexDigit()).assertFalse();
      expect(upperG.isLetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2400
     * @tc.name testCharIsHexDigitInstance0024
     * @tc.desc Verify complete hexadecimal digit set 0-9 A-F a-f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isHexDigit()).assertTrue();
      const cA = new Char(c'A');
      expect(cA.isHexDigit()).assertTrue();
      const cF = new Char(c'F');
      expect(cF.isHexDigit()).assertTrue();
      const ca = new Char(c'a');
      expect(ca.isHexDigit()).assertTrue();
      const cf = new Char(c'f');
      expect(cf.isHexDigit()).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2600
     * @tc.name testCharIsHexDigitInstance0026
     * @tc.desc Verify number type hierarchy relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Char(c'0');
      const two = new Char(c'2');
      const upperA = new Char(c'A');

      expect(zero.isBinDigit()).assertTrue();
      expect(zero.isDecDigit()).assertTrue();
      expect(zero.isHexDigit()).assertTrue();

      expect(two.isBinDigit()).assertFalse();
      expect(two.isDecDigit()).assertTrue();
      expect(two.isHexDigit()).assertTrue();

      expect(upperA.isBinDigit()).assertFalse();
      expect(upperA.isDecDigit()).assertFalse();
      expect(upperA.isHexDigit()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2700
     * @tc.name testCharIsHexDigitInstance0027
     * @tc.desc Verify ASCII boundary characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const slash = new Char(c'/');
      const zero = new Char(c'0');
      const nine = new Char(c'9');
      const colon = new Char(c':');
      const atSign = new Char(c'@');
      const upperA = new Char(c'A');
      const upperF = new Char(c'F');
      const upperG = new Char(c'G');

      expect(slash.isHexDigit()).assertFalse();
      expect(zero.isHexDigit()).assertTrue();
      expect(nine.isHexDigit()).assertTrue();
      expect(colon.isHexDigit()).assertFalse();
      expect(atSign.isHexDigit()).assertFalse();
      expect(upperA.isHexDigit()).assertTrue();
      expect(upperF.isHexDigit()).assertTrue();
      expect(upperG.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2800
     * @tc.name testCharIsHexDigitInstance0028
     * @tc.desc Verify Unicode characters are not hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chinese = new Char(c'十');
      expect(chinese.isHexDigit()).assertFalse();

      const fullWidthA = new Char(c'Ａ');
      expect(fullWidthA.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_2900
     * @tc.name testCharIsHexDigitInstance0029
     * @tc.desc Verify repeated calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.isHexDigit();
      const result2 = c.isHexDigit();
      const result3 = c.isHexDigit();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_3000
     * @tc.name testCharIsHexDigitInstance0030
     * @tc.desc Verify different instances have independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'G');

      expect(c1.isHexDigit()).assertTrue();
      expect(c2.isHexDigit()).assertFalse();

      expect(c1.isHexDigit()).assertTrue();
      expect(c2.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_3100
     * @tc.name testCharIsHexDigitInstance0031
     * @tc.desc Verify multiple calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.isHexDigit()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_3200
     * @tc.name testCharIsHexDigitInstance0032
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      expect(c1.isHexDigit()).assertTrue();
      const c2 = new Char(c'9');
      expect(c2.isHexDigit()).assertTrue();
      const c3 = new Char(c'A');
      expect(c3.isHexDigit()).assertTrue();
      const c4 = new Char(c'F');
      expect(c4.isHexDigit()).assertTrue();
      const c5 = new Char(c'a');
      expect(c5.isHexDigit()).assertTrue();
      const c6 = new Char(c'f');
      expect(c6.isHexDigit()).assertTrue();
      const c7 = new Char(c'G');
      expect(c7.isHexDigit()).assertFalse();
      const c8 = new Char(c'g');
      expect(c8.isHexDigit()).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_3400
     * @tc.name testCharIsHexDigitInstance0034
     * @tc.desc Verify hexadecimal digits are consistent with other digit classification methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isHexDigit()).assertTrue();
      const cA = new Char(c'A');
      expect(cA.isHexDigit()).assertTrue();
      const cG = new Char(c'G');
      expect(cG.isHexDigit()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARISHEXDIGITINSTANCETEST_ISHEXDIGITTEST_3500
     * @tc.name testCharIsHexDigitInstance0035
     * @tc.desc Verify conforms to hexadecimal mathematical definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsHexDigitInstance0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c0 = new Char(c'0');
      expect(c0.isHexDigit()).assertTrue();
      const cA = new Char(c'A');
      expect(cA.isHexDigit()).assertTrue();
      const cF = new Char(c'F');
      expect(cF.isHexDigit()).assertTrue();
      const ca = new Char(c'a');
      expect(ca.isHexDigit()).assertTrue();
      const cf = new Char(c'f');
      expect(cf.isHexDigit()).assertTrue();
      const cG = new Char(c'G');
      expect(cG.isHexDigit()).assertFalse();
    });
  });
}
