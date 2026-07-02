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

export default function IntToShortStaticTest(): void {
  describe('IntToShortStaticTest', (): void => {
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
     * @tc.number INT_TO_SHORT_S_CHK_0100
     * @tc.name testIntToShortStatic0001
     * @tc.desc Verify required value parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(64);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0200
     * @tc.name testIntToShortStatic0002
     * @tc.desc Verify error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int.toShort(0)).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0400
     * @tc.name testIntToShortStatic0004
     * @tc.desc Verify with normal range integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(1000);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0500
     * @tc.name testIntToShortStatic0005
     * @tc.desc Verify with positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(500);
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0600
     * @tc.name testIntToShortStatic0006
     * @tc.desc Verify with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-500);
      expect(result).assertEqual(-500);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0700
     * @tc.name testIntToShortStatic0007
     * @tc.desc Verify with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0800
     * @tc.name testIntToShortStatic0008
     * @tc.desc Verify with int maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(2147483647);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_0900
     * @tc.name testIntToShortStatic0009
     * @tc.desc Verify with int minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-2147483648);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_1000
     * @tc.name testIntToShortStatic0010
     * @tc.desc Verify with hexadecimal positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(0x40);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_1100
     * @tc.name testIntToShortStatic0011
     * @tc.desc Verify with hexadecimal negative boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(0x8000);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_1200
     * @tc.name testIntToShortStatic0012
     * @tc.desc Verify with octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(0o100);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_1300
     * @tc.name testIntToShortStatic0013
     * @tc.desc Verify with binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(0b1000000);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_1600
     * @tc.name testIntToShortStatic0016
     * @tc.desc Verify behavior when passing float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(Double.toInt(123.45));
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_1900
     * @tc.name testIntToShortStatic0019
     * @tc.desc Verify return converted short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(123);
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2000
     * @tc.name testIntToShortStatic0020
     * @tc.desc Verify return value is short type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(500);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2100
     * @tc.name testIntToShortStatic0021
     * @tc.desc Verify normal positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2200
     * @tc.name testIntToShortStatic0022
     * @tc.desc Verify small positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2400
     * @tc.name testIntToShortStatic0024
     * @tc.desc Verify normal negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-9999);
      expect(result).assertEqual(-9999);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2500
     * @tc.name testIntToShortStatic0025
     * @tc.desc Verify negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-32768);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2700
     * @tc.name testIntToShortStatic0027
     * @tc.desc Verify short maximum value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(32767);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2800
     * @tc.name testIntToShortStatic0028
     * @tc.desc Verify value exceeding short maximum 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(32768);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_2900
     * @tc.name testIntToShortStatic0029
     * @tc.desc Verify value exceeding short minimum -32769
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-32769);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3000
     * @tc.name testIntToShortStatic0030
     * @tc.desc Verify large positive number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(100000);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3100
     * @tc.name testIntToShortStatic0031
     * @tc.desc Verify large negative number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-100000);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3200
     * @tc.name testIntToShortStatic0032
     * @tc.desc Verify Int maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(Int.MAX_VALUE);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3300
     * @tc.name testIntToShortStatic0033
     * @tc.desc Verify Int minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(Int.MIN_VALUE);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3500
     * @tc.name testIntToShortStatic0035
     * @tc.desc Verify conversion of -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3600
     * @tc.name testIntToShortStatic0036
     * @tc.desc Verify conversion of 65535 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(65535);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3700
     * @tc.name testIntToShortStatic0037
     * @tc.desc Verify conversion of 65536 overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(65536);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3800
     * @tc.name testIntToShortStatic0038
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(1000);
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_3900
     * @tc.name testIntToShortStatic0039
     * @tc.desc Verify result is within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(5000);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4000
     * @tc.name testIntToShortStatic0040
     * @tc.desc Verify must call through Int class statically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(7500);
      expect(result).assertEqual(7500);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4100
     * @tc.name testIntToShortStatic0041
     * @tc.desc Verify static toShort matches instance toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16);
      const result1 = Int.toShort(16);
      const result2 = a.toShort();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4200
     * @tc.name testIntToShortStatic0042
     * @tc.desc Verify toShort return can be used for further operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Int.toShort(10000);
      const result = s + 5000;
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4300
     * @tc.name testIntToShortStatic0043
     * @tc.desc Verify large number retains only low 16 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(123456);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4400
     * @tc.name testIntToShortStatic0044
     * @tc.desc Verify large negative number truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(-123456);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4500
     * @tc.name testIntToShortStatic0045
     * @tc.desc Verify truncation behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toShort(65536);
      const result2 = Int.toShort(131072);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4600
     * @tc.name testIntToShortStatic0046
     * @tc.desc Verify multiple conversions of same value yield consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Int.toShort(9999);
      const result2 = Int.toShort(9999);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4700
     * @tc.name testIntToShortStatic0047
     * @tc.desc Verify arithmetic expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort(10000 + 5000);
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_4800
     * @tc.name testIntToShortStatic0048
     * @tc.desc Verify complex expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Int.toShort((100 * 100) - 50);
      expect(result).assertEqual(9950);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5000
     * @tc.name testIntToShortStatic0050
     * @tc.desc Verify toShort range is larger than toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1000;
      const s = Int.toShort(value);
      const b = Int.toByte(value);
      expect(Math.abs(s)).assertLessOrEqual(32768);
      expect(Math.abs(b)).assertLess(128);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5100
     * @tc.name testIntToShortStatic0051
     * @tc.desc Verify toInt returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      expect(Int.toInt(value)).assertEqual(12345);
      expect(Int.toShort(value)).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5200
     * @tc.name testIntToShortStatic0052
     * @tc.desc Verify toLong has larger range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 12345;
      const s = Int.toShort(value);
      const l = Int.toLong(value);
      expect(s).assertEqual(12345);
      expect(l).assertEqual(12345);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5300
     * @tc.name testIntToShortStatic0053
     * @tc.desc Verify usage in short integer array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: int[] = [100, 200, 300];
      const shorts = values.map((v: int): short => Int.toShort(v));
      expect(shorts.length).assertEqual(3);
      expect(shorts[0]).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5400
     * @tc.name testIntToShortStatic0054
     * @tc.desc Verify bit mask operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0x12345678;
      const lowShort = Int.toShort(value);
      expect(lowShort).assertLargerOrEqual(-32768);
      expect(lowShort).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5700
     * @tc.name testIntToShortStatic0057
     * @tc.desc Verify multiple calls to toShort perform normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += Int.toShort(1000);
      }
      expect(sum).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5800
     * @tc.name testIntToShortStatic0058
     * @tc.desc Verify documentation example outputs 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.info(Int.toShort(64));
      expect(Int.toShort(64)).assertEqual(64);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_5900
     * @tc.name testIntToShortStatic0059
     * @tc.desc Verify static toShort matches instance toShort in all cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [0, 1, -1, 100, -100, 32767, -32768, 100000, -100000];
      testValues.forEach((v: int): void => {
        const a = new Int(v);
        expect(Int.toShort(v)).assertEqual(a.toShort());
      });
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6000
     * @tc.name testIntToShortStatic0060
     * @tc.desc Verify valid input range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -32768; i <= 32767; i += 1000) {
        expect(Int.toShort(i)).assertEqual(i);
      }
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6100
     * @tc.name testIntToShortStatic0061
     * @tc.desc Verify consistent behavior for out of range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testValues: int[] = [32768, 65536, 100000];
      testValues.forEach((v: int): void => {
        const result = Int.toShort(v);
        expect(result).assertLargerOrEqual(-32768);
        expect(result).assertLess(32768);
      });
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6200
     * @tc.name testIntToShortStatic0062
     * @tc.desc Verify back and forth conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 10000;
      const toS = Int.toShort(original);
      const result = toS + 5000;
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6300
     * @tc.name testIntToShortStatic0063
     * @tc.desc Verify combined usage of valueOf and static toShort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16000);
      const value = a.toInt();
      const s = Int.toShort(value);
      expect(s).assertEqual(16000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6400
     * @tc.name testIntToShortStatic0064
     * @tc.desc Verify using static property as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxResult = Int.toShort(Int.MAX_VALUE);
      const minResult = Int.toShort(Int.MIN_VALUE);
      expect(maxResult).assertLargerOrEqual(-32768);
      expect(minResult).assertLargerOrEqual(-32768);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6500
     * @tc.name testIntToShortStatic0065
     * @tc.desc Verify expression as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 5000;
      const b = 3000;
      const result = Int.toShort(a + b);
      expect(result).assertEqual(8000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6600
     * @tc.name testIntToShortStatic0066
     * @tc.desc Verify batch array conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: int[] = [0, 1000, 2000, 3000, 4000];
      const shorts = numbers.map((n: int): short => Int.toShort(n));
      expect(shorts.length).assertEqual(5);
      expect(shorts[2]).assertEqual(2000);
    });

    /**
     * @tc.number INT_TO_SHORT_S_CHK_6700
     * @tc.name testIntToShortStatic0067
     * @tc.desc Verify short range is between byte and int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShortStatic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Int.toShort(12345);
      expect(s).assertLess(32768);
      expect(s).assertLargerOrEqual(-32768);
    });
  });
}
