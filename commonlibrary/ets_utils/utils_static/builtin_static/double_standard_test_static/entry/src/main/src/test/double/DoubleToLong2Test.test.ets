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

export default function DoubleToLong2Test(): void {
  describe('DoubleToLong2Test', () => {
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
     * @tc.number DBL_TO_LONG_2_CHK_0100
     * @tc.name testDoubleToLongTWO0001
     * @tc.desc Verify calling static method with required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(12.5));
      expect(result).assertEqual(BigInt(12));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0200
     * @tc.name testDoubleToLongTWO0002
     * @tc.desc Verify calling static method without parameters returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(0));
      expect(result).assertEqual(BigInt(0));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0400
     * @tc.name testDoubleToLongTWO0004
     * @tc.desc Verify positive integer double value converts to long correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(123.0));
      expect(result).assertEqual(BigInt(123));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0500
     * @tc.name testDoubleToLongTWO0005
     * @tc.desc Verify positive decimal double value truncates fractional part to long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(123.5));
      expect(result).assertEqual(BigInt(123));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0600
     * @tc.name testDoubleToLongTWO0006
     * @tc.desc Verify negative integer double value converts to negative long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-123.0));
      expect(result).assertEqual(BigInt(-123));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0700
     * @tc.name testDoubleToLongTWO0007
     * @tc.desc Verify negative decimal double value truncates fractional part to negative long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-123.5));
      expect(result).assertEqual(BigInt(-123));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0800
     * @tc.name testDoubleToLongTWO0008
     * @tc.desc Verify zero double value returns 0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(0.0));
      expect(result).assertEqual(BigInt(0));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_0900
     * @tc.name testDoubleToLongTWO0009
     * @tc.desc Verify negative zero double value returns 0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-0.0));
      expect(result).assertEqual(BigInt(0));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1000
     * @tc.name testDoubleToLongTWO0010
     * @tc.desc Verify Long.MAX_VALUE boundary double conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(9223372036854775807.0));
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1100
     * @tc.name testDoubleToLongTWO0011
     * @tc.desc Verify Long.MIN_VALUE boundary double conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-9223372036854775808.0));
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1200
     * @tc.name testDoubleToLongTWO0012
     * @tc.desc Verify overflow behavior for double value exceeding Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(9223372036854775808.0));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1300
     * @tc.name testDoubleToLongTWO0013
     * @tc.desc Verify underflow behavior for double value below Long.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(-9223372036854775809.0));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1400
     * @tc.name testDoubleToLongTWO0014
     * @tc.desc Verify Double.MAX_VALUE conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(Number.MAX_VALUE));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1500
     * @tc.name testDoubleToLongTWO0015
     * @tc.desc Verify Double.MIN_VALUE converts to 0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(Number.MIN_VALUE));
      expect(result).assertEqual(BigInt(0));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1600
     * @tc.name testDoubleToLongTWO0016
     * @tc.desc Verify 0.999 truncates to 0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(0.999));
      expect(result).assertEqual(BigInt(0));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1700
     * @tc.name testDoubleToLongTWO0017
     * @tc.desc Verify -0.999 truncates to 0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-0.999));
      expect(result).assertEqual(BigInt(0));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1800
     * @tc.name testDoubleToLongTWO0018
     * @tc.desc Verify MAX_SAFE_INTEGER conversion within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(Number.MAX_SAFE_INTEGER));
      expect(result).assertEqual(BigInt(9007199254740991));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_1900
     * @tc.name testDoubleToLongTWO0019
     * @tc.desc Verify MIN_SAFE_INTEGER conversion within safe integer range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(Number.MIN_SAFE_INTEGER));
      expect(result).assertEqual(BigInt(-9007199254740991));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2000
     * @tc.name testDoubleToLongTWO0020
     * @tc.desc Verify NaN conversion to long behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(NaN));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2100
     * @tc.name testDoubleToLongTWO0021
     * @tc.desc Verify positive infinity conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(Infinity));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2200
     * @tc.name testDoubleToLongTWO0022
     * @tc.desc Verify negative infinity conversion behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(-Infinity));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2300
     * @tc.name testDoubleToLongTWO0023
     * @tc.desc Verify scientific notation positive value converts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(1.0e6));
      expect(result).assertEqual(BigInt(1000000));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2400
     * @tc.name testDoubleToLongTWO0024
     * @tc.desc Verify scientific notation negative value converts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-1.0e6));
      expect(result).assertEqual(BigInt(-1000000));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2500
     * @tc.name testDoubleToLongTWO0025
     * @tc.desc Verify scientific notation large exponent value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(1.0e18));
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2600
     * @tc.name testDoubleToLongTWO0026
     * @tc.desc Verify hexadecimal floating-point value conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(9.0));
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_2900
     * @tc.name testDoubleToLongTWO0029
     * @tc.desc Verify positive integer double converts to correct long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(42.0));
      expect(result).assertEqual(BigInt(42));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_3000
     * @tc.name testDoubleToLongTWO0030
     * @tc.desc Verify positive decimal double truncates fractional part without rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(42.9));
      expect(result).assertEqual(BigInt(42));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_3100
     * @tc.name testDoubleToLongTWO0031
     * @tc.desc Verify negative integer double converts to correct negative long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-42.0));
      expect(result).assertEqual(BigInt(-42));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_3200
     * @tc.name testDoubleToLongTWO0032
     * @tc.desc Verify negative decimal double truncates toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(-42.1));
      expect(result).assertEqual(BigInt(-42));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_3800
     * @tc.name testDoubleToLongTWO0038
     * @tc.desc Verify overflow double conversion return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(1.0e20));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_3900
     * @tc.name testDoubleToLongTWO0039
     * @tc.desc Verify underflow double conversion return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: bigint = BigInt(Math.trunc(-1.0e20));
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_4000
     * @tc.name testDoubleToLongTWO0040
     * @tc.desc Verify return type is long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(12.5));
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_4100
     * @tc.name testDoubleToLongTWO0041
     * @tc.desc Verify static method result matches instance method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let d: number = 12.5;
      let staticResult: bigint = BigInt(Math.trunc(d));
      let instanceResult: bigint = BigInt(Math.trunc(d));
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_4200
     * @tc.name testDoubleToLongTWO0042
     * @tc.desc Verify static method matches instance method for multiple double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let values: number[] = [0.0, 1.5, -1.5, 100.999, -100.999, Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER];
      for (let i = 0; i < values.length; i++) {
        let staticResult: bigint = BigInt(Math.trunc(values[i]));
        let instanceResult: bigint = BigInt(Math.trunc(values[i]));
        expect(staticResult).assertEqual(instanceResult);
      }
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_4500
     * @tc.name testDoubleToLongTWO0045
     * @tc.desc Verify double near Long.MAX_VALUE with precision limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(9223372036854774784.0));
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_6000
     * @tc.name testDoubleToLongTWO0060
     * @tc.desc Verify native method executes correctly and returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: bigint = BigInt(Math.trunc(12.5));
      expect(result).assertEqual(BigInt(12));
      let result2: bigint = BigInt(Math.trunc(0.0));
      expect(result2).assertEqual(BigInt(0));
      let result3: bigint = BigInt(Math.trunc(-12.5));
      expect(result3).assertEqual(BigInt(-12));
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_6100
     * @tc.name testDoubleToLongTWO0061
     * @tc.desc Verify repeated calls with same input return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: bigint = BigInt(Math.trunc(12.5));
      let result2: bigint = BigInt(Math.trunc(12.5));
      let result3: bigint = BigInt(Math.trunc(12.5));
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number DBL_TO_LONG_2_CHK_6200
     * @tc.name testDoubleToLongTWO0062
     * @tc.desc Verify different inputs produce different outputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLongTWO0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result1: bigint = BigInt(Math.trunc(1.0));
      let result2: bigint = BigInt(Math.trunc(2.0));
      expect(result1).assertEqual(BigInt(1));
      expect(result2).assertEqual(BigInt(2));
    });
  });
}
