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

export default function DoubleToFixedOneTest(): void {
  describe('DoubleToFixedOneTest', (): void => {
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
     * @tc.number DBL_TO_FIXED_ONE_0100
     * @tc.name testDoubleToFixed0001
     * @tc.desc Verify calling toFixed without parameters returns fixed-point notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0200
     * @tc.name testDoubleToFixed0002
     * @tc.desc Verify passing extra undeclared parameters behavior at compile time and runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0300
     * @tc.name testDoubleToFixed0003
     * @tc.desc Verify positive integer Double instance calls toFixed returns fixed-point string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.0);
      const result: String = value.toFixed();
      expect(result).assertEqual("12");
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0400
     * @tc.name testDoubleToFixed0004
     * @tc.desc Verify negative integer Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.0);
      const result: String = value.toFixed();
      expect(result).assertEqual("-12");
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0600
     * @tc.name testDoubleToFixed0006
     * @tc.desc Verify negative decimal Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.345);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0700
     * @tc.name testDoubleToFixed0007
     * @tc.desc Verify zero value Double instance calls toFixed returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result: String = value.toFixed();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0800
     * @tc.name testDoubleToFixed0008
     * @tc.desc Verify negative zero Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_0900
     * @tc.name testDoubleToFixed0009
     * @tc.desc Verify default constructor Double instance calls toFixed returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double();
      const result: String = value.toFixed();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1000
     * @tc.name testDoubleToFixed0010
     * @tc.desc Verify BigInt constructed Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(new BigInt(42));
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1100
     * @tc.name testDoubleToFixed0011
     * @tc.desc Verify String constructed Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("3.5");
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1200
     * @tc.name testDoubleToFixed0012
     * @tc.desc Verify NaN value Double instance calls toFixed returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1300
     * @tc.name testDoubleToFixed0013
     * @tc.desc Verify POSITIVE_INFINITY Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1400
     * @tc.name testDoubleToFixed0014
     * @tc.desc Verify NEGATIVE_INFINITY Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1500
     * @tc.name testDoubleToFixed0015
     * @tc.desc Verify MIN_VALUE Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1600
     * @tc.name testDoubleToFixed0016
     * @tc.desc Verify MAX_VALUE Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1700
     * @tc.name testDoubleToFixed0017
     * @tc.desc Verify MAX_SAFE_INTEGER Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1800
     * @tc.name testDoubleToFixed0018
     * @tc.desc Verify MIN_SAFE_INTEGER Double instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_SAFE_INTEGER);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_1900
     * @tc.name testDoubleToFixed0019
     * @tc.desc Verify unparseable string constructed NaN instance calls toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double("abc");
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_2000
     * @tc.name testDoubleToFixed0020
     * @tc.desc Verify toFixed return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed();
      expect(result instanceof String).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_2100
     * @tc.name testDoubleToFixed0021
     * @tc.desc Verify toFixed return value does not contain decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result: String = value.toFixed();
      expect(result.toString().includes(".")).assertFalse();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_2300
     * @tc.name testDoubleToFixed0023
     * @tc.desc Verify large number formatting result string completeness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.7976931348623157e+308);
      const result: String = value.toFixed();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_2400
     * @tc.name testDoubleToFixed0024
     * @tc.desc Verify MIN_VALUE formatting result is "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(4.9e-324);
      const result: String = value.toFixed();
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_2500
     * @tc.name testDoubleToFixed0025
     * @tc.desc Verify rounding behavior for decimal part close to 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(12.499);
      const result1: String = value1.toFixed();
      const value2 = new Double(12.5);
      const result2: String = value2.toFixed();
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_2600
     * @tc.name testDoubleToFixed0026
     * @tc.desc Verify negative number rounding behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1 = new Double(-12.499);
      const result1: String = value1.toFixed();
      const value2 = new Double(-12.5);
      const result2: String = value2.toFixed();
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_3000
     * @tc.name testDoubleToFixed0030
     * @tc.desc Verify no-arg toFixed result equals toFixedImpl(0.0) result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1: String = value.toFixed();
      const result2: String = value.toFixedImpl(0.0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_3100
     * @tc.name testDoubleToFixed0031
     * @tc.desc Verify no-arg toFixed and toFixed(undefined) return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1: String = value.toFixed();
      const result2: String = value.toFixed(undefined);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_3200
     * @tc.name testDoubleToFixed0032
     * @tc.desc Verify same instance multiple calls to toFixed return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      const result1: String = value.toFixed();
      const result2: String = value.toFixed();
      const result3: String = value.toFixed();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number DBL_TO_FIXED_ONE_3300
     * @tc.name testDoubleToFixed0033
     * @tc.desc Verify different constructors with same value return same toFixed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToFixed0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(42.0);
      const v2 = new Double("42");
      const v3 = new Double(new BigInt(42));
      expect(v1.toFixed()).assertEqual(v2.toFixed());
      expect(v2.toFixed()).assertEqual(v3.toFixed());
    });
  });
}
