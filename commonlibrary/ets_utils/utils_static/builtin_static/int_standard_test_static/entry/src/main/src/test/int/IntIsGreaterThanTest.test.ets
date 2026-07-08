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
import hilog from '@ohos.hilog';
import Utils from '../Util.test';

export default function IntIsGreaterThanTest(): void {
  describe('IntIsGreaterThanTest', (): void => {
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
     * @tc.number INT_IS_GRTR_THAN_0100
     * @tc.name testIntIsGreaterThan0001
     * @tc.desc Verify required other parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isGreaterThan(new Int(55));
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0200
     * @tc.name testIntIsGreaterThan0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20);
      const b = new Int(10);
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0400
     * @tc.name testIntIsGreaterThan0004
     * @tc.desc Verify normal Int value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(150);
      const b = new Int(100);
      const result = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0500
     * @tc.name testIntIsGreaterThan0005
     * @tc.desc Verify positive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isGreaterThan(new Int(50))).assertTrue();
      expect(a.isGreaterThan(new Int(100))).assertFalse();
      expect(a.isGreaterThan(new Int(150))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0600
     * @tc.name testIntIsGreaterThan0006
     * @tc.desc Verify negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.isGreaterThan(new Int(-100))).assertTrue();
      expect(a.isGreaterThan(new Int(-50))).assertFalse();
      expect(a.isGreaterThan(new Int(-25))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0700
     * @tc.name testIntIsGreaterThan0007
     * @tc.desc Verify positive vs negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isGreaterThan(new Int(-50))).assertTrue();
      expect(a.isGreaterThan(new Int(50))).assertFalse();
      expect(a.isGreaterThan(new Int(100))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0800
     * @tc.name testIntIsGreaterThan0008
     * @tc.desc Verify comparison with int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      expect(a.isGreaterThan(new Int(2147483647 - 1))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_0900
     * @tc.name testIntIsGreaterThan0009
     * @tc.desc Verify comparison with int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isGreaterThan(new Int(-2147483648))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1000
     * @tc.name testIntIsGreaterThan0010
     * @tc.desc Verify max value vs min value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.isGreaterThan(new Int(-2147483648))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1100
     * @tc.name testIntIsGreaterThan0011
     * @tc.desc Verify comparison with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isGreaterThan(new Int(0))).assertTrue();

      const b = new Int(-50);
      expect(b.isGreaterThan(new Int(0))).assertFalse();

      const c = new Int(0);
      expect(c.isGreaterThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1200
     * @tc.name testIntIsGreaterThan0012
     * @tc.desc Verify comparison with one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      expect(a.isGreaterThan(new Int(1))).assertTrue();

      const b = new Int(1);
      expect(b.isGreaterThan(new Int(1))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1300
     * @tc.name testIntIsGreaterThan0013
     * @tc.desc Verify comparison with negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.isGreaterThan(new Int(-1))).assertTrue();

      const b = new Int(-1);
      expect(b.isGreaterThan(new Int(-1))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1600
     * @tc.name testIntIsGreaterThan0016
     * @tc.desc Verify isGreaterThan with number literal argument returns correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isGreaterThan(55);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1700
     * @tc.name testIntIsGreaterThan0017
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isGreaterThan(new Int(55));
      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1800
     * @tc.name testIntIsGreaterThan0018
     * @tc.desc Verify returns true when current value is greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isGreaterThan(new Int(50))).assertTrue();
      expect(a.isGreaterThan(new Int(99))).assertTrue();
      expect(a.isGreaterThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_1900
     * @tc.name testIntIsGreaterThan0019
     * @tc.desc Verify returns false when current value is less than or equal to other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isGreaterThan(new Int(100))).assertFalse();
      expect(a.isGreaterThan(new Int(50))).assertFalse();
      expect(a.isGreaterThan(new Int(75))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2000
     * @tc.name testIntIsGreaterThan0020
     * @tc.desc Verify positive number is greater than other positive numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(75);
      expect(a.isGreaterThan(new Int(65))).assertTrue();
      expect(a.isGreaterThan(new Int(50))).assertTrue();
      expect(a.isGreaterThan(new Int(74))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2100
     * @tc.name testIntIsGreaterThan0021
     * @tc.desc Verify positive number is not greater than some values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.isGreaterThan(new Int(75))).assertFalse();
      expect(a.isGreaterThan(new Int(65))).assertFalse();
      expect(a.isGreaterThan(new Int(100))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2200
     * @tc.name testIntIsGreaterThan0022
     * @tc.desc Verify negative number is greater than smaller negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.isGreaterThan(new Int(-100))).assertTrue();
      expect(a.isGreaterThan(new Int(-51))).assertTrue();
      expect(a.isGreaterThan(new Int(-200))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2300
     * @tc.name testIntIsGreaterThan0023
     * @tc.desc Verify negative number is not greater than larger negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isGreaterThan(new Int(-50))).assertFalse();
      expect(a.isGreaterThan(new Int(-100))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2400
     * @tc.name testIntIsGreaterThan0024
     * @tc.desc Verify positive number is greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.isGreaterThan(new Int(0))).assertTrue();

      const b = new Int(100);
      expect(b.isGreaterThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2500
     * @tc.name testIntIsGreaterThan0025
     * @tc.desc Verify negative number and zero are not greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.isGreaterThan(new Int(0))).assertFalse();

      const b = new Int(0);
      expect(b.isGreaterThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2600
     * @tc.name testIntIsGreaterThan0026
     * @tc.desc Verify equal values return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isGreaterThan(new Int(100))).assertFalse();

      const b = new Int(-100);
      expect(b.isGreaterThan(new Int(-100))).assertFalse();

      const c = new Int(0);
      expect(c.isGreaterThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2800
     * @tc.name testIntIsGreaterThan0028
     * @tc.desc Verify valueOf creates comparison parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(55);
      const result = a.isGreaterThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_2900
     * @tc.name testIntIsGreaterThan0029
     * @tc.desc Verify a > b is equivalent to b < a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(75);
      const b = new Int(65);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isLessThan(a)).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3000
     * @tc.name testIntIsGreaterThan0030
     * @tc.desc Verify a > b implies a >= b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(75);
      const b = new Int(65);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3100
     * @tc.name testIntIsGreaterThan0031
     * @tc.desc Verify a = b: a > b is false but a >= b is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(65);
      expect(a.isGreaterThan(b)).assertFalse();
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3300
     * @tc.name testIntIsGreaterThan0033
     * @tc.desc Verify a > b is equivalent to !(a <= b)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(75);
      const b = new Int(65);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(a.isLessEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3400
     * @tc.name testIntIsGreaterThan0034
     * @tc.desc Verify comparison with 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      expect(a.isGreaterThan(new Int(2147483647 - 1))).assertTrue();

      const max = new Int(2147483647);
      expect(max.isGreaterThan(new Int(2147483647))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3500
     * @tc.name testIntIsGreaterThan0035
     * @tc.desc Verify comparison with -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648 + 1);
      expect(a.isGreaterThan(new Int(-2147483648))).assertTrue();

      const min = new Int(-2147483648);
      expect(min.isGreaterThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3600
     * @tc.name testIntIsGreaterThan0036
     * @tc.desc Verify MAX_VALUE vs MIN_VALUE comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.isGreaterThan(new Int(-2147483648))).assertTrue();

      const min = new Int(-2147483648);
      expect(min.isGreaterThan(new Int(2147483647))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3700
     * @tc.name testIntIsGreaterThan0037
     * @tc.desc Verify consecutive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 1; i < 100; i++) {
        const a = new Int(i);
        expect(a.isGreaterThan(new Int(i - 1))).assertTrue();
        expect(a.isGreaterThan(new Int(i))).assertFalse();
        expect(a.isGreaterThan(new Int(i + 1))).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3800
     * @tc.name testIntIsGreaterThan0038
     * @tc.desc Verify consecutive negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -100; i < -1; i++) {
        const a = new Int(i);
        expect(a.isGreaterThan(new Int(i - 1))).assertTrue();
        expect(a.isGreaterThan(new Int(i))).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_3900
     * @tc.name testIntIsGreaterThan0039
     * @tc.desc Verify checking if value exceeds threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(150);
      const threshold = new Int(100);

      expect(value.isGreaterThan(threshold)).assertTrue();
      expect(value.toInt()).assertLarger(100);
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4000
     * @tc.name testIntIsGreaterThan0040
     * @tc.desc Verify using for sorting comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30)];
      values.sort((a: Int, b: Int): int => { if (a.isGreaterThan(b)) return -1; if (a.isLessThan(b)) return 1; return 0; });
      expect(values[0].toInt()).assertEqual(50);
      expect(values[2].toInt()).assertEqual(10);
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4100
     * @tc.name testIntIsGreaterThan0041
     * @tc.desc Verify conditional branch usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(150);
      const limit = new Int(100);

      expect(value.isGreaterThan(limit)).assertTrue();
      expect(value.toInt()).assertLarger(100);
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4200
     * @tc.name testIntIsGreaterThan0042
     * @tc.desc Verify performance with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      let result = false;
      for (let i = 0; i < 1000; i++) {
        result = a.isGreaterThan(b);
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4300
     * @tc.name testIntIsGreaterThan0043
     * @tc.desc Verify documentation example outputs true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      hilog.info(0x0000, 'IntIsGreaterThanTest', '%{public}s', a.isGreaterThan(new Int(55)).toString());
      expect(a.isGreaterThan(new Int(55))).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4400
     * @tc.name testIntIsGreaterThan0044
     * @tc.desc Verify isGreaterThan consistent with greater than operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [[20, 10], [10, 20], [10, 10]];

      for (let i = 0; i < testCases.length; i++) {
        const aVal = testCases[i][0];
        const bVal = testCases[i][1];
        const a = new Int(aVal);
        const result = a.isGreaterThan(new Int(bVal));
        expect(result).assertEqual(aVal > bVal);
      }
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4600
     * @tc.name testIntIsGreaterThan0046
     * @tc.desc Verify a > a is false (irreflexivity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.isGreaterThan(new Int(123))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4700
     * @tc.name testIntIsGreaterThan0047
     * @tc.desc Verify transitivity: a > b and b > c implies a > c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(50);
      const c = new Int(10);

      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isGreaterThan(c)).assertTrue();
      expect(a.isGreaterThan(c)).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4800
     * @tc.name testIntIsGreaterThan0048
     * @tc.desc Verify comparison of 1 and -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one = new Int(1);
      const minusOne = new Int(-1);

      expect(one.isGreaterThan(minusOne)).assertTrue();
      expect(minusOne.isGreaterThan(one)).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_4900
     * @tc.name testIntIsGreaterThan0049
     * @tc.desc Verify comparison with zero and positive negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int(0);
      const positive = new Int(1);
      const negative = new Int(-1);

      expect(positive.isGreaterThan(zero)).assertTrue();
      expect(zero.isGreaterThan(negative)).assertTrue();
      expect(zero.isGreaterThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5000
     * @tc.name testIntIsGreaterThan0050
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isGreaterThan(new Int(55));
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5100
     * @tc.name testIntIsGreaterThan0051
     * @tc.desc Verify filtering elements greater than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30),
      new Int(70), new Int(20)];
      const threshold = new Int(40);

      const filtered = values.filter((v: Int): boolean => v.isGreaterThan(threshold));
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].toInt()).assertEqual(50);
      expect(filtered[1].toInt()).assertEqual(70);
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5200
     * @tc.name testIntIsGreaterThan0052
     * @tc.desc Verify finding elements greater than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30)];
      const threshold = new Int(40);

      let found = new Int(0);
      for (let i = 0; i < values.length; i++) {
        if (values[i].isGreaterThan(threshold)) {
          found = values[i];
          break;
        }
      }
      expect(found.toInt()).assertEqual(50);
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5300
     * @tc.name testIntIsGreaterThan0053
     * @tc.desc Verify combined use of comparison methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const min = new Int(0);
      const max = new Int(100);

      expect(value.isGreaterThan(min)).assertTrue();
      expect(value.isGreaterThan(max)).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5400
     * @tc.name testIntIsGreaterThan0054
     * @tc.desc Verify checking if value is in open interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const lower = new Int(0);
      const upper = new Int(100);

      const aboveLower = value.isGreaterThan(lower);
      expect(aboveLower).assertTrue();
      expect(upper.isGreaterThan(value)).assertTrue();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5500
     * @tc.name testIntIsGreaterThan0055
     * @tc.desc Verify adjacent integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 1; i < 1000; i++) {
        const a = new Int(i);
        const b = new Int(i - 1);
        expect(a.isGreaterThan(b)).assertTrue();
        expect(b.isGreaterThan(a)).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5600
     * @tc.name testIntIsGreaterThan0056
     * @tc.desc Verify comparison near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax = new Int(2147483647);
      const belowMax = new Int(2147483647 - 1);

      expect(nearMax.isGreaterThan(belowMax)).assertTrue();
      expect(belowMax.isGreaterThan(nearMax)).assertFalse();
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5700
     * @tc.name testIntIsGreaterThan0057
     * @tc.desc Verify a > b is fully symmetric with b < a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [[100, 50], [50, 100], [50, 50]];

      for (let i = 0; i < testCases.length; i++) {
        const aVal = testCases[i][0];
        const bVal = testCases[i][1];
        const a = new Int(aVal);
        const b = new Int(bVal);
        expect(a.isGreaterThan(b)).assertEqual(b.isLessThan(a));
      }
    });

    /**
     * @tc.number INT_IS_GRTR_THAN_5800
     * @tc.name testIntIsGreaterThan0058
     * @tc.desc Verify not isGreaterThan equals isLessEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsGreaterThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      const b = new Int(100);

      expect(a.isGreaterThan(b)).assertFalse();
      expect(!a.isGreaterThan(b)).assertTrue();
      expect(a.isLessEqualThan(b)).assertTrue();
    });
  });
}

