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

export default function DoubleToExponentialTwoTest(): void {
  describe('DoubleToExponentialTwoTest', () => {
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
     * @tc.number DBL_TO_EXPNN_TWO_0100
     * @tc.name testDoubleToExponential0001
     * @tc.desc Verify calling toExponential without parameters returns default exponential notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential();
      expect(result).assertEqual("1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_0200
     * @tc.name testDoubleToExponential0002
     * @tc.desc Verify passing parameter d returns exponential notation string with specified decimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_0300
     * @tc.name testDoubleToExponential0003
     * @tc.desc Verify d as normal decimal value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(0.0);
      expect(result).assertEqual("1e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_0400
     * @tc.name testDoubleToExponential0004
     * @tc.desc Verify d as normal decimal value 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(1.0);
      expect(result).assertEqual("1.2e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_0600
     * @tc.name testDoubleToExponential0006
     * @tc.desc Verify d as normal decimal value 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(5.0);
      expect(result).assertEqual("1.25000e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_0700
     * @tc.name testDoubleToExponential0007
     * @tc.desc Verify d as normal decimal value 10.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(10.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_0800
     * @tc.name testDoubleToExponential0008
     * @tc.desc Verify d as boundary value 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(100.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_1000
     * @tc.name testDoubleToExponential0010
     * @tc.desc Verify d as negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(-0.0);
      expect(result).assertEqual("1e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_1300
     * @tc.name testDoubleToExponential0013
     * @tc.desc Verify d as Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(Double.MIN_VALUE);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_1400
     * @tc.name testDoubleToExponential0014
     * @tc.desc Verify d as Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(Double.NaN);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_1700
     * @tc.name testDoubleToExponential0017
     * @tc.desc Verify d as scientific notation 1.0e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(1.0e2);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_1800
     * @tc.name testDoubleToExponential0018
     * @tc.desc Verify d as hexadecimal floating point 0x1.2p3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(8.5);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_1900
     * @tc.name testDoubleToExponential0019
     * @tc.desc Verify Double instance value as positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.0);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("1.23e+2");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2100
     * @tc.name testDoubleToExponential0021
     * @tc.desc Verify Double instance value as positive number less than 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.005);
      const result = value.toExponential(3.0);
      expect(result).assertEqual("5.000e-3");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2200
     * @tc.name testDoubleToExponential0022
     * @tc.desc Verify Double instance value as negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-123.0);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("-1.23e+2");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2300
     * @tc.name testDoubleToExponential0023
     * @tc.desc Verify Double instance value as negative decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.5);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("-1.25e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2400
     * @tc.name testDoubleToExponential0024
     * @tc.desc Verify Double instance value as 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("0.00e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2500
     * @tc.name testDoubleToExponential0025
     * @tc.desc Verify Double instance value as -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("-0.00e+0");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2600
     * @tc.name testDoubleToExponential0026
     * @tc.desc Verify Double instance value as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2700
     * @tc.name testDoubleToExponential0027
     * @tc.desc Verify Double instance value as positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2800
     * @tc.name testDoubleToExponential0028
     * @tc.desc Verify Double instance value as negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("-Infinity");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_2900
     * @tc.name testDoubleToExponential0029
     * @tc.desc Verify Double instance value as Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      const result = value.toExponential(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_3000
     * @tc.name testDoubleToExponential0030
     * @tc.desc Verify Double instance value as Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      const result = value.toExponential(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_3100
     * @tc.name testDoubleToExponential0031
     * @tc.desc Verify Double instance value as extreme large 1.0e100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e100);
      const result = value.toExponential(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_3200
     * @tc.name testDoubleToExponential0032
     * @tc.desc Verify Double instance value as extreme small 1.0e-100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e-100);
      const result = value.toExponential(2.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_3700
     * @tc.name testDoubleToExponential0037
     * @tc.desc Verify d as large value returns corresponding decimal exponential format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(20.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_4200
     * @tc.name testDoubleToExponential0042
     * @tc.desc Verify return value type is String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(2.0);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_4300
     * @tc.name testDoubleToExponential0043
     * @tc.desc Verify return value is String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(2.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_4400
     * @tc.name testDoubleToExponential0044
     * @tc.desc Verify return string contains e or E exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(2.0);
      expect(result.includes("e")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_4700
     * @tc.name testDoubleToExponential0047
     * @tc.desc Verify negative number exponential string contains minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-12.5);
      const result = value.toExponential(2.0);
      expect(result.startsWith("-")).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_4800
     * @tc.name testDoubleToExponential0048
     * @tc.desc Verify actual decimals more than d are truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.3456789);
      const result = value.toExponential(2.0);
      expect(result).assertEqual("1.23e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_5000
     * @tc.name testDoubleToExponential0050
     * @tc.desc Verify d as negative number handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(1.0);
      expect(result != null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_5300
     * @tc.name testDoubleToExponential0053
     * @tc.desc Verify d as positive infinity handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(3.0);
      expect(result).assertEqual("1.250e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_5400
     * @tc.name testDoubleToExponential0054
     * @tc.desc Verify d as negative infinity handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      const result = value.toExponential(4.0);
      expect(result).assertEqual("1.2500e+1");
    });

    /**
     * @tc.number DBL_TO_EXPNN_TWO_5500
     * @tc.name testDoubleToExponential0055
     * @tc.desc Verify toExponential returns correct result with valid fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToExponential0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      let result: string = "";
      result = value.toExponential(2.0);
      expect(result).assertEqual("1.25e+1");
    });

  });
}
