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

export default function DoubleToExponentialWithNoDigitTest(): void {
  describe('DoubleToExponentialWithNoDigitTest', () => {
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
     * @tc.number DBL_TO_EXPNN_WITH_0001
     * @tc.name testDoubleToExponentialWithNoDigit0001
     * @tc.desc Verify calling toExponentialWithNoDigit without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0002
     * @tc.name testDoubleToExponentialWithNoDigit0002
     * @tc.desc Verify calling toExponentialWithNoDigit with extra parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5678);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1.2345678e+3");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0003
     * @tc.name testDoubleToExponentialWithNoDigit0003
     * @tc.desc Verify positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1.23e+2");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0004
     * @tc.name testDoubleToExponentialWithNoDigit0004
     * @tc.desc Verify negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-123.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("-1.23e+2");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0005
     * @tc.name testDoubleToExponentialWithNoDigit0005
     * @tc.desc Verify negative decimal conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.5);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("-1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0006
     * @tc.name testDoubleToExponentialWithNoDigit0006
     * @tc.desc Verify zero value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("0e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0007
     * @tc.name testDoubleToExponentialWithNoDigit0007
     * @tc.desc Verify negative zero value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("0e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0008
     * @tc.name testDoubleToExponentialWithNoDigit0008
     * @tc.desc Verify large value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123456.789);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1.23456789e+5");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0009
     * @tc.name testDoubleToExponentialWithNoDigit0009
     * @tc.desc Verify very small positive value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.000123);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1.23e-4");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0010
     * @tc.name testDoubleToExponentialWithNoDigit0010
     * @tc.desc Verify very small negative value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.000123);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("-1.23e-4");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0011
     * @tc.name testDoubleToExponentialWithNoDigit0011
     * @tc.desc Verify single digit integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(5.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("5e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0012
     * @tc.name testDoubleToExponentialWithNoDigit0012
     * @tc.desc Verify value created with scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e6);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1e+6");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0013
     * @tc.name testDoubleToExponentialWithNoDigit0013
     * @tc.desc Verify pure decimal value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.5);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("5e-1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0014
     * @tc.name testDoubleToExponentialWithNoDigit0014
     * @tc.desc Verify default constructed Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("0e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0015
     * @tc.name testDoubleToExponentialWithNoDigit0015
     * @tc.desc Verify Double instance created from string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("12.5");
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0016
     * @tc.name testDoubleToExponentialWithNoDigit0016
     * @tc.desc Verify NaN value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0017
     * @tc.name testDoubleToExponentialWithNoDigit0017
     * @tc.desc Verify POSITIVE_INFINITY conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0018
     * @tc.name testDoubleToExponentialWithNoDigit0018
     * @tc.desc Verify NEGATIVE_INFINITY conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0019
     * @tc.name testDoubleToExponentialWithNoDigit0019
     * @tc.desc Verify MAX_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toExponentialWithNoDigit();
      expect(result.includes("e+")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0020
     * @tc.name testDoubleToExponentialWithNoDigit0020
     * @tc.desc Verify MIN_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toExponentialWithNoDigit();
      expect(result.includes("e-")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0021
     * @tc.name testDoubleToExponentialWithNoDigit0021
     * @tc.desc Verify 1.0 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("1e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0022
     * @tc.name testDoubleToExponentialWithNoDigit0022
     * @tc.desc Verify -1.0 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1.0);
      const result = value.toExponentialWithNoDigit();
      expect(result).assertEqual("-1e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0023
     * @tc.name testDoubleToExponentialWithNoDigit0023
     * @tc.desc Verify return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponentialWithNoDigit();
      expect(typeof result === "string").assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0024
     * @tc.name testDoubleToExponentialWithNoDigit0024
     * @tc.desc Verify return value contains exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.456);
      const result = value.toExponentialWithNoDigit();
      expect(result.includes("e") || result.includes("E")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0025
     * @tc.name testDoubleToExponentialWithNoDigit0025
     * @tc.desc Verify multiple calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result1 = value.toExponentialWithNoDigit();
      const result2 = value.toExponentialWithNoDigit();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0026
     * @tc.name testDoubleToExponentialWithNoDigit0026
     * @tc.desc Verify different instances with same value return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(12.5);
      const value2 = new Double(12.5);
      const result1 = value1.toExponentialWithNoDigit();
      const result2 = value2.toExponentialWithNoDigit();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0027
     * @tc.name testDoubleToExponentialWithNoDigit0027
     * @tc.desc Verify calling after arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(6.0);
      const b = new Double(2.0);
      const sum = a.add(b);
      const result = sum.toExponentialWithNoDigit();
      expect(result).assertEqual("8e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_WITH_0028
     * @tc.name testDoubleToExponentialWithNoDigit0028
     * @tc.desc Verify calling on division by zero result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponentialWithNoDigit0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Double(1.0);
      const zero = new Double(0.0);
      const divResult = a.div(zero);
      const result = divResult.toExponentialWithNoDigit();
      expect(result).assertEqual("Infinity");
    });
  });
}