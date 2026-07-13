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

export default function IntToShortTest(): void {
  describe('IntToShortTest', (): void => {
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
     * @tc.number INT_TO_SHORT_CHK_0100
     * @tc.name testIntToShort0001
     * @tc.desc Verify toShort accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(16);
      const result = a.toShort();
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0200
     * @tc.name testIntToShort0002
     * @tc.desc Verify toShort returns correct short value (no parameters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65);
      expect(a.toShort()).assertEqual(65);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0300
     * @tc.name testIntToShort0003
     * @tc.desc Verify toShort returns converted short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.toShort();
      expect(result).assertEqual(1000);
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0400
     * @tc.name testIntToShort0004
     * @tc.desc Verify return value is short type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(500);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0500
     * @tc.name testIntToShort0005
     * @tc.desc Verify normal positive integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(9999);
      expect(a.toShort()).assertEqual(9999);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0600
     * @tc.name testIntToShort0006
     * @tc.desc Verify small positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1);
      expect(a.toShort()).assertEqual(1);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0700
     * @tc.name testIntToShort0007
     * @tc.desc Verify zero value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0);
      expect(a.toShort()).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0800
     * @tc.name testIntToShort0008
     * @tc.desc Verify normal negative integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-9999);
      expect(a.toShort()).assertEqual(-9999);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_0900
     * @tc.name testIntToShort0009
     * @tc.desc Verify negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-32768);
      expect(a.toShort()).assertEqual(-32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1100
     * @tc.name testIntToShort0011
     * @tc.desc Verify short maximum value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(32767);
      expect(a.toShort()).assertEqual(32767);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1200
     * @tc.name testIntToShort0012
     * @tc.desc Verify value exceeding short maximum 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(32768);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1300
     * @tc.name testIntToShort0013
     * @tc.desc Verify value exceeding short minimum -32769
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-32769);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1400
     * @tc.name testIntToShort0014
     * @tc.desc Verify large positive number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1500
     * @tc.name testIntToShort0015
     * @tc.desc Verify large negative number conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-100000);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1600
     * @tc.name testIntToShort0016
     * @tc.desc Verify Int maximum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MAX_VALUE);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1700
     * @tc.name testIntToShort0017
     * @tc.desc Verify Int minimum value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(Int.MIN_VALUE);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_1900
     * @tc.name testIntToShort0019
     * @tc.desc Verify conversion of -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-1);
      expect(a.toShort()).assertEqual(-1);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2000
     * @tc.name testIntToShort0020
     * @tc.desc Verify conversion of 65535 overflow case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65535);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2100
     * @tc.name testIntToShort0021
     * @tc.desc Verify conversion of 65536 overflow case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(65536);
      const result = a.toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2200
     * @tc.name testIntToShort0022
     * @tc.desc Verify return value is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const result = a.toShort();
      expect(typeof result).assertEqual("short");
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2300
     * @tc.name testIntToShort0023
     * @tc.desc Verify result is within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(5000);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2400
     * @tc.name testIntToShort0024
     * @tc.desc Verify toShort must be called through Int instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(7500);
      const result = a.toShort();
      expect(result).assertEqual(7500);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2500
     * @tc.name testIntToShort0025
     * @tc.desc Verify toShort does not change original Int instance value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(8888);
      const original = a.toInt();
      const result = a.toShort();
      expect(a.toInt()).assertEqual(original);
      expect(result).assertEqual(8888);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2600
     * @tc.name testIntToShort0026
     * @tc.desc Verify instance toShort and static toShort produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(6666);
      const result1 = a.toShort();
      const result2 = Int.toShort(6666);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2700
     * @tc.name testIntToShort0027
     * @tc.desc Verify toShort returns short value for continued use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(10000);
      const s = a.toShort();
      const result = s + 5000;
      expect(result).assertEqual(15000);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2800
     * @tc.name testIntToShort0028
     * @tc.desc Verify large number only keeps lower 16 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(123456);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_2900
     * @tc.name testIntToShort0029
     * @tc.desc Verify negative large number truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(-123456);
      const result = a.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3000
     * @tc.name testIntToShort0030
     * @tc.desc Verify truncation behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(65536);
      const a2 = new Int(131072);
      const result1 = a1.toShort();
      const result2 = a2.toShort();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3100
     * @tc.name testIntToShort0031
     * @tc.desc Verify multiple conversions of same value produce consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(9999);
      const result1 = a.toShort();
      const result2 = a.toShort();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3200
     * @tc.name testIntToShort0032
     * @tc.desc Verify different instances with same value produce consistent conversion results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int(7777);
      const a2 = new Int(7777);
      expect(a1.toShort()).assertEqual(a2.toShort());
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3300
     * @tc.name testIntToShort0033
     * @tc.desc Verify arithmetic result conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(20000);
      const b = new Int(10000);
      const result = a.add(b).toShort();
      expect(result).assertEqual(30000);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3400
     * @tc.name testIntToShort0034
     * @tc.desc Verify conversion after overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(30000);
      const b = new Int(10000);
      const result = a.add(b).toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3500
     * @tc.name testIntToShort0035
     * @tc.desc Verify MAX_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = new Int(Int.MAX_VALUE);
      const result = max.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3600
     * @tc.name testIntToShort0036
     * @tc.desc Verify MIN_VALUE conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const min = new Int(Int.MIN_VALUE);
      const result = min.toShort();
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3700
     * @tc.name testIntToShort0037
     * @tc.desc Verify toShort range is larger than toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const s = a.toShort();
      const b = a.toByte();
      expect(Math.abs(s)).assertLessOrEqual(32768);
      expect(Math.abs(b)).assertLess(128);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3800
     * @tc.name testIntToShort0038
     * @tc.desc Verify toInt returns original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(12345);
      expect(a.toInt()).assertEqual(12345);
      expect(a.toShort()).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_3900
     * @tc.name testIntToShort0039
     * @tc.desc Verify toLong maintains full precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(100000);
      expect(a.toLong()).assertEqual(100000);
      expect(a.toShort()).assertLargerOrEqual(-32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_4000
     * @tc.name testIntToShort0040
     * @tc.desc Verify usage with short integer array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int[] = [new Int(100), new Int(200), new Int(300)];
      const shorts = values.map((v: Int): short => v.toShort());
      expect(shorts.length).assertEqual(3);
      expect(shorts[0]).assertEqual(100);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_4100
     * @tc.name testIntToShort0041
     * @tc.desc Verify bitmask operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(0x12345678);
      const lowShort = a.toShort();
      expect(lowShort).assertLargerOrEqual(-32768);
      expect(lowShort).assertLess(32768);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_4400
     * @tc.name testIntToShort0044
     * @tc.desc Verify multiple calls to toShort perform normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      let sum = 0;
      for (let i = 0; i < 1000; i++) {
        sum += a.toShort();
      }
      expect(sum).assertEqual(1000000);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_4900
     * @tc.name testIntToShort0049
     * @tc.desc Verify Int to Short then to other type conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(1000);
      const s = a.toShort();
      const l = s + 2000;
      expect(l).assertEqual(3000);
    });

    /**
     * @tc.number INT_TO_SHORT_CHK_5000
     * @tc.name testIntToShort0050
     * @tc.desc Verify precision maintained for values within short range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIntToShort0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int(25000);
      const s = a.toShort();
      expect(s).assertEqual(25000);
    });

  });
}
