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

import { afterAll, afterEach, beforeAll,beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function IntCompareToTest(): void {
  describe('IntCompareToTest', (): void => {
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
     * @tc.number INT_CMPR_TO_CHK_0100
     * @tc.name testIntCompareTo0001
     * @tc.desc Verify that other parameter is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.compareTo(64);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0200
     * @tc.name testIntCompareTo0002
     * @tc.desc Verify that missing parameter throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(10);
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0400
     * @tc.name testIntCompareTo0004
     * @tc.desc Verify compareTo with normal integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.compareTo(50);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0500
     * @tc.name testIntCompareTo0005
     * @tc.desc Verify compareTo with positive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      expect(a.compareTo(400)).assertEqual(1);
      expect(a.compareTo(600)).assertEqual(-1);
      expect(a.compareTo(500)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0600
     * @tc.name testIntCompareTo0006
     * @tc.desc Verify compareTo with negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-500);
      expect(a.compareTo(-400)).assertEqual(-1);
      expect(a.compareTo(-600)).assertEqual(1);
      expect(a.compareTo(-500)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0700
     * @tc.name testIntCompareTo0007
     * @tc.desc Verify compareTo with zero value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.compareTo(0)).assertEqual(0);
      expect(a.compareTo(1)).assertEqual(-1);
      expect(a.compareTo(-1)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0800
     * @tc.name testIntCompareTo0008
     * @tc.desc Verify compareTo with int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.compareTo(2147483647)).assertEqual(-1);

      const max = new Int(2147483647);
      expect(max.compareTo(2147483647)).assertEqual(0);
      expect(max.compareTo(2147483646)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_0900
     * @tc.name testIntCompareTo0009
     * @tc.desc Verify compareTo with int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.compareTo(-2147483648)).assertEqual(1);

      const min = new Int(-2147483648);
      expect(min.compareTo(-2147483648)).assertEqual(0);
      expect(min.compareTo(-2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1000
     * @tc.name testIntCompareTo0010
     * @tc.desc Verify compareTo between MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      const min = new Int(-2147483648);
      expect(max.compareTo(-2147483648)).assertEqual(1);
      expect(min.compareTo(2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1100
     * @tc.name testIntCompareTo0011
     * @tc.desc Verify compareTo with hexadecimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0x41);
      expect(a.compareTo(0x40)).assertEqual(1);
      expect(a.compareTo(0x42)).assertEqual(-1);
      expect(a.compareTo(0x41)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1200
     * @tc.name testIntCompareTo0012
     * @tc.desc Verify compareTo with octal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0o101);
      expect(a.compareTo(0o100)).assertEqual(1);
      expect(a.compareTo(0o102)).assertEqual(-1);
      expect(a.compareTo(0o101)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1300
     * @tc.name testIntCompareTo0013
     * @tc.desc Verify compareTo with binary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0b1000001);
      expect(a.compareTo(0b1000000)).assertEqual(1);
      expect(a.compareTo(0b1000010)).assertEqual(-1);
      expect(a.compareTo(0b1000001)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1600
     * @tc.name testIntCompareTo0016
     * @tc.desc Verify that passing float throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(65);
        const result = a.compareTo(12.34 as Object as int);
        expect().assertFail();
      } catch (error) {
       expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1700
     * @tc.name testIntCompareTo0017
     * @tc.desc Verify that passing string throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(65);
        const result = a.compareTo("10" as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1800
     * @tc.name testIntCompareTo0018
     * @tc.desc Verify that passing boolean throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const a = new Int(65);
        const result = a.compareTo(true as Object as int);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_1900
     * @tc.name testIntCompareTo0019
     * @tc.desc Verify compareTo returns comparison result -1, 0, or 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.compareTo(64)).assertEqual(1);
      expect(a.compareTo(65)).assertEqual(0);
      expect(a.compareTo(66)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2000
     * @tc.name testIntCompareTo0020
     * @tc.desc Verify compareTo return value is int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.compareTo(50);
      expect(typeof result === 'number' || typeof result === 'int').assertTrue();
      expect(result).assertLargerOrEqual(-1);
      expect(result).assertLessOrEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2100
     * @tc.name testIntCompareTo0021
     * @tc.desc Verify compareTo returns -1 when current value is less than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.compareTo(100)).assertEqual(-1);
      expect(a.compareTo(51)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2200
     * @tc.name testIntCompareTo0022
     * @tc.desc Verify compareTo returns -1 for negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.compareTo(-50)).assertEqual(-1);
      expect(a.compareTo(-99)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2300
     * @tc.name testIntCompareTo0023
     * @tc.desc Verify compareTo returns -1 when comparing negative with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.compareTo(0)).assertEqual(-1);

      const b = new Int(-100);
      expect(b.compareTo(0)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2400
     * @tc.name testIntCompareTo0024
     * @tc.desc Verify compareTo returns 0 when current value equals other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.compareTo(100)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2500
     * @tc.name testIntCompareTo0025
     * @tc.desc Verify compareTo returns 0 for equal negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.compareTo(-100)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2600
     * @tc.name testIntCompareTo0026
     * @tc.desc Verify compareTo returns 0 for equal zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.compareTo(0)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2700
     * @tc.name testIntCompareTo0027
     * @tc.desc Verify compareTo returns 0 for equal maximum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      expect(a.compareTo(2147483647)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2800
     * @tc.name testIntCompareTo0028
     * @tc.desc Verify compareTo returns 0 for equal minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      expect(a.compareTo(-2147483648)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_2900
     * @tc.name testIntCompareTo0029
     * @tc.desc Verify compareTo returns 1 when current value is greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.compareTo(50)).assertEqual(1);
      expect(a.compareTo(99)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3000
     * @tc.name testIntCompareTo0030
     * @tc.desc Verify compareTo returns 1 for negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.compareTo(-100)).assertEqual(1);
      expect(a.compareTo(-51)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3100
     * @tc.name testIntCompareTo0031
     * @tc.desc Verify compareTo returns 1 when comparing positive with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.compareTo(0)).assertEqual(1);

      const b = new Int(100);
      expect(b.compareTo(0)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3300
     * @tc.name testIntCompareTo0033
     * @tc.desc Verify compareTo with two instances comparing each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      expect(a.compareTo(50)).assertEqual(1);
      expect(b.compareTo(100)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3400
     * @tc.name testIntCompareTo0034
     * @tc.desc Verify compareTo after creating instance with valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.compareTo(50)).assertEqual(1);
      expect(a.compareTo(100)).assertEqual(0);
      expect(a.compareTo(150)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3600
     * @tc.name testIntCompareTo0036
     * @tc.desc Verify compareTo with equal values comparing each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(100);
      expect(a.compareTo(100)).assertEqual(0);
      expect(b.compareTo(100)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3700
     * @tc.name testIntCompareTo0037
     * @tc.desc Verify transitivity of compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      const c = new Int(25);
      expect(a.compareTo(50)).assertEqual(1);
      expect(b.compareTo(25)).assertEqual(1);
      expect(a.compareTo(25)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3800
     * @tc.name testIntCompareTo0038
     * @tc.desc Verify transitivity with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-10);
      const b = new Int(-50);
      const c = new Int(-100);
      expect(a.compareTo(-50)).assertEqual(1);
      expect(b.compareTo(-100)).assertEqual(1);
      expect(a.compareTo(-100)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_3900
     * @tc.name testIntCompareTo0039
     * @tc.desc Verify positive number compared with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.compareTo(0)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4000
     * @tc.name testIntCompareTo0040
     * @tc.desc Verify negative number compared with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.compareTo(0)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4200
     * @tc.name testIntCompareTo0042
     * @tc.desc Verify 1 compared with 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.compareTo(0)).assertEqual(1);
      expect(a.compareTo(1)).assertEqual(0);
      expect(a.compareTo(2)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4300
     * @tc.name testIntCompareTo0043
     * @tc.desc Verify -1 compared with 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.compareTo(0)).assertEqual(-1);
      expect(a.compareTo(-1)).assertEqual(0);
      expect(a.compareTo(-2)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4400
     * @tc.name testIntCompareTo0044
     * @tc.desc Verify MAX_VALUE compared with normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.compareTo(0)).assertEqual(1);
      expect(max.compareTo(1000000)).assertEqual(1);
      expect(max.compareTo(2147483647)).assertEqual(0);
      expect(max.compareTo(2147483647 - 1)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4500
     * @tc.name testIntCompareTo0045
     * @tc.desc Verify MIN_VALUE compared with normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(-2147483648);
      expect(min.compareTo(0)).assertEqual(-1);
      expect(min.compareTo(-1000000)).assertEqual(-1);
      expect(min.compareTo(-2147483648)).assertEqual(0);
      expect(min.compareTo(-2147483648 + 1)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4600
     * @tc.name testIntCompareTo0046
     * @tc.desc Verify compareTo with large medium small positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large = new Int(1000000);
      const medium = new Int(1000);
      const small = new Int(10);

      expect(large.compareTo(1000)).assertEqual(1);
      expect(medium.compareTo(10)).assertEqual(1);
      expect(small.compareTo(1000000)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4700
     * @tc.name testIntCompareTo0047
     * @tc.desc Verify compareTo with large medium small negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large = new Int(-10);
      const medium = new Int(-1000);
      const small = new Int(-1000000);

      expect(large.compareTo(-1000)).assertEqual(1);
      expect(medium.compareTo(-1000000)).assertEqual(1);
      expect(small.compareTo(-10)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4800
     * @tc.name testIntCompareTo0048
     * @tc.desc Verify positive number compared with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive = new Int(100);
      const negative = new Int(-100);

      expect(positive.compareTo(-100)).assertEqual(1);
      expect(negative.compareTo(100)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_4900
     * @tc.name testIntCompareTo0049
     * @tc.desc Verify compareTo with adjacent integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const a = new Int(i);
        expect(a.compareTo(i - 1)).assertEqual(1);
        expect(a.compareTo(i)).assertEqual(0);
        expect(a.compareTo(i + 1)).assertEqual(-1);
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5000
     * @tc.name testIntCompareTo0050
     * @tc.desc Verify compareTo with arithmetic sequence elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [0, 10, 20, 30, 40, 50];
      for (let i = 0; i < values.length; i++) {
        const a = new Int(values[i]);
        for (let j = 0; j < values.length; j++) {
          const result = a.compareTo(values[j]);
          if (i < j) expect(result).assertEqual(-1);
          else if (i === j) expect(result).assertEqual(0);
          else expect(result).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5200
     * @tc.name testIntCompareTo0052
     * @tc.desc Verify compareTo result is consistent with comparison operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const other = 50;

      const result = a.compareTo(other);
      expect(result).assertEqual(1);
      expect(a.toInt()).assertLarger(other);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5300
     * @tc.name testIntCompareTo0053
     * @tc.desc Verify sorting using compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(50),
        new Int(10),
        new Int(100),
        new Int(30)];
      values.sort((a: Int, b: Int) => a.compareTo(b.toInt()));
      expect(values[0].toInt()).assertEqual(10);
      expect(values[3].toInt()).assertEqual(100);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5400
     * @tc.name testIntCompareTo0054
     * @tc.desc Verify binary search using compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binarySearch = (arr: Int[], target: int): number => {
        let left: number = 0;
        let right: number = arr.length - 1;
        while (left <= right) {
          const mid: int = Double.toInt(Math.floor((left + right) / 2));
          const cmp = arr[mid].compareTo(target);
          if (cmp === 0) return mid;
          else if (cmp > 0) right = mid - 1;
          else left = mid + 1;
        }
        return -1;
      };
      const sorted: Int[] = [new Int(10),
        new Int(30),
        new Int(50),
        new Int(70)];
      expect(binarySearch(sorted, 30)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5500
     * @tc.name testIntCompareTo0055
     * @tc.desc Verify range check using compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const min = 10;
      const max = 100;

      const aboveMin = value.compareTo(min) >= 0;
      const belowMax = value.compareTo(max) <= 0;

      expect(aboveMin).assertTrue();
      expect(belowMax).assertTrue();
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5600
     * @tc.name testIntCompareTo0056
     * @tc.desc Verify multiple compareTo calls performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      let result = 0;
      for (let i = 0; i < 1000; i++) {
        result = a.compareTo(50);
      }
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5700
     * @tc.name testIntCompareTo0057
     * @tc.desc Verify batch comparison operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const values: int[] = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
      let lessCount: number = 0;
      let equalCount: number = 0;
      let greaterCount: number = 0;

      values.forEach((v: int): void => {
        const cmp = a.compareTo(v);
        if (cmp < 0) lessCount++;
        else if (cmp === 0) equalCount++;
        else greaterCount++;
      });

      expect(lessCount).assertEqual(5);
      expect(equalCount).assertEqual(1);
      expect(greaterCount).assertEqual(5);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_5800
     * @tc.name testIntCompareTo0058
     * @tc.desc Verify documentation example output 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.compareTo(64)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6000
     * @tc.name testIntCompareTo0060
     * @tc.desc Verify extreme values compared with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      const min = new Int(-2147483648);
      expect(max.compareTo(0)).assertEqual(1);
      expect(min.compareTo(0)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6100
     * @tc.name testIntCompareTo0061
     * @tc.desc Verify near-boundary value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax = new Int(2147483647 - 1);
      const max = new Int(2147483647);
      expect(nearMax.compareTo(2147483647)).assertEqual(-1);
      expect(max.compareTo(2147483647 - 1)).assertEqual(1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6200
     * @tc.name testIntCompareTo0062
     * @tc.desc Verify near-minimum value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMin = new Int(-2147483648 + 1);
      const min = new Int(-2147483648);
      expect(nearMin.compareTo(-2147483648)).assertEqual(1);
      expect(min.compareTo(-2147483648 + 1)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6300
     * @tc.name testIntCompareTo0063
     * @tc.desc Verify same value instances comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(100);
      const a2 = new Int(100);
      expect(a1.compareTo(100)).assertEqual(0);
      expect(a2.compareTo(100)).assertEqual(0);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6400
     * @tc.name testIntCompareTo0064
     * @tc.desc Verify expression result comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100 + 50);
      expect(a.compareTo(150)).assertEqual(0);
      expect(a.compareTo(149)).assertEqual(1);
      expect(a.compareTo(151)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6500
     * @tc.name testIntCompareTo0065
     * @tc.desc Verify return value is only -1, 0, or 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [-2147483648, -1000, -1, 0, 1, 1000, 2147483647];
      testValues.forEach((v: int): void => {
        const a = new Int(100);
        const result = a.compareTo(v);
        expect(result === -1 || result === 0 || result === 1).assertTrue();
      });
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6600
     * @tc.name testIntCompareTo0066
     * @tc.desc Verify return value sign is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const less = a.compareTo(50);
      const equal = a.compareTo(100);
      const greater = a.compareTo(150);

      expect(less > 0).assertTrue();
      expect(equal === 0).assertTrue();
      expect(greater < 0).assertTrue();
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6700
     * @tc.name testIntCompareTo0067
     * @tc.desc Verify all array elements compared with target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [10, 20, 30, 40, 50];
      const target = new Int(30);
      const results: number[] = values.map((v: int): number => target.compareTo(v));
      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(0);
      expect(results[3]).assertEqual(-1);
      expect(results[4]).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6800
     * @tc.name testIntCompareTo0068
     * @tc.desc Verify finding extreme values using compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30),
      new Int(70), new Int(20)];
      let maxVal: Int = values[0];
      let minVal: Int = values[0];

      values.forEach((v: Int): void => {
        if (v.compareTo(maxVal.toInt()) > 0) maxVal = v;
        if (v.compareTo(minVal.toInt()) < 0) minVal = v;
      });

      expect(maxVal.toInt()).assertEqual(70);
      expect(minVal.toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_6900
     * @tc.name testIntCompareTo0069
     * @tc.desc Verify comparison relationship among three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(30);
      const b = 20;
      const c = 40;

      expect(a.compareTo(b)).assertEqual(1);
      expect(a.compareTo(c)).assertEqual(-1);
      expect(b < c).assertTrue();
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_7000
     * @tc.name testIntCompareTo0070
     * @tc.desc Verify sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Int[] = [new Int(50), new Int(10), new Int(30)];
      const sorted: Int[] = original.slice().sort((a: Int, b: Int) => a.compareTo(b.toInt()));

      expect(sorted[0].toInt()).assertEqual(10);
      expect(sorted[1].toInt()).assertEqual(30);
      expect(sorted[2].toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_7100
     * @tc.name testIntCompareTo0071
     * @tc.desc Verify multiple relationship comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.compareTo(10)).assertEqual(1);
      expect(a.compareTo(50)).assertEqual(1);
      expect(a.compareTo(200)).assertEqual(-1);
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_7200
     * @tc.name testIntCompareTo0072
     * @tc.desc Verify adjacent values differ by 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const a = new Int(i);
        expect(a.compareTo(i - 1)).assertEqual(1);
        expect(a.compareTo(i)).assertEqual(0);
        expect(a.compareTo(i + 1)).assertEqual(-1);
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_7300
     * @tc.name testIntCompareTo0073
     * @tc.desc Verify compareTo sign is consistent with subtraction result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [[100, 50], [50, 100], [50, 50]];

      for (let i = 0; i < testCases.length; i++) {
        const aVal = testCases[i][0];
        const bVal = testCases[i][1];
        const a = new Int(aVal);
        const cmp = a.compareTo(bVal);
        const diff = aVal - bVal;

        if (diff > 0) expect(cmp).assertEqual(1);
        else if (diff < 0) expect(cmp).assertEqual(-1);
        else expect(cmp).assertEqual(0);
      }
    });

    /**
     * @tc.number INT_CMPR_TO_CHK_7400
     * @tc.name testIntCompareTo0074
     * @tc.desc Verify compareTo is consistent with Math.sign result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntCompareTo0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [-2147483648, -100, 0, 100, 2147483647];
      testValues.forEach((v: int): void => {
        const a = new Int(50);
        const cmp = a.compareTo(v);
        const sign = 50 > v ? 1 : 50 < v ? -1 : 0;
        expect(cmp).assertEqual(sign);
      });
    });
  });
}

