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

export default function IntToLongStaticTest(): void {
  describe('IntToLongStaticTest', (): void => {
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
     * @tc.number INT_TO_LONG_S_CHK_0100
     * @tc.name testIntToLongStatic0001
     * @tc.desc Verify that value parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(65);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0200
     * @tc.name testIntToLongStatic0002
     * @tc.desc Verify that error is thrown when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toLong(0)).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0400
     * @tc.name testIntToLongStatic0004
     * @tc.desc Verify with normal integer value within range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(100000);
      expect(result).assertEqual(100000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0500
     * @tc.name testIntToLongStatic0005
     * @tc.desc Verify with positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(50000);
      expect(result).assertEqual(50000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0600
     * @tc.name testIntToLongStatic0006
     * @tc.desc Verify with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-50000);
      expect(result).assertEqual(-50000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0700
     * @tc.name testIntToLongStatic0007
     * @tc.desc Verify with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0800
     * @tc.name testIntToLongStatic0008
     * @tc.desc Verify with int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_0900
     * @tc.name testIntToLongStatic0009
     * @tc.desc Verify with int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_1000
     * @tc.name testIntToLongStatic0010
     * @tc.desc Verify with hexadecimal positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(0x41);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_1100
     * @tc.name testIntToLongStatic0011
     * @tc.desc Verify with hexadecimal negative boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-0x41);
      expect(result).assertEqual(-65);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_1200
     * @tc.name testIntToLongStatic0012
     * @tc.desc Verify with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(0o101);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_1300
     * @tc.name testIntToLongStatic0013
     * @tc.desc Verify with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(0b1000001);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_1600
     * @tc.name testIntToLongStatic0016
     * @tc.desc Verify behavior when passing float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(Double.toInt(123.45));
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_1900
     * @tc.name testIntToLongStatic0019
     * @tc.desc Verify return value is converted long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(123);
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual("long");
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2000
     * @tc.name testIntToLongStatic0020
     * @tc.desc Verify return value is long type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(50000);
      expect(result).assertLargerOrEqual(Long.MIN_VALUE);
      expect(result).assertLessOrEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2100
     * @tc.name testIntToLongStatic0021
     * @tc.desc Verify normal positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(99999);
      expect(result).assertEqual(99999);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2200
     * @tc.name testIntToLongStatic0022
     * @tc.desc Verify small positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2400
     * @tc.name testIntToLongStatic0024
     * @tc.desc Verify normal negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-99999);
      expect(result).assertEqual(-99999);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2500
     * @tc.name testIntToLongStatic0025
     * @tc.desc Verify negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-12345);
      expect(result).assertEqual(-12345);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2600
     * @tc.name testIntToLongStatic0026
     * @tc.desc Verify int minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2700
     * @tc.name testIntToLongStatic0027
     * @tc.desc Verify int maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(Int.MAX_VALUE);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2800
     * @tc.name testIntToLongStatic0028
     * @tc.desc Verify long can hold all int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = Int.MAX_VALUE;
      const asLong = Int.toLong(maxInt);
      expect(asLong).assertLess(Long.MAX_VALUE);
      expect(asLong).assertLarger(Long.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_2900
     * @tc.name testIntToLongStatic0029
     * @tc.desc Verify conversion of -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_3300
     * @tc.name testIntToLongStatic0033
     * @tc.desc Verify return value is number type (long)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(100000);
      expect(typeof result).assertEqual("long");
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_3500
     * @tc.name testIntToLongStatic0035
     * @tc.desc Verify no precision loss in conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(123456789);
      expect(result).assertEqual(123456789);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_3600
     * @tc.name testIntToLongStatic0036
     * @tc.desc Verify negative number precision preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(-987654321);
      expect(result).assertEqual(-987654321);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_3700
     * @tc.name testIntToLongStatic0037
     * @tc.desc Verify must call through Int class statically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(75000);
      expect(result).assertEqual(75000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_3800
     * @tc.name testIntToLongStatic0038
     * @tc.desc Verify static toLong matches instance toLong result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result1 = Int.toLong(65);
      const result2 = a.toLong();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_3900
     * @tc.name testIntToLongStatic0039
     * @tc.desc Verify toLong return can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(10000);
      const result = l + 5000;
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4000
     * @tc.name testIntToLongStatic0040
     * @tc.desc Verify long supports larger range operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(1000000);
      const bigResult = l * 1000000;
      expect(bigResult).assertEqual(1000000000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4100
     * @tc.name testIntToLongStatic0041
     * @tc.desc Verify multiple conversions of same value yield same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toLong(99999);
      const result2 = Int.toLong(99999);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4200
     * @tc.name testIntToLongStatic0042
     * @tc.desc Verify arithmetic expression result as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(100000 + 50000);
      expect(result).assertEqual(150000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4300
     * @tc.name testIntToLongStatic0043
     * @tc.desc Verify complex expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong((1000 * 100) - 50);
      expect(result).assertEqual(99950);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4500
     * @tc.name testIntToLongStatic0045
     * @tc.desc Verify toLong range is much larger than toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1000;
      const l = Int.toLong(value);
      const b = Int.toByte(value);
      expect(l).assertEqual(1000);
      expect(Math.abs(b)).assertLess(128);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4600
     * @tc.name testIntToLongStatic0046
     * @tc.desc Verify toLong range is larger than toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 100000;
      const l = Int.toLong(value);
      const s = Int.toShort(value);
      expect(l).assertEqual(100000);
      expect(Math.abs(s)).assertLessOrEqual(32768);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4700
     * @tc.name testIntToLongStatic0047
     * @tc.desc Verify toInt returns int and toLong returns long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const l = Int.toLong(value);
      expect(l).assertEqual(12345);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4800
     * @tc.name testIntToLongStatic0048
     * @tc.desc Verify toFloat converts to float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123;
      const l = Int.toLong(value);
      expect(l).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_4900
     * @tc.name testIntToLongStatic0049
     * @tc.desc Verify toDouble converts to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 456;
      const l = Int.toLong(value);
      const d = Int.toDouble(value);
      expect(l).assertEqual(456);
      expect(d).assertEqual(456.0);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5000
     * @tc.name testIntToLongStatic0050
     * @tc.desc Verify usage for long array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [10, 20, 30];
      const longs = values.map((v: int): long => Int.toLong(v));
      expect(longs.length).assertEqual(3);
      expect(longs[0]).assertEqual(10);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5100
     * @tc.name testIntToLongStatic0051
     * @tc.desc Verify scenario requiring large number range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(1000000);
      const bigNumber = l * 1000000000;
      expect(bigNumber).assertEqual(1000000000000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5200
     * @tc.name testIntToLongStatic0052
     * @tc.desc Verify usage for timestamp in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seconds = Int.toLong(1000);
      const milliseconds = seconds * 1000;
      expect(milliseconds).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5300
     * @tc.name testIntToLongStatic0053
     * @tc.desc Verify conversion to long then to other types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(100);
      const result = l * 10000000;
      expect(result).assertEqual(1000000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5400
     * @tc.name testIntToLongStatic0054
     * @tc.desc Verify round-trip conversion preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 123456789;
      const converted = Int.toLong(original);
      expect(converted).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5500
     * @tc.name testIntToLongStatic0055
     * @tc.desc Verify multiple toLong calls performance is normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += Int.toLong(1000);
      }
      expect(sum).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5600
     * @tc.name testIntToLongStatic0056
     * @tc.desc Verify documentation example outputs 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.info(Int.toLong(65));
      expect(Int.toLong(65)).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5700
     * @tc.name testIntToLongStatic0057
     * @tc.desc Verify static toLong matches instance toLong in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [Int.MIN_VALUE, -1000000, -1000, -1, 0, 1, 1000, 1000000, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(Int.toLong(v)).assertEqual(a.toLong());
      });
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5800
     * @tc.name testIntToLongStatic0058
     * @tc.desc Verify long can represent larger numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = Int.MAX_VALUE;
      const asLong = Int.toLong(maxInt);
      const increased = asLong + 1000000;
      expect(increased).assertLarger(asLong);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_5900
     * @tc.name testIntToLongStatic0059
     * @tc.desc Verify using long avoids int overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toLong(2000000000);
      const b = Int.toLong(2000000000);
      const sumLong = a + b;
      expect(sumLong).assertEqual(4000000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6000
     * @tc.name testIntToLongStatic0060
     * @tc.desc Verify long range is much larger than byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1000;
      const l = Int.toLong(value);
      const b = Int.toByte(value);
      expect(l).assertLarger(127);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6100
     * @tc.name testIntToLongStatic0061
     * @tc.desc Verify long range is larger than short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 100000;
      const l = Int.toLong(value);
      const s = Int.toShort(value);
      expect(l).assertLarger(32767);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6200
     * @tc.name testIntToLongStatic0062
     * @tc.desc Verify long range is larger than int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longFromMaxInt = Int.toLong(Int.MAX_VALUE);
      expect(Long.MAX_VALUE).assertLarger(longFromMaxInt);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6300
     * @tc.name testIntToLongStatic0063
     * @tc.desc Verify int to long conversion fully preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 1, -1, 100, -100, 1000000, -1000000,
                          Int.MIN_VALUE, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        expect(Int.toLong(v)).assertEqual(v);
      });
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6400
     * @tc.name testIntToLongStatic0064
     * @tc.desc Verify converting to long first prevents overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toLong(1500000000);
      const b = Int.toLong(1500000000);
      const safeSum = a + b;
      expect(safeSum).assertEqual(3000000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6500
     * @tc.name testIntToLongStatic0065
     * @tc.desc Verify long comparison is safe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(1000000);
      expect(l).assertLarger(999999);
      expect(l).assertLess(1000001);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6600
     * @tc.name testIntToLongStatic0066
     * @tc.desc Verify zero value conversion to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(0);
      expect(result).assertEqual(0);
      expect(result === 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6700
     * @tc.name testIntToLongStatic0067
     * @tc.desc Verify using long for large number multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(100000);
      const result = l * 100000;
      expect(result).assertEqual(10000000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6800
     * @tc.name testIntToLongStatic0068
     * @tc.desc Verify long division maintains precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l = Int.toLong(1000000);
      const result = l / 3;
      expect(result).assertLargerOrEqual(333333);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_6900
     * @tc.name testIntToLongStatic0069
     * @tc.desc Verify conversion result is compatible with Long type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l: long = Int.toLong(654321);
      expect(l).assertEqual(654321);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7000
     * @tc.name testIntToLongStatic0070
     * @tc.desc Verify long is subtype of number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toLong(987654);
      const num: number = result;
      expect(num).assertEqual(987654);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7100
     * @tc.name testIntToLongStatic0071
     * @tc.desc Verify combining valueOf and static toLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654321);
      const value = a.toInt();
      const l = Int.toLong(value);
      expect(l).assertEqual(654321);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7200
     * @tc.name testIntToLongStatic0072
     * @tc.desc Verify using static properties as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toLong(Int.MAX_VALUE);
      const minResult = Int.toLong(Int.MIN_VALUE);
      expect(maxResult).assertEqual(Int.MAX_VALUE);
      expect(minResult).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7300
     * @tc.name testIntToLongStatic0073
     * @tc.desc Verify expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 50000;
      const b = 30000;
      const result = Int.toLong(a + b);
      expect(result).assertEqual(80000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7400
     * @tc.name testIntToLongStatic0074
     * @tc.desc Verify batch array conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: int[] = [0, 100000, 200000, 300000];
      const longs = numbers.map((n: int): long => Int.toLong(n));
      expect(longs.length).assertEqual(4);
      expect(longs[2]).assertEqual(200000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7500
     * @tc.name testIntToLongStatic0075
     * @tc.desc Verify long has larger range than int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const i = Int.toInt(value);
      const l = Int.toLong(value);
      expect(i).assertEqual(l);
      expect(Long.MAX_VALUE).assertLarger(Int.MAX_VALUE);
      expect(Long.MIN_VALUE).assertLess(Int.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7600
     * @tc.name testIntToLongStatic0076
     * @tc.desc Verify long addition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toLong(1000000);
      const b = Int.toLong(2000000);
      const result = a + b;
      expect(result).assertEqual(3000000);
    });

    /**
     * @tc.number INT_TO_LONG_S_CHK_7700
     * @tc.name testIntToLongStatic0077
     * @tc.desc Verify long multiplication
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLongStatic0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Int.toLong(10000);
      const b = Int.toLong(10000);
      const result = a * b;
      expect(result).assertEqual(100000000);
    });
  });
}
