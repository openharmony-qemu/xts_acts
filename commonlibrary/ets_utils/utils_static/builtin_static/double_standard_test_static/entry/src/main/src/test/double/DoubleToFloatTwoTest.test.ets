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

export default function DoubleToFloatTwoTest(): void {
  describe('DoubleToFloatTwoTest', () => {
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
     * @tc.number DBL_TO_FLOAT_TWO_0100
     * @tc.name doubleToFloatTestTwo0001
     * @tc.desc Verify calling toFloat with one required double parameter returns correct float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.5);
      expect(result).assertClose(1.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_0500
     * @tc.name doubleToFloatTestTwo0005
     * @tc.desc Verify converting negative double value to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-888.88);
      expect(Math.abs(result - (-888.88)) < 0.01).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_0600
     * @tc.name doubleToFloatTestTwo0006
     * @tc.desc Verify converting zero double value to float returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(0.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_0700
     * @tc.name doubleToFloatTestTwo0007
     * @tc.desc Verify converting negative zero double value to float preserves negative zero sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-0.0);
      expect(1.0 / result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_0800
     * @tc.name doubleToFloatTestTwo0008
     * @tc.desc Verify converting integer double value to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(42.0);
      expect(result).assertClose(42.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_0900
     * @tc.name doubleToFloatTestTwo0009
     * @tc.desc Verify converting scientific notation double value to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.0e6);
      expect(result).assertClose(1000000.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1000
     * @tc.name doubleToFloatTestTwo0010
     * @tc.desc Verify converting hexadecimal floating-point double value to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(8.5);
      expect(result).assertClose(8.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1100
     * @tc.name doubleToFloatTestTwo0011
     * @tc.desc Verify Double.MAX_VALUE overflows to float positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.MAX_VALUE);
      expect(1 / result === 0).assertTrue();
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1200
     * @tc.name doubleToFloatTestTwo0012
     * @tc.desc Verify Double.MIN_VALUE underflows to 0 when converting to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.MIN_VALUE);
      expect(result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1300
     * @tc.name doubleToFloatTestTwo0013
     * @tc.desc Verify -Double.MAX_VALUE overflows to float negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-Double.MAX_VALUE);
      expect(1 / result === 0).assertTrue();
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1400
     * @tc.name doubleToFloatTestTwo0014
     * @tc.desc Verify double value near float max converts to finite float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(3.4028234663852886e38);
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1500
     * @tc.name doubleToFloatTestTwo0015
     * @tc.desc Verify double value exceeding float max overflows to positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(3.5e38);
      expect(1 / result === 0).assertTrue();
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1600
     * @tc.name doubleToFloatTestTwo0016
     * @tc.desc Verify double value exceeding float negative range overflows to negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-3.5e38);
      expect(1 / result === 0).assertTrue();
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1700
     * @tc.name doubleToFloatTestTwo0017
     * @tc.desc Verify double value near float min positive converts to non-zero positive float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.4e-45);
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1800
     * @tc.name doubleToFloatTestTwo0018
     * @tc.desc Verify double value smaller than float min positive underflows to 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.0e-50);
      expect(result === 0.0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_1900
     * @tc.name doubleToFloatTestTwo0019
     * @tc.desc Verify NaN double value converts to float NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.NaN);
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2000
     * @tc.name doubleToFloatTestTwo0020
     * @tc.desc Verify positive infinity double converts to float positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.POSITIVE_INFINITY);
      expect(1 / result === 0).assertTrue();
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2100
     * @tc.name doubleToFloatTestTwo0021
     * @tc.desc Verify negative infinity double converts to float negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.NEGATIVE_INFINITY);
      expect(1 / result === 0).assertTrue();
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2200
     * @tc.name doubleToFloatTestTwo0022
     * @tc.desc Verify high precision double value loses precision when converting to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.23456789012345);
      let backToDouble: double = result;
      expect(backToDouble !== 1.23456789012345).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2300
     * @tc.name doubleToFloatTestTwo0023
     * @tc.desc Verify double value close to integer converts with proper precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(99.999999);
      expect(result).assertClose(100.0, 0.001);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2400
     * @tc.name doubleToFloatTestTwo0024
     * @tc.desc Verify double value with many significant digits truncates to float precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(123456789.123456789);
      let backToDouble: double = result;
      expect(Math.abs(backToDouble - 123456792.0) < 10.0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2500
     * @tc.name doubleToFloatTestTwo0025
     * @tc.desc Verify double value within safe integer range converts to float correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatResult: float = Double.toFloat(100.0);
      expect(floatResult).assertClose(100.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2600
     * @tc.name doubleToFloatTestTwo0026
     * @tc.desc Verify standard positive double value returns correct float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(3.14);
      expect(result).assertClose(3.14, 0.01);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2700
     * @tc.name doubleToFloatTestTwo0027
     * @tc.desc Verify standard negative double value returns correct float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-2.718);
      expect(result).assertClose(-2.718, 0.01);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_2900
     * @tc.name doubleToFloatTestTwo0029
     * @tc.desc Verify large integer double value returns correct float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1000000.0);
      expect(result).assertClose(1000000.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3000
     * @tc.name doubleToFloatTestTwo0030
     * @tc.desc Verify small positive double within float range returns non-zero float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.0e-10);
      expect(result > 0).assertTrue();
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3100
     * @tc.name doubleToFloatTestTwo0031
     * @tc.desc Verify small negative double within float range returns non-zero float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-1.0e-10);
      expect(result < 0).assertTrue();
      expect(Double.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3300
     * @tc.name doubleToFloatTestTwo0033
     * @tc.desc Verify positive infinity or large double returns float positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.POSITIVE_INFINITY);
      expect(1 / result === 0 && result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3400
     * @tc.name doubleToFloatTestTwo0034
     * @tc.desc Verify negative infinity or very small double returns float negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.NEGATIVE_INFINITY);
      expect(1 / result === 0 && result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3500
     * @tc.name doubleToFloatTestTwo0035
     * @tc.desc Verify -0.0 input returns float negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-0.0);
      expect(result === 0).assertTrue();
      expect(1.0 / result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3600
     * @tc.name doubleToFloatTestTwo0036
     * @tc.desc Verify +0.0 input returns float positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(0.0);
      expect(result === 0).assertTrue();
      expect(1.0 / result > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3700
     * @tc.name doubleToFloatTestTwo0037
     * @tc.desc Verify return value type is number at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.5);
      expect(result === 1.5).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3800
     * @tc.name doubleToFloatTestTwo0038
     * @tc.desc Verify return value has float precision not double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: double = 1.23456789012345;
      let result: float = Double.toFloat(original);
      let backToDouble: double = result;
      expect(backToDouble !== original).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_3900
     * @tc.name doubleToFloatTestTwo0039
     * @tc.desc Verify multiple calls with same input return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: float = Double.toFloat(3.14);
      let result2: float = Double.toFloat(3.14);
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_4100
     * @tc.name doubleToFloatTestTwo0041
     * @tc.desc Verify double value exceeding float range returns infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posResult: float = Double.toFloat(1.0e50);
      expect(1 / posResult === 0 && posResult > 0).assertTrue();
      let negResult: float = Double.toFloat(-1.0e50);
      expect(1 / negResult === 0 && negResult < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_4300
     * @tc.name doubleToFloatTestTwo0043
     * @tc.desc Verify very small negative double underflows to -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(-1.0e-50);
      expect(result === 0).assertTrue();
      expect(1.0 / result < 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_4400
     * @tc.name doubleToFloatTestTwo0044
     * @tc.desc Verify precision loss from 15 significant digits to 7 significant digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(1.23456789012345);
      let backToDouble: double = result;
      expect(Math.abs(backToDouble - 1.2345679) < 0.000001).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_4500
     * @tc.name doubleToFloatTestTwo0045
     * @tc.desc Verify static toFloat and instance toFloat return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let staticResult: float = Double.toFloat(1.5);
      let instanceResult: float = new Double(1.5).toFloat();
      expect(staticResult === instanceResult).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_4800
     * @tc.name doubleToFloatTestTwo0048
     * @tc.desc Verify positive infinity input does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.POSITIVE_INFINITY);
      expect(1 / result === 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_4900
     * @tc.name doubleToFloatTestTwo0049
     * @tc.desc Verify overflow double value does not throw exception and returns infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Double.toFloat(Double.MAX_VALUE);
      expect(1 / result === 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_5100
     * @tc.name doubleToFloatTestTwo0051
     * @tc.desc Verify Double.toFloat converts value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Double.toFloat(1.5);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_5200
     * @tc.name doubleToFloatTestTwo0052
     * @tc.desc Verify Double.toFloat handles NaN correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Double.toFloat(Double.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_TWO_5300
     * @tc.name doubleToFloatTestTwo0053
     * @tc.desc Verify static toFloat method does not produce uncaught errors for various inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTestTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.0, 1.5, -888.88, Double.NaN, Double.POSITIVE_INFINITY,
        Double.NEGATIVE_INFINITY, Double.MAX_VALUE, Double.MIN_VALUE, -0.0];
      for (let i = 0; i < values.length; i++) {
        let result: float = Double.toFloat(values[i]);
        expect(result !== undefined).assertTrue();
      }
    });
  });
}
