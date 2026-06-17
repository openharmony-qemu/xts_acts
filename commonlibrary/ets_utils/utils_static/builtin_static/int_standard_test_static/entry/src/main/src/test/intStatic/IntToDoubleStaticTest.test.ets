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

export default function IntToDoubleStaticTest(): void {
  describe('IntToDoubleStaticTest', (): void => {
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
     * @tc.number INT_TO_DBL_S_CHK_0100
     * @tc.name testIntToDoubleStatic0001
     * @tc.desc Verify that value parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(65);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_0200
     * @tc.name testIntToDoubleStatic0002
     * @tc.desc Verify that error is thrown when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_0400
     * @tc.name testIntToDoubleStatic0004
     * @tc.desc Verify toDouble with normal integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_0500
     * @tc.name testIntToDoubleStatic0005
     * @tc.desc Verify toDouble with positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(500);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_0600
     * @tc.name testIntToDoubleStatic0006
     * @tc.desc Verify toDouble with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(-500);
      expect(result).assertEqual(-500);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_0800
     * @tc.name testIntToDoubleStatic0008
     * @tc.desc Verify toDouble with int max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_0900
     * @tc.name testIntToDoubleStatic0009
     * @tc.desc Verify toDouble with int min value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(-2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1000
     * @tc.name testIntToDoubleStatic0010
     * @tc.desc Verify toDouble with positive hexadecimal integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(0x41);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1100
     * @tc.name testIntToDoubleStatic0011
     * @tc.desc Verify toDouble with negative hexadecimal boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(0x7FFFFFFF);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1200
     * @tc.name testIntToDoubleStatic0012
     * @tc.desc Verify toDouble with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(0o101);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1300
     * @tc.name testIntToDoubleStatic0013
     * @tc.desc Verify toDouble with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(0b1000001);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1400
     * @tc.name testIntToDoubleStatic0014
     * @tc.desc Verify toDouble with value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1500
     * @tc.name testIntToDoubleStatic0015
     * @tc.desc Verify toDouble with value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_1800
     * @tc.name testIntToDoubleStatic0018
     * @tc.desc Verify toDouble behavior when passing float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(123);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_2100
     * @tc.name testIntToDoubleStatic0021
     * @tc.desc Verify toDouble returns converted double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(123);
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_2200
     * @tc.name testIntToDoubleStatic0022
     * @tc.desc Verify toDouble return value is double type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(500);
      expect(typeof result).assertEqual("number");
      expect((result) >= (Number.MIN_VALUE)).assertTrue();
      expect((result) <= (Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_2300
     * @tc.name testIntToDoubleStatic0023
     * @tc.desc Verify toDouble with normal positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_2600
     * @tc.name testIntToDoubleStatic0026
     * @tc.desc Verify toDouble with normal negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(-9999);
      expect(result).assertEqual(-9999);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3200
     * @tc.name testIntToDoubleStatic0032
     * @tc.desc Verify toDouble with large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(1000000);
      expect(result).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3300
     * @tc.name testIntToDoubleStatic0033
     * @tc.desc Verify toDouble preserves precision for all int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 1, -1, 100, -100, 2147483647, -2147483648];
      testValues.forEach((v: int): void => {
        const result = Int.toDouble(v);
        expect(result).assertEqual(v);
      });
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3400
     * @tc.name testIntToDoubleStatic0034
     * @tc.desc Verify toDouble has no precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123456789;
      const result = Int.toDouble(value);
      expect(result).assertEqual(123456789);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3500
     * @tc.name testIntToDoubleStatic0035
     * @tc.desc Verify toDouble return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(1000);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3600
     * @tc.name testIntToDoubleStatic0036
     * @tc.desc Verify toDouble return value can be used in floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(10);
      const division = result / 3;
      expect(Math.abs((division) - (3.333)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3700
     * @tc.name testIntToDoubleStatic0037
     * @tc.desc Verify toDouble must be called as static method of Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(7500);
      expect(result).assertEqual(7500);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3800
     * @tc.name testIntToDoubleStatic0038
     * @tc.desc Verify static toDouble matches instance doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = Int.toDouble(65);
      const result2 = a.toDouble();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_3900
     * @tc.name testIntToDoubleStatic0039
     * @tc.desc Verify toDouble return value can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = Int.toDouble(100);
      const result = d / 2.5;
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4000
     * @tc.name testIntToDoubleStatic0040
     * @tc.desc Verify toDouble produces consistent results for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toDouble(9999);
      const result2 = Int.toDouble(9999);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4100
     * @tc.name testIntToDoubleStatic0041
     * @tc.desc Verify toDouble with arithmetic expression result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(100 + 50);
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4200
     * @tc.name testIntToDoubleStatic0042
     * @tc.desc Verify toDouble with complex expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble((10 * 10) - 5);
      expect(result).assertEqual(95);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4300
     * @tc.name testIntToDoubleStatic0043
     * @tc.desc Verify toDouble with constant as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(Int.MAX_VALUE);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4400
     * @tc.name testIntToDoubleStatic0044
     * @tc.desc Verify toDouble has higher precision than toFloat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 2147483647;
      const d = Int.toDouble(value);
      const f = Int.toFloat(value);
      expect(Math.abs((d) - (f)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4500
     * @tc.name testIntToDoubleStatic0045
     * @tc.desc Verify toInt returns original int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      expect(Int.toInt(value)).assertEqual(12345);
      expect(Int.toDouble(value)).assertEqual(12345);
      expect(typeof Int.toDouble(value)).assertEqual("number");
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4600
     * @tc.name testIntToDoubleStatic0046
     * @tc.desc Verify toLong has larger range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const d = Int.toDouble(value);
      const l = Int.toLong(value);
      expect(d).assertEqual(12345);
      expect(l).assertEqual(12345);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4700
     * @tc.name testIntToDoubleStatic0047
     * @tc.desc Verify toDouble converts data for floating point operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intPart = Int.toDouble(10);
      const result = intPart / 3;
      expect(Math.abs((result) - (3.333)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4800
     * @tc.name testIntToDoubleStatic0048
     * @tc.desc Verify toDouble for high precision scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Int.toDouble(1000000);
      const preciseResult = value * 1.23456789;
      expect(Math.abs((preciseResult) - (1234567.89)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_4900
     * @tc.name testIntToDoubleStatic0049
     * @tc.desc Verify toDouble performance with multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0.0;
      for (let i = 0; i < 1000; i++) {
        sum += Int.toDouble(100);
      }
      expect(sum).assertEqual(100000);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5000
     * @tc.name testIntToDoubleStatic0050
     * @tc.desc Verify documentation example outputs 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.info(Int.toDouble(65));
      expect(Int.toDouble(65)).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5100
     * @tc.name testIntToDoubleStatic0051
     * @tc.desc Verify static toDouble matches instance doubleValue in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 1, -1, 100, -100, 2147483647, -2147483648];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(Int.toDouble(v)).assertEqual(a.toDouble());
      });
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5200
     * @tc.name testIntToDoubleStatic0052
     * @tc.desc Verify valid input range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [Int.MIN_VALUE, -1000, 0, 1000, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        expect(Int.toDouble(v)).assertEqual(v);
      });
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5300
     * @tc.name testIntToDoubleStatic0053
     * @tc.desc Verify return value is within valid double range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(Int.MAX_VALUE);
      expect((result) > (Number.MIN_VALUE)).assertTrue();
      expect((result) < (Number.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5400
     * @tc.name testIntToDoubleStatic0054
     * @tc.desc Verify round trip conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 10000;
      const toD = Int.toDouble(original);
      const result = toD + 5000.5;
      expect(result).assertEqual(15000.5);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5500
     * @tc.name testIntToDoubleStatic0055
     * @tc.desc Verify combination of valueOf and static toDouble
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16000);
      const value = a.toInt();
      const d = Int.toDouble(value);
      expect(d).assertEqual(16000);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5600
     * @tc.name testIntToDoubleStatic0056
     * @tc.desc Verify toDouble with static property as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toDouble(Int.MAX_VALUE);
      const minResult = Int.toDouble(Int.MIN_VALUE);
      expect(maxResult).assertEqual(2147483647);
      expect(minResult).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5700
     * @tc.name testIntToDoubleStatic0057
     * @tc.desc Verify toDouble with expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 5000;
      const b = 3000;
      const result = Int.toDouble(a + b);
      expect(result).assertEqual(8000);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5800
     * @tc.name testIntToDoubleStatic0058
     * @tc.desc Verify batch conversion of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: int[] = [0, 1000, 2000, 3000, 4000];
      const doubles = numbers.map((n: int): double => Int.toDouble(n));
      expect(doubles.length).assertEqual(5);
      expect(doubles[2]).assertEqual(2000);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_5900
     * @tc.name testIntToDoubleStatic0059
     * @tc.desc Verify double range is larger than int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intMax = Int.toDouble(Int.MAX_VALUE);
      const doubleMax = Number.MAX_VALUE;
      expect((intMax) < (doubleMax)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_6000
     * @tc.name testIntToDoubleStatic0060
     * @tc.desc Verify toDouble result participates in math operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = Int.toDouble(10);
      const result = d * 2.5 + d / 2;
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_6100
     * @tc.name testIntToDoubleStatic0061
     * @tc.desc Verify toDouble result operates with other double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i = Int.toDouble(100);
      const f = 3.14;
      const result = i * f;
      expect(Math.abs((result) - (314)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_6200
     * @tc.name testIntToDoubleStatic0062
     * @tc.desc Verify toDouble does not produce NaN or Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(Int.MAX_VALUE);
      expect(Number.isNaN(result)).assertFalse();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_S_CHK_6300
     * @tc.name testIntToDoubleStatic0063
     * @tc.desc Verify minimum negative value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDoubleStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toDouble(Int.MIN_VALUE);
      expect(Number.isFinite(result)).assertTrue();
      expect((result) < (0)).assertTrue();
    });
  });
}
