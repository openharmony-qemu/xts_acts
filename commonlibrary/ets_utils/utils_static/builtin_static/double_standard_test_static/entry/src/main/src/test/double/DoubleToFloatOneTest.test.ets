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

export default function DoubleToFloatOneTest(): void {
  describe('DoubleToFloatOneTest', () => {
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
     * @tc.number DBL_TO_FLOAT_ONE_0100
     * @tc.name doubleToFloatTest0001
     * @tc.desc Verify toFloat is a no-parameter instance method and can be called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      const result: float = value.toFloat();
      expect(result).assertClose(1.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_0400
     * @tc.name doubleToFloatTest0004
     * @tc.desc Verify integer double value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.0);
      const result: float = value.toFloat();
      expect(result).assertClose(12.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_0500
     * @tc.name doubleToFloatTest0005
     * @tc.desc Verify negative double value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-3.14);
      const result: float = value.toFloat();
      expect(Math.abs(result - (-3.14)) < 0.01).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_0600
     * @tc.name doubleToFloatTest0006
     * @tc.desc Verify zero value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: float = value.toFloat();
      expect(result).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_0700
     * @tc.name doubleToFloatTest0007
     * @tc.desc Verify negative zero value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result: float = value.toFloat();
      expect(result).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_0800
     * @tc.name doubleToFloatTest0008
     * @tc.desc Verify default constructor Double instance toFloat returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result: float = value.toFloat();
      expect(result).assertClose(0.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_0900
     * @tc.name doubleToFloatTest0009
     * @tc.desc Verify NaN converts to float remains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result: float = value.toFloat();
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1000
     * @tc.name doubleToFloatTest0010
     * @tc.desc Verify positive infinity converts to float remains positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: float = value.toFloat();
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1100
     * @tc.name doubleToFloatTest0011
     * @tc.desc Verify negative infinity converts to float remains negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: float = value.toFloat();
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1200
     * @tc.name doubleToFloatTest0012
     * @tc.desc Verify Double.MAX_VALUE overflows to float positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result: float = value.toFloat();
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1300
     * @tc.name doubleToFloatTest0013
     * @tc.desc Verify Double.MIN_VALUE converts to float underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result: float = value.toFloat();
      expect(result).assertClose(0.0, Float.MIN_VALUE);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1400
     * @tc.name doubleToFloatTest0014
     * @tc.desc Verify very small positive value near float precision limit converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.17549435e-38);
      const result: float = value.toFloat();
      expect(Math.abs(result - 1.17549435e-38) / 1.17549435e-38 < 1e-6).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1500
     * @tc.name doubleToFloatTest0015
     * @tc.desc Verify large float-range double value converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(3.4028235e38);
      const result: float = value.toFloat();
      expect(Math.abs(result - 3.4028235e38) / 3.4028235e38 < 1e-6).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1600
     * @tc.name doubleToFloatTest0016
     * @tc.desc Verify very large finite double value overflows to float positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(3.4028236e38);
      const result: float = value.toFloat();
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1700
     * @tc.name doubleToFloatTest0017
     * @tc.desc Verify toFloat return type is float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      const result: float = value.toFloat();
      expect(result === 1.5).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1800
     * @tc.name doubleToFloatTest0018
     * @tc.desc Verify precision loss when converting from double to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.123456789012345);
      const result: float = value.toFloat();
      expect(Math.abs(result - 1.123456789012345) > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_1900
     * @tc.name doubleToFloatTest0019
     * @tc.desc Verify MAX_SAFE_INTEGER converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result: float = value.toFloat();
      expect(result).assertClose(Double.MAX_SAFE_INTEGER, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2000
     * @tc.name doubleToFloatTest0020
     * @tc.desc Verify MIN_SAFE_INTEGER converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result: float = value.toFloat();
      expect(result).assertClose(Double.MIN_SAFE_INTEGER, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2100
     * @tc.name doubleToFloatTest0021
     * @tc.desc Verify Double instance constructed with BigInt converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result: float = value.toFloat();
      expect(result).assertClose(42.0, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2200
     * @tc.name doubleToFloatTest0022
     * @tc.desc Verify Double instance constructed with String converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const result: float = value.toFloat();
      expect(result).assertClose(3.5, Double.DELTA);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2300
     * @tc.name doubleToFloatTest0023
     * @tc.desc Verify Double instance constructed with unparseable String toFloat returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result: float = value.toFloat();
      expect(Double.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2400
     * @tc.name doubleToFloatTest0024
     * @tc.desc Verify very large negative double value overflows to float negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-3.4028236e38);
      const result: float = value.toFloat();
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2500
     * @tc.name doubleToFloatTest0025
     * @tc.desc Verify calling toFloat returns expected default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      const result: float = value.toFloat();
      expect(result === 1.0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2600
     * @tc.name doubleToFloatTest0026
     * @tc.desc Verify large double value overflows to float infinity without throwing exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e39);
      const result: float = value.toFloat();
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_TO_FLOAT_ONE_2700
     * @tc.name doubleToFloatTest0027
     * @tc.desc Verify very small double value underflows to float zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('doubleToFloatTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e-46);
      const result: float = value.toFloat();
      expect(result).assertClose(0.0, Float.MIN_VALUE);
    });
  });
}
