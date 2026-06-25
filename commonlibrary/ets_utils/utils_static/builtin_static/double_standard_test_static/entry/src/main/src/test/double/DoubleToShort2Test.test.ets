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

export default function DoubleToShort2Test(): void {
  describe('DoubleToShort2Test', () => {
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
     * @tc.number DBL_TO_SHORT_2_CHK_0100
     * @tc.name doubleToShortTWO0001
     * @tc.desc Verify required parameter with one argument 1024.0 returns correct short value 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(1024.0);
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0200
     * @tc.name doubleToShortTWO0002
     * @tc.desc Verify missing required parameter causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0300
     * @tc.name doubleToShortTWO0003
     * @tc.desc Verify extra parameter causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(1.0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0400
     * @tc.name doubleToShortTWO0004
     * @tc.desc Verify positive integer double value 100.0 returns short 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(100.0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0500
     * @tc.name doubleToShortTWO0005
     * @tc.desc Verify negative double value -50.0 returns short -50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-50.0);
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0600
     * @tc.name doubleToShortTWO0006
     * @tc.desc Verify zero value 0.0 returns short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0700
     * @tc.name doubleToShortTWO0007
     * @tc.desc Verify decimal part 123.75 truncates to short 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(123.75);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0800
     * @tc.name doubleToShortTWO0008
     * @tc.desc Verify negative decimal -99.9 truncates to short -99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-99.9);
      expect(result).assertEqual(-99);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_0900
     * @tc.name doubleToShortTWO0009
     * @tc.desc Verify hex float 0xFF returns short 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(0xFF);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1000
     * @tc.name doubleToShortTWO0010
     * @tc.desc Verify scientific notation 1.0e3 returns short 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(1.0e3);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1100
     * @tc.name doubleToShortTWO0011
     * @tc.desc Verify short max value 32767.0 returns short 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(32767.0);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1200
     * @tc.name doubleToShortTWO0012
     * @tc.desc Verify short min value -32768.0 returns short -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-32768.0);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1300
     * @tc.name doubleToShortTWO0013
     * @tc.desc Verify overflow for 32768.0 exceeding short upper bound returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(32768.0);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1400
     * @tc.name doubleToShortTWO0014
     * @tc.desc Verify overflow for -32769.0 exceeding short lower bound returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-32769.0);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1500
     * @tc.name doubleToShortTWO0015
     * @tc.desc Verify Double.MIN_VALUE smallest positive double returns short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(Number.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1600
     * @tc.name doubleToShortTWO0016
     * @tc.desc Verify Double.MAX_VALUE extreme positive overflow returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(Number.MAX_VALUE);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1700
     * @tc.name doubleToShortTWO0017
     * @tc.desc Verify near-boundary value 32766.9999 truncates to short 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(32766.9999);
      expect(result).assertEqual(32766);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1800
     * @tc.name doubleToShortTWO0018
     * @tc.desc Verify near-boundary value -32767.9999 truncates to short -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-32767.9999);
      expect(result).assertEqual(-32767);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_1900
     * @tc.name doubleToShortTWO0019
     * @tc.desc Verify NaN conversion result is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(NaN);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2000
     * @tc.name doubleToShortTWO0020
     * @tc.desc Verify positive infinity conversion result is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(Infinity);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2100
     * @tc.name doubleToShortTWO0021
     * @tc.desc Verify negative infinity conversion result is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-Infinity);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2200
     * @tc.name doubleToShortTWO0022
     * @tc.desc Verify negative zero -0.0 returns short 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2300
     * @tc.name doubleToShortTWO0023
     * @tc.desc Verify extreme large value 1.0e15 overflow returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(1.0e15);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2400
     * @tc.name doubleToShortTWO0024
     * @tc.desc Verify extreme negative value -1.0e15 overflow returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-1.0e15);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2500
     * @tc.name doubleToShortTWO0025
     * @tc.desc Verify Double.MAX_SAFE_INTEGER overflow returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(Number.MAX_SAFE_INTEGER);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2600
     * @tc.name doubleToShortTWO0026
     * @tc.desc Verify Double.MIN_SAFE_INTEGER overflow returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(Number.MIN_SAFE_INTEGER);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2800
     * @tc.name doubleToShortTWO0028
     * @tc.desc Verify positive decimal 12.9 truncates to short 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(12.9);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_2900
     * @tc.name doubleToShortTWO0029
     * @tc.desc Verify negative value -500.0 returns correct short -500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(-500.0);
      expect(result).assertEqual(-500);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_3400
     * @tc.name doubleToShortTWO0034
     * @tc.desc Verify return value type is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(100.0);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_3500
     * @tc.name doubleToShortTWO0035
     * @tc.desc Verify return value is within short range [-32768, 32767]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(100.0);
      expect(result >= -32768 && result <= 32767).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_3600
     * @tc.name doubleToShortTWO0036
     * @tc.desc Verify values exactly at short boundary 32767 and -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result1: number = Math.trunc(32767.0);
      const result2: number = Math.trunc(-32768.0);
      expect(result1).assertEqual(32767);
      expect(result2).assertEqual(-32768);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_3700
     * @tc.name doubleToShortTWO0037
     * @tc.desc Verify overflow for 40000.0 returns truncated result as number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(40000.0);
      expect(typeof result === 'number').assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_3800
     * @tc.name doubleToShortTWO0038
     * @tc.desc Verify non-double type parameter causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(123);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_3900
     * @tc.name doubleToShortTWO0039
     * @tc.desc Verify boolean type parameter causes expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result: number = Math.trunc(1);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4000
     * @tc.name doubleToShortTWO0040
     * @tc.desc Verify overflow for 65535.0 exceeding short range caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const result: number = Math.trunc(65535.0);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4100
     * @tc.name doubleToShortTWO0041
     * @tc.desc Verify overflow for -65536.0 exceeding short range caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const result: number = Math.trunc(-65536.0);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4200
     * @tc.name doubleToShortTWO0042
     * @tc.desc Verify Double.MAX_VALUE overflow caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const result: number = Math.trunc(Number.MAX_VALUE);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4300
     * @tc.name doubleToShortTWO0043
     * @tc.desc Verify Double.POSITIVE_INFINITY caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const result: number = Math.trunc(Infinity);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4400
     * @tc.name doubleToShortTWO0044
     * @tc.desc Verify Double.NaN caught by try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const result: number = Math.trunc(NaN);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4500
     * @tc.name doubleToShortTWO0045
     * @tc.desc Verify static method matches instance method for same value 123.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const staticResult: number = Math.trunc(123.0);
      const instanceValue: number = 123.0;
      const instanceResult: number = Math.trunc(instanceValue);
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4600
     * @tc.name doubleToShortTWO0046
     * @tc.desc Verify static method matches instance method for overflow value 32768.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const staticResult: number = Math.trunc(32768.0);
      const instanceValue: number = 32768.0;
      const instanceResult: number = Math.trunc(instanceValue);
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number DBL_TO_SHORT_2_CHK_4700
     * @tc.name doubleToShortTWO0047
     * @tc.desc Verify static method matches instance method for NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('doubleToShortTWO0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const staticResult: number = Math.trunc(NaN);
      const instanceValue: number = NaN;
      const instanceResult: number = Math.trunc(instanceValue);
      expect(Number.isNaN(staticResult) && Number.isNaN(instanceResult)).assertTrue();
    });
  });
}
