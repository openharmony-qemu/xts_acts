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

export default function CharIsInBasicMultilingualPlaneInstanceTest(): void {
  describe('CharIsInBasicMultilingualPlaneInstanceTest' as string, () => {
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
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0100
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0001
     * @tc.desc Verify instance method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isInBasicMultilingualPlane();
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0300
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0003
     * @tc.desc Verify no parameters needed for instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isInBasicMultilingualPlane();
      expect(typeof result).assertEqual("boolean");
    });


    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0500
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0005
     * @tc.desc Verify BMP characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const upperA = new Char(c'A');
      expect(upperA.isInBasicMultilingualPlane()).assertTrue();

      const lowerZ = new Char(c'z');
      expect(lowerZ.isInBasicMultilingualPlane()).assertTrue();

      const digit9 = new Char(c'9');
      expect(digit9.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0600
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0006
     * @tc.desc Verify Unicode BMP characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chinese = new Char(c'\u4E2D');
      expect(chinese.isInBasicMultilingualPlane()).assertTrue();

      const japanese = new Char(c'\u3042');
      expect(japanese.isInBasicMultilingualPlane()).assertTrue();

      const korean = new Char(c'\uAC00');
      expect(korean.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0700
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0007
     * @tc.desc Verify surrogate characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogate.isInBasicMultilingualPlane()).assertFalse();

      const lowSurrogate = new Char(Char.LOW_SURROGATE_MIN);
      expect(lowSurrogate.isInBasicMultilingualPlane()).assertFalse();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0800
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0008
     * @tc.desc Verify null character is in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullChar = new Char(c'\u0000');
      expect(nullChar.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_0900
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0009
     * @tc.desc Verify control characters are in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const newline = new Char(c'\n');
      expect(newline.isInBasicMultilingualPlane()).assertTrue();

      const tab = new Char(c'\t');
      expect(tab.isInBasicMultilingualPlane()).assertTrue();

      const carriage = new Char(c'\r');
      expect(carriage.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_1000
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0010
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isInBasicMultilingualPlane();
      expect(typeof result).assertEqual("boolean");
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_1100
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0011
     * @tc.desc Verify instance method boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minChar = new Char(Char.MIN_VALUE);
      expect(minChar.isInBasicMultilingualPlane()).assertTrue();

      const maxChar = new Char(Char.MAX_VALUE);
      expect(maxChar.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_1200
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0012
     * @tc.desc Verify normal call does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.isInBasicMultilingualPlane();
      expect(result !== null).assertTrue();
    });


    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_1400
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0014
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const result = c.isInBasicMultilingualPlane();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_1600
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0016
     * @tc.desc Verify static call produces same result as instance call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const instanceResult = c.isInBasicMultilingualPlane();

      const staticResult = Char.isInBasicMultilingualPlane(c'A');

      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_1700
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0017
     * @tc.desc Verify isInBasicMultilingualPlane is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const result = c.isInBasicMultilingualPlane();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertTrue();
    });



    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2000
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0020
     * @tc.desc Verify surrogate character judgment consistency with isHighSurrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogate.isInBasicMultilingualPlane()).assertFalse();
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2100
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0021
     * @tc.desc Verify surrogate judgment consistency with isPartOfSurrogatePair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogate.isInBasicMultilingualPlane()).assertFalse();
      expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN)).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2200
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0022
     * @tc.desc Verify complete ASCII table characters in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asciiChars: Char[] = [
        c' ', c'!', c'"', c'#', c'$', c'%', c'&', c'\'', c'(', c')',
      c'*', c'+', c',', c'-', c'.', c'/',
      c'0', c'1', c'2', c'3', c'4', c'5', c'6', c'7', c'8', c'9',
      c':', c';', c'<', c'=', c'>', c'?', c'@',
      c'A', c'B', c'C', c'D', c'E', c'F', c'G', c'H', c'I', c'J',
      c'K', c'L', c'M', c'N', c'O', c'P', c'Q', c'R', c'S', c'T',
      c'U', c'V', c'W', c'X', c'Y', c'Z',
      c'[', c'\\', c']', c'^', c'_', c'`',
      c'a', c'b', c'c', c'd', c'e', c'f', c'g', c'h', c'i', c'j',
      c'k', c'l', c'm', c'n', c'o', c'p', c'q', c'r', c's', c't',
      c'u', c'v', c'w', c'x', c'y', c'z',
      c'{', c'|', c'}', c'~'
      ];
      for (const ch of asciiChars) {
        const c = new Char(ch);
        expect(c.isInBasicMultilingualPlane()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2300
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0023
     * @tc.desc Verify extended ASCII characters in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const extendedChars: Char[] = [
        c'\u0080', c'\u0090', c'\u00A0', c'\u00B0', c'\u00C0', c'\u00D0',
      c'\u00E0', c'\u00F0', c'\u00FF'
      ];
      for (const ch of extendedChars) {
        const c = new Char(ch);
        expect(c.isInBasicMultilingualPlane()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2400
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0024
     * @tc.desc Verify BMP character conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testChars: Char[] = [c'\u4E00', c'\u4E8C', c'\u4E09'];
      for (const ch of testChars) {
        const c = new Char(ch);
        expect(c.isInBasicMultilingualPlane()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2500
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0025
     * @tc.desc Verify surrogate area characters not in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highMin = new Char(Char.HIGH_SURROGATE_MIN);
      const highMax = new Char(Char.HIGH_SURROGATE_MAX);
      const lowMin = new Char(Char.LOW_SURROGATE_MIN);
      const lowMax = new Char(Char.LOW_SURROGATE_MAX);

      expect(highMin.isInBasicMultilingualPlane()).assertFalse();
      expect(highMax.isInBasicMultilingualPlane()).assertFalse();
      expect(lowMin.isInBasicMultilingualPlane()).assertFalse();
      expect(lowMax.isInBasicMultilingualPlane()).assertFalse();
    });


    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2700
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0027
     * @tc.desc Verify MIN_VALUE character is in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MIN_VALUE);
      expect(c.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2800
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0028
     * @tc.desc Verify MAX_VALUE character is in BMP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(Char.MAX_VALUE);
      expect(c.isInBasicMultilingualPlane()).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_2900
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0029
     * @tc.desc Verify repeated calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result1 = c.isInBasicMultilingualPlane();
      const result2 = c.isInBasicMultilingualPlane();
      const result3 = c.isInBasicMultilingualPlane();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_3000
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0030
     * @tc.desc Verify batch calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.isInBasicMultilingualPlane()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_3100
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0031
     * @tc.desc Verify different character instances return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bmpChar = new Char(c'A');
      const highSurrogate = new Char(Char.HIGH_SURROGATE_MIN);

      expect(bmpChar.isInBasicMultilingualPlane()).assertTrue();
      expect(highSurrogate.isInBasicMultilingualPlane()).assertFalse();
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_3200
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0032
     * @tc.desc Verify instance and static methods are consistent for same characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ch1 = c'A';
      const c1 = new Char(ch1);
      expect(c1.isInBasicMultilingualPlane()).assertEqual(Char.isInBasicMultilingualPlane(ch1));

      const ch2 = c'\u4E2D';
      const c2 = new Char(ch2);
      expect(c2.isInBasicMultilingualPlane()).assertEqual(Char.isInBasicMultilingualPlane(ch2));

      const ch3 = Char.HIGH_SURROGATE_MIN;
      const c3 = new Char(ch3);
      expect(c3.isInBasicMultilingualPlane()).assertEqual(Char.isInBasicMultilingualPlane(ch3));

      const ch4 = Char.LOW_SURROGATE_MIN;
      const c4 = new Char(ch4);
      expect(c4.isInBasicMultilingualPlane()).assertEqual(Char.isInBasicMultilingualPlane(ch4));
    });

    /**
     * @tc.number SUB_CHAR_IS_INBASICMULTILINGUALPLANETEST_3300
     * @tc.name testCharIsInBasicMultilingualPlaneInstance0033
     * @tc.desc Verify surrogate character judgment consistency with related methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharIsInBasicMultilingualPlaneInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const highSurrogate = new Char(Char.HIGH_SURROGATE_MIN);
      expect(highSurrogate.isInBasicMultilingualPlane()).assertFalse();
      expect(Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN)).assertTrue();
      expect(Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN)).assertTrue();
    });
  });
}
