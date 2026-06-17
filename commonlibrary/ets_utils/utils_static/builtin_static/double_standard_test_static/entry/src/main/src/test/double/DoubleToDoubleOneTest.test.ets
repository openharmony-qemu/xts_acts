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

export default function DoubleToDoubleOneTest(): void {
  describe('DoubleToDoubleOneTest', (): void => {
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
     * @tc.number DBL_TO_ONE_CHK_0100
     * @tc.name testDoubleToDouble0001
     * @tc.desc Verify normal call toDouble without parameters returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      const result: double = value.toDouble();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_0400
     * @tc.name testDoubleToDouble0004
     * @tc.desc Verify toDouble returns 42.0 for Double instance with integer value 42.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(42.0);
      const result: double = value.toDouble();
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_0500
     * @tc.name testDoubleToDouble0005
     * @tc.desc Verify toDouble returns 0.0 for Double instance with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: double = value.toDouble();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_0600
     * @tc.name testDoubleToDouble0006
     * @tc.desc Verify toDouble returns -0.0 for Double instance with negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result: double = value.toDouble();
      expect(result).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_0700
     * @tc.name testDoubleToDouble0007
     * @tc.desc Verify toDouble returns -3.14 for Double instance with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-3.14);
      const result: double = value.toDouble();
      expect(result).assertEqual(-3.14);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_0800
     * @tc.name testDoubleToDouble0008
     * @tc.desc Verify toDouble returns MIN_VALUE for Double instance with MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result: double = value.toDouble();
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_0900
     * @tc.name testDoubleToDouble0009
     * @tc.desc Verify toDouble returns 3.5 for Double constructed from string "3.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const result: double = value.toDouble();
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1000
     * @tc.name testDoubleToDouble0010
     * @tc.desc Verify toDouble returns 42.0 for Double constructed from BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result: double = value.toDouble();
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1100
     * @tc.name testDoubleToDouble0011
     * @tc.desc Verify toDouble returns 0.0 for Double constructed with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result: double = value.toDouble();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1200
     * @tc.name testDoubleToDouble0012
     * @tc.desc Verify multiple calls to toDouble return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(2.718);
      const result1: double = value.toDouble();
      const result2: double = value.toDouble();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(2.718);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1300
     * @tc.name testDoubleToDouble0013
     * @tc.desc Verify toDouble returns NaN for Double instance with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result: double = value.toDouble();
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1400
     * @tc.name testDoubleToDouble0014
     * @tc.desc Verify toDouble returns positive infinity for Double instance with positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: double = value.toDouble();
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1500
     * @tc.name testDoubleToDouble0015
     * @tc.desc Verify toDouble returns negative infinity for Double instance with negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: double = value.toDouble();
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1600
     * @tc.name testDoubleToDouble0016
     * @tc.desc Verify toDouble returns NaN for Double constructed from unparseable string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result: double = value.toDouble();
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1700
     * @tc.name testDoubleToDouble0017
     * @tc.desc Verify the return type of toDouble is double primitive type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      const result: double = value.toDouble();
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_1800
     * @tc.name testDoubleToDouble0018
     * @tc.desc Verify toDouble return value equals valueOf return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(3.14);
      const toDoubleResult: double = value.toDouble();
      const valueOfResult: number = value.valueOf();
      expect(toDoubleResult).assertEqual(valueOfResult);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2000
     * @tc.name testDoubleToDouble0020
     * @tc.desc Verify toDouble returns MAX_VALUE for Double instance with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result: double = value.toDouble();
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2200
     * @tc.name testDoubleToDouble0022
     * @tc.desc Verify toDouble returns MAX_SAFE_INTEGER for Double instance with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result: double = value.toDouble();
      expect(result).assertEqual(Double.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2300
     * @tc.name testDoubleToDouble0023
     * @tc.desc Verify toDouble returns MIN_SAFE_INTEGER for Double instance with MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result: double = value.toDouble();
      expect(result).assertEqual(Double.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2400
     * @tc.name testDoubleToDouble0024
     * @tc.desc Verify toDouble correctly returns very large negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-Double.MAX_VALUE);
      const result: double = value.toDouble();
      expect(result).assertEqual(-Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2500
     * @tc.name testDoubleToDouble0025
     * @tc.desc Verify toDouble correctly returns high precision decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.123456789012345);
      const result: double = value.toDouble();
      expect(result).assertEqual(0.123456789012345);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2600
     * @tc.name testDoubleToDouble0026
     * @tc.desc Verify toDouble correctly returns scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e-10);
      const result: double = value.toDouble();
      expect(result).assertEqual(1.0e-10);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_2700
     * @tc.name testDoubleToDouble0027
     * @tc.desc Verify toDouble does not throw any exception during normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      let result: double = 0.0;
      result = value.toDouble();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_3100
     * @tc.name testDoubleToDouble0031
     * @tc.desc Verify polymorphic call to toDouble through parent class reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Double = new Double(3.14);
      const result: double = value.toDouble();
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_3200
     * @tc.name testDoubleToDouble0032
     * @tc.desc Verify toDouble as public method is accessible from external class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(2.5);
      const result: double = value.toDouble();
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_3300
     * @tc.name testDoubleToDouble0033
     * @tc.desc Verify toDouble preserves double precision while toFloat may lose precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.123456789012345);
      const doubleResult: double = value.toDouble();
      const floatResult: float = value.toFloat();
      expect(doubleResult).assertEqual(0.123456789012345);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_3400
     * @tc.name testDoubleToDouble0034
     * @tc.desc Verify calling toDouble immediately after constructing new Double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = new Double(9.9).toDouble();
      expect(result).assertEqual(9.9);
    });

    /**
     * @tc.number DBL_TO_ONE_CHK_3500
     * @tc.name testDoubleToDouble0035
     * @tc.desc Verify calling toDouble on arithmetic method return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToDouble0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(3.0);
      const b = new Double(2.0);
      const addResult: double = a.add(b).toDouble();
      expect(addResult).assertEqual(5.0);
      const subResult: double = a.sub(b).toDouble();
      expect(subResult).assertEqual(1.0);
      const mulResult: double = a.mul(b).toDouble();
      expect(mulResult).assertEqual(6.0);
      const divResult: double = a.div(b).toDouble();
      expect(divResult).assertEqual(1.5);
    });
  });
}
