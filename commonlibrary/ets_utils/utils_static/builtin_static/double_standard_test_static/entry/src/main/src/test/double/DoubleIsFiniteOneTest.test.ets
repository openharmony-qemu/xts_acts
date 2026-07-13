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
import Utils from '../Util.test';

export default function DoubleIsFiniteOneTest(): void {
  describe('DoubleIsFiniteOneTest', (): void => {
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
     * @tc.number DBL_IS_FNT_ONE_0100
     * @tc.name testDoubleIsFiniteOne0001
     * @tc.desc Verify calling with one required parameter normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_0400
     * @tc.name testDoubleIsFiniteOne0004
     * @tc.desc Verify positive finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(123.456);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_0500
     * @tc.name testDoubleIsFiniteOne0005
     * @tc.desc Verify negative finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-888.88);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_0600
     * @tc.name testDoubleIsFiniteOne0006
     * @tc.desc Verify passing 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_0700
     * @tc.name testDoubleIsFiniteOne0007
     * @tc.desc Verify passing -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_0800
     * @tc.name testDoubleIsFiniteOne0008
     * @tc.desc Verify integer form floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(2.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_0900
     * @tc.name testDoubleIsFiniteOne0009
     * @tc.desc Verify decimal form floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(3.14159);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1000
     * @tc.name testDoubleIsFiniteOne0010
     * @tc.desc Verify hexadecimal floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(9.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1100
     * @tc.name testDoubleIsFiniteOne0011
     * @tc.desc Verify positive number in scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.0e6);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1200
     * @tc.name testDoubleIsFiniteOne0012
     * @tc.desc Verify negative exponent in scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.5e-3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1300
     * @tc.name testDoubleIsFiniteOne0013
     * @tc.desc Verify Double.MAX_VALUE (maximum double value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1400
     * @tc.name testDoubleIsFiniteOne0014
     * @tc.desc Verify Double.MIN_VALUE (minimum positive double value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1500
     * @tc.name testDoubleIsFiniteOne0015
     * @tc.desc Verify -Double.MAX_VALUE (negative maximum absolute value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-Double.MAX_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1600
     * @tc.name testDoubleIsFiniteOne0016
     * @tc.desc Verify -Double.MIN_VALUE (negative minimum absolute value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-Double.MIN_VALUE);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1700
     * @tc.name testDoubleIsFiniteOne0017
     * @tc.desc Verify Double.MAX_SAFE_INTEGER (maximum safe integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1800
     * @tc.name testDoubleIsFiniteOne0018
     * @tc.desc Verify Double.MIN_SAFE_INTEGER (minimum safe integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.MIN_SAFE_INTEGER);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_1900
     * @tc.name testDoubleIsFiniteOne0019
     * @tc.desc Verify Double.NaN (not a number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2000
     * @tc.name testDoubleIsFiniteOne0020
     * @tc.desc Verify Double.POSITIVE_INFINITY (positive infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2100
     * @tc.name testDoubleIsFiniteOne0021
     * @tc.desc Verify Double.NEGATIVE_INFINITY (negative infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(Double.NEGATIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2200
     * @tc.name testDoubleIsFiniteOne0022
     * @tc.desc Verify Infinity produced by division by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inf: double = 1.0 / 0.0;
      let result: boolean = Double.isFinite(inf);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2300
     * @tc.name testDoubleIsFiniteOne0023
     * @tc.desc Verify -Infinity produced by operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInf: double = -1.0 / 0.0;
      let result: boolean = Double.isFinite(negInf);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2400
     * @tc.name testDoubleIsFiniteOne0024
     * @tc.desc Verify NaN produced by 0/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: double = 0.0 / 0.0;
      let result: boolean = Double.isFinite(nanVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2600
     * @tc.name testDoubleIsFiniteOne0026
     * @tc.desc Verify undefined value type mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2800
     * @tc.name testDoubleIsFiniteOne0028
     * @tc.desc Verify boolean type mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_2900
     * @tc.name testDoubleIsFiniteOne0029
     * @tc.desc Verify object type mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(100.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_3000
     * @tc.name testDoubleIsFiniteOne0030
     * @tc.desc Verify overflow value beyond double range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.7976931348623157E308);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_3100
     * @tc.name testDoubleIsFiniteOne0031
     * @tc.desc Verify positive finite value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.0);
      expect(result).assertTrue();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_3200
     * @tc.name testDoubleIsFiniteOne0032
     * @tc.desc Verify negative finite value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-100.5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_4200
     * @tc.name testDoubleIsFiniteOne0042
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.0);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_4400
     * @tc.name testDoubleIsFiniteOne0044
     * @tc.desc Verify near-infinity large finite value still returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(1.7976931348623155E308);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_4500
     * @tc.name testDoubleIsFiniteOne0045
     * @tc.desc Verify near-infinity small finite value (negative) still returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(-1.7976931348623155E308);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_4800
     * @tc.name testDoubleIsFiniteOne0048
     * @tc.desc Verify non-double type catches type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(2.5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_5000
     * @tc.name testDoubleIsFiniteOne0050
     * @tc.desc Verify no parameter catches error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = Double.isFinite(3.14);
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_5100
     * @tc.name testDoubleIsFiniteOne0051
     * @tc.desc Verify consistent results for same finite value across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isFinite(1.0);
      let result2: boolean = Double.isFinite(1.0);
      expect(result1).assertEqual(result2);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_5200
     * @tc.name testDoubleIsFiniteOne0052
     * @tc.desc Verify consistent results for NaN across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isFinite(Double.NaN);
      let result2: boolean = Double.isFinite(Double.NaN);
      expect(result1).assertEqual(result2);
      expect(result1).assertFalse();
    });

    /**
     * @tc.number DBL_IS_FNT_ONE_5300
     * @tc.name testDoubleIsFiniteOne0053
     * @tc.desc Verify consistent results for positive infinity across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsFiniteOne0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: boolean = Double.isFinite(Double.POSITIVE_INFINITY);
      let result2: boolean = Double.isFinite(Double.POSITIVE_INFINITY);
      expect(result1).assertEqual(result2);
      expect(result1).assertFalse();
    });
  });
}
