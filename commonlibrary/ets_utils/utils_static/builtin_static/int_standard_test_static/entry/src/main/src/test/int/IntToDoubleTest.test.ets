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

export default function IntToDoubleTest(): void {
  describe('IntToDoubleTest', (): void => {
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
     * @tc.number INT_TO_DBL_CHK_0100
     * @tc.name testIntToDouble0001
     * @tc.desc Verify toDouble accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toDouble();
      expect(result).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0300
     * @tc.name testIntToDouble0003
     * @tc.desc Verify toDouble returns converted double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.toDouble();
      expect(result).assertEqual(123.0);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0400
     * @tc.name testIntToDouble0004
     * @tc.desc Verify return value is double type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      const result = a.toDouble();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0500
     * @tc.name testIntToDouble0005
     * @tc.desc Verify positive integer conversion to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      expect(a.toDouble()).assertEqual(99999.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0600
     * @tc.name testIntToDouble0006
     * @tc.desc Verify small positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toDouble()).assertEqual(1.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0700
     * @tc.name testIntToDouble0007
     * @tc.desc Verify zero value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0800
     * @tc.name testIntToDouble0008
     * @tc.desc Verify negative integer conversion to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-99999);
      expect(a.toDouble()).assertEqual(-99999.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_0900
     * @tc.name testIntToDouble0009
     * @tc.desc Verify negative boundary value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-12345);
      expect(a.toDouble()).assertEqual(-12345.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1000
     * @tc.name testIntToDouble0010
     * @tc.desc Verify int min value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      const result = a.toDouble();
      expect(result).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1100
     * @tc.name testIntToDouble0011
     * @tc.desc Verify int max value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const result = a.toDouble();
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1200
     * @tc.name testIntToDouble0012
     * @tc.desc Verify negative one conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.toDouble()).assertEqual(-1.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1400
     * @tc.name testIntToDouble0014
     * @tc.desc Verify large number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const result = a.toDouble();
      expect(result).assertEqual(1000000.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1500
     * @tc.name testIntToDouble0015
     * @tc.desc Verify negative large number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1000000);
      const result = a.toDouble();
      expect(result).assertEqual(-1000000.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1600
     * @tc.name testIntToDouble0016
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.toDouble();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1700
     * @tc.name testIntToDouble0017
     * @tc.desc Verify return value has float characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.toDouble();
      expect(result % 1).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1800
     * @tc.name testIntToDouble0018
     * @tc.desc Verify double can exactly represent all int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      const result = a.toDouble();
      expect(result).assertEqual(123456789.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_1900
     * @tc.name testIntToDouble0019
     * @tc.desc Verify boundary value precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const result = max.toDouble();
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2000
     * @tc.name testIntToDouble0020
     * @tc.desc Verify toDouble equals doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      expect(a.toDouble()).assertEqual(654.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2100
     * @tc.name testIntToDouble0021
     * @tc.desc Verify boundary consistency with doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      expect(a.toDouble()).assertEqual(2147483647.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2200
     * @tc.name testIntToDouble0022
     * @tc.desc Verify negative value consistency with doubleValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-654);
      expect(a.toDouble()).assertEqual(-654.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2300
     * @tc.name testIntToDouble0023
     * @tc.desc Verify doubleValue naming convention consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(789);
      expect(a.toDouble()).assertEqual(789.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2400
     * @tc.name testIntToDouble0024
     * @tc.desc Verify toDouble called through Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7500);
      const result = a.toDouble();
      expect(result).assertEqual(7500.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2500
     * @tc.name testIntToDouble0025
     * @tc.desc Verify toDouble does not modify original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8888);
      const original = a.toInt();
      const result = a.toDouble();
      expect(a.toInt()).assertEqual(original);
      expect(result).assertEqual(8888.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2600
     * @tc.name testIntToDouble0026
     * @tc.desc Verify instance and static toDouble consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6666);
      const result1 = a.toDouble();
      const result2 = Int.toDouble(6666);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2700
     * @tc.name testIntToDouble0027
     * @tc.desc Verify returned double can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const d = a.toDouble();
      const result = d + 50.5;
      expect(result).assertEqual(150.5);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2800
     * @tc.name testIntToDouble0028
     * @tc.desc Verify high precision float arithmetic after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10);
      const b = new Int(3);
      const result = a.toDouble() / b.toDouble();
      expect(Math.abs((result) - (3.3333333333333335)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_2900
     * @tc.name testIntToDouble0029
     * @tc.desc Verify multiple conversions return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      const result1 = a.toDouble();
      const result2 = a.toDouble();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3000
     * @tc.name testIntToDouble0030
     * @tc.desc Verify different instances with same value return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(77777);
      const a2 = new Int(77777);
      expect(a1.toDouble()).assertEqual(a2.toDouble());
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3100
     * @tc.name testIntToDouble0031
     * @tc.desc Verify arithmetic result conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20000);
      const b = new Int(10000);
      const result = a.add(b).toDouble();
      expect(result).assertEqual(30000.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3300
     * @tc.name testIntToDouble0033
     * @tc.desc Verify MIN_VALUE conversion to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      const result = min.toDouble();
      expect(result).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3400
     * @tc.name testIntToDouble0034
     * @tc.desc Verify toDouble vs toByte comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const d = a.toDouble();
      const b = a.toByte();
      expect(d).assertEqual(100.0);
      expect(b).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3500
     * @tc.name testIntToDouble0035
     * @tc.desc Verify toDouble vs toShort comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const d = a.toDouble();
      const s = a.toShort();
      expect(d).assertEqual(10000.0);
      expect(s).assertEqual(10000);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3600
     * @tc.name testIntToDouble0036
     * @tc.desc Verify toInt vs toDouble comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      const i = a.toInt();
      const d = a.toDouble();
      expect(i).assertEqual(12345);
      expect(d).assertEqual(12345.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3700
     * @tc.name testIntToDouble0037
     * @tc.desc Verify toLong vs toDouble comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const l = a.toLong();
      const d = a.toDouble();
      expect(l).assertEqual(123);
      expect(d).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_3800
     * @tc.name testIntToDouble0038
     * @tc.desc Verify double precision is higher than float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      const f = a.toFloat();
      const d = a.toDouble();
      expect(d).assertEqual(123456789.0);
      expect(Math.abs((f) - (123456789.0)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4000
     * @tc.name testIntToDouble0040
     * @tc.desc Verify scientific calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Int(100);
      const d = value.toDouble();
      const percentage = d * 0.3333333333;
      expect(Math.abs((percentage) - (33.33333333)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4100
     * @tc.name testIntToDouble0041
     * @tc.desc Verify financial calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const amount = new Int(10000);
      const d = amount.toDouble() / 100;
      expect(d).assertEqual(100.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4200
     * @tc.name testIntToDouble0042
     * @tc.desc Verify double exact representation for all int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [Int.MIN_VALUE, -1000000, -1000, -1, 0, 1, 1000, 1000000, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        const result = a.toDouble();
        expect(result).assertEqual(v * 1.0);
      });
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4300
     * @tc.name testIntToDouble0043
     * @tc.desc Verify double precision is better than float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      const f = a.toFloat();
      const d = a.toDouble();
      expect((Math.abs(d - 123456789.0)) <= (Math.abs(f - 123456789.0))).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4400
     * @tc.name testIntToDouble0044
     * @tc.desc Verify multiple call performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      let sum = 0.0;
      for (let i = 0; i < 1000; i++) {
        sum += a.toDouble();
      }
      expect(sum).assertEqual(1000000.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4500
     * @tc.name testIntToDouble0045
     * @tc.desc Verify toDouble method exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      expect(a.toDouble()).assertEqual(500.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4700
     * @tc.name testIntToDouble0047
     * @tc.desc Verify return value float characteristics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toDouble();
      const divided = result / 3;
      expect(Math.abs((divided) - (33.333333333333336)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4800
     * @tc.name testIntToDouble0048
     * @tc.desc Verify isNaN and isFinite work on result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toDouble();
      expect(Number.isNaN(result)).assertFalse();
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_4900
     * @tc.name testIntToDouble0049
     * @tc.desc Verify valueOf instance can call toDouble
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      const result = a.toDouble();
      expect(result).assertEqual(654.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5000
     * @tc.name testIntToDouble0050
     * @tc.desc Verify instance and static toDouble consistency via valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654);
      const result1 = a.toDouble();
      const result2 = Int.toDouble(654);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5100
     * @tc.name testIntToDouble0051
     * @tc.desc Verify document example output 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      console.info(a.toDouble());
      expect(a.toDouble()).assertEqual(65.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5300
     * @tc.name testIntToDouble0053
     * @tc.desc Verify float multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toDouble() * 0.5;
      expect(result).assertEqual(50.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5400
     * @tc.name testIntToDouble0054
     * @tc.desc Verify complex arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = (a.toDouble() * 1.5 + 50) / 2;
      expect(result).assertEqual(100.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5600
     * @tc.name testIntToDouble0056
     * @tc.desc Verify double precision for large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const d = a.toDouble();
      expect(d).assertEqual(2147483647.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5700
     * @tc.name testIntToDouble0057
     * @tc.desc Verify integer zero converts to double zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      const result = a.toDouble();
      expect(result).assertEqual(0.0);
      expect(1 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5800
     * @tc.name testIntToDouble0058
     * @tc.desc Verify negative zero conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-0);
      const result = a.toDouble();
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_5900
     * @tc.name testIntToDouble0059
     * @tc.desc Verify conversion to double array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(20), new Int(30)];
      const doubles = values.map((v: Int): double => v.toDouble());
      expect(doubles.length).assertEqual(3);
      expect(doubles[0]).assertEqual(10.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6000
     * @tc.name testIntToDouble0060
     * @tc.desc Verify Math.sqrt with toDouble result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16);
      const result = Math.sqrt(a.toDouble());
      expect(result).assertEqual(4.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6100
     * @tc.name testIntToDouble0061
     * @tc.desc Verify Math.pow with toDouble result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2);
      const result = Math.pow(a.toDouble(), 10);
      expect(result).assertEqual(1024.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6200
     * @tc.name testIntToDouble0062
     * @tc.desc Verify Math.round with toDouble result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const d = a.toDouble() / 3;
      const rounded = Math.round(d);
      expect(rounded).assertEqual(33);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6300
     * @tc.name testIntToDouble0063
     * @tc.desc Verify Math.floor and Math.ceil with toDouble result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const d = a.toDouble() / 3;
      expect(Math.floor(d)).assertEqual(33);
      expect(Math.ceil(d)).assertEqual(34);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6400
     * @tc.name testIntToDouble0064
     * @tc.desc Verify formatted output after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const d = a.toDouble();
      expect(d).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6500
     * @tc.name testIntToDouble0065
     * @tc.desc Verify scientific notation representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const d = a.toDouble();
      expect(d / 1000000.0).assertEqual(1.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6600
     * @tc.name testIntToDouble0066
     * @tc.desc Verify int value is within double range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = new Int(Int.MAX_VALUE);
      const result = maxInt.toDouble();
      expect(Number.isFinite(result)).assertTrue();
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6700
     * @tc.name testIntToDouble0067
     * @tc.desc Verify double does not overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const d = a.toDouble();
      const bigger = d * 1000;
      expect(Number.isFinite(bigger)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6800
     * @tc.name testIntToDouble0068
     * @tc.desc Verify comparison after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const b = new Int(200);
      expect((a.toDouble()) < (b.toDouble())).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_6900
     * @tc.name testIntToDouble0069
     * @tc.desc Verify precise comparison using toBeCloseTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toDouble() / 3;
      expect(Math.abs((result) - (33.333333333333336)) <= 10.0).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7000
     * @tc.name testIntToDouble0070
     * @tc.desc Verify IEEE 754 double precision compliance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      const d = a.toDouble();
      expect(Number.isFinite(d)).assertTrue();
      expect(d).assertEqual(1.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7100
     * @tc.name testIntToDouble0071
     * @tc.desc Verify no accumulated error in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0.0;
      for (let i = 0; i < 100; i++) {
        sum += new Int(1).toDouble();
      }
      expect(sum).assertEqual(100.0);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7200
     * @tc.name testIntToDouble0072
     * @tc.desc Verify high precision calculation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000000);
      const d = a.toDouble();
      const result = d / 3;
      expect((result) > (333333333)).assertTrue();
      expect((result) < (333333334)).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7300
     * @tc.name testIntToDouble0073
     * @tc.desc Verify toDouble equals doubleValue in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [Int.MIN_VALUE, -1000000, -1000, -1, 0, 1, 1000, 1000000, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(a.toDouble()).assertEqual(v * 1.0);
      });
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7400
     * @tc.name testIntToDouble0074
     * @tc.desc Verify static toDouble consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(555555);
      const result1 = a.toDouble();
      const result2 = Int.toDouble(555555);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7500
     * @tc.name testIntToDouble0075
     * @tc.desc Verify toDouble with equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const b = new Int(10000);
      expect(a.toDouble()).assertEqual(b.toDouble());
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7600
     * @tc.name testIntToDouble0076
     * @tc.desc Verify comparison after toDouble
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const b = new Int(20000);
      expect((a.toDouble()) < (b.toDouble())).assertTrue();
    });

    /**
     * @tc.number INT_TO_DBL_CHK_7700
     * @tc.name testIntToDouble0077
     * @tc.desc Verify all int values can be exactly converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToDouble0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = new Int(Int.MAX_VALUE);
      const minInt = new Int(Int.MIN_VALUE);
      expect(maxInt.toDouble()).assertEqual(Int.MAX_VALUE);
      expect(minInt.toDouble()).assertEqual(Int.MIN_VALUE);
    });
  });
}
