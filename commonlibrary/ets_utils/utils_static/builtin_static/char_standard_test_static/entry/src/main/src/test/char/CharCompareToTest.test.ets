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

export default function CharCompareToTest(): void {
  describe('CharCompareToTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_0100
     * @tc.name testCharCompareTo0001
     * @tc.desc Verify that Char parameter is required for compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result = c1.compareTo(c2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_0200
     * @tc.name testCharCompareTo0002
     * @tc.desc Verify that compareTo throws error when no parameter is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const c = new Char(c'A');
        const result = c.compareTo(undefined as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_0400
     * @tc.name testCharCompareTo0004
     * @tc.desc Verify compareTo with Char instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_0700
     * @tc.name testCharCompareTo0007
     * @tc.desc Verify that compareTo throws error when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const c = new Char(c'A');
        const result = c.compareTo(null as Char);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });


    
    
    
    
    

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_1500
     * @tc.name testCharCompareTo0015
     * @tc.desc Verify that compareTo returns 0 when comparing same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = new Char(c'A');
      const result = c.compareTo(c);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_1700
     * @tc.name testCharCompareTo0017
     * @tc.desc Verify compareTo with digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      const c2 = new Char(c'9');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_1800
     * @tc.name testCharCompareTo0018
     * @tc.desc Verify that compareTo returns positive when current char is greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'Z');
      const c2 = new Char(c'A');
      const result = c1.compareTo(c2);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_1900
     * @tc.name testCharCompareTo0019
     * @tc.desc Verify compareTo with lowercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'z');
      const c2 = new Char(c'a');
      const result = c1.compareTo(c2);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2000
     * @tc.name testCharCompareTo0020
     * @tc.desc Verify that compareTo returns 0 for two null characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\u0000');
      const c2 = new Char(c'\u0000');
      const result = c1.compareTo(c2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2100
     * @tc.name testCharCompareTo0021
     * @tc.desc Verify that null character is minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\u0000');
      const c2 = new Char(c'A');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2200
     * @tc.name testCharCompareTo0022
     * @tc.desc Verify that compareTo returns 0 for equal high surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uD800');
      const result = c1.compareTo(c2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2300
     * @tc.name testCharCompareTo0023
     * @tc.desc Verify compareTo with high surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uDBFF');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2400
     * @tc.name testCharCompareTo0024
     * @tc.desc Verify compareTo with low surrogate characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uDC00');
      const c2 = new Char(c'\uDFFF');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2500
     * @tc.name testCharCompareTo0025
     * @tc.desc Verify that compareTo returns 0 for MIN_VALUE characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MIN_VALUE);
      const c2 = new Char(Char.MIN_VALUE);
      const result = c1.compareTo(c2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2600
     * @tc.name testCharCompareTo0026
     * @tc.desc Verify that compareTo returns 0 for MAX_VALUE characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(Char.MAX_VALUE);
      const c2 = new Char(Char.MAX_VALUE);
      const result = c1.compareTo(c2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2700
     * @tc.name testCharCompareTo0027
     * @tc.desc Verify that compareTo returns 0 for equal Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'中');
      const c2 = new Char(c'中');
      const result = c1.compareTo(c2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2800
     * @tc.name testCharCompareTo0028
     * @tc.desc Verify compareTo with different Chinese characters by code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'中');
      const c2 = new Char(c'国');
      const result = c1.compareTo(c2);
      expect(result !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_2900
     * @tc.name testCharCompareTo0029
     * @tc.desc Verify that compareTo return value is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result = c1.compareTo(c2);
      expect(typeof result === "number" || typeof result === "int").assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_3000
     * @tc.name testCharCompareTo0030
     * @tc.desc Verify that compareTo return value is an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const result = c1.compareTo(c2);
      expect(result % 1).assertEqual(0);
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_3300
     * @tc.name testCharCompareTo0033
     * @tc.desc Verify multiple compareTo calls return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c1.compareTo(c2)).assertEqual(0);
      }
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_3700
     * @tc.name testCharCompareTo0037
     * @tc.desc Verify that finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const c1 = new Char(c'A');
        const c2 = new Char(c'A');
        const result = c1.compareTo(c2);
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4000
     * @tc.name testCharCompareTo0040
     * @tc.desc Verify that compareTo is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const startTime = Date.now();
      const result = c1.compareTo(c2);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4100
     * @tc.name testCharCompareTo0041
     * @tc.desc Verify compareTo between uppercase and lowercase by Unicode code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'a');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4200
     * @tc.name testCharCompareTo0042
     * @tc.desc Verify compareTo with alphabetical order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const c3 = new Char(c'C');
      expect(c1.compareTo(c2) < 0).assertTrue();
      expect(c2.compareTo(c3) < 0).assertTrue();
      expect(c1.compareTo(c3) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4300
     * @tc.name testCharCompareTo0043
     * @tc.desc Verify compareTo with digit characters by Unicode code point order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'0');
      const c2 = new Char(c'5');
      const c3 = new Char(c'9');
      expect(c1.compareTo(c2) < 0).assertTrue();
      expect(c2.compareTo(c3) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4400
     * @tc.name testCharCompareTo0044
     * @tc.desc Verify compareTo with space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c' ');
      const c2 = new Char(c'A');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4500
     * @tc.name testCharCompareTo0045
     * @tc.desc Verify compareTo with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\n');
      const c2 = new Char(c'\r');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4600
     * @tc.name testCharCompareTo0046
     * @tc.desc Verify that reverse comparison returns opposite result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const result1 = c1.compareTo(c2);
      const result2 = c2.compareTo(c1);
      expect(result1).assertEqual(-result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4700
     * @tc.name testCharCompareTo0047
     * @tc.desc Verify symmetry for equal characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const result1 = c1.compareTo(c2);
      const result2 = c2.compareTo(c1);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4800
     * @tc.name testCharCompareTo0048
     * @tc.desc Verify transitivity of less than
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const c3 = new Char(c'C');
      expect(c1.compareTo(c2) < 0).assertTrue();
      expect(c2.compareTo(c3) < 0).assertTrue();
      expect(c1.compareTo(c3) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_4900
     * @tc.name testCharCompareTo0049
     * @tc.desc Verify transitivity of greater than
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'C');
      const c2 = new Char(c'B');
      const c3 = new Char(c'A');
      expect(c1.compareTo(c2) > 0).assertTrue();
      expect(c2.compareTo(c3) > 0).assertTrue();
      expect(c1.compareTo(c3) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5000
     * @tc.name testCharCompareTo0050
     * @tc.desc Verify equals returns true when compareTo returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(c1.compareTo(c2)).assertEqual(0);
      expect(c1.equals(c2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5100
     * @tc.name testCharCompareTo0051
     * @tc.desc Verify equals returns false when compareTo does not return 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      expect(c1.compareTo(c2) !== 0).assertTrue();
      expect(c1.equals(c2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5200
     * @tc.name testCharCompareTo0052
     * @tc.desc Verify difference between compareTo and compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      const compareToResult = c1.compareTo(c2);
      const compareResult = Char.compare(c1, c2);
      expect(typeof compareToResult === "number" || typeof compareToResult === "int").assertTrue();
      expect(typeof compareResult).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5300
     * @tc.name testCharCompareTo0053
     * @tc.desc Verify relationship between compareTo and toInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'B');
      const compareToResult = c1.compareTo(c2);
      const toIntDiff = c1.toInt() - c2.toInt();
      expect(compareToResult).assertEqual(toIntDiff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5400
     * @tc.name testCharCompareTo0054
     * @tc.desc Verify that compareTo can be used for sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars = [
        new Char(c'C'),
      new Char(c'A'),
      new Char(c'B')
      ];
      chars.sort((a, b) => a.compareTo(b));
      expect(chars[0].toString()).assertEqual("A");
      expect(chars[1].toString()).assertEqual("B");
      expect(chars[2].toString()).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5500
     * @tc.name testCharCompareTo0055
     * @tc.desc Verify that compareTo can be used for reverse sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars = [
        new Char(c'A'),
      new Char(c'B'),
      new Char(c'C')
      ];
      chars.sort((a, b) => b.compareTo(a));
      expect(chars[0].toString()).assertEqual("C");
      expect(chars[1].toString()).assertEqual("B");
      expect(chars[2].toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5600
     * @tc.name testCharCompareTo0056
     * @tc.desc Verify compareTo with surrogate range characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'\uD800');
      const c2 = new Char(c'\uD801');
      expect(c1.compareTo(c2) < 0).assertTrue();
      const c3 = new Char(c'\uDBFE');
      const c4 = new Char(c'\uDBFF');
      expect(c3.compareTo(c4) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARCOMPARETOTEST_COMPARETOTEST_5700
     * @tc.name testCharCompareTo0057
     * @tc.desc Verify compareTo strictly by Unicode code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharCompareTo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'\u0100');
      const result = c1.compareTo(c2);
      expect(result < 0).assertTrue();
    });

      });
}
