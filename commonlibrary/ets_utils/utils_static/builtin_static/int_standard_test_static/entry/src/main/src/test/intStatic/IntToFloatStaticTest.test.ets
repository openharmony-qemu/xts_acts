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

export default function IntToFloatStaticTest(): void {
  describe('IntToFloatStaticTest', (): void => {
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
     * @tc.number INT_TO_FLOAT_S_CHK_0100
     * @tc.name testIntToFloatStatic0001
     * @tc.desc Verify that value parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(65);
      expect(result).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_0200
     * @tc.name testIntToFloatStatic0002
     * @tc.desc Verify Int.toFloat with zero returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_0400
     * @tc.name testIntToFloatStatic0004
     * @tc.desc Verify toFloat with normal range integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(99999);
      expect(result).assertEqual(99999.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_0500
     * @tc.name testIntToFloatStatic0005
     * @tc.desc Verify toFloat with positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(5000);
      expect(result).assertEqual(5000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_0600
     * @tc.name testIntToFloatStatic0006
     * @tc.desc Verify toFloat with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-5000);
      expect(result).assertEqual(-5000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_0800
     * @tc.name testIntToFloatStatic0008
     * @tc.desc Verify toFloat with int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(2147483647);
      expect(Math.abs((result) - (2147483647.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_0900
     * @tc.name testIntToFloatStatic0009
     * @tc.desc Verify toFloat with int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-2147483648);
      expect(Math.abs((result) - (-2147483648.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1000
     * @tc.name testIntToFloatStatic0010
     * @tc.desc Verify toFloat with positive hexadecimal integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(0x41);
      expect(result).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1100
     * @tc.name testIntToFloatStatic0011
     * @tc.desc Verify toFloat with negative hexadecimal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-0x41);
      expect(result).assertEqual(-65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1200
     * @tc.name testIntToFloatStatic0012
     * @tc.desc Verify toFloat with octal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(0o101);
      expect(result).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1300
     * @tc.name testIntToFloatStatic0013
     * @tc.desc Verify toFloat with binary number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(0b1000001);
      expect(result).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1600
     * @tc.name testIntToFloatStatic0016
     * @tc.desc Verify Int.toFloat with int literal returns matching float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(123);
      expect(result).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1800
     * @tc.name testIntToFloatStatic0018
     * @tc.desc Verify Int.toFloat with int value 1 returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(1);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_1900
     * @tc.name testIntToFloatStatic0019
     * @tc.desc Verify toFloat returns converted float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(123);
      expect(result).assertEqual(123.0);
      expect(typeof result).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_2000
     * @tc.name testIntToFloatStatic0020
     * @tc.desc Verify that return value is float type (32-bit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(456);
      expect(typeof result).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_2400
     * @tc.name testIntToFloatStatic0024
     * @tc.desc Verify toFloat with normal negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-99999);
      expect(result).assertEqual(-99999.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_2500
     * @tc.name testIntToFloatStatic0025
     * @tc.desc Verify toFloat with negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-12345);
      expect(result).assertEqual(-12345.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_2600
     * @tc.name testIntToFloatStatic0026
     * @tc.desc Verify toFloat with int minimum value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(Int.MIN_VALUE);
      expect(Math.abs((result) - (-2147483648.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_2700
     * @tc.name testIntToFloatStatic0027
     * @tc.desc Verify toFloat with int maximum value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(Int.MAX_VALUE);
      expect(Math.abs((result) - (2147483647.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_2800
     * @tc.name testIntToFloatStatic0028
     * @tc.desc Verify toFloat with -1 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-1);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3000
     * @tc.name testIntToFloatStatic0030
     * @tc.desc Verify toFloat with large number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(1000000);
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3100
     * @tc.name testIntToFloatStatic0031
     * @tc.desc Verify toFloat with negative large number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-1000000);
      expect(result).assertEqual(-1000000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3200
     * @tc.name testIntToFloatStatic0032
     * @tc.desc Verify that return value is number type (float)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(1000);
      expect(typeof result).assertEqual("float");
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3300
     * @tc.name testIntToFloatStatic0033
     * @tc.desc Verify that return value has float characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(123);
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3400
     * @tc.name testIntToFloatStatic0034
     * @tc.desc Verify float type precision limitation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(123456789);
      expect(Math.abs((result) - (123456789.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3600
     * @tc.name testIntToFloatStatic0036
     * @tc.desc Verify that toFloat must be called statically from Int class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(7500);
      expect(result).assertEqual(7500.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3700
     * @tc.name testIntToFloatStatic0037
     * @tc.desc Verify that static toFloat and instance toFloat produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = Int.toFloat(65);
      const result2 = a.toFloat();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3800
     * @tc.name testIntToFloatStatic0038
     * @tc.desc Verify that toFloat return value can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = Int.toFloat(100);
      const result = f + 50.5;
      expect(result).assertEqual(150.5);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_3900
     * @tc.name testIntToFloatStatic0039
     * @tc.desc Verify float arithmetic after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toFloat(10);
      const b = Int.toFloat(3);
      const result = a / b;
      expect(Math.abs((result) - (3.333)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4000
     * @tc.name testIntToFloatStatic0040
     * @tc.desc Verify that converting same value multiple times produces consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toFloat(99999);
      const result2 = Int.toFloat(99999);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4100
     * @tc.name testIntToFloatStatic0041
     * @tc.desc Verify arithmetic result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(100 + 50);
      expect(result).assertEqual(150.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4200
     * @tc.name testIntToFloatStatic0042
     * @tc.desc Verify complex expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat((10 * 10) - 5);
      expect(result).assertEqual(95.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4400
     * @tc.name testIntToFloatStatic0044
     * @tc.desc Verify that toFloat returns float while toByte returns integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 100;
      const f = Int.toFloat(value);
      const b = Int.toByte(value);
      expect(f).assertEqual(100.0);
      expect(b).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4500
     * @tc.name testIntToFloatStatic0045
     * @tc.desc Verify that toFloat returns float while toShort returns integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 10000;
      const f = Int.toFloat(value);
      const s = Int.toShort(value);
      expect(f).assertEqual(10000.0);
      expect(s).assertEqual(10000);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4600
     * @tc.name testIntToFloatStatic0046
     * @tc.desc Verify that toInt returns integer while toFloat returns float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const i = Int.toInt(value);
      const f = Int.toFloat(value);
      expect(i).assertEqual(12345);
      expect(f).assertEqual(12345.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4700
     * @tc.name testIntToFloatStatic0047
     * @tc.desc Verify that toLong returns integer while toFloat returns float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123;
      const f = Int.toFloat(value);
      expect(f).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4800
     * @tc.name testIntToFloatStatic0048
     * @tc.desc Verify that toDouble has higher precision than toFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123456789;
      const f = Int.toFloat(value);
      const d = Int.toDouble(value);
      expect(Math.abs((f) - (123456789.0)) <= 10.0).assertTrue();
      expect(d).assertEqual(123456789.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_4900
     * @tc.name testIntToFloatStatic0049
     * @tc.desc Verify toFloat used in float arithmetic scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toFloat(10);
      const b = Int.toFloat(4);
      const result = a / b;
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5000
     * @tc.name testIntToFloatStatic0050
     * @tc.desc Verify toFloat used in scientific computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Int.toFloat(100);
      const percentage = value * 0.25;
      expect(percentage).assertEqual(25.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5100
     * @tc.name testIntToFloatStatic0051
     * @tc.desc Verify toFloat used in graphics coordinate calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x = Int.toFloat(100);
      const y = Int.toFloat(200);
      const distance = Math.sqrt(x * x + y * y);
      expect((distance) > (223)).assertTrue();
      expect((distance) < (224)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5300
     * @tc.name testIntToFloatStatic0053
     * @tc.desc Verify that double precision is typically higher
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123456789;
      const f = Int.toFloat(value);
      const d = Int.toDouble(value);
      expect((Math.abs(d - 123456789.0)) <= (Math.abs(f - 123456789.0))).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5400
     * @tc.name testIntToFloatStatic0054
     * @tc.desc Verify toFloat performance with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0.0;
      for (let i = 0; i < 1000; i++) {
        sum += Int.toFloat(1000);
      }
      expect(sum).assertEqual(1000000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5500
     * @tc.name testIntToFloatStatic0055
     * @tc.desc Verify documentation example output 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.info(Int.toFloat(65));
      expect(Int.toFloat(65)).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5700
     * @tc.name testIntToFloatStatic0057
     * @tc.desc Verify float multiplication after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toFloat(100);
      const result = a * 0.5;
      expect(result).assertEqual(50.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_5900
     * @tc.name testIntToFloatStatic0059
     * @tc.desc Verify integer zero converts to float zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(0);
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6000
     * @tc.name testIntToFloatStatic0060
     * @tc.desc Verify negative zero conversion if applicable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(-0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6100
     * @tc.name testIntToFloatStatic0061
     * @tc.desc Verify conversion to float array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [10, 20, 30];
      const floats = values.map((v: int): float => Int.toFloat(v));
      expect(floats.length).assertEqual(3);
      expect(floats[0]).assertEqual(10.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6200
     * @tc.name testIntToFloatStatic0062
     * @tc.desc Verify using Math function after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Int.toFloat(16);
      const result = Math.sqrt(value);
      expect(result).assertEqual(4.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6300
     * @tc.name testIntToFloatStatic0063
     * @tc.desc Verify power operation after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Int.toFloat(2);
      const result = Math.pow(value, 10);
      expect(result).assertEqual(1024.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6400
     * @tc.name testIntToFloatStatic0064
     * @tc.desc Verify rounding after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Int.toFloat(100);
      const f = value / 3;
      const rounded = Math.round(f);
      expect(rounded).assertEqual(33);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6600
     * @tc.name testIntToFloatStatic0066
     * @tc.desc Verify int value is within float representation range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(Int.MAX_VALUE);
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6700
     * @tc.name testIntToFloatStatic0067
     * @tc.desc Verify comparison after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toFloat(100);
      const b = Int.toFloat(200);
      expect((a) < (b)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6800
     * @tc.name testIntToFloatStatic0068
     * @tc.desc Verify approximate comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Int.toFloat(100);
      const result = value / 3;
      expect((Math.abs(result - 33.333)) < (0.001)).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_6900
     * @tc.name testIntToFloatStatic0069
     * @tc.desc Verify static toFloat and instance toFloat are consistent in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [Int.MIN_VALUE, -1000000, -1000, -1, 0, 1, 1000, 1000000, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(Int.toFloat(v)).assertEqual(a.toFloat());
      });
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_7000
     * @tc.name testIntToFloatStatic0070
     * @tc.desc Verify combined use of valueOf and static toFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      const value = a.toInt();
      const f = Int.toFloat(value);
      expect(f).assertEqual(654.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_7100
     * @tc.name testIntToFloatStatic0071
     * @tc.desc Verify using static property as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toFloat(Int.MAX_VALUE);
      const minResult = Int.toFloat(Int.MIN_VALUE);
      expect(Math.abs((maxResult) - (2147483647.0)) <= 10.0).assertTrue();
      expect(Math.abs((minResult) - (-2147483648.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_7200
     * @tc.name testIntToFloatStatic0072
     * @tc.desc Verify expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 500;
      const b = 300;
      const result = Int.toFloat(a + b);
      expect(result).assertEqual(800.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_7300
     * @tc.name testIntToFloatStatic0073
     * @tc.desc Verify batch conversion of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: int[] = [0, 1000, 2000, 3000];
      const floats = numbers.map((n: int): float => Int.toFloat(n));
      expect(floats.length).assertEqual(4);
      expect(floats[2]).assertEqual(2000.0);
    });

    /**
     * @tc.number INT_TO_FLOAT_S_CHK_7500
     * @tc.name testIntToFloatStatic0075
     * @tc.desc Verify compliance with IEEE 754 single precision standard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToFloatStatic0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toFloat(123);
      expect(typeof result).assertEqual("float");
      expect(Number.isFinite(result)).assertTrue();
    });
  });
}
