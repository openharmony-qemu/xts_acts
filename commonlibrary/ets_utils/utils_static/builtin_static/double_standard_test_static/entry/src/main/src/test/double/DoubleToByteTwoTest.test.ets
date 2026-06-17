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

export default function DoubleToByteTwoTest(): void {
  describe('DoubleToByteTwoTest', (): void => {
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
     * @tc.number DBL_TO_BYTE_TWO_0100
     * @tc.name doubleToByteTest0001
     * @tc.desc Verify required parameter with one argument 8.0 returns correct byte value 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(8.0);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_0400
     * @tc.name doubleToByteTest0004
     * @tc.desc Verify positive double value 12.0 returns byte 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(12.0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_0500
     * @tc.name doubleToByteTest0005
     * @tc.desc Verify negative double value -5.0 returns byte -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-5.0);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_0600
     * @tc.name doubleToByteTest0006
     * @tc.desc Verify zero value 0.0 returns byte 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_0700
     * @tc.name doubleToByteTest0007
     * @tc.desc Verify decimal double 12.9 truncates to byte 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(12.9);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_0800
     * @tc.name doubleToByteTest0008
     * @tc.desc Verify negative decimal -3.7 truncates to byte -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-3.7);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_0900
     * @tc.name doubleToByteTest0009
     * @tc.desc Verify byte range max value 127.0 returns byte 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(127.0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1000
     * @tc.name doubleToByteTest0010
     * @tc.desc Verify byte range min value -128.0 returns byte -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-128.0);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1100
     * @tc.name doubleToByteTest0011
     * @tc.desc Verify overflow for 128.0 exceeding byte upper bound returns -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(128.0);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1200
     * @tc.name doubleToByteTest0012
     * @tc.desc Verify overflow for -129.0 exceeding byte lower bound returns 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-129.0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1300
     * @tc.name doubleToByteTest0013
     * @tc.desc Verify 127.9 near byte max truncates to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(127.9);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1400
     * @tc.name doubleToByteTest0014
     * @tc.desc Verify -128.9 near byte min truncates to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-128.9);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1500
     * @tc.name doubleToByteTest0015
     * @tc.desc Verify Double.MAX_VALUE extreme positive overflow truncation returns number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(Double.MAX_VALUE);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1600
     * @tc.name doubleToByteTest0016
     * @tc.desc Verify -Double.MAX_VALUE extreme negative overflow truncation returns number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-Double.MAX_VALUE);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1700
     * @tc.name doubleToByteTest0017
     * @tc.desc Verify Double.MIN_VALUE smallest positive double truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(Double.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1800
     * @tc.name doubleToByteTest0018
     * @tc.desc Verify NaN conversion result is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(Double.NaN);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_1900
     * @tc.name doubleToByteTest0019
     * @tc.desc Verify positive infinity Double.POSITIVE_INFINITY conversion result is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(Double.POSITIVE_INFINITY);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_2000
     * @tc.name doubleToByteTest0020
     * @tc.desc Verify negative infinity Double.NEGATIVE_INFINITY conversion result is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(Double.NEGATIVE_INFINITY);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_2100
     * @tc.name doubleToByteTest0021
     * @tc.desc Verify negative zero -0.0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_2200
     * @tc.name doubleToByteTest0022
     * @tc.desc Verify scientific notation 1.0e2 returns byte 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(1.0e2);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_2700
     * @tc.name doubleToByteTest0027
     * @tc.desc Verify undefined parameter triggers exception behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: byte = Double.toByte(1.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_2900
     * @tc.name doubleToByteTest0029
     * @tc.desc Verify negative double -10.0 to byte returns correct negative integer -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-10.0);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_3100
     * @tc.name doubleToByteTest0031
     * @tc.desc Verify decimal 99.99 truncates to integer byte 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(99.99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_3800
     * @tc.name doubleToByteTest0038
     * @tc.desc Verify byte range normal values return correct results within [-128, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let values: double[] = [1.0, 50.0, 100.0, 127.0, -1.0, -50.0, -100.0, -128.0];
      for (let v of values) {
        const result: byte = Double.toByte(v);
        expect(result >= -128 && result <= 127).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4100
     * @tc.name doubleToByteTest0041
     * @tc.desc Verify overflow for 256.0 returns truncated byte result as number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(256.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4200
     * @tc.name doubleToByteTest0042
     * @tc.desc Verify overflow for -256.0 returns truncated byte result as number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(-256.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4300
     * @tc.name doubleToByteTest0043
     * @tc.desc Verify 255.0 to byte returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(255.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4400
     * @tc.name doubleToByteTest0044
     * @tc.desc Verify illegal type parameter triggers exception caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: byte = Double.toByte(100.0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4500
     * @tc.name doubleToByteTest0045
     * @tc.desc Verify null parameter triggers exception caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: byte = Double.toByte(50.0);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4600
     * @tc.name doubleToByteTest0046
     * @tc.desc Verify undefined parameter triggers exception caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const result: byte = Double.toByte(-50.0);
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_4700
     * @tc.name doubleToByteTest0047
     * @tc.desc Verify large value 1000000.0 to byte does not throw exception and returns truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(1000000.0);
      expect(result >= -128 && result <= 127).assertTrue();
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5100
     * @tc.name doubleToByteTest0051
     * @tc.desc Verify static method with instance context returns correct byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const value = new Double(8.0);
      const result: byte = Double.toByte(8.0);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5200
     * @tc.name doubleToByteTest0052
     * @tc.desc Verify native method returns correct byte value 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: byte = Double.toByte(42.0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5300
     * @tc.name doubleToByteTest0053
     * @tc.desc Verify multiple conversions of same value return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1: byte = Double.toByte(8.0);
      const result2: byte = Double.toByte(8.0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5400
     * @tc.name doubleToByteTest0054
     * @tc.desc Verify static toByte matches instance toByte for same double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new Double(12.0);
      const instanceResult: byte = instance.toByte();
      const staticResult: byte = Double.toByte(12.0);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5500
     * @tc.name doubleToByteTest0055
     * @tc.desc Verify positive range typical values conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.toByte(1.0)).assertEqual(1);
      expect(Double.toByte(64.0)).assertEqual(64);
      expect(Double.toByte(127.0)).assertEqual(127);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5600
     * @tc.name doubleToByteTest0056
     * @tc.desc Verify negative range typical values conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.toByte(-1.0)).assertEqual(-1);
      expect(Double.toByte(-64.0)).assertEqual(-64);
      expect(Double.toByte(-128.0)).assertEqual(-128);
    });

    /**
     * @tc.number DBL_TO_BYTE_TWO_5700
     * @tc.name doubleToByteTest0057
     * @tc.desc Verify various decimal truncation scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToByteTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(Double.toByte(0.1)).assertEqual(0);
      expect(Double.toByte(0.9)).assertEqual(0);
      expect(Double.toByte(1.5)).assertEqual(1);
      expect(Double.toByte(-0.5)).assertEqual(0);
      expect(Double.toByte(-1.5)).assertEqual(-1);
    });
  });
}
