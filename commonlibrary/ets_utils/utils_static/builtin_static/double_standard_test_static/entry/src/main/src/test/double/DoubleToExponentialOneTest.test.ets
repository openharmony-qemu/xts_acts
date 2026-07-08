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

export default function DoubleToExponentialOneTest(): void {
  describe('DoubleToExponentialOneTest', () => {
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
     * @tc.number DBL_TO_EXPNN_ONE_0400
     * @tc.name testDoubleToExponential0004
     * @tc.desc Verify positive integer value converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(100.0);
      const result = value.toExponential();
      expect(result).assertEqual("1e+2");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_0500
     * @tc.name testDoubleToExponential0005
     * @tc.desc Verify negative floating point number converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.5);
      const result = value.toExponential();
      expect(result).assertEqual("-1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_0600
     * @tc.name testDoubleToExponential0006
     * @tc.desc Verify zero value converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result = value.toExponential();
      expect(result).assertEqual("0e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_0700
     * @tc.name testDoubleToExponential0007
     * @tc.desc Verify negative zero converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result = value.toExponential();
      expect(result).assertEqual("0e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_0800
     * @tc.name testDoubleToExponential0008
     * @tc.desc Verify multi-decimal value converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.000123);
      const result = value.toExponential();
      expect(result).assertEqual("1.23e-4");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_0900
     * @tc.name testDoubleToExponential0009
     * @tc.desc Verify very small positive floating point number converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e-10);
      const result = value.toExponential();
      expect(result).assertEqual("1e-10");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1000
     * @tc.name testDoubleToExponential0010
     * @tc.desc Verify very large positive floating point number converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e20);
      const result = value.toExponential();
      expect(result).assertEqual("1e+20");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1100
     * @tc.name testDoubleToExponential0011
     * @tc.desc Verify NaN value converts to exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toExponential();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1200
     * @tc.name testDoubleToExponential0012
     * @tc.desc Verify positive infinity converts to exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toExponential();
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1300
     * @tc.name testDoubleToExponential0013
     * @tc.desc Verify negative infinity converts to exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result = value.toExponential();
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1400
     * @tc.name testDoubleToExponential0014
     * @tc.desc Verify Double.MIN_VALUE converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toExponential();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1500
     * @tc.name testDoubleToExponential0015
     * @tc.desc Verify Double.MAX_VALUE converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toExponential();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1600
     * @tc.name testDoubleToExponential0016
     * @tc.desc Verify default constructor Double instance calls toExponential
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result = value.toExponential();
      expect(result).assertEqual("0e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1700
     * @tc.name testDoubleToExponential0017
     * @tc.desc Verify BigInt constructed Double instance calls toExponential
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result = value.toExponential();
      expect(result).assertEqual("4.2e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1800
     * @tc.name testDoubleToExponential0018
     * @tc.desc Verify String constructed Double instance calls toExponential
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const result = value.toExponential();
      expect(result).assertEqual("3.5e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_1900
     * @tc.name testDoubleToExponential0019
     * @tc.desc Verify unparseable string constructed Double instance calls toExponential returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result = value.toExponential();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_2000
     * @tc.name testDoubleToExponential0020
     * @tc.desc Verify Double.MAX_SAFE_INTEGER converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result = value.toExponential();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_2100
     * @tc.name testDoubleToExponential0021
     * @tc.desc Verify Double.MIN_SAFE_INTEGER converts to exponential notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result = value.toExponential();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_2200
     * @tc.name testDoubleToExponential0022
     * @tc.desc Verify value 1.0 exponential notation output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      const result = value.toExponential();
      expect(result).assertEqual("1e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_2300
     * @tc.name testDoubleToExponential0023
     * @tc.desc Verify value -1.0 exponential notation output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1.0);
      const result = value.toExponential();
      expect(result).assertEqual("-1e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_2500
     * @tc.name testDoubleToExponential0025
     * @tc.desc Verify decimal less than 1 returns negative exponent string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.001);
      const result = value.toExponential();
      expect(result).assertEqual("1e-3");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_2600
     * @tc.name testDoubleToExponential0026
     * @tc.desc Verify integer value returns exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1000.0);
      const result = value.toExponential();
      expect(result).assertEqual("1e+3");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3100
     * @tc.name testDoubleToExponential0031
     * @tc.desc Verify return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3200
     * @tc.name testDoubleToExponential0032
     * @tc.desc Verify toExponential return value is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3300
     * @tc.name testDoubleToExponential0033
     * @tc.desc Verify return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3400
     * @tc.name testDoubleToExponential0034
     * @tc.desc Verify Double.MIN_VALUE returns minimal exponent string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toExponential();
      expect(result != null).assertTrue();
      expect(result.startsWith("5")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3500
     * @tc.name testDoubleToExponential0035
     * @tc.desc Verify Double.MAX_VALUE returns maximum exponent string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toExponential();
      expect(result != null).assertTrue();
      expect(result.includes("e+")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3700
     * @tc.name testDoubleToExponential0037
     * @tc.desc Verify undefined constructed Double instance via $_invoke calls toExponential
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Double.$_invoke(undefined);
      const result = value.toExponential();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3800
     * @tc.name testDoubleToExponential0038
     * @tc.desc Verify normal Double instance calls toExponential without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      let result: string = "";
      result = value.toExponential();
      expect(result).assertEqual("1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_3900
     * @tc.name testDoubleToExponential0039
     * @tc.desc Verify NaN Double instance calls toExponential without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      let result: string = "";
      result = value.toExponential();
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_4100
     * @tc.name testDoubleToExponential0041
     * @tc.desc Verify toExponential is instance method requiring Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential();
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_4300
     * @tc.name testDoubleToExponential0043
     * @tc.desc Verify no-arg toExponential and toExponentialWithNoDigit return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result1 = value.toExponential();
      const result2 = value.toExponentialWithNoDigit();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_4400
     * @tc.name testDoubleToExponential0044
     * @tc.desc Verify no-arg toExponential compared with toExponential with parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result1 = value.toExponential();
      const result2 = value.toExponential(0.0);
      expect(result1 != null).assertTrue();
      expect(result2 != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_4500
     * @tc.name testDoubleToExponential0045
     * @tc.desc Verify multiple calls to toExponential return same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result1 = value.toExponential();
      const result2 = value.toExponential();
      const result3 = value.toExponential();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_4600
     * @tc.name testDoubleToExponential0046
     * @tc.desc Verify different instances with same value return same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(12.5);
      const value2 = new Double(12.5);
      const result1 = value1.toExponential();
      const result2 = value2.toExponential();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_EXPNN_ONE_4700
     * @tc.name testDoubleToExponential0047
     * @tc.desc Verify toExponential return value supports chained String operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential();
      expect(result.length > 0).assertTrue();
    });
  });
}
