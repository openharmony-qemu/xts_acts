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

export default function DoubleBitCastToLongTest(): void {
  describe('DoubleBitCastToLongTest', (): void => {
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
     * @tc.number DBL_BIT_CAST_TO_0100
     * @tc.name testDoubleBitCastToLong0001
     * @tc.desc Verify calling with one required parameter returns valid result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_0400
     * @tc.name testDoubleBitCastToLong0004
     * @tc.desc Verify positive integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0);
      expect(bits).assertEqual(0x3FF0000000000000);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_0500
     * @tc.name testDoubleBitCastToLong0005
     * @tc.desc Verify positive decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(3.14);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_0600
     * @tc.name testDoubleBitCastToLong0006
     * @tc.desc Verify negative decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(-888.88);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_0700
     * @tc.name testDoubleBitCastToLong0007
     * @tc.desc Verify negative integer double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(-1.0);
      expect(bits).assertEqual(-4616189618054758400);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_0800
     * @tc.name testDoubleBitCastToLong0008
     * @tc.desc Verify hexadecimal floating-point double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(9.0);
      expect(bits).not().assertNull();
      const restored = Double.bitCastFromLong(bits);
      expect(restored).assertEqual(9.0);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_0900
     * @tc.name testDoubleBitCastToLong0009
     * @tc.desc Verify scientific notation double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0e6);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1000
     * @tc.name testDoubleBitCastToLong0010
     * @tc.desc Verify Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.MAX_VALUE);
      expect(bits).assertEqual(0x7FEFFFFFFFFFFFFF);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1100
     * @tc.name testDoubleBitCastToLong0011
     * @tc.desc Verify Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.MIN_VALUE);
      expect(bits).assertEqual(0x0000000000000001);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1200
     * @tc.name testDoubleBitCastToLong0012
     * @tc.desc Verify Double.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.MAX_SAFE_INTEGER);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1300
     * @tc.name testDoubleBitCastToLong0013
     * @tc.desc Verify Double.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.MIN_SAFE_INTEGER);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1400
     * @tc.name testDoubleBitCastToLong0014
     * @tc.desc Verify negative Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(-Double.MAX_VALUE);
      expect(bits).assertEqual(-4503599627370497);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1500
     * @tc.name testDoubleBitCastToLong0015
     * @tc.desc Verify positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(0.0);
      expect(bits).assertEqual(0);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1600
     * @tc.name testDoubleBitCastToLong0016
     * @tc.desc Verify negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(-0.0);
      expect(bits).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1700
     * @tc.name testDoubleBitCastToLong0017
     * @tc.desc Verify Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.NaN);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1800
     * @tc.name testDoubleBitCastToLong0018
     * @tc.desc Verify Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.POSITIVE_INFINITY);
      expect(bits).assertEqual(0x7FF0000000000000);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_1900
     * @tc.name testDoubleBitCastToLong0019
     * @tc.desc Verify Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.NEGATIVE_INFINITY);
      expect(bits).assertEqual(-4503599627370496);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_2000
     * @tc.name testDoubleBitCastToLong0020
     * @tc.desc Verify Double.DELTA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.DELTA);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_2100
     * @tc.name testDoubleBitCastToLong0021
     * @tc.desc Verify Double.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.EPSILON);
      expect(bits).not().assertNull();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_2600
     * @tc.name testDoubleBitCastToLong0026
     * @tc.desc Verify bit pattern of 1.0 is 0x3FF0000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0);
      const expected: long = 0x3FF0000000000000;
      expect(bits).assertEqual(expected);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_2700
     * @tc.name testDoubleBitCastToLong0027
     * @tc.desc Verify bit pattern of 2.0 is 0x4000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(2.0);
      const expected: long = 0x4000000000000000;
      expect(bits).assertEqual(expected);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_2800
     * @tc.name testDoubleBitCastToLong0028
     * @tc.desc Verify bit pattern of 0.5 is 0x3FE0000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(0.5);
      const expected: long = 0x3FE0000000000000;
      expect(bits).assertEqual(expected);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_2900
     * @tc.name testDoubleBitCastToLong0029
     * @tc.desc Verify bitCastToLong and bitCastFromLong are inverse operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = 3.14;
      const bits = Double.bitCastToLong(original);
      const restored = Double.bitCastFromLong(bits);
      expect(restored).assertEqual(original);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_3000
     * @tc.name testDoubleBitCastToLong0030
     * @tc.desc Verify round-trip conversion for multiple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: double[] = [0.0, 1.0, -1.0, 123.456, -999.99];
      for (const v of values) {
        const bits = Double.bitCastToLong(v);
        const restored = Double.bitCastFromLong(bits);
        expect(restored).assertEqual(v);
      }
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_3300
     * @tc.name testDoubleBitCastToLong0033
     * @tc.desc Verify NaN bit pattern is non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.NaN);
      expect(bits).not().assertNull();
      expect(bits).not().assertEqual(0);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_3600
     * @tc.name testDoubleBitCastToLong0036
     * @tc.desc Verify return type is long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits: long = Double.bitCastToLong(1.0);
      expect(bits).assertEqual(0x3FF0000000000000);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_3700
     * @tc.name testDoubleBitCastToLong0037
     * @tc.desc Verify return value is integer type without fractional part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(3.14);
      expect(bits % 1).assertEqual(0);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_4000
     * @tc.name testDoubleBitCastToLong0040
     * @tc.desc Verify positive number sign bit is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0);
      expect(bits >= 0).assertTrue();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_4100
     * @tc.name testDoubleBitCastToLong0041
     * @tc.desc Verify negative number sign bit is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(-1.0);
      expect(bits < 0).assertTrue();
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_4700
     * @tc.name testDoubleBitCastToLong0047
     * @tc.desc Verify calling bitCastToLong through Double class name directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.5);
      expect(bits).assertEqual(4609434218613702656);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_4800
     * @tc.name testDoubleBitCastToLong0048
     * @tc.desc Verify same return value for multiple calls with same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits1 = Double.bitCastToLong(1.0);
      const bits2 = Double.bitCastToLong(1.0);
      expect(bits1).assertEqual(bits2);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_4900
     * @tc.name testDoubleBitCastToLong0049
     * @tc.desc Verify different return values for different inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits1 = Double.bitCastToLong(1.0);
      const bits2 = Double.bitCastToLong(2.0);
      expect(bits1).not().assertEqual(bits2);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_5000
     * @tc.name testDoubleBitCastToLong0050
     * @tc.desc Verify exponent bits of 1.0 is 1023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0);
      const exponent = (bits & 0x7FF0000000000000) >> 52;
      expect(exponent).assertEqual(1023);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_5100
     * @tc.name testDoubleBitCastToLong0051
     * @tc.desc Verify exponent bits of 2.0 is 1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(2.0);
      const exponent = (bits & 0x7FF0000000000000) >> 52;
      expect(exponent).assertEqual(1024);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_5200
     * @tc.name testDoubleBitCastToLong0052
     * @tc.desc Verify mantissa bits of 1.0 are all zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.0);
      const mantissa = bits & 0x000FFFFFFFFFFFFF;
      expect(mantissa).assertEqual(0);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_5300
     * @tc.name testDoubleBitCastToLong0053
     * @tc.desc Verify mantissa bits of 1.5 are non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(1.5);
      const mantissa = bits & 0x000FFFFFFFFFFFFF;
      expect(mantissa).not().assertEqual(0);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_5400
     * @tc.name testDoubleBitCastToLong0054
     * @tc.desc Verify MIN_VALUE exponent is 0 and mantissa is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(Double.MIN_VALUE);
      const exponent = (bits & 0x7FF0000000000000) >> 52;
      const mantissa = bits & 0x000FFFFFFFFFFFFF;
      expect(exponent).assertEqual(0);
      expect(mantissa).assertEqual(1);
    });

    /**
     * @tc.number DBL_BIT_CAST_TO_5500
     * @tc.name testDoubleBitCastToLong0055
     * @tc.desc Verify subnormal number close to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastToLong0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bits = Double.bitCastToLong(5e-324);
      expect(bits).not().assertEqual(0);
    });
  });
}
