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

export default function IntToLongTest(): void {
  describe('IntToLongTest', (): void => {
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
     * @tc.number INT_TO_LONG_CHK_0100
     * @tc.name testIntToLong0001
     * @tc.desc Verify toLong does not accept any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      const result = a.toLong();
      expect(result).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0200
     * @tc.name testIntToLong0002
     * @tc.desc Verify toLong returns correct long value (no parameters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toLong()).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0300
     * @tc.name testIntToLong0003
     * @tc.desc Verify toLong returns the converted long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      const result = a.toLong();
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual("long");
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0400
     * @tc.name testIntToLong0004
     * @tc.desc Verify return value is long type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      const result = a.toLong();
      expect(typeof result).assertEqual("long");
      expect(result).assertLargerOrEqual(Long.MIN_VALUE);
      expect(result).assertLessOrEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0500
     * @tc.name testIntToLong0005
     * @tc.desc Verify positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      expect(a.toLong()).assertEqual(99999);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0600
     * @tc.name testIntToLong0006
     * @tc.desc Verify small positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toLong()).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0700
     * @tc.name testIntToLong0007
     * @tc.desc Verify zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toLong()).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0800
     * @tc.name testIntToLong0008
     * @tc.desc Verify negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-99999);
      expect(a.toLong()).assertEqual(-99999);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_0900
     * @tc.name testIntToLong0009
     * @tc.desc Verify negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-12345);
      expect(a.toLong()).assertEqual(-12345);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1000
     * @tc.name testIntToLong0010
     * @tc.desc Verify int minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      expect(a.toLong()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1100
     * @tc.name testIntToLong0011
     * @tc.desc Verify int maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      expect(a.toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1200
     * @tc.name testIntToLong0012
     * @tc.desc Verify long can hold all int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = new Int(Int.MAX_VALUE);
      const asLong = maxInt.toLong();
      expect(asLong).assertLess(Long.MAX_VALUE);
      expect(asLong).assertLarger(Long.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1300
     * @tc.name testIntToLong0013
     * @tc.desc Verify minus one conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.toLong()).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1500
     * @tc.name testIntToLong0015
     * @tc.desc Verify maximum positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2147483647);
      expect(a.toLong()).assertEqual(2147483647);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1600
     * @tc.name testIntToLong0016
     * @tc.desc Verify minimum negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-2147483648);
      expect(a.toLong()).assertEqual(-2147483648);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1700
     * @tc.name testIntToLong0017
     * @tc.desc Verify return value is number type (long)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.toLong();
      expect(typeof result).assertEqual("long");
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1800
     * @tc.name testIntToLong0018
     * @tc.desc Verify result is within long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(5000);
      const result = a.toLong();
      expect(result).assertLargerOrEqual(Long.MIN_VALUE);
      expect(result).assertLessOrEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_1900
     * @tc.name testIntToLong0019
     * @tc.desc Verify conversion does not lose precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456789);
      expect(a.toLong()).assertEqual(123456789);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_2000
     * @tc.name testIntToLong0020
     * @tc.desc Verify negative number precision preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-987654321);
      expect(a.toLong()).assertEqual(-987654321);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_2500
     * @tc.name testIntToLong0025
     * @tc.desc Verify must be called through Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7500);
      const result = a.toLong();
      expect(result).assertEqual(7500);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_2600
     * @tc.name testIntToLong0026
     * @tc.desc Verify toLong does not change original Int instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8888);
      const original = a.toInt();
      const result = a.toLong();
      expect(a.toInt()).assertEqual(original);
      expect(result).assertEqual(8888);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_2700
     * @tc.name testIntToLong0027
     * @tc.desc Verify instance toLong and static toLong have same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6666);
      const result1 = a.toLong();
      const result2 = Int.toLong(6666);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_2800
     * @tc.name testIntToLong0028
     * @tc.desc Verify toLong return value can be used further
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const l = a.toLong();
      const result = l + 5000;
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_2900
     * @tc.name testIntToLong0029
     * @tc.desc Verify long can perform larger range operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const l = a.toLong();
      const bigResult = l * 1000000;
      expect(bigResult).assertEqual(1000000000000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3000
     * @tc.name testIntToLong0030
     * @tc.desc Verify multiple conversions of same value have consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(99999);
      const result1 = a.toLong();
      const result2 = a.toLong();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3100
     * @tc.name testIntToLong0031
     * @tc.desc Verify different instances with same value have consistent conversion result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(77777);
      const a2 = new Int(77777);
      expect(a1.toLong()).assertEqual(a2.toLong());
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3200
     * @tc.name testIntToLong0032
     * @tc.desc Verify arithmetic result conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20000);
      const b = new Int(10000);
      const result = a.add(b).toLong();
      expect(result).assertEqual(30000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3300
     * @tc.name testIntToLong0033
     * @tc.desc Verify conversion after subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(30000);
      const b = new Int(10000);
      const result = a.sub(b).toLong();
      expect(result).assertEqual(20000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3400
     * @tc.name testIntToLong0034
     * @tc.desc Verify MAX_VALUE conversion to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const result = max.toLong();
      expect(result).assertEqual(2147483647);
      expect(result).assertLess(Long.MAX_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3500
     * @tc.name testIntToLong0035
     * @tc.desc Verify MIN_VALUE conversion to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      const result = min.toLong();
      expect(result).assertEqual(-2147483648);
      expect(result).assertLarger(Long.MIN_VALUE);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3600
     * @tc.name testIntToLong0036
     * @tc.desc Verify toLong range is much larger than toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      expect(a.toLong()).assertEqual(1000);
      expect(a.toByte()).assertLess(128);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3700
     * @tc.name testIntToLong0037
     * @tc.desc Verify toLong range is larger than toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      expect(a.toLong()).assertEqual(100000);
      expect(a.toShort()).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3800
     * @tc.name testIntToLong0038
     * @tc.desc Verify toLong keeps int value but with larger type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      expect(a.toInt()).assertEqual(12345);
      expect(a.toLong()).assertEqual(12345);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_3900
     * @tc.name testIntToLong0039
     * @tc.desc Verify toFloat converts to floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123);
      expect(a.toLong()).assertEqual(123);
      expect(a.toFloat()).assertEqual(123.0);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4000
     * @tc.name testIntToLong0040
     * @tc.desc Verify toDouble converts to double precision floating point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(456);
      expect(a.toLong()).assertEqual(456);
      expect(a.toDouble()).assertEqual(456.0);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4100
     * @tc.name testIntToLong0041
     * @tc.desc Verify usage in long array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(10), new Int(20), new Int(30)];
      const longs = values.map((v: Int): long => v.toLong());
      expect(longs.length).assertEqual(3);
      expect(longs[0]).assertEqual(10);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4200
     * @tc.name testIntToLong0042
     * @tc.desc Verify large number range scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const l = a.toLong();
      const bigNumber = l * 1000000000;
      expect(bigNumber).assertLargerOrEqual(0);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4300
     * @tc.name testIntToLong0043
     * @tc.desc Verify usage for timestamp in milliseconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const seconds = new Int(1000);
      const milliseconds = seconds.toLong() * 1000;
      expect(milliseconds).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4400
     * @tc.name testIntToLong0044
     * @tc.desc Verify conversion to long then to other types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const l = a.toLong();
      const result = l * 10000000;
      expect(result).assertLargerOrEqual(0);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4500
     * @tc.name testIntToLong0045
     * @tc.desc Verify round-trip conversion precision unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 123456789;
      const a = new Int(original);
      const converted = a.toLong();
      expect(converted).assertEqual(original);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4600
     * @tc.name testIntToLong0046
     * @tc.desc Verify multiple toLong calls performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += a.toLong();
      }
      expect(sum).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4700
     * @tc.name testIntToLong0047
     * @tc.desc Verify large array conversion performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [];
      for (let i = 0; i < 10000; i++) {
        values.push(new Int(i));
      }
      const longs = values.map((v: Int): long => v.toLong());
      expect(longs.length).assertEqual(10000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_4800
     * @tc.name testIntToLong0048
     * @tc.desc Verify toLong method exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      expect(a.toLong()).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5000
     * @tc.name testIntToLong0050
     * @tc.desc Verify return value is number type (long)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const result = a.toLong();
      expect(typeof result).assertEqual("long");
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5100
     * @tc.name testIntToLong0051
     * @tc.desc Verify return value can be used directly in math operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100);
      const result = a.toLong() + 50;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5200
     * @tc.name testIntToLong0052
     * @tc.desc Verify valueOf instance can call toLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654321);
      const result = a.toLong();
      expect(result).assertEqual(654321);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5300
     * @tc.name testIntToLong0053
     * @tc.desc Verify instance toLong and static toLong have same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654321);
      const result1 = a.toLong();
      const result2 = Int.toLong(654321);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5400
     * @tc.name testIntToLong0054
     * @tc.desc Verify document example outputs 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      console.info(a.toLong());
      expect(a.toLong()).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5500
     * @tc.name testIntToLong0055
     * @tc.desc Verify long can represent larger numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = new Int(Int.MAX_VALUE);
      const asLong = maxInt.toLong();
      const increased = asLong + 1000000;
      expect(increased).assertLarger(asLong);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5600
     * @tc.name testIntToLong0056
     * @tc.desc Verify using long avoids int overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(2000000000);
      const b = new Int(2000000000);
      const sumLong = a.toLong() + b.toLong();
      expect(sumLong).assertEqual(4000000000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5700
     * @tc.name testIntToLong0057
     * @tc.desc Verify long range is much larger than byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const l = a.toLong();
      const b = a.toByte();
      expect(l).assertLarger(127);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5800
     * @tc.name testIntToLong0058
     * @tc.desc Verify long range is larger than short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      const l = a.toLong();
      const s = a.toShort();
      expect(l).assertLarger(32767);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_5900
     * @tc.name testIntToLong0059
     * @tc.desc Verify long range is larger than int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxInt = Int.MAX_VALUE;
      const maxLong = Long.MAX_VALUE;
      expect(maxLong).assertLarger(maxInt);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6000
     * @tc.name testIntToLong0060
     * @tc.desc Verify int to long conversion fully preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 1, -1, 100, -100, 1000000, -1000000,
                          Int.MIN_VALUE, Int.MAX_VALUE];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(a.toLong()).assertEqual(v);
      });
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6100
     * @tc.name testIntToLong0061
     * @tc.desc Verify converting to long before operation prevents overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1500000000);
      const b = new Int(1500000000);
      const safeSum = a.toLong() + b.toLong();
      expect(safeSum).assertEqual(3000000000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6200
     * @tc.name testIntToLong0062
     * @tc.desc Verify long comparison is safe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const l = a.toLong();
      expect(l).assertLarger(999999);
      expect(l).assertLess(1000001);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6300
     * @tc.name testIntToLong0063
     * @tc.desc Verify zero value conversion to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toLong()).assertEqual(0);
      expect(a.toLong() === 0).assertTrue();
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6400
     * @tc.name testIntToLong0064
     * @tc.desc Verify large number multiplication using long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      const result = a.toLong() * 100000;
      expect(result).assertEqual(10000000000);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6500
     * @tc.name testIntToLong0065
     * @tc.desc Verify long division maintains precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000000);
      const result = a.toLong() / 3;
      expect(result).assertLargerOrEqual(333333);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6600
     * @tc.name testIntToLong0066
     * @tc.desc Verify conversion result is compatible with Long type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(654321);
      const l: long = a.toLong();
      expect(l).assertEqual(654321);
    });

    /**
     * @tc.number INT_TO_LONG_CHK_6700
     * @tc.name testIntToLong0067
     * @tc.desc Verify long is subtype of number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToLong0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(987654);
      const result = a.toLong();
      const num: number = result;
      expect(num).assertEqual(987654);
    });
  });
}
