'use static'

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

export default function FloatIsNaN1Test2(): void {
  describe('FloatIsNaN1Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0100
     * @tc.name testFloatIsNaNStatic001
     * @tc.desc Verify Float.isNaN(int 1) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 1;
      expect(Float.isNaN(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0200
     * @tc.name testFloatIsNaNStatic002
     * @tc.desc Verify Float.isNaN(int -2147483648) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      expect(Float.isNaN(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0300
     * @tc.name testFloatIsNaNStatic003
     * @tc.desc Verify Float.isNaN(long 100) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.isNaN(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0400
     * @tc.name testFloatIsNaNStatic004
     * @tc.desc Verify Float.isNaN(float 4.0f) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      expect(Float.isNaN(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0500
     * @tc.name testFloatIsNaNStatic005
     * @tc.desc Verify Float.isNaN(float 1.0e3f) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      expect(Float.isNaN(val)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0600
     * @tc.name testFloatIsNaNStatic006
     * @tc.desc Verify Float.isNaN idempotency: multiple calls with float value NaN return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = Float.isNaN(Float.NaN);
      const r2: boolean = Float.isNaN(Float.NaN);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0700
     * @tc.name testFloatIsNaNStatic007
     * @tc.desc Verify Float.isNaN(short -32768) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = -32768 as short;
      const r: boolean = Float.isNaN(val);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0800
     * @tc.name testFloatIsNaNStatic008
     * @tc.desc Verify Float.isNaN(byte 12) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 12 as byte;
      const r: boolean = Float.isNaN(val);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_0900
     * @tc.name testFloatIsNaNStatic009
     * @tc.desc Verify Float.isNaN(byte -128) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = -128 as byte;
      const r: boolean = Float.isNaN(val);
      expect(r).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1000
     * @tc.name testFloatIsNaNStatic010
     * @tc.desc Verify Float.isNaN(float Float.POSITIVE_INFINITY / Float.POSITIVE_INFINITY) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY / Float.POSITIVE_INFINITY;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1100
     * @tc.name testFloatIsNaNStatic011
     * @tc.desc Verify Float.isNaN(float Float.NEGATIVE_INFINITY / Float.POSITIVE_INFINITY) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY / Float.POSITIVE_INFINITY;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1200
     * @tc.name testFloatIsNaNStatic012
     * @tc.desc Verify Float.isNaN(float Float.NaN * 1.0f) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN * 1.0f;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1300
     * @tc.name testFloatIsNaNStatic013
     * @tc.desc Verify Float.isNaN(float Float.NaN / 1.0f) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN / 1.0f;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1400
     * @tc.name testFloatIsNaNStatic014
     * @tc.desc Verify Float.isNaN(float 0.0f * Float.POSITIVE_INFINITY) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.0f * Float.POSITIVE_INFINITY;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1500
     * @tc.name testFloatIsNaNStatic015
     * @tc.desc Verify Float.isNaN(float -0.0f * Float.POSITIVE_INFINITY) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f * Float.POSITIVE_INFINITY;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1600
     * @tc.name testFloatIsNaNStatic016
     * @tc.desc Verify Float.isNaN(float Float.MIN_VALUE / 2.0f) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MIN_VALUE / 2.0f;
      const result: boolean = Float.isNaN(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1700
     * @tc.name testFloatIsNaNStatic017
     * @tc.desc Verify Float.isNaN(float -Float.MIN_VALUE / 2.0f) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MIN_VALUE / 2.0f;
      const result: boolean = Float.isNaN(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1800
     * @tc.name testFloatIsNaNStatic018
     * @tc.desc Verify static Float.isNaN matches instance isNaN() for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isNaN(Float.NaN);
      const instanceResult: boolean = new Float(Float.NaN).isNaN();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_1900
     * @tc.name testFloatIsNaNStatic019
     * @tc.desc Verify static Float.isNaN matches instance isNaN() for 3.14f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isNaN(3.14f);
      const instanceResult: boolean = new Float(3.14f).isNaN();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2000
     * @tc.name testFloatIsNaNStatic020
     * @tc.desc Verify Float.isNaN(Float.NaN) is NaN (static)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(Float.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2100
     * @tc.name testFloatIsNaNStatic021
     * @tc.desc Verify Float.isNaN(0.0f) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(0.0f)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2200
     * @tc.name testFloatIsNaNStatic022
     * @tc.desc Verify Float.isNaN(-0.0f) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(-0.0f)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2300
     * @tc.name testFloatIsNaNStatic023
     * @tc.desc Verify Float.isNaN(Float.POSITIVE_INFINITY) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(Float.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2400
     * @tc.name testFloatIsNaNStatic024
     * @tc.desc Verify Float.isNaN(Float.NEGATIVE_INFINITY) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(Float.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2500
     * @tc.name testFloatIsNaNStatic025
     * @tc.desc Verify Float.isNaN(Float.MAX_VALUE) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(Float.MAX_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2600
     * @tc.name testFloatIsNaNStatic026
     * @tc.desc Verify Float.isNaN(Float.MIN_VALUE) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isNaN(Float.MIN_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2700
     * @tc.name testFloatIsNaNStatic027
     * @tc.desc Verify Float.isNaN(Float.NaN) is NaN for nanVal (static)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanVal: float = Float.NaN;
      expect(nanVal).not().assertEqual(nanVal);
      expect(Float.isNaN(nanVal)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2800
     * @tc.name testFloatIsNaNStatic028
     * @tc.desc Verify Float.isNaN(Float.EPSILON) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(Float.EPSILON);
      expect(result).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_2900
     * @tc.name testFloatIsNaNStatic029
     * @tc.desc Verify chained not then assertNull() is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | null = Float.NaN;
      expect(val).not().assertNull();
      const result: boolean = Float.isNaN(val!);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3000
     * @tc.name testFloatIsNaNStatic030
     * @tc.desc Verify Float.isNaN(float Float.MAX_VALUE - Float.MAX_VALUE) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE - Float.MAX_VALUE;
      const result: boolean = Float.isNaN(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3100
     * @tc.name testFloatIsNaNStatic031
     * @tc.desc Verify Float.isNaN(2147483647) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(2147483647 as int);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3200
     * @tc.name testFloatIsNaNStatic032
     * @tc.desc Verify Float.isNaN(-2147483648) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(-2147483648 as int);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3300
     * @tc.name testFloatIsNaNStatic033
     * @tc.desc Verify Float.isNaN(127) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(127 as byte);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3400
     * @tc.name testFloatIsNaNStatic034
     * @tc.desc Verify Float.isNaN(-128) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(-128 as byte);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3500
     * @tc.name testFloatIsNaNStatic035
     * @tc.desc Verify Float.isNaN(32767) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(32767 as short);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3600
     * @tc.name testFloatIsNaNStatic036
     * @tc.desc Verify Float.isNaN(-32768) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(-32768 as short);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3700
     * @tc.name testFloatIsNaNStatic037
     * @tc.desc Verify Float.isNaN(Float.bitCastFromInt(0x3f800000) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(Float.bitCastFromInt(0x3f800000));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3800
     * @tc.name testFloatIsNaNStatic038
     * @tc.desc Verify Float.isNaN(Float.bitCastFromInt(0x7f800000)) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.bitCastFromInt(0x7f800000);
      const result: boolean = Float.isNaN(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_3900
     * @tc.name testFloatIsNaNStatic039
     * @tc.desc Verify Float.isNaN(float Float.NEGATIVE_INFINITY - Float.NEGATIVE_INFINITY) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY - Float.NEGATIVE_INFINITY;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_4000
     * @tc.name testFloatIsNaNStatic040
     * @tc.desc Verify Float.isNaN(float Float.NEGATIVE_INFINITY * 0.0f) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY * 0.0f;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_4100
     * @tc.name testFloatIsNaNStatic041
     * @tc.desc Verify Float.isNaN(float Float.NEGATIVE_INFINITY / Float.NEGATIVE_INFINITY) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NEGATIVE_INFINITY / Float.NEGATIVE_INFINITY;
      const result: boolean = Float.isNaN(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_4200
     * @tc.name testFloatIsNaNStatic042
     * @tc.desc Verify consistency: Float.isNaN and instance isNaN return the same result for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isNaN(Float.DELTA);
      const instanceResult: boolean = new Float(Float.DELTA).isNaN();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_4300
     * @tc.name testFloatIsNaNStatic043
     * @tc.desc Verify consistency: Float.isNaN and instance isNaN return the same result for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = Float.isNaN(-0.0f);
      const val: float = new Float(-0.0f)
      const instanceResult: boolean = val.isNaN();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_4400
     * @tc.name testFloatIsNaNStatic044
     * @tc.desc Verify Float.isNaN(float Float.MAX_SAFE_INTEGER) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(Float.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISNAN_STATIC_ONE_4500
     * @tc.name testFloatIsNaNStatic045
     * @tc.desc Verify Float.isNaN(float -Float.MAX_SAFE_INTEGER) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsNaNStatic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.isNaN(-Float.MAX_SAFE_INTEGER);
      expect(result).assertFalse();
    });

  })
}