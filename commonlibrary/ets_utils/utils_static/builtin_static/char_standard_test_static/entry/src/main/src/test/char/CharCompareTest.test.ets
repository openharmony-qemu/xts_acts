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

export default function CharCompareTest(): void {
  describe('CharCompareTest', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_0100
     * @tc.name testCharCompare0001
     * @tc.desc Verify that two Char type parameters must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2200
     * @tc.name testCharCompare0022
     * @tc.desc Verify comparing the same instance returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = Char.compare(c, c);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2300
     * @tc.name testCharCompare0023
     * @tc.desc Verify two different Char instances return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const result = Char.compare(c1, c2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2400
     * @tc.name testCharCompare0024
     * @tc.desc Verify uppercase and lowercase are not equal and return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'a');
      const result = Char.compare(c1, c2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2500
     * @tc.name testCharCompare0025
     * @tc.desc Verify same digit characters return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      const c2 = new Char(c'0');
      expect(Char.compare(c1, c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2600
     * @tc.name testCharCompare0026
     * @tc.desc Verify different digit characters return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      const c2 = new Char(c'1');
      expect(Char.compare(c1, c2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2700
     * @tc.name testCharCompare0027
     * @tc.desc Verify two null characters are equal and return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\u0000');
      const c2 = new Char(c'\u0000');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2800
     * @tc.name testCharCompare0028
     * @tc.desc Verify null character and non-null character are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\u0000');
      const c2 = new Char(c'A');
      const result = Char.compare(c1, c2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_2900
     * @tc.name testCharCompare0029
     * @tc.desc Verify two identical high surrogate characters are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uD800');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3000
     * @tc.name testCharCompare0030
     * @tc.desc Verify high surrogate and low surrogate are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uDC00');
      const result = Char.compare(c1, c2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3100
     * @tc.name testCharCompare0031
     * @tc.desc Verify two identical low surrogate characters are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uDC00');
      const c2 = new Char(c'\uDC00');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3200
     * @tc.name testCharCompare0032
     * @tc.desc Verify minimum character values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MIN_VALUE);
      const c2 = new Char(Char.MIN_VALUE);
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3300
     * @tc.name testCharCompare0033
     * @tc.desc Verify maximum character values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MAX_VALUE);
      const c2 = new Char(Char.MAX_VALUE);
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3400
     * @tc.name testCharCompare0034
     * @tc.desc Verify space characters are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c' ');
      const c2 = new Char(c' ');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3500
     * @tc.name testCharCompare0035
     * @tc.desc Verify newline characters are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\n');
      const c2 = new Char(c'\n');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3600
     * @tc.name testCharCompare0036
     * @tc.desc Verify same Chinese characters are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'中');
      const c2 = new Char(c'中');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3700
     * @tc.name testCharCompare0037
     * @tc.desc Verify different Chinese characters are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'中');
      const c2 = new Char(c'国');
      const result = Char.compare(c1, c2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3800
     * @tc.name testCharCompare0038
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result = Char.compare(c1, c2);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_3900
     * @tc.name testCharCompare0039
     * @tc.desc Verify return value can only be true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result = Char.compare(c1, c2);
      expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_4000
     * @tc.name testCharCompare0040
     * @tc.desc Verify multiple comparisons return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(Char.compare(c1, c2)).assertTrue();
      }
    });

    
    
    
    

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_4700
     * @tc.name testCharCompare0047
     * @tc.desc Verify compare() works correctly in a try-finally context regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c1 = new Char(c'A');
        const c2 = new Char(c'A');
        const result = Char.compare(c1, c2);
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_4800
     * @tc.name testCharCompare0048
     * @tc.desc Verify compare is a static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof Char.compare).assertEqual("function");
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result = Char.compare(c1, c2);
      expect(result).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5000
     * @tc.name testCharCompare0050
     * @tc.desc Verify compare is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const startTime = Date.now();
      const result = Char.compare(c1, c2);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5100
     * @tc.name testCharCompare0051
     * @tc.desc Verify symmetry of comparison for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(Char.compare(c1, c2)).assertEqual(Char.compare(c2, c1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5200
     * @tc.name testCharCompare0052
     * @tc.desc Verify symmetry of comparison for unequal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(Char.compare(c1, c2)).assertEqual(Char.compare(c2, c1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5300
     * @tc.name testCharCompare0053
     * @tc.desc Verify transitivity of equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const c3 = new Char(c'A');
      if (Char.compare(c1, c2) && Char.compare(c2, c3)) {
        expect(Char.compare(c1, c3)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5400
     * @tc.name testCharCompare0054
     * @tc.desc Verify repeated calls to compare return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result1 = Char.compare(c1, c2);
      const result2 = Char.compare(c1, c2);
      const result3 = Char.compare(c1, c2);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5500
     * @tc.name testCharCompare0055
     * @tc.desc Verify compare and equals return consistent results for equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      if (Char.compare(c1, c2)) {
        expect(c1.equals(c2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5600
     * @tc.name testCharCompare0056
     * @tc.desc Verify compare and equals return consistent results for unequal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      if (!Char.compare(c1, c2)) {
        expect(c1.equals(c2)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_5700
     * @tc.name testCharCompare0057
     * @tc.desc Verify difference between compare and compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const compareResult = Char.compare(c1, c2);
      const compareToResult = c1.compareTo(c2);
      expect(typeof compareResult).assertEqual("boolean");
      expect(compareToResult === 0).assertTrue();
    });

    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_6100
     * @tc.name testCharCompare0061
     * @tc.desc Verify minimum and maximum value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cMin = new Char(Char.MIN_VALUE);
      const cMax = new Char(Char.MAX_VALUE);
      expect(Char.compare(cMin, cMax)).assertFalse();
      expect(Char.compare(cMax, cMin)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_6200
     * @tc.name testCharCompare0062
     * @tc.desc Verify high surrogate boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cHighMin = new Char(Char.HIGH_SURROGATE_MIN);
      const cHighMax = new Char(Char.HIGH_SURROGATE_MAX);
      expect(Char.compare(cHighMin, cHighMax)).assertFalse();
      expect(Char.compare(cHighMin, cHighMin)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETEST_COMPARETEST_6300
     * @tc.name testCharCompare0063
     * @tc.desc Verify low surrogate boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompare0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cLowMin = new Char(Char.LOW_SURROGATE_MIN);
      const cLowMax = new Char(Char.LOW_SURROGATE_MAX);
      expect(Char.compare(cLowMin, cLowMax)).assertFalse();
      expect(Char.compare(cLowMin, cLowMin)).assertTrue();
    });
  });
}
