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

export default function FloatToFloat1Test2(): void {
  describe('FloatToFloat1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0100
     * @tc.name testFloatToFloat001
     * @tc.desc Verify toFloat throws ClassCastError when passing int 1 upcast to Object then cast to float as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const val: int = 1;
        Float.toFloat(val as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0200
     * @tc.name testFloatToFloat002
     * @tc.desc Verify toFloat idempotency: multiple calls with float value 42.0 return the same float result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const r1: float = f.toFloat();
      const r2: float = f.toFloat();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0300
     * @tc.name testFloatToFloat003
     * @tc.desc Verify toFloat() on Float(-0.0f) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      const f: Float = new Float(val);
      expect(1.0f / f.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0400
     * @tc.name testFloatToFloat004
     * @tc.desc Verify toFloat() throws ClassCastError when passing {} as Object as float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const valF: float = {} as Object as float;
        const f: Float = new Float(valF);
        f.toFloat();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0500
     * @tc.name testFloatToFloat005
     * @tc.desc Verify toFloat() on Float(Float.MIN_VALUE / 2.0f) returns small float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: float = f.toFloat();
      expect(result).assertLargerOrEqual(0.0f);
      expect(result).assertLess(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0600
     * @tc.name testFloatToFloat006
     * @tc.desc Verify toFloat() on Float(-Float.MIN_VALUE / 2.0f) returns small negative float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MIN_VALUE / 2.0f);
      const result: float = f.toFloat();
      expect(result).assertLessOrEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0700
     * @tc.name testFloatToFloat007
     * @tc.desc Verify toFloat() on Float(3.14) returns approx 3.14f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(3.14).toFloat();
      expect(result).assertClose(3.14f, 0.001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0800
     * @tc.name testFloatToFloat008
     * @tc.desc Verify toFloat idempotency: same input multiple calls return the same float result (5.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: float = new Float(5.0f).toFloat();
      const staticResult: float = Float.toFloat(5.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_0900
     * @tc.name testFloatToFloat009
     * @tc.desc Verify toFloat idempotency: same input multiple calls return the same float result (-3.14f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: float = new Float(-3.14f).toFloat();
      const staticResult: float = Float.toFloat(-3.14f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1000
     * @tc.name testFloatToFloat010
     * @tc.desc Verify toFloat() on Float(10.0f) plus toFloat() on Float(5.0f) equals 15.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = new Float(10.0f).toFloat();
      const b: float = new Float(5.0f).toFloat();
      expect(a + b).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1100
     * @tc.name testFloatToFloat011
     * @tc.desc Verify toFloat() on Float(20.0f) minus toFloat() on Float(8.0f) equals 12.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = new Float(20.0f).toFloat();
      const b: float = new Float(8.0f).toFloat();
      expect(a - b).assertEqual(12.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1200
     * @tc.name testFloatToFloat012
     * @tc.desc Verify toFloat() on Float(7.0f) times toFloat() on Float(6.0f) equals 42.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = new Float(7.0f).toFloat();
      const b: float = new Float(6.0f).toFloat();
      expect(a * b).assertEqual(42.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1300
     * @tc.name testFloatToFloat013
     * @tc.desc Verify toFloat() on Float(30.0f) divided by toFloat() on Float(5.0f) equals 6.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = new Float(30.0f).toFloat();
      const b: float = new Float(5.0f).toFloat();
      expect(a / b).assertEqual(6.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1400
     * @tc.name testFloatToFloat014
     * @tc.desc Verify toFloat() on Float(5.0f) is greater than or equal to 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(5.0f).toFloat();
      expect(result).assertLargerOrEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1500
     * @tc.name testFloatToFloat015
     * @tc.desc Verify toFloat() on Float(1.0f) returns 0x3F800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0f);
      const result: float = f.toFloat();
      const bits: int = Float.bitCastToInt(result);
      expect(bits).assertEqual(0x3F800000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1600
     * @tc.name testFloatToFloat016
     * @tc.desc Verify toFloat() on Float(-1.0f) returns 0xBF800000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.0f);
      const result: float = f.toFloat();
      const bits: int = Float.bitCastToInt(result);
      expect(bits).assertEqual(-1082130432);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1700
     * @tc.name testFloatToFloat017
     * @tc.desc Verify toFloat() on float 42.0f: isFinite returns boolean true, value is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(42.0f).toFloat();
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1800
     * @tc.name testFloatToFloat018
     * @tc.desc Verify toFloat() on float 10.0f: Float.isInteger returns boolean true, value is integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(10.0f).toFloat();
      expect(Float.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_1900
     * @tc.name testFloatToFloat019
     * @tc.desc Verify toFloat() on float 100.0f: Float.isSafeInteger returns boolean true, value is safe integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(100.0f).toFloat();
      expect(Float.isSafeInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2000
     * @tc.name testFloatToFloat020
     * @tc.desc Verify toFloat() on Float(-Float.MAX_SAFE_INTEGER) returns -Float.MAX_SAFE_INTEGER equaling -Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-Float.MAX_SAFE_INTEGER).toFloat();
      expect(result).assertEqual(-Float.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2100
     * @tc.name testFloatToFloat021
     * @tc.desc Verify toFloat() on Float(Float.DELTA) returns Float.DELTA via direct literal equaling Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.DELTA).toFloat();
      expect(result).assertEqual(Float.DELTA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2200
     * @tc.name testFloatToFloat022
     * @tc.desc Verify toFloat() on Float(99.99f) equals toFloat() on another Float(99.99f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(99.99f);
      const f2: Float = new Float(99.99f);
      expect(f1.toFloat()).assertEqual(f2.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2300
     * @tc.name testFloatToFloat023
     * @tc.desc Verify toFloat idempotency: same input multiple calls return the same float result (33.33f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(33.33f);
      const r1: float = f.toFloat();
      const r2: float = f.toFloat();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(33.33f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2400
     * @tc.name testFloatToFloat024
     * @tc.desc Verify toFloat() on Float(3.5f) returns 3.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Float = new Float(3.5f);
      const result: float = original.toFloat();
      const wrapped: Float = new Float(result);
      expect(wrapped.toFloat()).assertEqual(3.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2500
     * @tc.name testFloatToFloat025
     * @tc.desc Verify toFloat() on Float(-7.5f) returns -7.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Float = new Float(-7.5f);
      const result: float = original.toFloat();
      const wrapped: Float = new Float(result);
      expect(wrapped.toFloat()).assertEqual(-7.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2600
     * @tc.name testFloatToFloat026
     * @tc.desc Verify toFloat() on Float(Float.POSITIVE_INFINITY) is larger than Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.POSITIVE_INFINITY).toFloat();
      expect(result).assertLarger(Float.MAX_VALUE);
      expect(isFinite(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2700
     * @tc.name testFloatToFloat027
     * @tc.desc Verify toFloat() on Float(Float.NEGATIVE_INFINITY) is less than -Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.NEGATIVE_INFINITY).toFloat();
      expect(result).assertLess(-Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2800
     * @tc.name testFloatToFloat028
     * @tc.desc Verify toFloat() on Float(2147483647.0f) is larger than 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(2147483647.0f).toFloat();
      expect(result).assertLarger(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_2900
     * @tc.name testFloatToFloat029
     * @tc.desc Verify toFloat() on Float(-2147483648.0f) is less than 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(-2147483648.0f).toFloat();
      expect(result).assertLess(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3000
     * @tc.name testFloatToFloat030
     * @tc.desc Verify toFloat idempotency: same input multiple calls return the same float result (12.34f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(12.34f);
      const first: float = f.toFloat();
      for (let i: int = 0; i < 100; i++) {
        expect(f.toFloat()).assertEqual(first);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3100
     * @tc.name testFloatToFloat031
     * @tc.desc Verify toFloat() on Float(Float.POSITIVE_INFINITY) returns Float.POSITIVE_INFINITY via direct literal equaling Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.POSITIVE_INFINITY).toFloat();
      expect(Float.isFinite(result)).assertFalse();
      expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3200
     * @tc.name testFloatToFloat032
     * @tc.desc Verify toFloat() on Float(Float.NEGATIVE_INFINITY) returns Float.NEGATIVE_INFINITY via direct literal equaling Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = new Float(Float.NEGATIVE_INFINITY).toFloat();
      expect(Float.isFinite(result)).assertFalse(); expect(Float.isNaN(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3300
     * @tc.name testFloatToFloat033
     * @tc.desc Verify toFloat() on Float(2.0f) plus toFloat() on Float(3.0f) equals 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: float = new Float(2.0f).toFloat();
      const y: float = new Float(3.0f).toFloat();
      expect(x + y).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3400
     * @tc.name testFloatToFloat034
     * @tc.desc Verify toFloat() does not modify the original Float(2147483647) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      const result: float = f.toFloat();
      expect(result).assertEqual(2147483600f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3500
     * @tc.name testFloatToFloat035
     * @tc.desc Verify toFloat() does not modify the original Float(-2147483648) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2147483648 as int);
      const result: float = f.toFloat();
      expect(result).assertEqual(-2147483600f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3600
     * @tc.name testFloatToFloat036
     * @tc.desc Verify toFloat() does not modify the original Float(127 as byte) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(127 as byte);
      const result: float = f.toFloat();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3700
     * @tc.name testFloatToFloat037
     * @tc.desc Verify toFloat() does not modify the original Float(-128 as byte) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-128 as byte);
      const result: float = f.toFloat();
      expect(result).assertEqual(-128f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3800
     * @tc.name testFloatToFloat038
     * @tc.desc Verify toFloat() does not modify the original Float(32767 as short) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(32767 as short);
      const result: float = f.toFloat();
      expect(result).assertEqual(32767f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_3900
     * @tc.name testFloatToFloat039
     * @tc.desc Verify toFloat() does not modify the original Float(-32768 as short) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-32768 as short);
      const result: float = f.toFloat();
      expect(result).assertEqual(-32768f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4000
     * @tc.name testFloatToFloat040
     * @tc.desc Verify toFloat() does not modify the original Float(1) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const result: float = f.toFloat();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4100
     * @tc.name testFloatToFloat041
     * @tc.desc Verify toFloat() does not modify the original Float(2) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x40000000));
      const result: float = f.toFloat();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4200
     * @tc.name testFloatToFloat042
     * @tc.desc Verify toFloat() does not modify the original Float(Float.NaN) value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      const result: float = f.toFloat();
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4300
     * @tc.name testFloatToFloat043
     * @tc.desc Verify toFloat() on Float(9999999999999999f) handles precision overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(9999999999999999f);
      const result: float = f.toFloat();
      expect(result).assertEqual(1.0e16f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4400
     * @tc.name testFloatToFloat044
     * @tc.desc Verify instance.toFloat() matches Float.toFloat() for Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(Float.MAX_SAFE_INTEGER).toFloat();
      const staticResult: float = Float.toFloat(Float.MAX_SAFE_INTEGER);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4500
     * @tc.name testFloatToFloat045
     * @tc.desc Verify instance.toFloat() matches Float.toFloat() for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(-0.0f).toFloat();
      const staticResult: float = Float.toFloat(-0.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4600
     * @tc.name testFloatToFloat046
     * @tc.desc Verify instance.toFloat() matches Float.toFloat() for 1.0e38f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(1.0e38f).toFloat();
      const staticResult: float = Float.toFloat(1.0e38f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4700
     * @tc.name testFloatToFloat047
     * @tc.desc Verify instance.toFloat() matches Float.toFloat() for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(Float.DELTA).toFloat();
      const staticResult: float = Float.toFloat(Float.DELTA);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4800
     * @tc.name testFloatToFloat048
     * @tc.desc Verify instance.toFloat() matches Float.toFloat() for Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(Float.EPSILON).toFloat();
      const staticResult: float = Float.toFloat(Float.EPSILON);
      expect(instanceResult).assertEqual(staticResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_4900
     * @tc.name testFloatToFloat049
     * @tc.desc Verify toFloat() on Float(-Float.MIN_VALUE) returns -Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MIN_VALUE);
      const result: float = f.toFloat();
      expect(result).assertEqual(-Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_5000
     * @tc.name testFloatToFloat050
     * @tc.desc Verify toFloat() on Float(-Float.MAX_VALUE) returns -Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MAX_VALUE);
      const result: float = f.toFloat();
      expect(result).assertEqual(-Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_5100
     * @tc.name testFloatToFloat051
     * @tc.desc Verify toFloat() on Float(-1.0e38f) returns -1.0e38f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.0e38f);
      const result: float = f.toFloat();
      expect(result).assertEqual(-1.0e38f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_5200
     * @tc.name testFloatToFloat052
     * @tc.desc Verify toFloat() on Float(16777216.0f) returns 16777216.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(16777216.0f);
      const result: float = f.toFloat();
      expect(result).assertEqual(16777216.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_5300
     * @tc.name testFloatToFloat053
     * @tc.desc Verify toFloat() on Float(16777217.0f) returns 16777217.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(16777217.0f);
      const result: float = f.toFloat();
      expect(result).assertEqual(16777217.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOFLOAT_ONE_5400
     * @tc.name testFloatToFloat054
     * @tc.desc Verify toFloat() round-trip: new Float(f.toFloat()).toFloat() equals f.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToFloat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0f);
      const first: float = f.toFloat();
      const roundTrip: float = new Float(first).toFloat();
      expect(roundTrip).assertEqual(first);
    });

  });
}
