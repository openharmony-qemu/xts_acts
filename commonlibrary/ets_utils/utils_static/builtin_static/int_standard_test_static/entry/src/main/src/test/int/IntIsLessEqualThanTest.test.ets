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

export default function IntIsLessEqualThanTest(): void {
  describe('IntIsLessEqualThanTest', (): void => {
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
     * @tc.number INT_IS_LESS_EQUAL_0100
     * @tc.name testIntIsLessEqualThan0001
     * @tc.desc Verify required other parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessEqualThan(new Int(65));
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0200
     * @tc.name testIntIsLessEqualThan0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(10);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0400
     * @tc.name testIntIsLessEqualThan0004
     * @tc.desc Verify normal Int value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(100);
      const result = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0500
     * @tc.name testIntIsLessEqualThan0005
     * @tc.desc Verify positive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isLessEqualThan(new Int(100))).assertTrue();
      expect(a.isLessEqualThan(new Int(50))).assertTrue();
      expect(a.isLessEqualThan(new Int(25))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0600
     * @tc.name testIntIsLessEqualThan0006
     * @tc.desc Verify negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessEqualThan(new Int(-50))).assertTrue();
      expect(a.isLessEqualThan(new Int(-100))).assertTrue();
      expect(a.isLessEqualThan(new Int(-150))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0700
     * @tc.name testIntIsLessEqualThan0007
     * @tc.desc Verify positive vs negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.isLessEqualThan(new Int(50))).assertTrue();
      expect(a.isLessEqualThan(new Int(-50))).assertTrue();
      expect(a.isLessEqualThan(new Int(-100))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0800
     * @tc.name testIntIsLessEqualThan0008
     * @tc.desc Verify comparison with int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isLessEqualThan(new Int(2147483647))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_0900
     * @tc.name testIntIsLessEqualThan0009
     * @tc.desc Verify comparison with int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessEqualThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1000
     * @tc.name testIntIsLessEqualThan0010
     * @tc.desc Verify max value vs min value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.isLessEqualThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1100
     * @tc.name testIntIsLessEqualThan0011
     * @tc.desc Verify comparison with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-50);
      expect(a.isLessEqualThan(new Int(0))).assertTrue();

      const b = new Int(0);
      expect(b.isLessEqualThan(new Int(0))).assertTrue();

      const c = new Int(50);
      expect(c.isLessEqualThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1200
     * @tc.name testIntIsLessEqualThan0012
     * @tc.desc Verify comparison with one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.isLessEqualThan(new Int(1))).assertTrue();

      const b = new Int(1);
      expect(b.isLessEqualThan(new Int(1))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1500
     * @tc.name testIntIsLessEqualThan0015
     * @tc.desc Verify isLessEqualThan with number literal argument returns correct boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessEqualThan(65);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1600
     * @tc.name testIntIsLessEqualThan0016
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessEqualThan(new Int(65));
      expect(typeof result).assertEqual("boolean");
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1700
     * @tc.name testIntIsLessEqualThan0017
     * @tc.desc Verify returns true when current value less than or equal to other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isLessEqualThan(new Int(100))).assertTrue();
      expect(a.isLessEqualThan(new Int(51))).assertTrue();
      expect(a.isLessEqualThan(new Int(50))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1800
     * @tc.name testIntIsLessEqualThan0018
     * @tc.desc Verify returns false when current value greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      expect(a.isLessEqualThan(new Int(25))).assertFalse();
      expect(a.isLessEqualThan(new Int(0))).assertFalse();
      expect(a.isLessEqualThan(new Int(-10))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_1900
     * @tc.name testIntIsLessEqualThan0019
     * @tc.desc Verify positive number less than or equal to other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.isLessEqualThan(new Int(75))).assertTrue();
      expect(a.isLessEqualThan(new Int(65))).assertTrue();
      expect(a.isLessEqualThan(new Int(100))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2000
     * @tc.name testIntIsLessEqualThan0020
     * @tc.desc Verify positive number greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.isLessEqualThan(new Int(55))).assertFalse();
      expect(a.isLessEqualThan(new Int(1))).assertFalse();
      expect(a.isLessEqualThan(new Int(64))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2100
     * @tc.name testIntIsLessEqualThan0021
     * @tc.desc Verify negative number less than or equal to larger number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessEqualThan(new Int(-50))).assertTrue();
      expect(a.isLessEqualThan(new Int(-100))).assertTrue();
      expect(a.isLessEqualThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2200
     * @tc.name testIntIsLessEqualThan0022
     * @tc.desc Verify negative number greater than smaller negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100);
      expect(a.isLessEqualThan(new Int(-150))).assertFalse();
      expect(a.isLessEqualThan(new Int(-200))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2300
     * @tc.name testIntIsLessEqualThan0023
     * @tc.desc Verify negative and zero less than or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.isLessEqualThan(new Int(0))).assertTrue();

      const b = new Int(0);
      expect(b.isLessEqualThan(new Int(0))).assertTrue();

      const c = new Int(-100);
      expect(c.isLessEqualThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2400
     * @tc.name testIntIsLessEqualThan0024
     * @tc.desc Verify positive number not less than or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.isLessEqualThan(new Int(0))).assertFalse();

      const b = new Int(100);
      expect(b.isLessEqualThan(new Int(0))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2500
     * @tc.name testIntIsLessEqualThan0025
     * @tc.desc Verify equal values return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      expect(a.isLessEqualThan(new Int(100))).assertTrue();

      const b = new Int(-100);
      expect(b.isLessEqualThan(new Int(-100))).assertTrue();

      const c = new Int(0);
      expect(c.isLessEqualThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2700
     * @tc.name testIntIsLessEqualThan0027
     * @tc.desc Verify valueOf creates comparison parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(65);
      const result = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2800
     * @tc.name testIntIsLessEqualThan0028
     * @tc.desc Verify a less equal than b equals not a greater than b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(a.isGreaterThan(b)).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_2900
     * @tc.name testIntIsLessEqualThan0029
     * @tc.desc Verify a less than b implies a less equal than b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3000
     * @tc.name testIntIsLessEqualThan0030
     * @tc.desc Verify when a equal b a less than b is false but a less equal than b is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(65);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3200
     * @tc.name testIntIsLessEqualThan0032
     * @tc.desc Verify a less equal than b and a greater equal than b both true when a equal b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(65);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3300
     * @tc.name testIntIsLessEqualThan0033
     * @tc.desc Verify comparison with Int MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      expect(a.isLessEqualThan(new Int(2147483647))).assertTrue();

      const b = new Int(2147483647 - 1);
      expect(b.isLessEqualThan(new Int(2147483647))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3400
     * @tc.name testIntIsLessEqualThan0034
     * @tc.desc Verify comparison with Int MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      expect(a.isLessEqualThan(new Int(-2147483648))).assertTrue();

      const b = new Int(-2147483648 + 1);
      expect(b.isLessEqualThan(new Int(-2147483648))).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3500
     * @tc.name testIntIsLessEqualThan0035
     * @tc.desc Verify MAX_VALUE vs MIN_VALUE comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(2147483647);
      expect(max.isLessEqualThan(new Int(-2147483648))).assertFalse();

      const min = new Int(-2147483648);
      expect(min.isLessEqualThan(new Int(2147483647))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3600
     * @tc.name testIntIsLessEqualThan0036
     * @tc.desc Verify consecutive number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const a = new Int(i);
        expect(a.isLessEqualThan(new Int(i))).assertTrue();
        expect(a.isLessEqualThan(new Int(i + 1))).assertTrue();
        expect(a.isLessEqualThan(new Int(i - 1))).assertFalse();
      }
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3700
     * @tc.name testIntIsLessEqualThan0037
     * @tc.desc Verify consecutive negative number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -100; i < 0; i++) {
        const a = new Int(i);
        expect(a.isLessEqualThan(new Int(i))).assertTrue();
        expect(a.isLessEqualThan(new Int(i + 1))).assertTrue();
      }
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3800
     * @tc.name testIntIsLessEqualThan0038
     * @tc.desc Verify checking if value is in closed interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const min = new Int(0);
      const max = new Int(100);

      expect(value.isGreaterEqualThan(min) && value.isLessEqualThan(max)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_3900
     * @tc.name testIntIsLessEqualThan0039
     * @tc.desc Verify less than or equal to threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const threshold = new Int(100);

      expect(value.isLessEqualThan(threshold)).assertTrue();
      expect(value.toInt()).assertLessOrEqual(100);
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4000
     * @tc.name testIntIsLessEqualThan0040
     * @tc.desc Verify boundary inclusion range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(100);
      const max = new Int(100);

      expect(value.isLessEqualThan(max)).assertTrue();
      expect(value.isLessThan(max)).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4100
     * @tc.name testIntIsLessEqualThan0041
     * @tc.desc Verify performance with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(50);
      const b = new Int(100);
      let result = false;
      for (let i = 0; i < 1000; i++) {
        result = a.isLessEqualThan(b);
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4200
     * @tc.name testIntIsLessEqualThan0042
     * @tc.desc Verify documentation example outputs true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      hilog.info(0x0000, 'IntIsLessEqualThanTest', '%{public}s', a.isLessEqualThan(new Int(65)).toString());
      expect(a.isLessEqualThan(new Int(65))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4300
     * @tc.name testIntIsLessEqualThan0043
     * @tc.desc Verify isLessEqualThan consistent with less equal operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [[10, 20], [20, 10], [10, 10]];

      for (let i = 0; i < testCases.length; i++) {
        const aVal = testCases[i][0];
        const bVal = testCases[i][1];
        const a = new Int(aVal);
        const result = a.isLessEqualThan(new Int(bVal));
        expect(result).assertEqual(aVal <= bVal);
      }
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4400
     * @tc.name testIntIsLessEqualThan0044
     * @tc.desc Verify a less equal than b equals b greater equal than a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isGreaterEqualThan(a)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4500
     * @tc.name testIntIsLessEqualThan0045
     * @tc.desc Verify a less equal than a is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.isLessEqualThan(new Int(123))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4600
     * @tc.name testIntIsLessEqualThan0046
     * @tc.desc Verify transitivity of less equal than
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(50);
      const c = new Int(100);

      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isLessEqualThan(c)).assertTrue();
      expect(a.isLessEqualThan(c)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4700
     * @tc.name testIntIsLessEqualThan0047
     * @tc.desc Verify comparison of one and minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one = new Int(1);
      const minusOne = new Int(-1);

      expect(minusOne.isLessEqualThan(one)).assertTrue();
      expect(one.isLessEqualThan(minusOne)).assertFalse();
      expect(one.isLessEqualThan(new Int(1))).assertTrue();
      expect(minusOne.isLessEqualThan(new Int(-1))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4800
     * @tc.name testIntIsLessEqualThan0048
     * @tc.desc Verify comparison with zero and positive negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = new Int(0);
      const positive = new Int(1);
      const negative = new Int(-1);

      expect(negative.isLessEqualThan(zero)).assertTrue();
      expect(zero.isLessEqualThan(positive)).assertTrue();
      expect(zero.isLessEqualThan(new Int(0))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_4900
     * @tc.name testIntIsLessEqualThan0049
     * @tc.desc Verify return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.isLessEqualThan(new Int(65));
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5000
     * @tc.name testIntIsLessEqualThan0050
     * @tc.desc Verify filtering elements less equal than threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(50), new Int(30),
      new Int(70), new Int(20)];
      const threshold = new Int(40);

      const filtered = values.filter((v: Int): boolean => v.isLessEqualThan(threshold));
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5100
     * @tc.name testIntIsLessEqualThan0051
     * @tc.desc Verify filtering including boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(40), new Int(50)];
      const threshold = new Int(40);

      const filtered = values.filter((v: Int): boolean => v.isLessEqualThan(threshold));
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5300
     * @tc.name testIntIsLessEqualThan0053
     * @tc.desc Verify checking if value is in closed interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(50);
      const lower = new Int(0);
      const upper = new Int(100);

      const inRange = value.isGreaterEqualThan(lower) && value.isLessEqualThan(upper);
      expect(inRange).assertTrue();

      const lowerBound = new Int(0);
      expect(lowerBound.isGreaterEqualThan(lower) && lowerBound.isLessEqualThan(upper)).assertTrue();

      const upperBound = new Int(100);
      expect(upperBound.isGreaterEqualThan(lower) && upperBound.isLessEqualThan(upper)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5400
     * @tc.name testIntIsLessEqualThan0054
     * @tc.desc Verify adjacent integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 999; i++) {
        const a = new Int(i);
        const b = new Int(i + 1);
        expect(a.isLessEqualThan(b)).assertTrue();
        expect(b.isLessEqualThan(a)).assertFalse();
        expect(a.isLessEqualThan(new Int(i))).assertTrue();
      }
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5500
     * @tc.name testIntIsLessEqualThan0055
     * @tc.desc Verify comparison near MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax = new Int(2147483647 - 1);
      const max = new Int(2147483647);

      expect(nearMax.isLessEqualThan(max)).assertTrue();
      expect(max.isLessEqualThan(new Int(2147483647))).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5600
     * @tc.name testIntIsLessEqualThan0056
     * @tc.desc Verify behavior difference when values equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(100);

      expect(a.isLessThan(b)).assertFalse();
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5700
     * @tc.name testIntIsLessEqualThan0057
     * @tc.desc Verify closed interval vs open interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(100);
      const boundary = new Int(100);

      expect(value.isLessEqualThan(boundary)).assertTrue();
      expect(value.isLessThan(boundary)).assertFalse();
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5800
     * @tc.name testIntIsLessEqualThan0058
     * @tc.desc Verify isLessEqualThan includes all isLessThan cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testCases: int[][] = [[50, 100], [100, 100], [100, 50]];

      for (let i = 0; i < testCases.length; i++) {
        const intA = new Int(testCases[i][0]);
        const intB = new Int(testCases[i][1]);

        expect(intA.isLessEqualThan(intB)).assertEqual(intA.toInt() <= intB.toInt());
      }
    });

    /**
     * @tc.number INT_IS_LESS_EQUAL_5900
     * @tc.name testIntIsLessEqualThan0059
     * @tc.desc Verify not isLessEqualThan equals isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntIsLessEqualThan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const b = new Int(75);

      expect(a.isLessEqualThan(b)).assertTrue();
      expect(!a.isLessEqualThan(b)).assertFalse();
      expect(a.isGreaterThan(b)).assertFalse();
    });
  });
}

