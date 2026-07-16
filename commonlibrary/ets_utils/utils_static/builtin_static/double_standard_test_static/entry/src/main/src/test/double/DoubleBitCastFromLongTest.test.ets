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

export default function DoubleBitCastFromLongTest(): void {
  describe('DoubleBitCastFromLongTest', () : void => {
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
     * @tc.number DBL_BIT_CAST_FROM_0100
     * @tc.name testDoubleBitCastFromLong0001
     * @tc.desc Verify calling with required parameter bits returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3ff0000000000000)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_0500
     * @tc.name testDoubleBitCastFromLong0005
     * @tc.desc Verify passing IEEE-754 bit pattern for 2.0 returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x4000000000000000)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_0600
     * @tc.name testDoubleBitCastFromLong0006
     * @tc.desc Verify passing IEEE-754 bit pattern for -1.0 returns -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4616189618054758400)
      expect(result).assertEqual(-1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_0700
     * @tc.name testDoubleBitCastFromLong0007
     * @tc.desc Verify passing IEEE-754 bit pattern for -2.0 returns -2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4611686018427387904)
      expect(result).assertEqual(-2.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_0800
     * @tc.name testDoubleBitCastFromLong0008
     * @tc.desc Verify passing IEEE-754 bit pattern for 0.5 returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3fe0000000000000)
      expect(result).assertEqual(0.5)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_0900
     * @tc.name testDoubleBitCastFromLong0009
     * @tc.desc Verify passing IEEE-754 bit pattern for -0.5 returns -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: long = Double.bitCastToLong(-0.5);
      let result: double = Double.bitCastFromLong(bits);
      expect(result).assertEqual(-0.5);
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1000
     * @tc.name testDoubleBitCastFromLong0010
     * @tc.desc Verify passing IEEE-754 bit pattern for pi returns 3.141592653589793
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x400921fb54442d18)
      expect(result).assertEqual(3.141592653589793)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1100
     * @tc.name testDoubleBitCastFromLong0011
     * @tc.desc Verify passing IEEE-754 bit pattern for 1.1 returns 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3ff199999999999a)
      expect(result).assertEqual(1.1)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1200
     * @tc.name testDoubleBitCastFromLong0012
     * @tc.desc Verify passing IEEE-754 bit pattern for 255.0 returns 255.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x406fe00000000000)
      expect(result).assertEqual(255.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1300
     * @tc.name testDoubleBitCastFromLong0013
     * @tc.desc Verify passing IEEE-754 bit pattern for -128.0 returns -128.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(-128.0);
      let result: double = Double.bitCastFromLong(bits);
      expect(result).assertEqual(-128.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1400
     * @tc.name testDoubleBitCastFromLong0014
     * @tc.desc Verify passing 0x0000000000000000 returns positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x0000000000000000)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1500
     * @tc.name testDoubleBitCastFromLong0015
     * @tc.desc Verify passing 0x8000000000000000 returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-9223372036854775808)
      expect(Double.compare(result, 0.0)).assertTrue()
      expect(Double.compare(result, -0.0)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1600
     * @tc.name testDoubleBitCastFromLong0016
     * @tc.desc Verify passing 0x7ff0000000000000 returns positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff0000000000000)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1700
     * @tc.name testDoubleBitCastFromLong0017
     * @tc.desc Verify passing 0xfff0000000000000 returns negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4503599627370496)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1800
     * @tc.name testDoubleBitCastFromLong0018
     * @tc.desc Verify passing 0x7ff8000000000000 returns quiet NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff8000000000000)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_1900
     * @tc.name testDoubleBitCastFromLong0019
     * @tc.desc Verify passing 0x7fefffffffffffff returns max finite double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7fefffffffffffff)
      expect(result).assertEqual(Double.MAX_VALUE)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2000
     * @tc.name testDoubleBitCastFromLong0020
     * @tc.desc Verify passing 0xffefffffffffffff returns min negative finite double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4503599627370497)
      expect(result).assertEqual(-Double.MAX_VALUE)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2100
     * @tc.name testDoubleBitCastFromLong0021
     * @tc.desc Verify passing 0x0010000000000000 returns min positive normalized double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x0010000000000000)
      expect(Double.isFinite(result)).assertTrue()
      expect(result > 0.0).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2200
     * @tc.name testDoubleBitCastFromLong0022
     * @tc.desc Verify passing 0x0000000000000001 returns min positive subnormal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x0000000000000001)
      expect(result > 0.0).assertTrue()
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2300
     * @tc.name testDoubleBitCastFromLong0023
     * @tc.desc Verify passing 0x000fffffffffffff returns max subnormal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x000fffffffffffff)
      expect(result > 0.0).assertTrue()
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2400
     * @tc.name testDoubleBitCastFromLong0024
     * @tc.desc Verify passing 0x8010000000000000 returns min negative normalized double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-8941897060144119040)
      expect(result < 0.0).assertTrue()
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2500
     * @tc.name testDoubleBitCastFromLong0025
     * @tc.desc Verify passing 0x8000000000000001 returns max negative subnormal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-9223372036854775807)
      expect(result < 0.0).assertTrue()
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2600
     * @tc.name testDoubleBitCastFromLong0026
     * @tc.desc Verify passing 0x800fffffffffffff returns min negative subnormal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4719772409484280813)
      expect(result < 0.0).assertTrue()
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2700
     * @tc.name testDoubleBitCastFromLong0027
     * @tc.desc Verify passing signaling NaN 0x7ff0000000000001 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff0000000000001)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2800
     * @tc.name testDoubleBitCastFromLong0028
     * @tc.desc Verify passing negative quiet NaN 0xfff8000000000000 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-2124193792)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_2900
     * @tc.name testDoubleBitCastFromLong0029
     * @tc.desc Verify passing negative signaling NaN 0xfff0000000000001 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4503599627370495)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_3000
     * @tc.name testDoubleBitCastFromLong0030
     * @tc.desc Verify passing NaN with payload 0x7ff4000000000000 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff4000000000000)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_3100
     * @tc.name testDoubleBitCastFromLong0031
     * @tc.desc Verify passing Long.MAX_VALUE 0x7fffffffffffffff returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7fffffffffffffff)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_3200
     * @tc.name testDoubleBitCastFromLong0032
     * @tc.desc Verify passing Long.MIN_VALUE 0x8000000000000000 returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-9223372036854775808)
      expect(Double.compare(result, 0.0)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_3300
     * @tc.name testDoubleBitCastFromLong0033
     * @tc.desc Verify passing -1L 0xffffffffffffffff returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-1)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_3400
     * @tc.name testDoubleBitCastFromLong0034
     * @tc.desc Verify passing 1L 0x0000000000000001 returns min positive subnormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x0000000000000001)
      expect(result > 0.0).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_3500
     * @tc.name testDoubleBitCastFromLong0035
     * @tc.desc Verify passing 255L 0x00000000000000ff returns subnormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x00000000000000ff)
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4000
     * @tc.name testDoubleBitCastFromLong0040
     * @tc.desc Verify documentation example passing 0x3ff0000000000000 returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      const value: double = Double.bitCastFromLong(0x3ff0000000000000)
      expect(value).assertEqual(1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4100
     * @tc.name testDoubleBitCastFromLong0041
     * @tc.desc Verify passing positive integer bit pattern returns correct positive double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x4024000000000000)
      expect(result).assertEqual(10.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4200
     * @tc.name testDoubleBitCastFromLong0042
     * @tc.desc Verify passing negative integer bit pattern returns correct negative double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(-10.0);
      let result: double = Double.bitCastFromLong(bits);
      expect(result).assertEqual(-10.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4300
     * @tc.name testDoubleBitCastFromLong0043
     * @tc.desc Verify passing positive decimal bit pattern returns correct positive decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3fb999999999999a)
      expect(result).assertEqual(0.1)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4400
     * @tc.name testDoubleBitCastFromLong0044
     * @tc.desc Verify passing negative decimal bit pattern returns correct negative decimal double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      const expected: double = -0.5;
      const bits: long = Double.bitCastToLong(expected);
      let result: double = Double.bitCastFromLong(bits);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4500
     * @tc.name testDoubleBitCastFromLong0045
     * @tc.desc Verify passing large positive bit pattern returns large positive double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x4340000000000000)
      expect(result).assertEqual(9007199254740992)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4600
     * @tc.name testDoubleBitCastFromLong0046
     * @tc.desc Verify passing small positive bit pattern returns small positive double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3cb0000000000000)
      expect(result).assertEqual(2.220446049250313e-16)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4700
     * @tc.name testDoubleBitCastFromLong0047
     * @tc.desc Verify passing all-zero bit pattern returns positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x0000000000000000)
      expect(result).assertEqual(0.0)
      expect(Double.compare(result, 0.0)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_4900
     * @tc.name testDoubleBitCastFromLong0049
     * @tc.desc Verify passing positive infinity bit pattern returns Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff0000000000000)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
      expect(Double.isFinite(result)).assertFalse()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5000
     * @tc.name testDoubleBitCastFromLong0050
     * @tc.desc Verify passing negative infinity bit pattern returns Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(-4503599627370496)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
      expect(Double.isFinite(result)).assertFalse()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5100
     * @tc.name testDoubleBitCastFromLong0051
     * @tc.desc Verify passing standard NaN bit pattern returns NaN and isNaN is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff8000000000000)
      expect(Double.isNaN(result)).assertTrue()
      expect(Double.isFinite(result)).assertFalse()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5200
     * @tc.name testDoubleBitCastFromLong0052
     * @tc.desc Verify NaN return value is not equal to itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7ff8000000000000)
      expect(result != result).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5300
     * @tc.name testDoubleBitCastFromLong0053
     * @tc.desc Verify return value type is double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3ff0000000000000)
      expect(typeof result).assertEqual('number')
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5400
     * @tc.name testDoubleBitCastFromLong0054
     * @tc.desc Verify return value can be assigned to double type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3ff0000000000000)
      let boxed: Double = new Double(result)
      expect(boxed.toDouble()).assertEqual(1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5500
     * @tc.name testDoubleBitCastFromLong0055
     * @tc.desc Verify return value can participate in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let a: double = Double.bitCastFromLong(0x3ff0000000000000)
      let b: double = Double.bitCastFromLong(0x4000000000000000)
      expect(a + b).assertEqual(3.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5600
     * @tc.name testDoubleBitCastFromLong0056
     * @tc.desc Verify return value can be used in Double constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let raw: double = Double.bitCastFromLong(0x3ff0000000000000)
      let d: Double = new Double(raw)
      expect(d.valueOf()).assertEqual(1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5700
     * @tc.name testDoubleBitCastFromLong0057
     * @tc.desc Verify max finite double value equals Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x7fefffffffffffff)
      expect(result).assertEqual(Double.MAX_VALUE)
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_5900
     * @tc.name testDoubleBitCastFromLong0059
     * @tc.desc Verify min positive normalized double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x0010000000000000)
      expect(result > 0.0).assertTrue()
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_6000
     * @tc.name testDoubleBitCastFromLong0060
     * @tc.desc Verify consecutive calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = 0x400921fb54442d18
      let r1: double = Double.bitCastFromLong(bits)
      let r2: double = Double.bitCastFromLong(bits)
      expect(r1).assertEqual(r2)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_6700
     * @tc.name testDoubleBitCastFromLong0067
     * @tc.desc Verify bitCastFromLong(bitCastToLong(1.0)) equals 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(1.0)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_6800
     * @tc.name testDoubleBitCastFromLong0068
     * @tc.desc Verify bitCastFromLong(bitCastToLong(2.0)) equals 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(2.0)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_6900
     * @tc.name testDoubleBitCastFromLong0069
     * @tc.desc Verify bitCastFromLong(bitCastToLong(3.141592653589793)) equals pi
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(3.141592653589793)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(3.141592653589793)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7000
     * @tc.name testDoubleBitCastFromLong0070
     * @tc.desc Verify bitCastFromLong(bitCastToLong(0.0)) equals 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(0.0)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7100
     * @tc.name testDoubleBitCastFromLong0071
     * @tc.desc Verify bitCastFromLong(bitCastToLong(-0.0)) equals negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(-0.0)
      let result: double = Double.bitCastFromLong(bits)
      expect(Double.compare(result, -0.0)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7200
     * @tc.name testDoubleBitCastFromLong0072
     * @tc.desc Verify bitCastFromLong(bitCastToLong(Double.POSITIVE_INFINITY)) equals positive infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(Double.POSITIVE_INFINITY)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7300
     * @tc.name testDoubleBitCastFromLong0073
     * @tc.desc Verify bitCastFromLong(bitCastToLong(Double.NEGATIVE_INFINITY)) equals negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(Double.NEGATIVE_INFINITY)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7400
     * @tc.name testDoubleBitCastFromLong0074
     * @tc.desc Verify bitCastFromLong(bitCastToLong(Double.NaN)) returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(Double.NaN)
      let result: double = Double.bitCastFromLong(bits)
      expect(Double.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7500
     * @tc.name testDoubleBitCastFromLong0075
     * @tc.desc Verify bitCastFromLong(bitCastToLong(-1.0)) equals -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(-1.0)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(-1.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7600
     * @tc.name testDoubleBitCastFromLong0076
     * @tc.desc Verify bitCastFromLong(bitCastToLong(-999.99)) equals -999.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(-999.99)
      let result: double = Double.bitCastFromLong(bits)
      expect(result).assertEqual(-999.99)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7800
     * @tc.name testDoubleBitCastFromLong0078
     * @tc.desc Verify consecutive multiple calls return independent correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let r1: double = Double.bitCastFromLong(0x3ff0000000000000)
      let r2: double = Double.bitCastFromLong(0x4000000000000000)
      let r3: double = Double.bitCastFromLong(-4611686018427387904)
      expect(r1).assertEqual(1.0)
      expect(r2).assertEqual(2.0)
      expect(r3).assertEqual(-2.0)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_7900
     * @tc.name testDoubleBitCastFromLong0079
     * @tc.desc Verify bitCastFromLong return value used as other Double method parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let bits: long = Double.bitCastToLong(1.5)
      let roundTrip: double = Double.bitCastFromLong(bits)
      let d: Double = new Double(roundTrip)
      expect(d.valueOf()).assertEqual(1.5)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_8100
     * @tc.name testDoubleBitCastFromLong0081
     * @tc.desc Verify bitCastFromLong return value used for Double.isFinite check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3ff0000000000000)
      expect(Double.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_8200
     * @tc.name testDoubleBitCastFromLong0082
     * @tc.desc Verify bitCastFromLong return value used for Double.isInteger check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x3ff0000000000000)
      expect(Double.isInteger(result)).assertTrue()
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_8300
     * @tc.name testDoubleBitCastFromLong0083
     * @tc.desc Verify 0x4028000000000000 exactly corresponds to 12.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x4028000000000000)
      expect(result).assertEqual(12.0)
      let backBits: long = Double.bitCastToLong(result)
      expect(backBits).assertEqual(0x4028000000000000)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_8400
     * @tc.name testDoubleBitCastFromLong0084
     * @tc.desc Verify 0x4059000000000000 exactly corresponds to 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      let result: double = Double.bitCastFromLong(0x4059000000000000)
      expect(result).assertEqual(100.0)
      let backBits: long = Double.bitCastToLong(result)
      expect(backBits).assertEqual(0x4059000000000000)
    });

    /**
     * @tc.number DBL_BIT_CAST_FROM_8500
     * @tc.name testDoubleBitCastFromLong0085
     * @tc.desc Verify 0xc059000000000000 exactly corresponds to -100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleBitCastFromLong0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () : void => {
      const expected: double = -100.0;
      const bits: long = Double.bitCastToLong(expected);
      let result: double = Double.bitCastFromLong(bits);
      expect(result).assertEqual(expected);
      expect(bits).assertEqual(-4586634745500139520);
    });
  });
}
