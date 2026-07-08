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

export default function DoubleIsIntegerTwoTest(): void {
  describe('DoubleIsIntegerTwoTest', (): void => {
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
     * @tc.number DBL_IS_INTGR_TWO_0100
     * @tc.name testDoubleIsIntegerTwo0001
     * @tc.desc Verify instance method isInteger can be called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value = new Double(2.0);
      let result: boolean = value.isInteger();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0300
     * @tc.name testDoubleIsIntegerTwo0003
     * @tc.desc Verify isInteger returns true for Double instances constructed with integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(0.0);
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(2.0);
      expect(d2.isInteger()).assertEqual(true);
      let d3 = new Double(-1.0);
      expect(d3.isInteger()).assertEqual(true);
      let d4 = new Double(100.0);
      expect(d4.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0400
     * @tc.name testDoubleIsIntegerTwo0004
     * @tc.desc Verify isInteger returns false for Double instances constructed with non-integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(2.5);
      expect(d1.isInteger()).assertEqual(false);
      let d2 = new Double(0.1);
      expect(d2.isInteger()).assertEqual(false);
      let d3 = new Double(-0.5);
      expect(d3.isInteger()).assertEqual(false);
      let d4 = new Double(3.14159);
      expect(d4.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0500
     * @tc.name testDoubleIsIntegerTwo0005
     * @tc.desc Verify isInteger returns true for Double instances constructed with BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(new BigInt(42));
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(new BigInt(0));
      expect(d2.isInteger()).assertEqual(true);
      let d3 = new Double(new BigInt(-100));
      expect(d3.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0600
     * @tc.name testDoubleIsIntegerTwo0006
     * @tc.desc Verify isInteger returns true for Double instances constructed with integer-parseable strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double("2.0");
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double("0");
      expect(d2.isInteger()).assertEqual(true);
      let d3 = new Double("-3.0");
      expect(d3.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0700
     * @tc.name testDoubleIsIntegerTwo0007
     * @tc.desc Verify isInteger returns false for Double instances constructed with non-integer-parseable strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double("3.5");
      expect(d1.isInteger()).assertEqual(false);
      let d2 = new Double("0.1");
      expect(d2.isInteger()).assertEqual(false);
      let d3 = new Double("-2.7");
      expect(d3.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0800
     * @tc.name testDoubleIsIntegerTwo0008
     * @tc.desc Verify isInteger returns false for Double instances constructed with unparseable strings resulting in NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double("abc");
      expect(d1.isInteger()).assertEqual(false);
      let d2 = new Double("1.5");
      expect(d2.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_0900
     * @tc.name testDoubleIsIntegerTwo0009
     * @tc.desc Verify isInteger returns true for default-constructed Double instance with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double();
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1000
     * @tc.name testDoubleIsIntegerTwo0010
     * @tc.desc Verify isInteger returns false for Double instances constructed with special values like NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(Double.NaN);
      expect(d1.isInteger()).assertEqual(false);
      let d2 = new Double(Double.POSITIVE_INFINITY);
      expect(d2.isInteger()).assertEqual(false);
      let d3 = new Double(Double.NEGATIVE_INFINITY);
      expect(d3.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1100
     * @tc.name testDoubleIsIntegerTwo0011
     * @tc.desc Verify isInteger returns true for Double instances constructed with large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(Double.MAX_VALUE);
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(Double.MAX_SAFE_INTEGER);
      expect(d2.isInteger()).assertEqual(true);
      let d3 = new Double(Double.MIN_SAFE_INTEGER);
      expect(d3.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1200
     * @tc.name testDoubleIsIntegerTwo0012
     * @tc.desc Verify isInteger returns false for Double instances constructed with minimum positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(Double.MIN_VALUE);
      expect(d1.isInteger()).assertEqual(false);
      let d2 = new Double(4.9E-324);
      expect(d2.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1300
     * @tc.name testDoubleIsIntegerTwo0013
     * @tc.desc Verify isInteger returns true for Double instance constructed with negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(-0.0);
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1400
     * @tc.name testDoubleIsIntegerTwo0014
     * @tc.desc Verify isInteger returns true for Double instances constructed with large integer boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(9007199254740992.0);
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(1.7976931348623157E308);
      expect(d2.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1500
     * @tc.name testDoubleIsIntegerTwo0015
     * @tc.desc Verify isInteger for Double instances constructed with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(1.0e3);
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(1.5e2);
      expect(d2.isInteger()).assertEqual(true);
      let d3 = new Double(1.5);
      expect(d3.isInteger()).assertEqual(false);
      let d4 = new Double(2.5e-1);
      expect(d4.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1600
     * @tc.name testDoubleIsIntegerTwo0016
     * @tc.desc Verify isInteger returns true for Double instance constructed with hex float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(8.0);
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1700
     * @tc.name testDoubleIsIntegerTwo0017
     * @tc.desc Verify isInteger returns true for positive integer Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(1.0).isInteger()).assertEqual(true);
      expect(new Double(10.0).isInteger()).assertEqual(true);
      expect(new Double(1000.0).isInteger()).assertEqual(true);
      expect(new Double(2147483647.0).isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1800
     * @tc.name testDoubleIsIntegerTwo0018
     * @tc.desc Verify isInteger returns true for zero-value Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(0.0).isInteger()).assertEqual(true);
      expect(new Double(-0.0).isInteger()).assertEqual(true);
      expect(new Double().isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_1900
     * @tc.name testDoubleIsIntegerTwo0019
     * @tc.desc Verify isInteger returns true for negative integer Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(-1.0).isInteger()).assertEqual(true);
      expect(new Double(-100.0).isInteger()).assertEqual(true);
      expect(new Double(-2147483648.0).isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2000
     * @tc.name testDoubleIsIntegerTwo0020
     * @tc.desc Verify isInteger returns false for positive decimal Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(0.5).isInteger()).assertEqual(false);
      expect(new Double(1.1).isInteger()).assertEqual(false);
      expect(new Double(99.99).isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2100
     * @tc.name testDoubleIsIntegerTwo0021
     * @tc.desc Verify isInteger returns false for negative decimal Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(-0.5).isInteger()).assertEqual(false);
      expect(new Double(-1.1).isInteger()).assertEqual(false);
      expect(new Double(-99.99).isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2200
     * @tc.name testDoubleIsIntegerTwo0022
     * @tc.desc Verify isInteger returns false for NaN Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.NaN);
      expect(d.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2300
     * @tc.name testDoubleIsIntegerTwo0023
     * @tc.desc Verify isInteger returns false for positive infinity Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.POSITIVE_INFINITY);
      expect(d.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2400
     * @tc.name testDoubleIsIntegerTwo0024
     * @tc.desc Verify isInteger returns false for negative infinity Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.NEGATIVE_INFINITY);
      expect(d.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2500
     * @tc.name testDoubleIsIntegerTwo0025
     * @tc.desc Verify isInteger returns true for MAX_SAFE_INTEGER Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.MAX_SAFE_INTEGER);
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2600
     * @tc.name testDoubleIsIntegerTwo0026
     * @tc.desc Verify isInteger returns true for MIN_SAFE_INTEGER Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.MIN_SAFE_INTEGER);
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2700
     * @tc.name testDoubleIsIntegerTwo0027
     * @tc.desc Verify isInteger returns true for MAX_VALUE Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.MAX_VALUE);
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2800
     * @tc.name testDoubleIsIntegerTwo0028
     * @tc.desc Verify isInteger returns false for MIN_VALUE Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.MIN_VALUE);
      expect(d.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_2900
     * @tc.name testDoubleIsIntegerTwo0029
     * @tc.desc Verify isInteger returns true for value just beyond MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(9007199254740992.0);
      expect(d.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3000
     * @tc.name testDoubleIsIntegerTwo0030
     * @tc.desc Verify isInteger returns false for very small positive values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(4.9E-324).isInteger()).assertEqual(false);
      expect(new Double(2.2250738585072014E-308).isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3100
     * @tc.name testDoubleIsIntegerTwo0031
     * @tc.desc Verify isInteger returns true for large negative integer Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(-9007199254740992.0).isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3200
     * @tc.name testDoubleIsIntegerTwo0032
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(2.0);
      let result: boolean = d.isInteger();
      expect(typeof result === "boolean").assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3300
     * @tc.name testDoubleIsIntegerTwo0033
     * @tc.desc Verify return value is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(2.0);
      let result = d.isInteger();
      expect(result == null).assertFalse();
      expect(result == undefined).assertFalse();
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3400
     * @tc.name testDoubleIsIntegerTwo0034
     * @tc.desc Verify return value is boolean not numeric type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(2.0);
      let result = d.isInteger();
      expect(result).assertEqual(true);
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3500
     * @tc.name testDoubleIsIntegerTwo0035
     * @tc.desc Verify isInteger for floating point values very close to integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(1.9999999999999998).isInteger()).assertEqual(false);
      expect(new Double(2.0000000000000004).isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3600
     * @tc.name testDoubleIsIntegerTwo0036
     * @tc.desc Verify isInteger for integer values plus or minus EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eps = Double.EPSILON;
      expect(new Double(1.0 + eps).isInteger()).assertEqual(false);
      expect(new Double(1.0 - eps).isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3700
     * @tc.name testDoubleIsIntegerTwo0037
     * @tc.desc Verify isInteger returns false for values near 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(0.49999999999999994).isInteger()).assertEqual(false);
      expect(new Double(0.5).isInteger()).assertEqual(false);
      expect(new Double(0.5000000000000001).isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3800
     * @tc.name testDoubleIsIntegerTwo0038
     * @tc.desc Verify multiple calls to isInteger on the same instance return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(2.5);
      let r1: boolean = d.isInteger();
      let r2: boolean = d.isInteger();
      let r3: boolean = d.isInteger();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_3900
     * @tc.name testDoubleIsIntegerTwo0039
     * @tc.desc Verify different Double instances with the same value return consistent isInteger results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(3.0);
      let d2 = new Double(3.0);
      expect(d1.isInteger()).assertEqual(d2.isInteger());
      expect(d1.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4000
     * @tc.name testDoubleIsIntegerTwo0040
     * @tc.desc Verify isInteger returns consistent results for same value from different constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(5.0);
      let d2 = new Double("5.0");
      let d3 = new Double(new BigInt(5));
      expect(d1.isInteger()).assertEqual(d2.isInteger());
      expect(d2.isInteger()).assertEqual(d3.isInteger());
      expect(d1.isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4100
     * @tc.name testDoubleIsIntegerTwo0041
     * @tc.desc Verify isInteger does not throw exception on normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(2.0);
      let result = d.isInteger();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4200
     * @tc.name testDoubleIsIntegerTwo0042
     * @tc.desc Verify isInteger does not throw exception on NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.NaN);
      let result = d.isInteger();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4300
     * @tc.name testDoubleIsIntegerTwo0043
     * @tc.desc Verify isInteger does not throw exception on Infinity instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(Double.POSITIVE_INFINITY);
      let result = d.isInteger();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4400
     * @tc.name testDoubleIsIntegerTwo0044
     * @tc.desc Verify isInteger call completes normally in try block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(10.0);
      let executed = false;
      try {
        d.isInteger();
        executed = true;
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        executed = false;
      }
      expect(executed).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4500
     * @tc.name testDoubleIsIntegerTwo0045
     * @tc.desc Verify Double.isInteger returns true for integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Double(10.0);
      expect(d.isInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4600
     * @tc.name testDoubleIsIntegerTwo0046
     * @tc.desc Verify isInteger method does not produce uncaught errors for various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.0, 1.0, -1.0, 2.5, Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, Double.MAX_VALUE, Double.MIN_VALUE];
      for (let v of values) {
        let d = new Double(v);
        let result = d.isInteger();
        expect(typeof result === "boolean").assertTrue();
      }
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4700
     * @tc.name testDoubleIsIntegerTwo0047
     * @tc.desc Verify isInteger after arithmetic operations on Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(1.5).add(new Double(0.5));
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(3.0).sub(new Double(0.5));
      expect(d2.isInteger()).assertEqual(false);
      let d3 = new Double(2.0).mul(new Double(3.0));
      expect(d3.isInteger()).assertEqual(true);
      let d4 = new Double(5.0).div(new Double(2.0));
      expect(d4.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4800
     * @tc.name testDoubleIsIntegerTwo0048
     * @tc.desc Verify instance isInteger matches static Double.isInteger for the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.0, 1.0, 2.5, -1.0, Double.NaN, Double.POSITIVE_INFINITY, Double.MAX_VALUE, Double.MIN_VALUE];
      for (let v of values) {
        let d = new Double(v);
        expect(d.isInteger()).assertEqual(Double.isInteger(v));
      }
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_4900
     * @tc.name testDoubleIsIntegerTwo0049
     * @tc.desc Verify isInteger called directly on chain-constructed Double instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(42.0).isInteger()).assertEqual(true);
      expect(new Double("42").isInteger()).assertEqual(true);
      expect(new Double(new BigInt(42)).isInteger()).assertEqual(true);
      expect(new Double().isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_5000
     * @tc.name testDoubleIsIntegerTwo0050
     * @tc.desc Verify isInteger returns true for powers of two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(1.0).isInteger()).assertEqual(true);
      expect(new Double(2.0).isInteger()).assertEqual(true);
      expect(new Double(4.0).isInteger()).assertEqual(true);
      expect(new Double(1024.0).isInteger()).assertEqual(true);
      expect(new Double(1048576.0).isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_5100
     * @tc.name testDoubleIsIntegerTwo0051
     * @tc.desc Verify isInteger returns true for negative powers of two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Double(-1.0).isInteger()).assertEqual(true);
      expect(new Double(-2.0).isInteger()).assertEqual(true);
      expect(new Double(-4.0).isInteger()).assertEqual(true);
      expect(new Double(-1024.0).isInteger()).assertEqual(true);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_5200
     * @tc.name testDoubleIsIntegerTwo0052
     * @tc.desc Verify isInteger for division results that are integer or non-integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new Double(6.0).div(new Double(3.0));
      expect(d1.isInteger()).assertEqual(true);
      let d2 = new Double(7.0).div(new Double(3.0));
      expect(d2.isInteger()).assertEqual(false);
    });

    /**
     * @tc.number DBL_IS_INTGR_TWO_5300
     * @tc.name testDoubleIsIntegerTwo0053
     * @tc.desc Verify isInteger consistency with valueOf result for non-integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsIntegerTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Double(3.14);
      let rawValue: number = d.valueOf();
      expect(d.isInteger()).assertEqual(Double.isInteger(rawValue));
      expect(d.isInteger()).assertEqual(false);
    });
  });
}
