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

export default function DoubleIsGreaterEqualThanTest(): void {
  describe('DoubleIsGreaterEqualThanTest', (): void => {
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
     * @tc.number DBL_IS_GRTR_EQUAL_0100
     * @tc.name testDoubleIsGreaterEqualThan0001
     * @tc.desc Verify calling with required parameter other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterEqualThan(new Double(2.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0300
     * @tc.name testDoubleIsGreaterEqualThan0003
     * @tc.desc Verify positive Double instance when current value is greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: boolean = d.isGreaterEqualThan(new Double(3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0400
     * @tc.name testDoubleIsGreaterEqualThan0004
     * @tc.desc Verify negative Double instance when current value is greater than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(-3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0500
     * @tc.name testDoubleIsGreaterEqualThan0005
     * @tc.desc Verify zero value Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isGreaterEqualThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0600
     * @tc.name testDoubleIsGreaterEqualThan0006
     * @tc.desc Verify decimal Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.5);
      let result: boolean = d.isGreaterEqualThan(new Double(1.2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0700
     * @tc.name testDoubleIsGreaterEqualThan0007
     * @tc.desc Verify large number Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(999999.99);
      let result: boolean = d.isGreaterEqualThan(new Double(999999.98));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0800
     * @tc.name testDoubleIsGreaterEqualThan0008
     * @tc.desc Verify Double instance created with scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0e6);
      let result: boolean = d.isGreaterEqualThan(new Double(999999.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_0900
     * @tc.name testDoubleIsGreaterEqualThan0009
     * @tc.desc Verify Double.MAX_VALUE as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.MAX_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1000
     * @tc.name testDoubleIsGreaterEqualThan0010
     * @tc.desc Verify current value is Double.MAX_VALUE and other is smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_VALUE);
      let result: boolean = d.isGreaterEqualThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1100
     * @tc.name testDoubleIsGreaterEqualThan0011
     * @tc.desc Verify two Double.MAX_VALUE comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_VALUE);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1200
     * @tc.name testDoubleIsGreaterEqualThan0012
     * @tc.desc Verify Double.MIN_VALUE as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_VALUE);
      let result: boolean = d.isGreaterEqualThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1300
     * @tc.name testDoubleIsGreaterEqualThan0013
     * @tc.desc Verify MAX_SAFE_INTEGER as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_SAFE_INTEGER);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.MAX_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1400
     * @tc.name testDoubleIsGreaterEqualThan0014
     * @tc.desc Verify MIN_SAFE_INTEGER as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_SAFE_INTEGER);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.MIN_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1500
     * @tc.name testDoubleIsGreaterEqualThan0015
     * @tc.desc Verify current value is MIN_SAFE_INTEGER and other is larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_SAFE_INTEGER);
      let result: boolean = d.isGreaterEqualThan(new Double(0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1600
     * @tc.name testDoubleIsGreaterEqualThan0016
     * @tc.desc Verify comparison when other is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1700
     * @tc.name testDoubleIsGreaterEqualThan0017
     * @tc.desc Verify comparison when current value is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isGreaterEqualThan(new Double(1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1800
     * @tc.name testDoubleIsGreaterEqualThan0018
     * @tc.desc Verify two NaN values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_1900
     * @tc.name testDoubleIsGreaterEqualThan0019
     * @tc.desc Verify other is POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2000
     * @tc.name testDoubleIsGreaterEqualThan0020
     * @tc.desc Verify current value is POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterEqualThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2100
     * @tc.name testDoubleIsGreaterEqualThan0021
     * @tc.desc Verify two POSITIVE_INFINITY comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2200
     * @tc.name testDoubleIsGreaterEqualThan0022
     * @tc.desc Verify other is NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2300
     * @tc.name testDoubleIsGreaterEqualThan0023
     * @tc.desc Verify current value is NEGATIVE_INFINITY and other is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isGreaterEqualThan(new Double(-1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2400
     * @tc.name testDoubleIsGreaterEqualThan0024
     * @tc.desc Verify POSITIVE_INFINITY compared with NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2500
     * @tc.name testDoubleIsGreaterEqualThan0025
     * @tc.desc Verify current value is 0.0 and other is -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isGreaterEqualThan(new Double(-0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2600
     * @tc.name testDoubleIsGreaterEqualThan0026
     * @tc.desc Verify current value is -0.0 and other is 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-0.0);
      let result: boolean = d.isGreaterEqualThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2700
     * @tc.name testDoubleIsGreaterEqualThan0027
     * @tc.desc Verify difference equal to DELTA is considered greater or equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0;
      let d: Double = new Double(base + Double.DELTA);
      let result: boolean = d.isGreaterEqualThan(new Double(base));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2800
     * @tc.name testDoubleIsGreaterEqualThan0028
     * @tc.desc Verify difference less than DELTA is considered equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0;
      let d: Double = new Double(base + Double.DELTA / 2.0);
      let result: boolean = d.isGreaterEqualThan(new Double(base));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_2900
     * @tc.name testDoubleIsGreaterEqualThan0029
     * @tc.desc Verify difference slightly greater than DELTA is considered greater
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0;
      let d: Double = new Double(base + Double.DELTA * 2.0);
      let result: boolean = d.isGreaterEqualThan(new Double(base));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3000
     * @tc.name testDoubleIsGreaterEqualThan0030
     * @tc.desc Verify current value slightly less than other with difference less than DELTA is considered equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0;
      let d: Double = new Double(base - Double.DELTA / 2.0);
      let result: boolean = d.isGreaterEqualThan(new Double(base));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3100
     * @tc.name testDoubleIsGreaterEqualThan0031
     * @tc.desc Verify current value less than other with difference greater than DELTA returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0;
      let d: Double = new Double(base - Double.DELTA * 2.0);
      let result: boolean = d.isGreaterEqualThan(new Double(base));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3200
     * @tc.name testDoubleIsGreaterEqualThan0032
     * @tc.desc Verify approximate comparison using EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 1.0;
      let d: Double = new Double(base + Double.EPSILON / 2.0);
      let result: boolean = d.isGreaterEqualThan(new Double(base));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3300
     * @tc.name testDoubleIsGreaterEqualThan0033
     * @tc.desc Verify passing null as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(2.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3500
     * @tc.name testDoubleIsGreaterEqualThan0035
     * @tc.desc Verify positive number greater than negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(-1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3600
     * @tc.name testDoubleIsGreaterEqualThan0036
     * @tc.desc Verify negative number greater than smaller negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(-10.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3700
     * @tc.name testDoubleIsGreaterEqualThan0037
     * @tc.desc Verify large number greater than small number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1000000.0);
      let result: boolean = d.isGreaterEqualThan(new Double(999999.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3800
     * @tc.name testDoubleIsGreaterEqualThan0038
     * @tc.desc Verify two equal positive numbers comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterEqualThan(new Double(3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_3900
     * @tc.name testDoubleIsGreaterEqualThan0039
     * @tc.desc Verify two equal negative numbers comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-5.5);
      let result: boolean = d.isGreaterEqualThan(new Double(-5.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4200
     * @tc.name testDoubleIsGreaterEqualThan0042
     * @tc.desc Verify negative number less than positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(1.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4300
     * @tc.name testDoubleIsGreaterEqualThan0043
     * @tc.desc Verify small decimal less than larger decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.001);
      let result: boolean = d.isGreaterEqualThan(new Double(0.002));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4400
     * @tc.name testDoubleIsGreaterEqualThan0044
     * @tc.desc Verify current value is NaN returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isGreaterEqualThan(new Double(0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4500
     * @tc.name testDoubleIsGreaterEqualThan0045
     * @tc.desc Verify normal value is not greater or equal to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(100.0);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.NaN));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4600
     * @tc.name testDoubleIsGreaterEqualThan0046
     * @tc.desc Verify POSITIVE_INFINITY is greater or equal to any finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4700
     * @tc.name testDoubleIsGreaterEqualThan0047
     * @tc.desc Verify finite value is not greater or equal to POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_VALUE);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4800
     * @tc.name testDoubleIsGreaterEqualThan0048
     * @tc.desc Verify NEGATIVE_INFINITY is not greater or equal to any finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isGreaterEqualThan(new Double(-Double.MAX_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_4900
     * @tc.name testDoubleIsGreaterEqualThan0049
     * @tc.desc Verify any finite value is greater or equal to NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-Double.MAX_VALUE);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5200
     * @tc.name testDoubleIsGreaterEqualThan0052
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterEqualThan(new Double(2.0));
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5300
     * @tc.name testDoubleIsGreaterEqualThan0053
     * @tc.desc Verify return value type when result is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: boolean = d.isGreaterEqualThan(new Double(3.0));
      expect(result).assertTrue();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5400
     * @tc.name testDoubleIsGreaterEqualThan0054
     * @tc.desc Verify return value type when result is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(2.0));
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5500
     * @tc.name testDoubleIsGreaterEqualThan0055
     * @tc.desc Verify difference within DELTA threshold returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 100.0;
      let d: Double = new Double(base);
      let other: Double = new Double(base + Double.DELTA * 0.9);
      let result: boolean = d.isGreaterEqualThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5600
     * @tc.name testDoubleIsGreaterEqualThan0056
     * @tc.desc Verify difference exceeding DELTA threshold returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 100.0;
      let d: Double = new Double(base);
      let other: Double = new Double(base + Double.DELTA * 1.1);
      let result: boolean = d.isGreaterEqualThan(other);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5700
     * @tc.name testDoubleIsGreaterEqualThan0057
     * @tc.desc Verify comparison of two very close large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: double = 1.0e300;
      let d: Double = new Double(big);
      let result: boolean = d.isGreaterEqualThan(new Double(big - 1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_5800
     * @tc.name testDoubleIsGreaterEqualThan0058
     * @tc.desc Verify comparison of two very small positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_VALUE);
      let result: boolean = d.isGreaterEqualThan(new Double(Double.MIN_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6000
     * @tc.name testDoubleIsGreaterEqualThan0060
     * @tc.desc Verify passing null as other parameter returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterEqualThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6200
     * @tc.name testDoubleIsGreaterEqualThan0062
     * @tc.desc Verify consecutive calls of isGreaterEqualThan on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let r1: boolean = d.isGreaterEqualThan(new Double(3.0));
      let r2: boolean = d.isGreaterEqualThan(new Double(5.0));
      let r3: boolean = d.isGreaterEqualThan(new Double(7.0));
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6300
     * @tc.name testDoubleIsGreaterEqualThan0063
     * @tc.desc Verify default constructor creates instance with value 0.0 for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double();
      let result: boolean = d.isGreaterEqualThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6400
     * @tc.name testDoubleIsGreaterEqualThan0064
     * @tc.desc Verify instance constructed with double value for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.5);
      let result: boolean = d.isGreaterEqualThan(new Double(3.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6500
     * @tc.name testDoubleIsGreaterEqualThan0065
     * @tc.desc Verify Double instance constructed with BigInt for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(new BigInt(42));
      let result: boolean = d.isGreaterEqualThan(new Double(42.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6600
     * @tc.name testDoubleIsGreaterEqualThan0066
     * @tc.desc Verify Double instance constructed with String for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double("3.5");
      let result: boolean = d.isGreaterEqualThan(new Double(3.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6700
     * @tc.name testDoubleIsGreaterEqualThan0067
     * @tc.desc Verify unparseable string constructs NaN instance for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double("abc");
      let result: boolean = d.isGreaterEqualThan(new Double(1.0));
      expect(d.isNaN()).assertTrue();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_EQUAL_6800
     * @tc.name testDoubleIsGreaterEqualThan0068
     * @tc.desc Verify Number instance created via $_invoke for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterEqualThan0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let other: Number = Double.$_invoke(3.0);
      let result: boolean = d.isGreaterEqualThan(other as Double);
      expect(result).assertTrue();
    });
  });
}
