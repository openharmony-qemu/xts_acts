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

export default function FloatConstantsTest2(): void {
  describe('FloatConstantsTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0100
     * @tc.name testFloatStaticConstants001
     * @tc.desc Verify Float static constant MIN_VALUE: value is positive and equals itself, confirming the constant is well-defined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Float.MIN_VALUE;
      expect(minVal).assertLarger(0.0);
      expect(minVal).assertLess(Float.DELTA);
      expect(Float.bitCastToInt(minVal)).assertEqual(0x00000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0200
     * @tc.name testFloatStaticConstants002
     * @tc.desc Verify Float static constant MAX_VALUE equals 3.4028234663852886e38
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: float = Float.MAX_VALUE;
      expect(maxVal).assertLarger(0.0);
      expect(isFinite(maxVal)).assertTrue();
      expect(maxVal).assertEqual(3.4028234663852886e38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0300
     * @tc.name testFloatStaticConstants003
     * @tc.desc Verify Float static constant MAX_VALUE, POSITIVE_INFINITY equals posInf
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: float = Float.MAX_VALUE;
      const posInf: float = Float.POSITIVE_INFINITY;
      expect(maxVal).not().assertEqual(posInf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0400
     * @tc.name testFloatStaticConstants004
     * @tc.desc Verify Float.BIT_SIZE equals Float.BYTE_SIZE times 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bitSize: int = Float.BIT_SIZE;
      const byteSize: int = Float.BYTE_SIZE;
      expect(bitSize).assertEqual(byteSize * 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0500
     * @tc.name testFloatStaticConstants005
     * @tc.desc Verify Float static constant NaN equals 0x7FC00000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanVal: float = Float.NaN;
      expect(isNaN(nanVal)).assertTrue();
      expect(Float.bitCastToInt(nanVal)).assertEqual(0x7FC00000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0600
     * @tc.name testFloatStaticConstants006
     * @tc.desc Verify NEGATIVE_INFINITY is less than -MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: float = Float.NEGATIVE_INFINITY;
      const negMax: float = -Float.MAX_VALUE;
      expect(negInf).assertLess(negMax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0700
     * @tc.name testFloatStaticConstants007
     * @tc.desc Verify Float.DELTA equals Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const delta: float = Float.DELTA;
      const epsilon: float = Float.EPSILON;
      expect(delta).assertEqual(epsilon);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0800
     * @tc.name testFloatStaticConstants008
     * @tc.desc Verify Float static constant NaN is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanVal: float = Float.NaN;
      const result: float = nanVal + 5.0f;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_0900
     * @tc.name testFloatStaticConstants009
     * @tc.desc Verify POSITIVE_INFINITY plus 1.0e30f stays POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInf: float = Float.POSITIVE_INFINITY;
      const result: float = posInf + 1.0e30f;
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1000
     * @tc.name testFloatStaticConstants010
     * @tc.desc Verify 1.0f divided by 0.0f equals POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = 1.0f / 0.0f;
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1100
     * @tc.name testFloatStaticConstants011
     * @tc.desc Verify -1.0f divided by 0.0f equals NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = -1.0f / 0.0f;
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1200
     * @tc.name testFloatStaticConstants012
     * @tc.desc Verify Float static constant: 0.0f / 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = 0.0f / 0.0f;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1300
     * @tc.name testFloatStaticConstants013
     * @tc.desc Verify POSITIVE_INFINITY minus POSITIVE_INFINITY is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInf: float = Float.POSITIVE_INFINITY;
      const result: float = posInf - posInf;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1400
     * @tc.name testFloatStaticConstants014
     * @tc.desc Verify Float.MIN_VALUE divided by itself approximates 1.0 within EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Float.MIN_VALUE;
      const result: float = minVal / minVal;
      expect(result).assertClose(1.0, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1500
     * @tc.name testFloatStaticConstants015
     * @tc.desc Verify MAX_VALUE divided by itself approximates 1.0 within EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: float = Float.MAX_VALUE;
      const result: float = maxVal / maxVal;
      expect(result).assertClose(1.0, Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1600
     * @tc.name testFloatStaticConstants016
     * @tc.desc Verify Float static constant MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafe: float = Float.MAX_SAFE_INTEGER as float;
      const result: float = maxSafe + 1.0f;
      expect(Float.isSafeInteger(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1700
     * @tc.name testFloatStaticConstants017
     * @tc.desc Verify 1.0f plus DELTA is within DELTA of 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const delta: float = Float.DELTA;
      const a: float = 1.0f;
      const b: float = 1.0f + delta;
      expect(Float.compare(a, b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1800
     * @tc.name testFloatStaticConstants018
     * @tc.desc Verify -2.0f is larger than Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negHex: float = -2.0f;
      const negInf: float = Float.NEGATIVE_INFINITY;
      expect(negHex).assertLarger(negInf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_1900
     * @tc.name testFloatStaticConstants019
     * @tc.desc Verify 1.0e-40f is larger than or equal to Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tiny: float = 1.0e-40f;
      const minVal: float = Float.MIN_VALUE;
      expect(tiny).assertLargerOrEqual(minVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2000
     * @tc.name testFloatStaticConstants020
     * @tc.desc Verify Float static constant MAX_VALUE equals v1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue: float = Float.MAX_VALUE;
      expect(Float.MAX_VALUE).assertLarger(0.0f);
      expect(Float.MAX_VALUE).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2100
     * @tc.name testFloatStaticConstants021
     * @tc.desc Verify Float.MIN_VALUE divided by 2.0f equals 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MIN_VALUE / 2.0f;
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2200
     * @tc.name testFloatStaticConstants022
     * @tc.desc Verify Float.MIN_VALUE times 0.25f underflows to 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MIN_VALUE * 0.25f;
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2300
     * @tc.name testFloatStaticConstants023
     * @tc.desc Verify Float.MIN_VALUE minus itself equals 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MIN_VALUE - Float.MIN_VALUE;
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2400
     * @tc.name testFloatStaticConstants024
     * @tc.desc Verify 1.0f divided by Float.MIN_VALUE equals POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = 1.0f / Float.MIN_VALUE;
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2500
     * @tc.name testFloatStaticConstants025
     * @tc.desc Verify -1.0f divided by Float.MIN_VALUE equals NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = -1.0f / Float.MIN_VALUE;
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2600
     * @tc.name testFloatStaticConstants026
     * @tc.desc Verify Float.MAX_VALUE divided by 2.0f is finite and positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE / 2.0f;
      expect(isFinite(result)).assertTrue();
      expect(result).assertLarger(0.0f);
      expect(result).assertLess(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2700
     * @tc.name testFloatStaticConstants027
     * @tc.desc Verify Float.MAX_VALUE times 0.5f is finite and less than MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE * 0.5f;
      expect(isFinite(result)).assertTrue();
      expect(result).assertLess(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2800
     * @tc.name testFloatStaticConstants028
     * @tc.desc Verify MAX_VALUE multiplied by 1.0001f overflows to Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE * 1.0001f;
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_2900
     * @tc.name testFloatStaticConstants029
     * @tc.desc Verify Float.MAX_VALUE minus itself equals 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE - Float.MAX_VALUE;
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3000
     * @tc.name testFloatStaticConstants030
     * @tc.desc Verify half of Float.MAX_SAFE_INTEGER is not a safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER as float;
      const half: float = val / 2.0f;
      expect(Float.isSafeInteger(half)).assertFalse();
      expect(Float.isInteger(half)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3100
     * @tc.name testFloatStaticConstants031
     * @tc.desc Verify doubled Float.MAX_SAFE_INTEGER is not a safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER as float;
      const doubled: float = val * 2.0f;
      expect(Float.isSafeInteger(doubled)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3200
     * @tc.name testFloatStaticConstants032
     * @tc.desc Verify Float.MAX_SAFE_INTEGER minus 1.0f is a safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER as float;
      const result: float = val - 1.0f;
      expect(Float.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3300
     * @tc.name testFloatStaticConstants033
     * @tc.desc Verify negative Float.MAX_SAFE_INTEGER plus 1.0f is a safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negMaxSafe: float = -(Float.MAX_SAFE_INTEGER as float);
      const result: float = negMaxSafe + 1.0f;
      expect(Float.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3400
     * @tc.name testFloatStaticConstants034
     * @tc.desc Verify negative Float.MAX_SAFE_INTEGER minus 1.0f is not a safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negMaxSafe: float = -(Float.MAX_SAFE_INTEGER as float);
      const result: float = negMaxSafe - 1.0f;
      expect(Float.isSafeInteger(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3500
     * @tc.name testFloatStaticConstants035
     * @tc.desc Verify Float.MAX_SAFE_INTEGER is both safe integer and integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_SAFE_INTEGER as float;
      expect(Float.isSafeInteger(val)).assertTrue();
      expect(Float.isInteger(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3600
     * @tc.name testFloatStaticConstants036
     * @tc.desc Verify Float.PRECISION is less than or equal to BIT_SIZE minus 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precision: int = Float.PRECISION;
      const bitSize: int = Float.BIT_SIZE;
      expect(precision).assertLessOrEqual(bitSize - 8);
      expect(precision).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3700
     * @tc.name testFloatStaticConstants037
     * @tc.desc Verify 1.0f plus half of Float.DELTA equals 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const halfDelta: float = Float.DELTA / 2.0f;
      const result: float = 1.0f + halfDelta;
      expect(result).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3800
     * @tc.name testFloatStaticConstants038
     * @tc.desc Verify Float.EPSILON is larger than Float.MIN_VALUE and bit pattern is 0x34000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.EPSILON).assertLarger(Float.MIN_VALUE);
      expect(Float.bitCastToInt(Float.EPSILON)).assertEqual(0x34000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_3900
     * @tc.name testFloatStaticConstants039
     * @tc.desc Verify Float.NaN bit pattern is non-zero and exponent bits equal 0xFF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bitsNaN: int = Float.bitCastToInt(Float.NaN);
      const exponent: int = (bitsNaN >> 23) & 0xFF;
      expect(exponent).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4000
     * @tc.name testFloatStaticConstants040
     * @tc.desc Verify Float static constant: Float.bitCastFromInt(0x3F800000)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = Float.bitCastFromInt(0x3F800000);
      expect(f).assertEqual(1.0f);
      const bits: int = Float.bitCastToInt(f);
      expect(bits).assertEqual(0x3F800000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4100
     * @tc.name testFloatStaticConstants041
     * @tc.desc Verify bitCastFromInt(0x7F800000) equals POSITIVE_INFINITY and bitCastToInt round-trips
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = Float.bitCastFromInt(0x7F800000);
      expect(Float.isFinite(f)).assertFalse();
      expect(Float.isNaN(f)).assertFalse();
      const bits: int = Float.bitCastToInt(f);
      expect(bits).assertEqual(0x7F800000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4200
     * @tc.name testFloatStaticConstants042
     * @tc.desc Verify bitCastFromInt(-8388608) equals NEGATIVE_INFINITY and bitCastToInt round-trips
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = Float.bitCastFromInt(-8388608);
      expect(Float.isFinite(f)).assertFalse();
      expect(Float.isNaN(f)).assertFalse();
      const bits: int = Float.bitCastToInt(f);
      expect(bits).assertEqual(-8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4300
     * @tc.name testFloatStaticConstants043
     * @tc.desc Verify Float.compare(DELTA, EPSILON) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cmp: boolean = Float.compare(Float.DELTA, Float.EPSILON);
      expect(cmp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4400
     * @tc.name testFloatStaticConstants044
     * @tc.desc Verify Float.compare(MIN_VALUE, 0.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cmp: boolean = Float.compare(Float.MIN_VALUE, 0.0f);
      expect(cmp).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4500
     * @tc.name testFloatStaticConstants045
     * @tc.desc Verify Float.compare(MIN_VALUE, MIN_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.compare(Float.MIN_VALUE, Float.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4600
     * @tc.name testFloatStaticConstants046
     * @tc.desc Verify Float.compare(MAX_VALUE, MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.compare(Float.MAX_VALUE, Float.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4700
     * @tc.name testFloatStaticConstants047
     * @tc.desc Verify Float.compare(POSITIVE_INFINITY, POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.compare(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4800
     * @tc.name testFloatStaticConstants048
     * @tc.desc Verify Float.compare(NEGATIVE_INFINITY, NEGATIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.compare(Float.NEGATIVE_INFINITY, Float.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_4900
     * @tc.name testFloatStaticConstants049
     * @tc.desc Verify Float.compare(DELTA, DELTA) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.compare(Float.DELTA, Float.DELTA)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5000
     * @tc.name testFloatStaticConstants050
     * @tc.desc Verify Float.compare(EPSILON, EPSILON) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.compare(Float.EPSILON, Float.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5100
     * @tc.name testFloatStaticConstants051
     * @tc.desc Verify new Float(Float.NaN).toFloat() is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      const result: float = f.toFloat();
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5200
     * @tc.name testFloatStaticConstants052
     * @tc.desc Verify new Float(POSITIVE_INFINITY).toFloat() equals POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.POSITIVE_INFINITY);
      const result: float = f.toFloat();
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5300
     * @tc.name testFloatStaticConstants053
     * @tc.desc Verify new Float(NEGATIVE_INFINITY).toFloat() equals NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: float = f.toFloat();
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5400
     * @tc.name testFloatStaticConstants054
     * @tc.desc Verify new Float(MAX_SAFE_INTEGER).toFloat() equals MAX_SAFE_INTEGER as float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: float = f.toFloat();
      expect(result).assertEqual(Float.MAX_SAFE_INTEGER as float);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5500
     * @tc.name testFloatStaticConstants055
     * @tc.desc Verify Float.toDouble(Float.MIN_VALUE) equals 1.401298464324817e-45
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Float.toDouble(Float.MIN_VALUE);
      expect(result).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5600
     * @tc.name testFloatStaticConstants056
     * @tc.desc Verify Float.toInt(MAX_SAFE_INTEGER) equals 16777215
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = Float.toInt(Float.MAX_SAFE_INTEGER);
      expect(result).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5700
     * @tc.name testFloatStaticConstants057
     * @tc.desc Verify Float static constant MAX_SAFE_INTEGER equals 16777215 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(Float.MAX_SAFE_INTEGER);
      expect(result).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5800
     * @tc.name testFloatStaticConstants058
     * @tc.desc Verify Float.MAX_VALUE times 0.0f equals 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE * 0.0f;
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_5900
     * @tc.name testFloatStaticConstants059
     * @tc.desc Verify Float.MAX_VALUE divided by 0.5f equals POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE / 0.5f;
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6000
     * @tc.name testFloatStaticConstants060
     * @tc.desc Verify Float static constant MIN_VALUE, MAX_VALUE equaling Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MAX_VALUE + Float.MIN_VALUE;
      expect(result).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6100
     * @tc.name testFloatStaticConstants061
     * @tc.desc Verify Float static constant MIN_VALUE equals product
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: float = Float.MIN_VALUE + Float.MIN_VALUE;
      const product: float = Float.MIN_VALUE * 2.0f;
      expect(sum).assertEqual(product);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6200
     * @tc.name testFloatStaticConstants062
     * @tc.desc Verify Float static constant MIN_VALUE, MAX_VALUE via assertLarger
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.MIN_VALUE * Float.MAX_VALUE;
      expect(isFinite(result)).assertTrue();
      expect(result).assertLarger(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6300
     * @tc.name testFloatStaticConstants063
     * @tc.desc Verify POSITIVE_INFINITY times 0.0f is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.POSITIVE_INFINITY * 0.0f;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6400
     * @tc.name testFloatStaticConstants064
     * @tc.desc Verify POSITIVE_INFINITY divided by POSITIVE_INFINITY is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.POSITIVE_INFINITY / Float.POSITIVE_INFINITY;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6500
     * @tc.name testFloatStaticConstants065
     * @tc.desc Verify POSITIVE_INFINITY divided by 2.0f equals POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.POSITIVE_INFINITY / 2.0f;
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6600
     * @tc.name testFloatStaticConstants066
     * @tc.desc Verify Float.isInteger(Float.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isInteger(Float.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6700
     * @tc.name testFloatStaticConstants067
     * @tc.desc Verify Float.isInteger(Float.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isInteger(Float.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6800
     * @tc.name testFloatStaticConstants068
     * @tc.desc Verify Float.isSafeInteger(Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isSafeInteger(Float.MAX_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_6900
     * @tc.name testFloatStaticConstants069
     * @tc.desc Verify Float.isSafeInteger(Float.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.isSafeInteger(Float.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7000
     * @tc.name testFloatStaticConstants070
     * @tc.desc Verify isFinite(Float.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isFinite(Float.MAX_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7100
     * @tc.name testFloatStaticConstants071
     * @tc.desc Verify isFinite(Float.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isFinite(Float.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7200
     * @tc.name testFloatStaticConstants072
     * @tc.desc Verify isNaN(Float.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isNaN(Float.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7300
     * @tc.name testFloatStaticConstants073
     * @tc.desc Verify isNaN(Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isNaN(Float.MAX_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7400
     * @tc.name testFloatStaticConstants074
     * @tc.desc Verify -Float.MAX_VALUE is less than -Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Float.MAX_VALUE).assertLess(-Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7500
     * @tc.name testFloatStaticConstants075
     * @tc.desc Verify Float.PRECISION is larger than Float.BYTE_SIZE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.PRECISION).assertLarger(Float.BYTE_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7600
     * @tc.name testFloatStaticConstants076
     * @tc.desc Verify Float.BIT_SIZE is larger than Float.PRECISION
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.BIT_SIZE).assertLarger(Float.PRECISION);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7700
     * @tc.name testFloatStaticConstants077
     * @tc.desc Verify POSITIVE_INFINITY plus NEGATIVE_INFINITY is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Float.POSITIVE_INFINITY + Float.NEGATIVE_INFINITY;
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7800
     * @tc.name testFloatStaticConstants078
     * @tc.desc Verify -Float.POSITIVE_INFINITY equals NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Float.POSITIVE_INFINITY).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_STATIC_CONSTANTS_7900
     * @tc.name testFloatStaticConstants079
     * @tc.desc Verify -Float.NEGATIVE_INFINITY equals POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatStaticConstants079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-Float.NEGATIVE_INFINITY).assertEqual(Float.POSITIVE_INFINITY);
    });

  });
}