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

export default function DoubleConstructorTwoTest(): void {
  describe('DoubleConstructorTwoTest', () : void => {
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
     * @tc.number DBL_CNSTR_TWO_CHK_0100
     * @tc.name testDoubleConstructorTwo0001
     * @tc.desc Verify passing one double parameter creates Double instance normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_0400
     * @tc.name testDoubleConstructorTwo0004
     * @tc.desc Verify positive integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0);
      expect(value.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_0500
     * @tc.name testDoubleConstructorTwo0005
     * @tc.desc Verify positive decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      expect(value.toDouble()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_0600
     * @tc.name testDoubleConstructorTwo0006
     * @tc.desc Verify negative integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1.0);
      expect(value.toDouble()).assertEqual(-1.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_0700
     * @tc.name testDoubleConstructorTwo0007
     * @tc.desc Verify negative decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-888.88);
      expect(value.toDouble()).assertEqual(-888.88);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_0800
     * @tc.name testDoubleConstructorTwo0008
     * @tc.desc Verify zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      expect(value.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_0900
     * @tc.name testDoubleConstructorTwo0009
     * @tc.desc Verify high precision decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.456789012345);
      expect(value.toDouble()).assertEqual(123.456789012345);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1000
     * @tc.name testDoubleConstructorTwo0010
     * @tc.desc Verify scientific notation representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.0e6);
      expect(value.toDouble()).assertEqual(1000000.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1100
     * @tc.name testDoubleConstructorTwo0011
     * @tc.desc Verify hexadecimal floating point representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mantissa = 1.125;
      const exponent = Math.pow(2, 3);
      const hexFloatValue = mantissa * exponent;
      const value = new Double(hexFloatValue);
      expect(value.toDouble()).assertEqual(9.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1200
     * @tc.name testDoubleConstructorTwo0012
     * @tc.desc Verify double max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.7976931348623157e308);
      expect(value.toDouble()).assertEqual(1.7976931348623157e308);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1300
     * @tc.name testDoubleConstructorTwo0013
     * @tc.desc Verify double minimum positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(5e-324);
      expect(value.toDouble()).assertEqual(5e-324);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1400
     * @tc.name testDoubleConstructorTwo0014
     * @tc.desc Verify value close to max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.7976931348623155e308);
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1500
     * @tc.name testDoubleConstructorTwo0015
     * @tc.desc Verify safe integer max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(9007199254740991.0);
      expect(value.toDouble()).assertEqual(9007199254740991.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1600
     * @tc.name testDoubleConstructorTwo0016
     * @tc.desc Verify safe integer min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-9007199254740991.0);
      expect(value.toDouble()).assertEqual(-9007199254740991.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1700
     * @tc.name testDoubleConstructorTwo0017
     * @tc.desc Verify value beyond safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(9007199254740992.0);
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_1800
     * @tc.name testDoubleConstructorTwo0018
     * @tc.desc Verify value close to overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.7976931348623157e308);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2000
     * @tc.name testDoubleConstructorTwo0020
     * @tc.desc Verify positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      expect(value.toDouble()).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2100
     * @tc.name testDoubleConstructorTwo0021
     * @tc.desc Verify negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      expect(value.toDouble()).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2200
     * @tc.name testDoubleConstructorTwo0022
     * @tc.desc Verify negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      expect(value.toDouble()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2300
     * @tc.name testDoubleConstructorTwo0023
     * @tc.desc Verify DELTA constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.DELTA);
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2400
     * @tc.name testDoubleConstructorTwo0024
     * @tc.desc Verify EPSILON constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.EPSILON);
      expect(value).not().assertNull();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2500
     * @tc.name testDoubleConstructorTwo0025
     * @tc.desc Verify MIN_VALUE constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      expect(value.toDouble()).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_2600
     * @tc.name testDoubleConstructorTwo0026
     * @tc.desc Verify MAX_VALUE constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      expect(value.toDouble()).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3200
     * @tc.name testDoubleConstructorTwo0032
     * @tc.desc Verify normal double value creates instance with matching internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(3.14);
      expect(value.toDouble()).assertEqual(3.14);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3300
     * @tc.name testDoubleConstructorTwo0033
     * @tc.desc Verify negative number creates instance with correct internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-2.718);
      expect(value.toDouble()).assertEqual(-2.718);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3400
     * @tc.name testDoubleConstructorTwo0034
     * @tc.desc Verify integer value creates Double instance correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(42.0);
      expect(value.toDouble()).assertEqual(42.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3500
     * @tc.name testDoubleConstructorTwo0035
     * @tc.desc Verify valueOf returns double value matching constructor parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(9.99);
      expect(value.valueOf()).assertEqual(9.99);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3600
     * @tc.name testDoubleConstructorTwo0036
     * @tc.desc Verify toString outputs correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(15.5);
      expect(value.toString()).assertEqual("15.5");
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3700
     * @tc.name testDoubleConstructorTwo0037
     * @tc.desc Verify NaN value creates instance with NaN internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NaN);
      expect(value.isNaN()).assertTrue();
      expect(Double.isNaN(value.valueOf())).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3800
     * @tc.name testDoubleConstructorTwo0038
     * @tc.desc Verify positive infinity creates instance with positive infinity internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.POSITIVE_INFINITY);
      expect(value.valueOf()).assertEqual(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_3900
     * @tc.name testDoubleConstructorTwo0039
     * @tc.desc Verify negative infinity creates instance with negative infinity internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.NEGATIVE_INFINITY);
      expect(value.valueOf()).assertEqual(Double.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4000
     * @tc.name testDoubleConstructorTwo0040
     * @tc.desc Verify zero value creates instance with 0.0 internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(0.0);
      expect(value.valueOf()).assertEqual(0.0);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4100
     * @tc.name testDoubleConstructorTwo0041
     * @tc.desc Verify negative zero creates instance with -0.0 internal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-0.0);
      expect(value.valueOf()).assertEqual(-0.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4200
     * @tc.name testDoubleConstructorTwo0042
     * @tc.desc Verify return value is Double instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      expect(value instanceof Double).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4300
     * @tc.name testDoubleConstructorTwo0043
     * @tc.desc Verify Double instance can be assigned to Number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Number = new Double(1.5);
      expect(value.toString()).assertEqual("1.5");
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4400
     * @tc.name testDoubleConstructorTwo0044
     * @tc.desc Verify Double implements Comparable interface and compareTo works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      const other = new Double(2.0);
      expect(value.compareTo(other)).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4500
     * @tc.name testDoubleConstructorTwo0045
     * @tc.desc Verify conversion methods toByte/toShort/toInt/toFloat/toDouble work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(123.5);
      expect(value.toByte()).assertEqual(123);
      expect(value.toShort()).assertEqual(123);
      expect(value.toInt()).assertEqual(123);
      expect(value.toFloat()).assertEqual(123.5);
      expect(value.toDouble()).assertEqual(123.5);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4600
     * @tc.name testDoubleConstructorTwo0046
     * @tc.desc Verify MAX_VALUE creates instance with unchanged value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_VALUE);
      expect(value.toDouble()).assertEqual(Double.MAX_VALUE);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4700
     * @tc.name testDoubleConstructorTwo0047
     * @tc.desc Verify MIN_VALUE creates instance with unchanged value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MIN_VALUE);
      expect(value.toDouble()).assertEqual(Double.MIN_VALUE);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_4800
     * @tc.name testDoubleConstructorTwo0048
     * @tc.desc Verify MAX_SAFE_INTEGER creates instance as safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(Double.MAX_SAFE_INTEGER);
      expect(value.isSafeInteger()).assertTrue();
      expect(value.isInteger()).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5000
     * @tc.name testDoubleConstructorTwo0050
     * @tc.desc Verify normal double value construction does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Double | null = null;
      result = new Double(1.5);
      expect(result).not().assertNull();
      expect(result!.toDouble()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5100
     * @tc.name testDoubleConstructorTwo0051
     * @tc.desc Verify type mismatch caught by catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
      try {
        const value = new Double(null as double);
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('ClassCastError');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5200
     * @tc.name testDoubleConstructorTwo0052
     * @tc.desc Verify Double constructor initializes value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1.5);
      expect(value.valueOf()).assertEqual(1.5);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5300
     * @tc.name testDoubleConstructorTwo0053
     * @tc.desc Verify double parameter constructor vs no-argument constructor difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double();
      const v2 = new Double(0.0);
      expect(v1.toDouble()).assertEqual(0.0);
      expect(v2.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5400
     * @tc.name testDoubleConstructorTwo0054
     * @tc.desc Verify double parameter constructor vs BigInt parameter constructor consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(42.0);
      const v2 = new Double(new BigInt(42));
      expect(v1.toDouble()).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5500
     * @tc.name testDoubleConstructorTwo0055
     * @tc.desc Verify double parameter constructor vs String parameter constructor consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(3.5);
      const v2 = new Double("3.5");
      expect(v1.toDouble()).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5800
     * @tc.name testDoubleConstructorTwo0058
     * @tc.desc Verify multiple instances with different values are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(1.0);
      const v2 = new Double(2.0);
      const v3 = new Double(3.0);
      expect(v1.toDouble()).assertEqual(1.0);
      expect(v2.toDouble()).assertEqual(2.0);
      expect(v3.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_5900
     * @tc.name testDoubleConstructorTwo0059
     * @tc.desc Verify calling add method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(1.5);
      const v2 = new Double(2.0);
      const result = v1.add(v2);
      expect(result.toDouble()).assertEqual(3.5);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6000
     * @tc.name testDoubleConstructorTwo0060
     * @tc.desc Verify calling sub method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(3.5);
      const v2 = new Double(1.5);
      const result = v1.sub(v2);
      expect(result.toDouble()).assertEqual(2.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6100
     * @tc.name testDoubleConstructorTwo0061
     * @tc.desc Verify calling mul method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(3.0);
      const v2 = new Double(2.0);
      const result = v1.mul(v2);
      expect(result.toDouble()).assertEqual(6.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6200
     * @tc.name testDoubleConstructorTwo0062
     * @tc.desc Verify calling div method after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(6.0);
      const v2 = new Double(2.0);
      const result = v1.div(v2);
      expect(result.toDouble()).assertEqual(3.0);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6300
     * @tc.name testDoubleConstructorTwo0063
     * @tc.desc Verify equals returns true for same double value instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(1.5);
      const v2 = new Double(1.5);
      expect(v1.equals(v2)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6400
     * @tc.name testDoubleConstructorTwo0064
     * @tc.desc Verify compareTo returns non-zero for different double value instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(1.0);
      const v2 = new Double(2.0);
      expect(v1.compareTo(v2)).assertEqual(-1);
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6500
     * @tc.name testDoubleConstructorTwo0065
     * @tc.desc Verify isLessThan returns true for smaller value instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(1.0);
      const v2 = new Double(2.0);
      expect(v1.isLessThan(v2)).assertTrue();
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6600
     * @tc.name testDoubleConstructorTwo0066
     * @tc.desc Verify toFixed outputs correct result after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      expect(value.toFixed(2.0)).assertEqual("12.35");
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6700
     * @tc.name testDoubleConstructorTwo0067
     * @tc.desc Verify toExponential outputs correct result after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.5);
      expect(value.toExponential(2.0)).assertEqual("1.25e+1");
    });

    /**
     * @tc.number DBL_CNSTR_TWO_CHK_6800
     * @tc.name testDoubleConstructorTwo0068
     * @tc.desc Verify toPrecision outputs correct result after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleConstructorTwo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(12.345);
      expect(value.toPrecision(4.0)).assertEqual("12.35");
    });
  });
}
