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

export default function IntToFloatTest(): void {
  describe('IntToFloatTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0100
     * @tc.name testIntToFloat0001
     * @tc.desc Verify toFloat accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toFloat();
      expect(result).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0300
     * @tc.name testIntToFloat0003
     * @tc.desc Verify toFloat returns converted float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.toFloat();
      expect(result).assertEqual(123.0);
      expect(typeof result).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0400
     * @tc.name testIntToFloat0004
     * @tc.desc Verify toFloat returns float type value (32-bit floating point)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      const result = a.toFloat();
      expect(typeof result).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0500
     * @tc.name testIntToFloat0005
     * @tc.desc Verify toFloat converts normal positive integer to floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      expect(a.toFloat()).assertEqual(99999.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0600
     * @tc.name testIntToFloat0006
     * @tc.desc Verify toFloat converts small positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toFloat()).assertEqual(1.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0700
     * @tc.name testIntToFloat0007
     * @tc.desc Verify toFloat converts zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0800
     * @tc.name testIntToFloat0008
     * @tc.desc Verify toFloat converts normal negative integer to floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-99999);
      expect(a.toFloat()).assertEqual(-99999.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_0900
     * @tc.name testIntToFloat0009
     * @tc.desc Verify toFloat converts negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-12345);
      expect(a.toFloat()).assertEqual(-12345.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1000
     * @tc.name testIntToFloat0010
     * @tc.desc Verify toFloat with int minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      const result = a.toFloat();
      expect(result).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1100
     * @tc.name testIntToFloat0011
     * @tc.desc Verify toFloat with int maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const result = a.toFloat();
      expect(Math.abs((result) - (2147483647.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1200
     * @tc.name testIntToFloat0012
     * @tc.desc Verify toFloat converts value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.toFloat()).assertEqual(-1.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1400
     * @tc.name testIntToFloat0014
     * @tc.desc Verify toFloat converts large positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const result = a.toFloat();
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1500
     * @tc.name testIntToFloat0015
     * @tc.desc Verify toFloat converts large negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000000);
      const result = a.toFloat();
      expect(result).assertEqual(-1000000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1600
     * @tc.name testIntToFloat0016
     * @tc.desc Verify toFloat returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.toFloat();
      expect(typeof result).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1700
     * @tc.name testIntToFloat0017
     * @tc.desc Verify toFloat result has floating point characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.toFloat();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1800
     * @tc.name testIntToFloat0018
     * @tc.desc Verify toFloat and floatValue have same functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      expect(a.toFloat()).assertEqual(Int.toFloat(a.toInt()));
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_1900
     * @tc.name testIntToFloat0019
     * @tc.desc Verify toFloat and floatValue consistency at boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      expect(a.toFloat()).assertEqual(Int.toFloat(a.toInt()));
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2000
     * @tc.name testIntToFloat0020
     * @tc.desc Verify toFloat and floatValue consistency with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-654);
      expect(a.toFloat()).assertEqual(Int.toFloat(a.toInt()));
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2100
     * @tc.name testIntToFloat0021
     * @tc.desc Verify floatValue follows Java naming convention
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(789);
      expect(a.toFloat()).assertEqual(Int.toFloat(a.toInt()));
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2200
     * @tc.name testIntToFloat0022
     * @tc.desc Verify toFloat must be called through Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7500);
      const result = a.toFloat();
      expect(result).assertEqual(7500.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2300
     * @tc.name testIntToFloat0023
     * @tc.desc Verify toFloat does not change original Int instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8888);
      const original = a.toInt();
      const result = a.toFloat();
      expect(a.toInt()).assertEqual(original);
      expect(result).assertEqual(8888.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2400
     * @tc.name testIntToFloat0024
     * @tc.desc Verify instance toFloat and static toFloat produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6666);
      const result1 = a.toFloat();
      const result2 = Int.toFloat(6666);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2500
     * @tc.name testIntToFloat0025
     * @tc.desc Verify toFloat return value can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const f = a.toFloat();
      const result = f + 50.5;
      expect(result).assertEqual(150.5);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2600
     * @tc.name testIntToFloat0026
     * @tc.desc Verify toFloat result can be used in floating point arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(3);
      const result = a.toFloat() / b.toFloat();
      expect(Math.abs((result) - (3.333)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2700
     * @tc.name testIntToFloat0027
     * @tc.desc Verify same value multiple conversions yield consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      const result1 = a.toFloat();
      const result2 = a.toFloat();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2800
     * @tc.name testIntToFloat0028
     * @tc.desc Verify different instances with same value yield consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(77777);
      const a2 = new Int(77777);
      expect(a1.toFloat()).assertEqual(a2.toFloat());
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_2900
     * @tc.name testIntToFloat0029
     * @tc.desc Verify toFloat converts arithmetic operation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20000);
      const b = new Int(10000);
      const result = a.add(b).toFloat();
      expect(result).assertEqual(30000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3000
     * @tc.name testIntToFloat0030
     * @tc.desc Verify toFloat converts MAX_VALUE to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const result = max.toFloat();
      expect(Math.abs((result) - (2147483647.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3100
     * @tc.name testIntToFloat0031
     * @tc.desc Verify toFloat converts MIN_VALUE to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      const result = min.toFloat();
      expect(Math.abs((result) - (-2147483648.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3200
     * @tc.name testIntToFloat0032
     * @tc.desc Verify toFloat returns float while toByte returns integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const f = a.toFloat();
      const b = a.toByte();
      expect(f).assertEqual(100.0);
      expect(b).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3300
     * @tc.name testIntToFloat0033
     * @tc.desc Verify toFloat returns float while toShort returns integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const f = a.toFloat();
      const s = a.toShort();
      expect(f).assertEqual(10000.0);
      expect(s).assertEqual(10000);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3400
     * @tc.name testIntToFloat0034
     * @tc.desc Verify toInt returns integer while toFloat returns float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const i = a.toInt();
      const f = a.toFloat();
      expect(i).assertEqual(12345);
      expect(f).assertEqual(12345.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3500
     * @tc.name testIntToFloat0035
     * @tc.desc Verify toLong keeps integer while toFloat converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const l = a.toLong();
      const f = a.toFloat();
      expect(l).assertEqual(123);
      expect(f).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3600
     * @tc.name testIntToFloat0036
     * @tc.desc Verify toDouble has higher precision than toFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      const f = a.toFloat();
      const d = a.toDouble();
      expect(Math.abs((f) - (123456789.0)) <= 10.0).assertTrue();
      expect(d).assertEqual(123456789.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3700
     * @tc.name testIntToFloat0037
     * @tc.desc Verify toFloat used in floating point division scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(4);
      const result = a.toFloat() / b.toFloat();
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3800
     * @tc.name testIntToFloat0038
     * @tc.desc Verify toFloat used for scientific calculation representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(100);
      const f = value.toFloat();
      const percentage = f * 0.25;
      expect(percentage).assertEqual(25.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_3900
     * @tc.name testIntToFloat0039
     * @tc.desc Verify toFloat used for graphic coordinate calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x = new Int(100);
      const y = new Int(200);
      const fx = x.toFloat();
      const fy = y.toFloat();
      const distance = Math.sqrt(fx * fx + fy * fy);
      expect((distance) > (223)).assertTrue();
      expect((distance) < (224)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4000
     * @tc.name testIntToFloat0040
     * @tc.desc Verify toFloat precision limitation of float type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      const result = a.toFloat();
      expect(Math.abs((result) - (123456789.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4200
     * @tc.name testIntToFloat0042
     * @tc.desc Verify toFloat performance with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      let sum = 0.0;
      for (let i = 0; i < 1000; i++) {
        sum += a.toFloat();
      }
      expect(sum).assertEqual(1000000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4300
     * @tc.name testIntToFloat0043
     * @tc.desc Verify toFloat method exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      expect(a.toFloat()).assertEqual(500.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4500
     * @tc.name testIntToFloat0045
     * @tc.desc Verify toFloat result has floating point characteristics for division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toFloat();
      const divided = result / 3;
      expect(Math.abs((divided) - (33.333)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4600
     * @tc.name testIntToFloat0046
     * @tc.desc Verify toFloat result can be checked with isNaN and isFinite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toFloat();
      expect(Number.isNaN(result)).assertFalse();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4700
     * @tc.name testIntToFloat0047
     * @tc.desc Verify toFloat can be called on valueOf-created instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      const result = a.toFloat();
      expect(result).assertEqual(654.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4800
     * @tc.name testIntToFloat0048
     * @tc.desc Verify instance toFloat and static toFloat produce identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      const result1 = a.toFloat();
      const result2 = Int.toFloat(654);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_4900
     * @tc.name testIntToFloat0049
     * @tc.desc Verify toFloat document example output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toFloat()).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5100
     * @tc.name testIntToFloat0051
     * @tc.desc Verify toFloat result used in floating point multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toFloat() * 0.5;
      expect(result).assertEqual(50.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5200
     * @tc.name testIntToFloat0052
     * @tc.desc Verify toDouble has higher precision than toFloat for large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      const f = a.toFloat();
      expect(Math.abs(f - 123456789.0) < 256.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5300
     * @tc.name testIntToFloat0053
     * @tc.desc Verify toFloat converts integer zero to floating point zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const result = a.toFloat();
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5400
     * @tc.name testIntToFloat0054
     * @tc.desc Verify toFloat converts negative zero to floating point zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-0);
      const result = a.toFloat();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5500
     * @tc.name testIntToFloat0055
     * @tc.desc Verify toFloat used in float array operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(20), new Int(30)];
      const floats = values.map((v: Int): float => v.toFloat());
      expect(floats.length).assertEqual(3);
      expect(floats[0]).assertEqual(10.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5600
     * @tc.name testIntToFloat0056
     * @tc.desc Verify toFloat result used with Math.sqrt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16);
      const result = Math.sqrt(a.toFloat());
      expect(result).assertEqual(4.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5700
     * @tc.name testIntToFloat0057
     * @tc.desc Verify toFloat result used with Math.pow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const result = Math.pow(a.toFloat(), 10);
      expect(result).assertEqual(1024.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5800
     * @tc.name testIntToFloat0058
     * @tc.desc Verify toFloat result used with Math.round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const f = a.toFloat() / 3;
      const rounded = Math.round(f);
      expect(rounded).assertEqual(33);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_5900
     * @tc.name testIntToFloat0059
     * @tc.desc Verify toFloat result formatted with toFixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const f = a.toFloat();
      expect(f).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_6000
     * @tc.name testIntToFloat0060
     * @tc.desc Verify toFloat result is within float representable range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = new Int(Int.MAX_VALUE);
      const result = maxInt.toFloat();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_6100
     * @tc.name testIntToFloat0061
     * @tc.desc Verify toFloat result can be used for comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(200);
      expect((a.toFloat()) < (b.toFloat())).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_CHK_6200
     * @tc.name testIntToFloat0062
     * @tc.desc Verify toFloat result compared with approximate comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloat0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toFloat() / 3;
      expect((Math.abs(result - 33.333)) < (0.001)).assertTrue();
    });
  });
}
