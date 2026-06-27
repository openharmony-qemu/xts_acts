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

export default function DoubleIsFiniteTwoTest(): void {
  describe('DoubleIsFiniteTwoTest', (): void => {
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
     * @tc.number DBL_IS_FNT_TWO_0100
     * @tc.name testDoubleIsFiniteTwo0001
     * @tc.desc Verify calling instance method isFinite without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      let result: boolean = value.isFinite();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0300
     * @tc.name testDoubleIsFiniteTwo0003
     * @tc.desc Verify positive finite value on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0400
     * @tc.name testDoubleIsFiniteTwo0004
     * @tc.desc Verify negative finite value on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(-1.0);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0500
     * @tc.name testDoubleIsFiniteTwo0005
     * @tc.desc Verify value 0.0 on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(0.0);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0600
     * @tc.name testDoubleIsFiniteTwo0006
     * @tc.desc Verify value -0.0 on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(-0.0);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0700
     * @tc.name testDoubleIsFiniteTwo0007
     * @tc.desc Verify NaN value on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.NaN);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0800
     * @tc.name testDoubleIsFiniteTwo0008
     * @tc.desc Verify POSITIVE_INFINITY value on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_0900
     * @tc.name testDoubleIsFiniteTwo0009
     * @tc.desc Verify NEGATIVE_INFINITY value on Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1000
     * @tc.name testDoubleIsFiniteTwo0010
     * @tc.desc Verify positive finite value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(123.456);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1100
     * @tc.name testDoubleIsFiniteTwo0011
     * @tc.desc Verify negative finite value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(-888.88);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1300
     * @tc.name testDoubleIsFiniteTwo0013
     * @tc.desc Verify Double.MAX_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.MAX_VALUE);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1400
     * @tc.name testDoubleIsFiniteTwo0014
     * @tc.desc Verify Double.MIN_VALUE returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.MIN_VALUE);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1500
     * @tc.name testDoubleIsFiniteTwo0015
     * @tc.desc Verify Double.MAX_SAFE_INTEGER returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.MAX_SAFE_INTEGER);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1600
     * @tc.name testDoubleIsFiniteTwo0016
     * @tc.desc Verify Double.MIN_SAFE_INTEGER returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.MIN_SAFE_INTEGER);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1700
     * @tc.name testDoubleIsFiniteTwo0017
     * @tc.desc Verify extremely large negative value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(-Double.MAX_VALUE);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_1800
     * @tc.name testDoubleIsFiniteTwo0018
     * @tc.desc Verify scientific notation value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0e6);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2200
     * @tc.name testDoubleIsFiniteTwo0022
     * @tc.desc Verify infinity produced by dividing by zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0 / 0.0);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2300
     * @tc.name testDoubleIsFiniteTwo0023
     * @tc.desc Verify negative infinity produced by dividing negative by zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(-1.0 / 0.0);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2400
     * @tc.name testDoubleIsFiniteTwo0024
     * @tc.desc Verify NaN produced by dividing zero by zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(0.0 / 0.0);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2500
     * @tc.name testDoubleIsFiniteTwo0025
     * @tc.desc Verify overflow producing positive infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0e308 * 10.0);
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2600
     * @tc.name testDoubleIsFiniteTwo0026
     * @tc.desc Verify default constructor value 0.0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double();
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2700
     * @tc.name testDoubleIsFiniteTwo0027
     * @tc.desc Verify string parsed to finite value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double("3.5");
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2800
     * @tc.name testDoubleIsFiniteTwo0028
     * @tc.desc Verify string parsed to NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double("abc");
      expect(value.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_2900
     * @tc.name testDoubleIsFiniteTwo0029
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      let result = value.isFinite();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3000
     * @tc.name testDoubleIsFiniteTwo0030
     * @tc.desc Verify return value strictly equals true when finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3100
     * @tc.name testDoubleIsFiniteTwo0031
     * @tc.desc Verify return value strictly equals false when infinite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3400
     * @tc.name testDoubleIsFiniteTwo0034
     * @tc.desc Verify Double.DELTA constant value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.DELTA);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3500
     * @tc.name testDoubleIsFiniteTwo0035
     * @tc.desc Verify Double.EPSILON constant value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.EPSILON);
      expect(value.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3600
     * @tc.name testDoubleIsFiniteTwo0036
     * @tc.desc Verify consistent results across multiple calls on same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      let result1 = value.isFinite();
      let result2 = value.isFinite();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3700
     * @tc.name testDoubleIsFiniteTwo0037
     * @tc.desc Verify different instances with same value return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value1 = new Double(1.0);
      let value2 = new Double(1.0);
      expect(value1.isFinite()).assertEqual(value2.isFinite());
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3800
     * @tc.name testDoubleIsFiniteTwo0038
     * @tc.desc Verify calling isFinite on finite value does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      let result = value.isFinite();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_3900
     * @tc.name testDoubleIsFiniteTwo0039
     * @tc.desc Verify calling isFinite on NaN instance does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.NaN);
      let result = value.isFinite();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4000
     * @tc.name testDoubleIsFiniteTwo0040
     * @tc.desc Verify calling isFinite on positive infinity instance does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.POSITIVE_INFINITY);
      let result = value.isFinite();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4100
     * @tc.name testDoubleIsFiniteTwo0041
     * @tc.desc Verify calling isFinite on negative infinity instance does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.NEGATIVE_INFINITY);
      let result = value.isFinite();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4200
     * @tc.name testDoubleIsFiniteTwo0042
     * @tc.desc Verify instance method and static method consistency for finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = 1.0;
      let value = new Double(d);
      expect(value.isFinite()).assertEqual(Double.isFinite(d));
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4300
     * @tc.name testDoubleIsFiniteTwo0043
     * @tc.desc Verify instance method and static method consistency for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = Double.NaN;
      let value = new Double(d);
      expect(value.isFinite()).assertEqual(Double.isFinite(d));
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4400
     * @tc.name testDoubleIsFiniteTwo0044
     * @tc.desc Verify instance method and static method consistency for positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: double = Double.POSITIVE_INFINITY;
      let value = new Double(d);
      expect(value.isFinite()).assertEqual(Double.isFinite(d));
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4500
     * @tc.name testDoubleIsFiniteTwo0045
     * @tc.desc Verify finite value has isFinite true and isNaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(1.0);
      expect(value.isFinite()).assertEqual(true);
      expect(value.isNaN()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4600
     * @tc.name testDoubleIsFiniteTwo0046
     * @tc.desc Verify NaN has isFinite false and isNaN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.NaN);
      expect(value.isFinite()).assertEqual(false);
      expect(value.isNaN()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4700
     * @tc.name testDoubleIsFiniteTwo0047
     * @tc.desc Verify positive infinity has isFinite false and isNaN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertEqual(false);
      expect(value.isNaN()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4800
     * @tc.name testDoubleIsFiniteTwo0048
     * @tc.desc Verify addition result of two finite values is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.5).add(new Double(2.0));
      expect(result.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_4900
     * @tc.name testDoubleIsFiniteTwo0049
     * @tc.desc Verify overflow addition produces infinity and isFinite returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big = new Double(Double.MAX_VALUE);
      let result = big.add(big);
      expect(result.isFinite()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_5000
     * @tc.name testDoubleIsFiniteTwo0050
     * @tc.desc Verify division result of finite values is finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(6.0).div(new Double(2.0));
      expect(result.isFinite()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_FNT_TWO_5100
     * @tc.name testDoubleIsFiniteTwo0051
     * @tc.desc Verify dividing by zero produces infinity and isFinite returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = new Double(1.0).div(new Double(0.0));
      expect(result.isFinite()).assertEqual(false);
    });
  });
}
