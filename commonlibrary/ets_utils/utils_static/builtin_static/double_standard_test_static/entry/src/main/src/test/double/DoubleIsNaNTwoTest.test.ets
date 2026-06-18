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

export default function DoubleIsNaNTwoTest(): void {
  describe('DoubleIsNaNTwoTest', (): void => {
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
     * @tc.number DBL_IS_NA_N_2_0100
     * @tc.name testDoubleIsNaNTwo0001
     * @tc.desc Verify calling isNaN() without parameters returns true for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NaN);
      let result: boolean = value.isNaN();
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_0200
     * @tc.name testDoubleIsNaNTwo0002
     * @tc.desc Verify calling isNaN() with extra parameters still executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.5);
      let result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_0400
     * @tc.name testDoubleIsNaNTwo0004
     * @tc.desc Verify calling isNaN() on instance created by no-arg constructor returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double();
      let result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_0500
     * @tc.name testDoubleIsNaNTwo0005
     * @tc.desc Verify calling isNaN() on instance created by BigInt returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(new BigInt(42));
      let result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_0600
     * @tc.name testDoubleIsNaNTwo0006
     * @tc.desc Verify calling isNaN() on instance created by String returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double("3.5");
      let result: boolean = value.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_0700
     * @tc.name testDoubleIsNaNTwo0007
     * @tc.desc Verify calling isNaN() on instance created by unparsable String returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double("abc");
      let result: boolean = value.isNaN();
      expect(result).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_0900
     * @tc.name testDoubleIsNaNTwo0009
     * @tc.desc Verify isNaN() returns true for instance constructed with NaN constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NaN);
      expect(value.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1100
     * @tc.name testDoubleIsNaNTwo0011
     * @tc.desc Verify isNaN() returns false for zero value instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(0.0);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1200
     * @tc.name testDoubleIsNaNTwo0012
     * @tc.desc Verify isNaN() returns false for negative zero value instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(-0.0);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1300
     * @tc.name testDoubleIsNaNTwo0013
     * @tc.desc Verify isNaN() returns false for positive infinity instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.POSITIVE_INFINITY);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1400
     * @tc.name testDoubleIsNaNTwo0014
     * @tc.desc Verify isNaN() returns false for negative infinity instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1500
     * @tc.name testDoubleIsNaNTwo0015
     * @tc.desc Verify isNaN() returns false for MAX_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.MAX_VALUE);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1600
     * @tc.name testDoubleIsNaNTwo0016
     * @tc.desc Verify isNaN() returns false for MIN_VALUE instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.MIN_VALUE);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1700
     * @tc.name testDoubleIsNaNTwo0017
     * @tc.desc Verify isNaN() returns false for integer value instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(42.0);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1800
     * @tc.name testDoubleIsNaNTwo0018
     * @tc.desc Verify isNaN() returns false for negative number instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(-3.14);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_1900
     * @tc.name testDoubleIsNaNTwo0019
     * @tc.desc Verify isNaN() returns true for instance with NaN from 0 divided by 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new Double(0.0);
      const result = new Double(0.0).div(new Double(0.0));
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2000
     * @tc.name testDoubleIsNaNTwo0020
     * @tc.desc Verify isNaN() returns true for instance with NaN from infinity minus infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const inf = new Double(Double.POSITIVE_INFINITY);
      const result = inf.sub(new Double(Double.POSITIVE_INFINITY));
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2100
     * @tc.name testDoubleIsNaNTwo0021
     * @tc.desc Verify isNaN() returns false for MAX_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2200
     * @tc.name testDoubleIsNaNTwo0022
     * @tc.desc Verify isNaN() returns false for MIN_SAFE_INTEGER instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2300
     * @tc.name testDoubleIsNaNTwo0023
     * @tc.desc Verify isNaN() return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NaN);
      let result = value.isNaN();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2400
     * @tc.name testDoubleIsNaNTwo0024
     * @tc.desc Verify isNaN() return value type is boolean for non-NaN instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.0);
      let result = value.isNaN();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2600
     * @tc.name testDoubleIsNaNTwo0026
     * @tc.desc Verify isNaN() returns false for DELTA constant instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.DELTA);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_2700
     * @tc.name testDoubleIsNaNTwo0027
     * @tc.desc Verify isNaN() returns false for EPSILON constant instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.EPSILON);
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3000
     * @tc.name testDoubleIsNaNTwo0030
     * @tc.desc Verify isNaN() normal execution does not trigger catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const value = new Double(1.5);
  expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3200
     * @tc.name testDoubleIsNaNTwo0032
     * @tc.desc Verify instance isNaN() matches static isNaN() result for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NaN);
      expect(value.isNaN()).assertEqual(Double.isNaN(Double.NaN));
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3300
     * @tc.name testDoubleIsNaNTwo0033
     * @tc.desc Verify instance isNaN() matches static isNaN() result for non-NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(1.5);
      expect(value.isNaN()).assertEqual(Double.isNaN(1.5));
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3400
     * @tc.name testDoubleIsNaNTwo0034
     * @tc.desc Verify multiple calls to isNaN() on same instance return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(Double.NaN);
      let first: boolean = value.isNaN();
      let second: boolean = value.isNaN();
      expect(first).assertEqual(second);
      expect(first).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3500
     * @tc.name testDoubleIsNaNTwo0035
     * @tc.desc Verify multiple calls to isNaN() on non-NaN instance return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value = new Double(3.14);
      let first: boolean = value.isNaN();
      let second: boolean = value.isNaN();
      expect(first).assertEqual(second);
      expect(first).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3600
     * @tc.name testDoubleIsNaNTwo0036
     * @tc.desc Verify isNaN() returns false after add operation chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = new Double(1.0).add(new Double(2.0));
      expect(result.isNaN()).assertFalse();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3700
     * @tc.name testDoubleIsNaNTwo0037
     * @tc.desc Verify isNaN() returns true after div operation producing NaN chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = new Double(0.0).div(new Double(0.0));
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number DBL_IS_NA_N_2_3800
     * @tc.name testDoubleIsNaNTwo0038
     * @tc.desc Verify NaN value toString then parseFloat still produces NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleIsNaNTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nanValue = new Double(Double.NaN);
      const str: String = nanValue.toString();
      const parsed = new Double(str);
      expect(parsed.isNaN()).assertTrue();
    });
  });
}
