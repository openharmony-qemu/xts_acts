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

export default function DoubleIsSafeIntegerOneTest(): void {
  describe('DoubleIsSafeIntegerOneTest', (): void => {
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
     * @tc.number DBL_IS_SAFE_INTGR_0100
     * @tc.name testDoubleIsSafeIntegerOne0001
     * @tc.desc Verify calling with one required parameter normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(2.0);
      expect(result).assertTrue();
    });
/**
     * @tc.number DBL_IS_SAFE_INTGR_0400
     * @tc.name testDoubleIsSafeIntegerOne0004
     * @tc.desc Verify isSafeInteger returns true for double value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_0500
     * @tc.name testDoubleIsSafeIntegerOne0005
     * @tc.desc Verify isSafeInteger returns true for negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_0600
     * @tc.name testDoubleIsSafeIntegerOne0006
     * @tc.desc Verify isSafeInteger returns true for positive integer double value 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_0700
     * @tc.name testDoubleIsSafeIntegerOne0007
     * @tc.desc Verify isSafeInteger returns true for larger positive integer 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(100.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_0800
     * @tc.name testDoubleIsSafeIntegerOne0008
     * @tc.desc Verify isSafeInteger returns true for negative integer -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(-1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_0900
     * @tc.name testDoubleIsSafeIntegerOne0009
     * @tc.desc Verify isSafeInteger returns true for larger negative integer -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(-100.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1000
     * @tc.name testDoubleIsSafeIntegerOne0010
     * @tc.desc Verify isSafeInteger returns false for non-integer double value 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(2.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1100
     * @tc.name testDoubleIsSafeIntegerOne0011
     * @tc.desc Verify isSafeInteger returns false for negative non-integer -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1200
     * @tc.name testDoubleIsSafeIntegerOne0012
     * @tc.desc Verify isSafeInteger returns true for scientific notation integer 1.0e2 (100.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(1.0e2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1300
     * @tc.name testDoubleIsSafeIntegerOne0013
     * @tc.desc Verify isSafeInteger returns true for scientific notation 1.5e1 (15.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(1.5e1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1400
     * @tc.name testDoubleIsSafeIntegerOne0014
     * @tc.desc Verify isSafeInteger returns true for Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1500
     * @tc.name testDoubleIsSafeIntegerOne0015
     * @tc.desc Verify isSafeInteger returns true for Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1600
     * @tc.name testDoubleIsSafeIntegerOne0016
     * @tc.desc Verify isSafeInteger returns false for value beyond safe integer upper bound MAX_SAFE_INTEGER + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MAX_SAFE_INTEGER + 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1700
     * @tc.name testDoubleIsSafeIntegerOne0017
     * @tc.desc Verify isSafeInteger returns false for value beyond safe integer lower bound MIN_SAFE_INTEGER - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MIN_SAFE_INTEGER - 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1800
     * @tc.name testDoubleIsSafeIntegerOne0018
     * @tc.desc Verify isSafeInteger returns false for Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MAX_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_1900
     * @tc.name testDoubleIsSafeIntegerOne0019
     * @tc.desc Verify isSafeInteger returns false for Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MIN_VALUE);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2000
     * @tc.name testDoubleIsSafeIntegerOne0020
     * @tc.desc Verify isSafeInteger returns false for MAX_SAFE_INTEGER + 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.MAX_SAFE_INTEGER + 0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2100
     * @tc.name testDoubleIsSafeIntegerOne0021
     * @tc.desc Verify isSafeInteger returns false for Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2200
     * @tc.name testDoubleIsSafeIntegerOne0022
     * @tc.desc Verify isSafeInteger returns false for Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2300
     * @tc.name testDoubleIsSafeIntegerOne0023
     * @tc.desc Verify isSafeInteger returns false for Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(Double.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2400
     * @tc.name testDoubleIsSafeIntegerOne0024
     * @tc.desc Verify isSafeInteger returns false for large scientific notation 1.0e308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(1.0e308);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2500
     * @tc.name testDoubleIsSafeIntegerOne0025
     * @tc.desc Verify isSafeInteger returns false for small scientific notation 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(1.0e-308);
      expect(result).assertFalse();
    });
/**
     * @tc.number DBL_IS_SAFE_INTGR_2700
     * @tc.name testDoubleIsSafeIntegerOne0027
     * @tc.desc Verify isSafeInteger returns false for non-integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(3.14);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_2900
     * @tc.name testDoubleIsSafeIntegerOne0029
     * @tc.desc Verify isSafeInteger returns true for multiple safe integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.0, 1.0, -1.0, 2.0, -2.0, 100.0, -100.0, 9007199254740991.0, -9007199254740991.0];
      for (let v of values) {
        let result: boolean = Double.isSafeInteger(v);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_3000
     * @tc.name testDoubleIsSafeIntegerOne0030
     * @tc.desc Verify isSafeInteger returns false for non-integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [2.5, 3.14, 0.1, -0.5, -3.14];
      for (let v of values) {
        let result: boolean = Double.isSafeInteger(v);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_3100
     * @tc.name testDoubleIsSafeIntegerOne0031
     * @tc.desc Verify isSafeInteger returns false for values beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isSafeInteger(9007199254740992.0);
      expect(result1).assertFalse();
      let result2: boolean = Double.isSafeInteger(-9007199254740992.0);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_3800
     * @tc.name testDoubleIsSafeIntegerOne0038
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(2.0);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_3900
     * @tc.name testDoubleIsSafeIntegerOne0039
     * @tc.desc Verify return value true strictly equals boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(2.0);
      expect(result === true).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_4000
     * @tc.name testDoubleIsSafeIntegerOne0040
     * @tc.desc Verify return value false strictly equals boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isSafeInteger(2.5);
      expect(result === false).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_4800
     * @tc.name testDoubleIsSafeIntegerOne0048
     * @tc.desc Verify special values NaN and Infinity do not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isSafeInteger(Double.NaN);
      expect(result1).assertFalse();
      let result2: boolean = Double.isSafeInteger(Double.POSITIVE_INFINITY);
      expect(result2).assertFalse();
      let result3: boolean = Double.isSafeInteger(Double.NEGATIVE_INFINITY);
      expect(result3).assertFalse();
    });
/**
     * @tc.number DBL_IS_SAFE_INTGR_5100
     * @tc.name testDoubleIsSafeIntegerOne0051
     * @tc.desc Verify consecutive calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isSafeInteger(2.0);
      let result2: boolean = Double.isSafeInteger(2.0);
      let result3: boolean = Double.isSafeInteger(2.0);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_5200
     * @tc.name testDoubleIsSafeIntegerOne0052
     * @tc.desc Verify isInteger returns true but isSafeInteger returns false for value beyond safe range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeValue: double = 9007199254740992.0;
      let isInt: boolean = Double.isInteger(largeValue);
      let isSafe: boolean = Double.isSafeInteger(largeValue);
      expect(isInt).assertTrue();
      expect(isSafe).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_5300
     * @tc.name testDoubleIsSafeIntegerOne0053
     * @tc.desc Verify safe integer satisfies both isInteger and isSafeInteger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 42.0;
      let isInt: boolean = Double.isInteger(value);
      let isSafe: boolean = Double.isSafeInteger(value);
      expect(isInt).assertTrue();
      expect(isSafe).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_5400
     * @tc.name testDoubleIsSafeIntegerOne0054
     * @tc.desc Verify non-integer returns false for both isInteger and isSafeInteger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 2.5;
      let isInt: boolean = Double.isInteger(value);
      let isSafe: boolean = Double.isSafeInteger(value);
      expect(isInt).assertFalse();
      expect(isSafe).assertFalse();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_5500
     * @tc.name testDoubleIsSafeIntegerOne0055
     * @tc.desc Verify static method and instance method return same result for safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 2.0;
      let staticResult: boolean = Double.isSafeInteger(value);
      let instance: Double = new Double(value);
      let instanceResult: boolean = instance.isSafeInteger();
      expect(staticResult).assertEqual(instanceResult);
      expect(staticResult).assertTrue();
    });

    /**
     * @tc.number DBL_IS_SAFE_INTGR_5600
     * @tc.name testDoubleIsSafeIntegerOne0056
     * @tc.desc Verify static method and instance method return same result for non-safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsSafeIntegerOne0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: double = 2.5;
      let staticResult: boolean = Double.isSafeInteger(value);
      let instance: Double = new Double(value);
      let instanceResult: boolean = instance.isSafeInteger();
      expect(staticResult).assertEqual(instanceResult);
      expect(staticResult).assertFalse();
    });

  });
}
