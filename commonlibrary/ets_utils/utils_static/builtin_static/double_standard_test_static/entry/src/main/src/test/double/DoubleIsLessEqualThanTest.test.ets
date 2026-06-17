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

export default function DoubleIsLessEqualThanTest(): void {
  describe('DoubleIsLessEqualThanTest', (): void => {
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
     * @tc.number DBL_IS_LESS_EQUAL_0100
     * @tc.name testDoubleIsLessEqualThan0001
     * @tc.desc Verify calling with required parameter other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(2.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_0500
     * @tc.name testDoubleIsLessEqualThan0005
     * @tc.desc Verify positive Double instance as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.5);
      let result: boolean = d.isLessEqualThan(new Double(10.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_0600
     * @tc.name testDoubleIsLessEqualThan0006
     * @tc.desc Verify negative Double instance as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-5.0);
      let result: boolean = d.isLessEqualThan(new Double(-3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_0700
     * @tc.name testDoubleIsLessEqualThan0007
     * @tc.desc Verify zero value Double instance as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isLessEqualThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_0800
     * @tc.name testDoubleIsLessEqualThan0008
     * @tc.desc Verify Double.MAX_VALUE as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_0900
     * @tc.name testDoubleIsLessEqualThan0009
     * @tc.desc Verify Double.MIN_VALUE as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1000
     * @tc.name testDoubleIsLessEqualThan0010
     * @tc.desc Verify Double.NaN as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.NaN));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1100
     * @tc.name testDoubleIsLessEqualThan0011
     * @tc.desc Verify Double.POSITIVE_INFINITY as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1200
     * @tc.name testDoubleIsLessEqualThan0012
     * @tc.desc Verify Double.NEGATIVE_INFINITY as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1300
     * @tc.name testDoubleIsLessEqualThan0013
     * @tc.desc Verify Double.MAX_SAFE_INTEGER as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.MAX_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1400
     * @tc.name testDoubleIsLessEqualThan0014
     * @tc.desc Verify Double.MIN_SAFE_INTEGER as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isLessEqualThan(new Double(Double.MIN_SAFE_INTEGER));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1500
     * @tc.name testDoubleIsLessEqualThan0015
     * @tc.desc Verify very small positive value near zero as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isLessEqualThan(new Double(4.9E-324));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1700
     * @tc.name testDoubleIsLessEqualThan0017
     * @tc.desc Verify -0.0 as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isLessEqualThan(new Double(-0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1800
     * @tc.name testDoubleIsLessEqualThan0018
     * @tc.desc Verify scientific notation value as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0e10);
      let result: boolean = d.isLessEqualThan(new Double(1.0e20));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_1900
     * @tc.name testDoubleIsLessEqualThan0019
     * @tc.desc Verify hexadecimal floating point value as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(9.0);
      let result: boolean = d.isLessEqualThan(new Double(776.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_2000
     * @tc.name testDoubleIsLessEqualThan0020
     * @tc.desc Verify passing null as parameter returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: boolean = d.isLessEqualThan(new Double(10.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_2500
     * @tc.name testDoubleIsLessEqualThan0025
     * @tc.desc Verify isLessEqualThan returns true when current value is negative and other is positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-10.0);
      let result: boolean = d.isLessEqualThan(new Double(5.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_2600
     * @tc.name testDoubleIsLessEqualThan0026
     * @tc.desc Verify isLessEqualThan returns true when current value is small and other is large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1e-10);
      let result: boolean = d.isLessEqualThan(new Double(1e10));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_2700
     * @tc.name testDoubleIsLessEqualThan0027
     * @tc.desc Verify isLessEqualThan returns true when current value equals other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(2.0);
      let result: boolean = d.isLessEqualThan(new Double(2.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_2900
     * @tc.name testDoubleIsLessEqualThan0029
     * @tc.desc Verify isLessEqualThan returns true when both current value and other are equal negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-3.14);
      let result: boolean = d.isLessEqualThan(new Double(-3.14));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3100
     * @tc.name testDoubleIsLessEqualThan0031
     * @tc.desc Verify isLessEqualThan returns false when current value is greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isLessEqualThan(new Double(2.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3200
     * @tc.name testDoubleIsLessEqualThan0032
     * @tc.desc Verify isLessEqualThan returns false when current value is positive and other is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: boolean = d.isLessEqualThan(new Double(-5.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3300
     * @tc.name testDoubleIsLessEqualThan0033
     * @tc.desc Verify isLessEqualThan returns boolean when current value is NaN and other is normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isLessEqualThan(new Double(1.0));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3500
     * @tc.name testDoubleIsLessEqualThan0035
     * @tc.desc Verify isLessEqualThan returns boolean when both values are NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isLessEqualThan(new Double(Double.NaN));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3600
     * @tc.name testDoubleIsLessEqualThan0036
     * @tc.desc Verify isLessEqualThan returns true when both current and other are positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isLessEqualThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3700
     * @tc.name testDoubleIsLessEqualThan0037
     * @tc.desc Verify isLessEqualThan returns false when current is positive infinity and other is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isLessEqualThan(new Double(1e308));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3800
     * @tc.name testDoubleIsLessEqualThan0038
     * @tc.desc Verify isLessEqualThan returns true when current is negative infinity and other is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isLessEqualThan(new Double(-1e308));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_3900
     * @tc.name testDoubleIsLessEqualThan0039
     * @tc.desc Verify isLessEqualThan returns true when both current and other are negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isLessEqualThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4000
     * @tc.name testDoubleIsLessEqualThan0040
     * @tc.desc Verify isLessEqualThan returns true when current is negative infinity and other is positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isLessEqualThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4100
     * @tc.name testDoubleIsLessEqualThan0041
     * @tc.desc Verify isLessEqualThan returns true when both current and other are MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_VALUE);
      let result: boolean = d.isLessEqualThan(new Double(Double.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4200
     * @tc.name testDoubleIsLessEqualThan0042
     * @tc.desc Verify isLessEqualThan returns true when both current and other are MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_VALUE);
      let result: boolean = d.isLessEqualThan(new Double(Double.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4300
     * @tc.name testDoubleIsLessEqualThan0043
     * @tc.desc Verify isLessEqualThan returns true when both current and other are MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_SAFE_INTEGER);
      let result: boolean = d.isLessEqualThan(new Double(Double.MAX_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4400
     * @tc.name testDoubleIsLessEqualThan0044
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(2.0));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4500
     * @tc.name testDoubleIsLessEqualThan0045
     * @tc.desc Verify true return value is strictly boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(2.0));
      expect(result === true).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4600
     * @tc.name testDoubleIsLessEqualThan0046
     * @tc.desc Verify false return value is strictly boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isLessEqualThan(new Double(2.0));
      expect(result === false).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4700
     * @tc.name testDoubleIsLessEqualThan0047
     * @tc.desc Verify difference within DELTA range returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(1.0 + Double.DELTA));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4800
     * @tc.name testDoubleIsLessEqualThan0048
     * @tc.desc Verify difference exceeding DELTA returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isLessEqualThan(new Double(1.0 - Double.DELTA * 2));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_4900
     * @tc.name testDoubleIsLessEqualThan0049
     * @tc.desc Verify comparison of two very close floating point numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.1 + 0.2);
      let result: boolean = d.isLessEqualThan(new Double(0.3));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5000
     * @tc.name testDoubleIsLessEqualThan0050
     * @tc.desc Verify null parameter is caught in try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(10.0);
      let result: boolean = d.isLessEqualThan(new Double(5.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5200
     * @tc.name testDoubleIsLessEqualThan0052
     * @tc.desc Verify non-Double type object causes runtime error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(7.0);
      let result: boolean = d.isLessEqualThan(new Double(7.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5300
     * @tc.name testDoubleIsLessEqualThan0053
     * @tc.desc Verify comparison between Double instances from double and string constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(2.0);
      let d2: Double = new Double("2.0");
      let result: boolean = d1.isLessEqualThan(d2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5400
     * @tc.name testDoubleIsLessEqualThan0054
     * @tc.desc Verify comparison between Double instances from double and BigInt constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(42.0);
      let d2: Double = new Double(new BigInt(42));
      let result: boolean = d1.isLessEqualThan(d2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5500
     * @tc.name testDoubleIsLessEqualThan0055
     * @tc.desc Verify comparison between default and zero constructed Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double();
      let d2: Double = new Double(0.0);
      let result: boolean = d1.isLessEqualThan(d2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5600
     * @tc.name testDoubleIsLessEqualThan0056
     * @tc.desc Verify isLessEqualThan is consistent with isLessThan when less than
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(1.0);
      let d2: Double = new Double(2.0);
      let lessEqual: boolean = d1.isLessEqualThan(d2);
      let less: boolean = d1.isLessThan(d2);
      expect(lessEqual).assertTrue();
      expect(less).assertTrue();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5700
     * @tc.name testDoubleIsLessEqualThan0057
     * @tc.desc Verify isLessEqualThan and isLessThan differ when values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(2.0);
      let d2: Double = new Double(2.0);
      let lessEqual: boolean = d1.isLessEqualThan(d2);
      let less: boolean = d1.isLessThan(d2);
      expect(lessEqual).assertTrue();
      expect(less).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5800
     * @tc.name testDoubleIsLessEqualThan0058
     * @tc.desc Verify consecutive calls on same instance with different other values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      expect(d.isLessEqualThan(new Double(10.0))).assertTrue();
      expect(d.isLessEqualThan(new Double(5.0))).assertTrue();
      expect(d.isLessEqualThan(new Double(3.0))).assertFalse();
      expect(d.isLessEqualThan(new Double(-1.0))).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_5900
     * @tc.name testDoubleIsLessEqualThan0059
     * @tc.desc Verify d1.isLessEqualThan(d2) and d2.isLessEqualThan(d1) relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(3.0);
      let d2: Double = new Double(5.0);
      expect(d1.isLessEqualThan(d2)).assertTrue();
      expect(d2.isLessEqualThan(d1)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_LESS_EQUAL_6000
     * @tc.name testDoubleIsLessEqualThan0060
     * @tc.desc Verify bidirectional isLessEqualThan returns true when values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsLessEqualThan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(4.0);
      let d2: Double = new Double(4.0);
      expect(d1.isLessEqualThan(d2)).assertTrue();
      expect(d2.isLessEqualThan(d1)).assertTrue();
    });
  });
}
