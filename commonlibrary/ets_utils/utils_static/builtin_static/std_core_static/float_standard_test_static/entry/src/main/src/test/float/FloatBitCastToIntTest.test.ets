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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function FloatBitCastToIntTest(): void {
  describe('FloatBitCastToIntTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0100
     * @tc.name testBitCastToInt001
     * @tc.desc Verify Float.bitCastToInt converts 1.0f to 0x3f800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(1.0f);
      expect(bits).assertEqual(1065353216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0200
     * @tc.name testBitCastToInt002
     * @tc.desc Verify Float.bitCastToInt converts 2.0f to 0x40000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(2.0f);
      expect(bits).assertEqual(1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0300
     * @tc.name testBitCastToInt003
     * @tc.desc Verify Float.bitCastToInt converts -1.0f to 0xbf800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(-1.0f);
      expect(bits).assertEqual(-1082130432);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0400
     * @tc.name testBitCastToInt004
     * @tc.desc Verify Float.bitCastToInt converts 0.5f to 0x3f000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(0.5f);
      expect(bits).assertEqual(1056964608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0500
     * @tc.name testBitCastToInt005
     * @tc.desc Verify Float.bitCastToInt converts 0.0f to 0x00000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(0.0f);
      expect(bits).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0600
     * @tc.name testBitCastToInt006
     * @tc.desc Verify Float.bitCastToInt converts -0.0f to 0x80000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(-0.0f);
      expect(bits).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0700
     * @tc.name testBitCastToInt007
     * @tc.desc Verify Float.bitCastToInt converts Float.POSITIVE_INFINITY to 0x7f800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.POSITIVE_INFINITY);
      expect(bits).assertEqual(2139095040);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0800
     * @tc.name testBitCastToInt008
     * @tc.desc Verify Float.bitCastToInt converts Float.NEGATIVE_INFINITY to 0xff800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.NEGATIVE_INFINITY);
      expect(bits).assertEqual(-8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_0900
     * @tc.name testBitCastToInt009
     * @tc.desc Verify Float.bitCastToInt converts Float.NaN to 0x7fc00000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.NaN);
      expect(bits).assertEqual(2143289344);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1000
     * @tc.name testBitCastToInt010
     * @tc.desc Verify Float.bitCastToInt converts Float.MIN_VALUE to 0x00000001
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.MIN_VALUE);
      expect(bits).assertEqual(0x00000001 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1100
     * @tc.name testBitCastToInt011
     * @tc.desc Verify Float.bitCastToInt converts Float.MAX_VALUE to 0x7f7fffff
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(Float.MAX_VALUE);
      expect(bits).assertEqual(2139095039);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1200
     * @tc.name testBitCastToInt012
     * @tc.desc Verify Float.bitCastToInt converts -Float.MAX_VALUE to 0xff7fffff
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(-Float.MAX_VALUE);
      expect(bits).assertEqual(-8388609);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1300
     * @tc.name testBitCastToInt013
     * @tc.desc Verify Float.bitCastToInt return value is not equal to the float value (bit reinterpretation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bits: int = Float.bitCastToInt(1.0f);
      let isNotNumericEqual: boolean = bits !== 1;
      expect(isNotNumericEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1400
     * @tc.name testBitCastToInt014
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) === x for positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(1.0f));
      expect(result).assertClose(1.0f, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1500
     * @tc.name testBitCastToInt015
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(-1.0f));
      expect(result).assertClose(-1.0f, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1600
     * @tc.name testBitCastToInt016
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(0.0f));
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1700
     * @tc.name testBitCastToInt017
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(-0.0f));
      expect(result).assertEqual(0.0f);
      let isNegativeZero: boolean = (1.0f / result) == Float.NEGATIVE_INFINITY;
      expect(isNegativeZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1800
     * @tc.name testBitCastToInt018
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(Float.POSITIVE_INFINITY));
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_1900
     * @tc.name testBitCastToInt019
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(Float.NEGATIVE_INFINITY));
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2000
     * @tc.name testBitCastToInt020
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(Float.NaN));
      let isNaNResult: boolean = Float.isNaN(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2100
     * @tc.name testBitCastToInt021
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(Float.MIN_VALUE));
      expect(result).assertClose(Float.MIN_VALUE, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_BITCASTTOINT_2200
     * @tc.name testBitCastToInt022
     * @tc.desc Verify round-trip bitCastFromInt(bitCastToInt(x)) for Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBitCastToInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: float = Float.bitCastFromInt(Float.bitCastToInt(Float.MAX_VALUE));
      expect(result).assertClose(Float.MAX_VALUE, Float.EPSILON * 10.0f);
    });

  });
}
