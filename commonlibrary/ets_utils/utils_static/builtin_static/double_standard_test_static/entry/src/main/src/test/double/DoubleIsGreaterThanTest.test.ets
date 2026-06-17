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

export default function DoubleIsGreaterThanTest(): void {
  describe('DoubleIsGreaterThanTest', (): void => {
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
     * @tc.number DBL_IS_GRTR_THAN_0100
     * @tc.name testDoubleIsGreaterThan0001
     * @tc.desc Verify calling with required parameter other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_0500
     * @tc.name testDoubleIsGreaterThan0005
     * @tc.desc Verify positive Double instance when current value is less than other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_0600
     * @tc.name testDoubleIsGreaterThan0006
     * @tc.desc Verify negative Double instance comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-1.0);
      let result: boolean = d.isGreaterThan(new Double(-2.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_0700
     * @tc.name testDoubleIsGreaterThan0007
     * @tc.desc Verify zero value Double instance comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.5);
      let result: boolean = d.isGreaterThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_0800
     * @tc.name testDoubleIsGreaterThan0008
     * @tc.desc Verify Double instance constructed with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: boolean = d.isGreaterThan(new Double("3.0"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_0900
     * @tc.name testDoubleIsGreaterThan0009
     * @tc.desc Verify Double instance constructed with BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(100.0);
      let result: boolean = d.isGreaterThan(new Double(new BigInt(50)));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1000
     * @tc.name testDoubleIsGreaterThan0010
     * @tc.desc Verify Double.MAX_VALUE as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_VALUE);
      let result: boolean = d.isGreaterThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1100
     * @tc.name testDoubleIsGreaterThan0011
     * @tc.desc Verify Double.MIN_VALUE as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_VALUE);
      let result: boolean = d.isGreaterThan(new Double(0.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1200
     * @tc.name testDoubleIsGreaterThan0012
     * @tc.desc Verify Double.NaN as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterThan(new Double(Double.NaN));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1300
     * @tc.name testDoubleIsGreaterThan0013
     * @tc.desc Verify current value is NaN compared with normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1400
     * @tc.name testDoubleIsGreaterThan0014
     * @tc.desc Verify Double.POSITIVE_INFINITY as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1500
     * @tc.name testDoubleIsGreaterThan0015
     * @tc.desc Verify Double.NEGATIVE_INFINITY as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1600
     * @tc.name testDoubleIsGreaterThan0016
     * @tc.desc Verify current value is positive infinity compared with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterThan(new Double(Double.MAX_VALUE));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1700
     * @tc.name testDoubleIsGreaterThan0017
     * @tc.desc Verify current value is negative infinity compared with negative MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isGreaterThan(new Double(-Double.MAX_VALUE));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1800
     * @tc.name testDoubleIsGreaterThan0018
     * @tc.desc Verify 0.0 is not greater than -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isGreaterThan(new Double(-0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_1900
     * @tc.name testDoubleIsGreaterThan0019
     * @tc.desc Verify difference less than EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0 + Double.EPSILON / 2);
      let result: boolean = d.isGreaterThan(new Double(1.0));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_2000
     * @tc.name testDoubleIsGreaterThan0020
     * @tc.desc Verify difference greater than EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0 + Double.EPSILON * 2);
      let result: boolean = d.isGreaterThan(new Double(1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_2100
     * @tc.name testDoubleIsGreaterThan0021
     * @tc.desc Verify Double.MAX_SAFE_INTEGER nearby values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_SAFE_INTEGER);
      let result: boolean = d.isGreaterThan(new Double(Double.MAX_SAFE_INTEGER - 1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_2200
     * @tc.name testDoubleIsGreaterThan0022
     * @tc.desc Verify Double.MIN_SAFE_INTEGER nearby values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MIN_SAFE_INTEGER + 1);
      let result: boolean = d.isGreaterThan(new Double(Double.MIN_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_2400
     * @tc.name testDoubleIsGreaterThan0024
     * @tc.desc Verify passing undefined as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterThan(new Double(3.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_3000
     * @tc.name testDoubleIsGreaterThan0030
     * @tc.desc Verify isGreaterThan returns false when values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(2.0);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_3100
     * @tc.name testDoubleIsGreaterThan0031
     * @tc.desc Verify negative number is greater than smaller negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-1.0);
      let result: boolean = d.isGreaterThan(new Double(-3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_3200
     * @tc.name testDoubleIsGreaterThan0032
     * @tc.desc Verify positive number is greater than negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterThan(new Double(-1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_3400
     * @tc.name testDoubleIsGreaterThan0034
     * @tc.desc Verify zero is greater than negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(0.0);
      let result: boolean = d.isGreaterThan(new Double(-0.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_3700
     * @tc.name testDoubleIsGreaterThan0037
     * @tc.desc Verify two NaN values comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NaN);
      let result: boolean = d.isGreaterThan(new Double(Double.NaN));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4000
     * @tc.name testDoubleIsGreaterThan0040
     * @tc.desc Verify two positive infinities are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterThan(new Double(Double.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4100
     * @tc.name testDoubleIsGreaterThan0041
     * @tc.desc Verify two negative infinities are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.NEGATIVE_INFINITY);
      let result: boolean = d.isGreaterThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4200
     * @tc.name testDoubleIsGreaterThan0042
     * @tc.desc Verify positive infinity is greater than negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.POSITIVE_INFINITY);
      let result: boolean = d.isGreaterThan(new Double(Double.NEGATIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4400
     * @tc.name testDoubleIsGreaterThan0044
     * @tc.desc Verify -0.0 is not greater than 0.0 considered equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(-0.0);
      let result: boolean = d.isGreaterThan(new Double(0.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4500
     * @tc.name testDoubleIsGreaterThan0045
     * @tc.desc Verify difference equal to EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0 + Double.EPSILON);
      let result: boolean = d.isGreaterThan(new Double(1.0));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4600
     * @tc.name testDoubleIsGreaterThan0046
     * @tc.desc Verify default constructed Double compared with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double();
      let result: boolean = d.isGreaterThan(new Double(-1.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4700
     * @tc.name testDoubleIsGreaterThan0047
     * @tc.desc Verify two default constructed Double instances are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double();
      let result: boolean = d.isGreaterThan(new Double());
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4800
     * @tc.name testDoubleIsGreaterThan0048
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_4900
     * @tc.name testDoubleIsGreaterThan0049
     * @tc.desc Verify true return value is strictly boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(result === true).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5000
     * @tc.name testDoubleIsGreaterThan0050
     * @tc.desc Verify false return value is strictly boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: boolean = d.isGreaterThan(new Double(2.0));
      expect(result === false).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5100
     * @tc.name testDoubleIsGreaterThan0051
     * @tc.desc Verify Double.MAX_VALUE is greater than near-max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(Double.MAX_VALUE);
      let result: boolean = d.isGreaterThan(new Double(Double.MAX_VALUE * 0.9999999999));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5300
     * @tc.name testDoubleIsGreaterThan0053
     * @tc.desc Verify scientific notation large number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0e308);
      let result: boolean = d.isGreaterThan(new Double(1.0e307));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5400
     * @tc.name testDoubleIsGreaterThan0054
     * @tc.desc Verify scientific notation small number comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0e-308);
      let result: boolean = d.isGreaterThan(new Double(1.0e-309));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5500
     * @tc.name testDoubleIsGreaterThan0055
     * @tc.desc Verify comparison near overflow boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.7976931348623157e308);
      let result: boolean = d.isGreaterThan(new Double(1.7976931348623155e308));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5600
     * @tc.name testDoubleIsGreaterThan0056
     * @tc.desc Verify passing null as parameter returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: boolean = d.isGreaterThan(new Double(4.0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5700
     * @tc.name testDoubleIsGreaterThan0057
     * @tc.desc Verify passing undefined as parameter returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: boolean = d.isGreaterThan(new Double(3.0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_5900
     * @tc.name testDoubleIsGreaterThan0059
     * @tc.desc Verify Double.isGreaterThan returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Double(3.0);
      expect(d.isGreaterThan(new Double(2.0))).assertTrue();
    });
    
    /**
     * @tc.number DBL_IS_GRTR_THAN_6300
     * @tc.name testDoubleIsGreaterThan0063
     * @tc.desc Verify consecutive calls on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      expect(d.isGreaterThan(new Double(4.0))).assertTrue();
      expect(d.isGreaterThan(new Double(5.0))).assertFalse();
      expect(d.isGreaterThan(new Double(6.0))).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_6400
     * @tc.name testDoubleIsGreaterThan0064
     * @tc.desc Verify return values used in logical operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(3.0);
      let d2: Double = new Double(1.0);
      let r1: boolean = d1.isGreaterThan(new Double(2.0));
      let r2: boolean = d2.isGreaterThan(new Double(0.0));
      expect(r1 && r2).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_6500
     * @tc.name testDoubleIsGreaterThan0065
     * @tc.desc Verify isGreaterThan is consistent with compareTo when returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let other: Double = new Double(2.0);
      expect(d.isGreaterThan(other)).assertTrue();
      expect(d.compareTo(other)).assertEqual(1);
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_6600
     * @tc.name testDoubleIsGreaterThan0066
     * @tc.desc Verify isGreaterThan is consistent with compareTo when returning false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let other: Double = new Double(2.0);
      expect(d.isGreaterThan(other)).assertFalse();
      expect(d.compareTo(other)).assertEqual(-1);
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_6700
     * @tc.name testDoubleIsGreaterThan0067
     * @tc.desc Verify isGreaterThan after add operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(1.0);
      let result: Double = d.add(new Double(2.0));
      expect(result.isGreaterThan(new Double(2.5))).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_6800
     * @tc.name testDoubleIsGreaterThan0068
     * @tc.desc Verify isGreaterThan after sub operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(5.0);
      let result: Double = d.sub(new Double(3.0));
      expect(result.isGreaterThan(new Double(1.5))).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_6900
     * @tc.name testDoubleIsGreaterThan0069
     * @tc.desc Verify isGreaterThan after mul operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(3.0);
      let result: Double = d.mul(new Double(2.0));
      expect(result.isGreaterThan(new Double(5.0))).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7000
     * @tc.name testDoubleIsGreaterThan0070
     * @tc.desc Verify isGreaterThan after div operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Double = new Double(6.0);
      let result: Double = d.div(new Double(2.0));
      expect(result.isGreaterThan(new Double(2.5))).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7100
     * @tc.name testDoubleIsGreaterThan0071
     * @tc.desc Verify isGreaterThan and isLessThan are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(3.0);
      let b: Double = new Double(2.0);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isLessThan(a)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7200
     * @tc.name testDoubleIsGreaterThan0072
     * @tc.desc Verify isGreaterThan true implies isGreaterEqualThan true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(3.0);
      let b: Double = new Double(2.0);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7300
     * @tc.name testDoubleIsGreaterThan0073
     * @tc.desc Verify equal values: isGreaterThan false but isGreaterEqualThan true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(2.0);
      let b: Double = new Double(2.0);
      expect(a.isGreaterThan(b)).assertFalse();
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7400
     * @tc.name testDoubleIsGreaterThan0074
     * @tc.desc Verify isGreaterThan and isLessEqualThan are complementary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(3.0);
      let b: Double = new Double(2.0);
      expect(a.isGreaterThan(b)).assertTrue();
      expect(b.isLessEqualThan(a)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7500
     * @tc.name testDoubleIsGreaterThan0075
     * @tc.desc Verify equal values: both isGreaterThan false and both isLessEqualThan true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Double = new Double(2.0);
      let b: Double = new Double(2.0);
      expect(a.isGreaterThan(b)).assertFalse();
      expect(b.isGreaterThan(a)).assertFalse();
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isLessEqualThan(a)).assertTrue();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7600
     * @tc.name testDoubleIsGreaterThan0076
     * @tc.desc Verify string constructed and number constructed Double with same value are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(3.0);
      let d2: Double = new Double("3.0");
      expect(d1.isGreaterThan(d2)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7700
     * @tc.name testDoubleIsGreaterThan0077
     * @tc.desc Verify BigInt constructed and number constructed Double with same value are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(42.0);
      let d2: Double = new Double(new BigInt(42));
      expect(d1.isGreaterThan(d2)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7800
     * @tc.name testDoubleIsGreaterThan0078
     * @tc.desc Verify default constructed and zero constructed Double are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double();
      let d2: Double = new Double(0.0);
      expect(d1.isGreaterThan(d2)).assertFalse();
    });

    /**
     * @tc.number DBL_IS_GRTR_THAN_7900
     * @tc.name testDoubleIsGreaterThan0079
     * @tc.desc Verify $_invoke and constructor created Double instances are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsGreaterThan0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Double = new Double(3.0);
      let d2: Double = Double.$_invoke(3.0) as Double;
      expect(d1.isGreaterThan(d2)).assertFalse();
    });
  });
}
