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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function FloatBitCastFromIntTest(): void {
  describe('FloatBitCastFromIntTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0100
     * @tc.name testBitCastFromInt001
     * @tc.desc Verify Float.bitCastFromInt converts 0x3f800000 to 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1065353216);
      expect(result).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0200
     * @tc.name testBitCastFromInt002
     * @tc.desc Verify Float.bitCastFromInt converts 0x00000000 to +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0);
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0300
     * @tc.name testBitCastFromInt003
     * @tc.desc Verify Float.bitCastFromInt converts 0x80000000 to -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-2147483648);
      expect(result).assertEqual(0.0f);
      let isNegativeZero: boolean = (1.0f / result) == Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0400
     * @tc.name testBitCastFromInt004
     * @tc.desc Verify Float.bitCastFromInt converts 0x40000000 to 2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1073741824);
      expect(result).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0500
     * @tc.name testBitCastFromInt005
     * @tc.desc Verify Float.bitCastFromInt converts 0x40490fdb to pi approximation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1078530011);
      expect(Math.abs(result - 3.1415927f) < 1e-6f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0600
     * @tc.name testBitCastFromInt006
     * @tc.desc Verify Float.bitCastFromInt converts 0x3fc90fdb to pi/2 approximation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x3fc90fdb as int);
      expect(Math.abs(result - 1.5707963f) < 1e-6f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0700
     * @tc.name testBitCastFromInt007
     * @tc.desc Verify Float.bitCastFromInt converts 0x3eaaaaab to 1/3 approximation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x3eaaaaab as int);
      expect(Math.abs(result - 0.33333334f) < 1e-6f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0800
     * @tc.name testBitCastFromInt008
     * @tc.desc Verify Float.bitCastFromInt converts 0x41200000 to 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1092616192);
      expect(result).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_0900
     * @tc.name testBitCastFromInt009
     * @tc.desc Verify Float.bitCastFromInt converts 0xc1200000 to -10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-1054867456);
      expect(result).assertEqual(-10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1000
     * @tc.name testBitCastFromInt010
     * @tc.desc Verify Float.bitCastFromInt converts 0x3f000000 to 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1056964608);
      expect(result).assertEqual(0.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1100
     * @tc.name testBitCastFromInt011
     * @tc.desc Verify Float.bitCastFromInt converts 0xbf000000 to -0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-1090519040);
      expect(result).assertEqual(-0.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1200
     * @tc.name testBitCastFromInt012
     * @tc.desc Verify Float.bitCastFromInt converts 0x7f800000 to +Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(2139095040);
      expect(!Float.isFinite(result)).assertTrue();
      expect(result > 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1300
     * @tc.name testBitCastFromInt013
     * @tc.desc Verify Float.bitCastFromInt converts 0xff800000 to -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-8388608);
      expect(!Float.isFinite(result)).assertTrue();
      expect(result < 0.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1400
     * @tc.name testBitCastFromInt014
     * @tc.desc Verify Float.bitCastFromInt converts 0x7fc00000 to NaN (quiet NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(2143289344);
      let isNaNResult: boolean = Float.isNaN(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1500
     * @tc.name testBitCastFromInt015
     * @tc.desc Verify Float.bitCastFromInt converts 0x7f800001 to NaN (signaling NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(2139095041);
      let isNaNResult2: boolean = Float.isNaN(result);
      expect(isNaNResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1600
     * @tc.name testBitCastFromInt016
     * @tc.desc Verify Float.bitCastFromInt converts 0xffc00000 to NaN (negative quiet NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-4194304);
      let isNaNResult3: boolean = Float.isNaN(result);
      expect(isNaNResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1700
     * @tc.name testBitCastFromInt017
     * @tc.desc Verify Float.bitCastFromInt converts 0x7fe00000 to NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x7fe00000 as int);
      let isNaNResult4: boolean = Float.isNaN(result);
      expect(isNaNResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1800
     * @tc.name testBitCastFromInt018
     * @tc.desc Verify Float.bitCastFromInt converts 0x00800000 to Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(8388608);
      expect(result).assertClose(1.17549435e-38f, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_1900
     * @tc.name testBitCastFromInt019
     * @tc.desc Verify Float.bitCastFromInt converts 0x00000001 to smallest positive subnormal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x00000001 as int);
      expect(result > 0.0f).assertTrue();
      expect(result <= Float.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2000
     * @tc.name testBitCastFromInt020
     * @tc.desc Verify Float.bitCastFromInt converts 0x007fffff to max subnormal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x007fffff as int);
      expect(result > 0.0f).assertTrue();
      expect(result < 1.17549435e-38f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2100
     * @tc.name testBitCastFromInt021
     * @tc.desc Verify Float.bitCastFromInt converts 0x7f7fffff to Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(2139095039);
      expect(result).assertClose(Float.MAX_VALUE, Float.EPSILON * 10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2200
     * @tc.name testBitCastFromInt022
     * @tc.desc Verify Float.bitCastFromInt converts 0x80800000 to -Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-2139095040);
      expect(Math.abs(result + Float.MIN_VALUE) < Float.EPSILON * 10.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2300
     * @tc.name testBitCastFromInt023
     * @tc.desc Verify Float.bitCastFromInt converts 0xff7fffff to -Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-8388609);
      expect(Math.abs(result + Float.MAX_VALUE) < Float.EPSILON * 10.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2400
     * @tc.name testBitCastFromInt024
     * @tc.desc Verify Float.bitCastFromInt converts 0x80000001 to max negative subnormal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-2147483647);
      expect(result < 0.0f).assertTrue();
      expect(result >= -Float.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2500
     * @tc.name testBitCastFromInt025
     * @tc.desc Verify Float.bitCastFromInt converts 0x01000000 to a subnormal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x01000000 as int);
      expect(result > 0.0f).assertTrue();
      expect(result > Float.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2600
     * @tc.name testBitCastFromInt026
     * @tc.desc Verify Float.bitCastFromInt converts 0x00400000 to a subnormal float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x00400000 as int);
      expect(result > 0.0f).assertTrue();
      expect(result > Float.MIN_VALUE).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2700
     * @tc.name testBitCastFromInt027
     * @tc.desc Verify Float.bitCastToInt distinguishes +0.0f from -0.0f via bitCastFromInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posZeroBits: int = Float.bitCastToInt(Float.bitCastFromInt(0));
      let negZeroBits: int = Float.bitCastToInt(Float.bitCastFromInt(-2147483648));
      let isDistinctBits: boolean = posZeroBits !== negZeroBits;
      expect(isDistinctBits).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2800
     * @tc.name testBitCastFromInt028
     * @tc.desc Verify Float.bitCastFromInt(bitCastToInt(1.0f)) reverse round-trip restores 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(1.0f));
      expect(result).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_2900
     * @tc.name testBitCastFromInt029
     * @tc.desc Verify Float.bitCastFromInt(bitCastToInt(-10.0f)) reverse round-trip restores -10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(-10.0f));
      expect(result).assertEqual(-10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3000
     * @tc.name testBitCastFromInt030
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(1065353216));
      expect(bits).assertEqual(1065353216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3100
     * @tc.name testBitCastFromInt031
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for 2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(1073741824));
      expect(bits).assertEqual(1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3200
     * @tc.name testBitCastFromInt032
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for +0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(0));
      expect(bits).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3300
     * @tc.name testBitCastFromInt033
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(-2147483648));
      expect(bits).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3400
     * @tc.name testBitCastFromInt034
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for +Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(2139095040));
      expect(bits).assertEqual(2139095040);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3500
     * @tc.name testBitCastFromInt035
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(-8388608));
      expect(bits).assertEqual(-8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3600
     * @tc.name testBitCastFromInt036
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for quiet NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(2143289344));
      expect(bits).assertEqual(2143289344);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3700
     * @tc.name testBitCastFromInt037
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(2139095039));
      expect(bits).assertEqual(2139095039);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3800
     * @tc.name testBitCastFromInt038
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(8388608));
      expect(bits).assertEqual(8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_3900
     * @tc.name testBitCastFromInt039
     * @tc.desc Verify Float.bitCastFromInt round-trip with bitCastToInt for smallest subnormal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.bitCastFromInt(0x00000001 as int));
      expect(bits).assertEqual(0x00000001 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4000
     * @tc.name testBitCastFromInt040
     * @tc.desc Verify Float.bitCastFromInt is bit reinterpretation not numeric conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1065353216);
      expect(result).assertEqual(1.0f);
      let isNotNumericEqual: boolean = result !== 1065353216.0f;
      expect(isNotNumericEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4100
     * @tc.name testBitCastFromInt041
     * @tc.desc Verify Float.bitCastFromInt(1) is not 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(1);
      let isNotOneFloat: boolean = result !== 1.0f;
      expect(isNotOneFloat).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4200
     * @tc.name testBitCastFromInt042
     * @tc.desc Verify Float.bitCastFromInt converts 0x3f800001 to slightly above 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x3f800001 as int);
      expect(result > 1.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4300
     * @tc.name testBitCastFromInt043
     * @tc.desc Verify Float.bitCastFromInt converts 0x3f7fffff to slightly below 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x3f7fffff as int);
      expect(result < 1.0f).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4400
     * @tc.name testBitCastFromInt044
     * @tc.desc Verify Float.bitCastFromInt converts 0x7fffffff (all mantissa bits 1) to NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(0x7fffffff as int);
      let isNaNResult5: boolean = Float.isNaN(result);
      expect(isNaNResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4500
     * @tc.name testBitCastFromInt045
     * @tc.desc Verify Float.bitCastFromInt converts 0xffffffff to NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(-1);
      let isNaNResult6: boolean = Float.isNaN(result);
      expect(isNaNResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTFROMINT_4600
     * @tc.name testBitCastFromInt046
     * @tc.desc Verify Float.bitCastFromInt(bitCastToInt(Float.MAX_VALUE)) reverse round-trip
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastFromInt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(Float.MAX_VALUE));
      expect(result).assertClose(Float.MAX_VALUE, Float.EPSILON * 10.0f);
    });
  });
}
