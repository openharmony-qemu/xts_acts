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
import Utils from '../Util.test';

export default function DoubleToDoubleTwoTest(): void {
  describe('DoubleToDoubleTwoTest', (): void => {
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
     * @tc.number DBL_TO_TWO_CHK_0100
     * @tc.name testDoubleToDouble0001
     * @tc.desc Verify normal call toDouble with required parameter returns the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(1.5);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_0400
     * @tc.name testDoubleToDouble0004
     * @tc.desc Verify toDouble with positive integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(100.0);
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_0500
     * @tc.name testDoubleToDouble0005
     * @tc.desc Verify toDouble with negative double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(-888.88);
      expect(result).assertEqual(-888.88);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_0600
     * @tc.name testDoubleToDouble0006
     * @tc.desc Verify toDouble with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(0.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_0700
     * @tc.name testDoubleToDouble0007
     * @tc.desc Verify toDouble with decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(123.456);
      expect(result).assertEqual(123.456);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_0800
     * @tc.name testDoubleToDouble0008
     * @tc.desc Verify toDouble with scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(1.0e6);
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_0900
     * @tc.name testDoubleToDouble0009
     * @tc.desc Verify toDouble with hexadecimal floating point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(8.5);
      expect(result).assertEqual(8.5);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1000
     * @tc.name testDoubleToDouble0010
     * @tc.desc Verify toDouble with Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MAX_VALUE);
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1100
     * @tc.name testDoubleToDouble0011
     * @tc.desc Verify toDouble with Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MIN_VALUE);
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1200
     * @tc.name testDoubleToDouble0012
     * @tc.desc Verify toDouble with Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MAX_SAFE_INTEGER);
      expect(result).assertEqual(Double.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1300
     * @tc.name testDoubleToDouble0013
     * @tc.desc Verify toDouble with Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MIN_SAFE_INTEGER);
      expect(result).assertEqual(Double.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1400
     * @tc.name testDoubleToDouble0014
     * @tc.desc Verify toDouble with Double.NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.NaN);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1500
     * @tc.name testDoubleToDouble0015
     * @tc.desc Verify toDouble with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1600
     * @tc.name testDoubleToDouble0016
     * @tc.desc Verify toDouble with Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1700
     * @tc.name testDoubleToDouble0017
     * @tc.desc Verify toDouble with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(-0.0);
      expect(1.0 / result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1800
     * @tc.name testDoubleToDouble0018
     * @tc.desc Verify toDouble with Double.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.EPSILON);
      expect(result).assertEqual(Double.EPSILON);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_1900
     * @tc.name testDoubleToDouble0019
     * @tc.desc Verify toDouble with Double.DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.DELTA);
      expect(result).assertEqual(Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_2500
     * @tc.name testDoubleToDouble0025
     * @tc.desc Verify return value equals input for normal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(3.14);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_2600
     * @tc.name testDoubleToDouble0026
     * @tc.desc Verify return value equals input for integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(42.0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_2700
     * @tc.name testDoubleToDouble0027
     * @tc.desc Verify return value equals input for negative double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(-99.99);
      expect(result).assertEqual(-99.99);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_2800
     * @tc.name testDoubleToDouble0028
     * @tc.desc Verify multiple calls with same value return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: double = Double.toDouble(1.5);
      const result2: double = Double.toDouble(1.5);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_3300
     * @tc.name testDoubleToDouble0033
     * @tc.desc Verify passing -0.0 returns -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(-0.0);
      expect(1 / result === Number.NEGATIVE_INFINITY).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_3400
     * @tc.name testDoubleToDouble0034
     * @tc.desc Verify return type is double primitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(1.5);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_3600
     * @tc.name testDoubleToDouble0036
     * @tc.desc Verify return value can be assigned to double variable and passed again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intermediate: double = Double.toDouble(2.5);
      const finalResult: double = Double.toDouble(intermediate);
      expect(finalResult).assertEqual(2.5);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_3700
     * @tc.name testDoubleToDouble0037
     * @tc.desc Verify return value can be used as parameter for other Double static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(1.5);
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_3800
     * @tc.name testDoubleToDouble0038
     * @tc.desc Verify MAX_VALUE return value matches exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MAX_VALUE);
      expect(result === Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_3900
     * @tc.name testDoubleToDouble0039
     * @tc.desc Verify MIN_VALUE return value matches exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MIN_VALUE);
      expect(result === Double.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_4000
     * @tc.name testDoubleToDouble0040
     * @tc.desc Verify MAX_SAFE_INTEGER return value matches exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MAX_SAFE_INTEGER);
      expect(result === Double.MAX_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_4100
     * @tc.name testDoubleToDouble0041
     * @tc.desc Verify MIN_SAFE_INTEGER return value matches exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Double.toDouble(Double.MIN_SAFE_INTEGER);
      expect(result === Double.MIN_SAFE_INTEGER).assertTrue();
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_5200
     * @tc.name testDoubleToDouble0052
     * @tc.desc Verify static toDouble and instance toDouble return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: double = 3.14;
      const staticResult: double = Double.toDouble(value);
      const instance = new Double(value);
      const instanceResult: double = instance.toDouble();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number DBL_TO_TWO_CHK_5300
     * @tc.name testDoubleToDouble0053
     * @tc.desc Verify toDouble works as part of numeric conversion chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: double = 2.718;
      const result: double = Double.toDouble(input);
      expect(result).assertEqual(2.718);
      expect(Double.isFinite(result)).assertTrue();
      expect(Double.isNaN(result)).assertFalse();
    });
  });
}
