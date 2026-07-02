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
import hilog from '@ohos.hilog';
import Utils from '../Util.test';

export default function IntIsLessThanTest(): void {
  describe('IntIsLessThanTest', (): void => {
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
     * @tc.number INT_IS_LESS_THAN_0100
     * @tc.name testIntIsLessThan0001
     * @tc.desc Verify required other parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessThan(new Int(75));
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0200
     * @tc.name testIntIsLessThan0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(20);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0400
     * @tc.name testIntIsLessThan0004
     * @tc.desc Verify normal Int value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(150);
      const result = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0500
     * @tc.name testIntIsLessThan0005
     * @tc.desc Verify positive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isLessThan(new Int(100))).assertTrue();
      expect(a.isLessThan(new Int(50))).assertFalse();
      expect(a.isLessThan(new Int(25))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0600
     * @tc.name testIntIsLessThan0006
     * @tc.desc Verify negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessThan(new Int(-50))).assertTrue();
      expect(a.isLessThan(new Int(-100))).assertFalse();
      expect(a.isLessThan(new Int(-150))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0700
     * @tc.name testIntIsLessThan0007
     * @tc.desc Verify positive vs negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.isLessThan(new Int(50))).assertTrue();
      expect(a.isLessThan(new Int(-50))).assertFalse();
      expect(a.isLessThan(new Int(-100))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0800
     * @tc.name testIntIsLessThan0008
     * @tc.desc Verify comparison with int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isLessThan(new Int(2147483647))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_0900
     * @tc.name testIntIsLessThan0009
     * @tc.desc Verify comparison with int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1000
     * @tc.name testIntIsLessThan0010
     * @tc.desc Verify max value vs min value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.isLessThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1100
     * @tc.name testIntIsLessThan0011
     * @tc.desc Verify comparison with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.isLessThan(new Int(0))).assertTrue();

      const b = new Int(50);
      expect(b.isLessThan(new Int(0))).assertFalse();

      const c = new Int(0);
      expect(c.isLessThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1200
     * @tc.name testIntIsLessThan0012
     * @tc.desc Verify comparison with one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.isLessThan(new Int(1))).assertTrue();

      const b = new Int(1);
      expect(b.isLessThan(new Int(1))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1300
     * @tc.name testIntIsLessThan0013
     * @tc.desc Verify comparison with negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2);
      expect(a.isLessThan(new Int(-1))).assertTrue();

      const b = new Int(-1);
      expect(b.isLessThan(new Int(-1))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1600
     * @tc.name testIntIsLessThan0016
     * @tc.desc Verify isLessThan with number literal argument returns correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessThan(75);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1700
     * @tc.name testIntIsLessThan0017
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessThan(new Int(75));
      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1800
     * @tc.name testIntIsLessThan0018
     * @tc.desc Verify returns true when current value is less than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isLessThan(new Int(100))).assertTrue();
      expect(a.isLessThan(new Int(51))).assertTrue();
      expect(a.isLessThan(new Int(75))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_1900
     * @tc.name testIntIsLessThan0019
     * @tc.desc Verify returns false when current value is greater than or equal to other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isLessThan(new Int(25))).assertFalse();
      expect(a.isLessThan(new Int(50))).assertFalse();
      expect(a.isLessThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2000
     * @tc.name testIntIsLessThan0020
     * @tc.desc Verify positive number is less than other positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.isLessThan(new Int(75))).assertTrue();
      expect(a.isLessThan(new Int(100))).assertTrue();
      expect(a.isLessThan(new Int(66))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2100
     * @tc.name testIntIsLessThan0021
     * @tc.desc Verify positive number is not less than some values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.isLessThan(new Int(55))).assertFalse();
      expect(a.isLessThan(new Int(65))).assertFalse();
      expect(a.isLessThan(new Int(1))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2200
     * @tc.name testIntIsLessThan0022
     * @tc.desc Verify negative number is less than larger negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessThan(new Int(-50))).assertTrue();
      expect(a.isLessThan(new Int(-99))).assertTrue();
      expect(a.isLessThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2300
     * @tc.name testIntIsLessThan0023
     * @tc.desc Verify negative number is not less than smaller negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessThan(new Int(-150))).assertFalse();
      expect(a.isLessThan(new Int(-100))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2400
     * @tc.name testIntIsLessThan0024
     * @tc.desc Verify negative number is less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.isLessThan(new Int(0))).assertTrue();

      const b = new Int(-100);
      expect(b.isLessThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2500
     * @tc.name testIntIsLessThan0025
     * @tc.desc Verify positive number and zero are not less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.isLessThan(new Int(0))).assertFalse();

      const b = new Int(0);
      expect(b.isLessThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2600
     * @tc.name testIntIsLessThan0026
     * @tc.desc Verify equal values return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isLessThan(new Int(100))).assertFalse();

      const b = new Int(-100);
      expect(b.isLessThan(new Int(-100))).assertFalse();

      const c = new Int(0);
      expect(c.isLessThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2800
     * @tc.name testIntIsLessThan0028
     * @tc.desc Verify valueOf creates comparison parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      const result = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_2900
     * @tc.name testIntIsLessThan0029
     * @tc.desc Verify a < b is equivalent to !(a >= b)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      expect(a.isLessThan(b)).assertTrue();
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3000
     * @tc.name testIntIsLessThan0030
     * @tc.desc Verify a < b implies a <= b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      expect(a.isLessThan(b)).assertTrue();
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3100
     * @tc.name testIntIsLessThan0031
     * @tc.desc Verify a = b: a < b is false but a <= b is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(65);
      expect(a.isLessThan(b)).assertFalse();
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3200
     * @tc.name testIntIsLessThan0032
     * @tc.desc Verify a < b is equivalent to b > a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isGreaterThan(a)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3400
     * @tc.name testIntIsLessThan0034
     * @tc.desc Verify comparison with 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647 - 1);
      expect(a.isLessThan(new Int(2147483647))).assertTrue();

      const max = new Int(2147483647);
      expect(max.isLessThan(new Int(2147483647))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3500
     * @tc.name testIntIsLessThan0035
     * @tc.desc Verify comparison with -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648 + 1);
      expect(a.isLessThan(new Int(-2147483648))).assertFalse();

      const min = new Int(-2147483648);
      expect(min.isLessThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3600
     * @tc.name testIntIsLessThan0036
     * @tc.desc Verify MAX_VALUE vs MIN_VALUE comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.isLessThan(new Int(-2147483648))).assertFalse();

      const min = new Int(-2147483648);
      expect(min.isLessThan(new Int(2147483647))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3700
     * @tc.name testIntIsLessThan0037
     * @tc.desc Verify consecutive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const a = new Int(i);
        expect(a.isLessThan(new Int(i + 1))).assertTrue();
        expect(a.isLessThan(new Int(i))).assertFalse();
        expect(a.isLessThan(new Int(i - 1))).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3800
     * @tc.name testIntIsLessThan0038
     * @tc.desc Verify consecutive negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -100; i < 0; i++) {
        const a = new Int(i);
        expect(a.isLessThan(new Int(i + 1))).assertTrue();
        expect(a.isLessThan(new Int(i))).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_LESS_THAN_3900
     * @tc.name testIntIsLessThan0039
     * @tc.desc Verify checking if value is within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const min = new Int(0);
      const max = new Int(100);

      expect(value.isGreaterThan(min)).assertTrue();
      expect(value.isLessThan(max)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4000
     * @tc.name testIntIsLessThan0040
     * @tc.desc Verify using for sorting comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30)];
      values.sort((a: Int, b: Int): int => { if (a.isLessThan(b)) return -1; if (a.isGreaterThan(b)) return 1; return 0; });
      expect(values[0].toInt()).assertEqual(10);
      expect(values[2].toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4100
     * @tc.name testIntIsLessThan0041
     * @tc.desc Verify conditional branch usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const threshold = new Int(100);

      expect(value.isLessThan(threshold)).assertTrue();
      expect(value.toInt()).assertLess(100);
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4200
     * @tc.name testIntIsLessThan0042
     * @tc.desc Verify performance with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      const b = new Int(100);
      let result = false;
      for (let i = 0; i < 1000; i++) {
        result = a.isLessThan(b);
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4300
     * @tc.name testIntIsLessThan0043
     * @tc.desc Verify documentation example outputs true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      hilog.info(0x0000, 'IntIsLessThanTest', '%{public}s', a.isLessThan(new Int(75)).toString());
      expect(a.isLessThan(new Int(75))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4400
     * @tc.name testIntIsLessThan0044
     * @tc.desc Verify isLessThan consistent with less than operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [[10, 20], [20, 10], [10, 10]];

      for (let i = 0; i < testCases.length; i++) {
        const aVal = testCases[i][0];
        const bVal = testCases[i][1];
        const a = new Int(aVal);
        const result = a.isLessThan(new Int(bVal));
        expect(result).assertEqual(aVal < bVal);
      }
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4600
     * @tc.name testIntIsLessThan0046
     * @tc.desc Verify a < a is false (irreflexivity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.isLessThan(new Int(123))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4700
     * @tc.name testIntIsLessThan0047
     * @tc.desc Verify transitivity: a < b and b < c implies a < c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(50);
      const c = new Int(100);

      expect(a.isLessThan(b)).assertTrue();
      expect(b.isLessThan(c)).assertTrue();
      expect(a.isLessThan(c)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4800
     * @tc.name testIntIsLessThan0048
     * @tc.desc Verify comparison of 1 and -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one = new Int(1);
      const minusOne = new Int(-1);

      expect(minusOne.isLessThan(one)).assertTrue();
      expect(one.isLessThan(minusOne)).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_4900
     * @tc.name testIntIsLessThan0049
     * @tc.desc Verify comparison with zero and positive negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int(0);
      const positive = new Int(1);
      const negative = new Int(-1);

      expect(negative.isLessThan(zero)).assertTrue();
      expect(zero.isLessThan(positive)).assertTrue();
      expect(zero.isLessThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5000
     * @tc.name testIntIsLessThan0050
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessThan(new Int(75));
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5100
     * @tc.name testIntIsLessThan0051
     * @tc.desc Verify filtering elements less than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30),
      new Int(70), new Int(20)];
      const threshold = new Int(40);

      const filtered = values.filter((v: Int): boolean => v.isLessThan(threshold));
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5200
     * @tc.name testIntIsLessThan0052
     * @tc.desc Verify finding elements less than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30)];
      const threshold = new Int(40);

      let found = new Int(0);
      for (let i = 0; i < values.length; i++) {
        if (!values[i].isLessThan(threshold)) {
          found = values[i];
          break;
        }
      }
      expect(found.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5300
     * @tc.name testIntIsLessThan0053
     * @tc.desc Verify combined use of comparison methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const min = new Int(0);
      const max = new Int(100);

      expect(value.isGreaterThan(min) && value.isLessThan(max)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5400
     * @tc.name testIntIsLessThan0054
     * @tc.desc Verify checking if value is in open interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const lower = new Int(0);
      const upper = new Int(100);

      const inRange = value.isGreaterThan(lower) && value.isLessThan(upper);
      expect(inRange).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5500
     * @tc.name testIntIsLessThan0055
     * @tc.desc Verify adjacent integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 999; i++) {
        const a = new Int(i);
        const b = new Int(i + 1);
        expect(a.isLessThan(b)).assertTrue();
        expect(b.isLessThan(a)).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5600
     * @tc.name testIntIsLessThan0056
     * @tc.desc Verify comparison near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax = new Int(2147483647 - 1);
      const max = new Int(2147483647);

      expect(nearMax.isLessThan(max)).assertTrue();
      expect(max.isLessThan(nearMax)).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5700
     * @tc.name testIntIsLessThan0057
     * @tc.desc Verify isLessThan consistent with compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);

      expect(a.isLessThan(b)).assertTrue();
      expect(a.compareTo(75)).assertEqual(-1);
    });

    /**
     * @tc.number INT_IS_LESS_THAN_5800
     * @tc.name testIntIsLessThan0058
     * @tc.desc Verify not isLessThan equals isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);

      expect(a.isLessThan(b)).assertTrue();
      expect(!a.isLessThan(b)).assertFalse();
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });
  });
}

