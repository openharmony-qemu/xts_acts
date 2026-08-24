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

export default function FloatToShort2Test2(): void {
  describe('FloatToShort2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0100
     * @tc.name testFloatToShort001
     * @tc.desc Verify Float.toShort(int 42) returns 42 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      expect(Float.toShort(val)).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0200
     * @tc.name testFloatToShort002
     * @tc.desc Verify Float.toShort(int -32768) returns -32768 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -32768;
      expect(Float.toShort(val)).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0300
     * @tc.name testFloatToShort003
     * @tc.desc Verify Float.toShort(long 100) returns 100 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      expect(Float.toShort(val)).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0400
     * @tc.name testFloatToShort004
     * @tc.desc Verify Float.toShort(float -3.14f) returns -3 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      expect(Float.toShort(val)).assertEqual(-3 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0500
     * @tc.name testFloatToShort005
     * @tc.desc Verify Float.toShort(float 4.0f) returns 4 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      expect(Float.toShort(val)).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0600
     * @tc.name testFloatToShort006
     * @tc.desc Verify Float.toShort(float 1.0e3f) returns 1000 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      expect(Float.toShort(val)).assertEqual(1000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0700
     * @tc.name testFloatToShort007
     * @tc.desc Verify Float.toShort idempotency: multiple calls with float value 42.0f return the same short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: short = Float.toShort(val);
      const r2: short = Float.toShort(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0800
     * @tc.name testFloatToShort008
     * @tc.desc Verify Float.toShort(float 42.0f) returns 42 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      expect(Float.toShort(val)).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_0900
     * @tc.name testFloatToShort009
     * @tc.desc Verify Float.toShort(float Float.NaN) returns 0 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      expect(Float.toShort(val)).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1000
     * @tc.name testFloatToShort010
     * @tc.desc Verify Float.toShort(float Float.POSITIVE_INFINITY) returns -1 as short (POSITIVE_INFINITY overflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.POSITIVE_INFINITY;
      expect(Float.toShort(val)).assertEqual(-1 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1100
     * @tc.name testFloatToShort011
     * @tc.desc Verify Float.toShort(65536.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(65536.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1200
     * @tc.name testFloatToShort012
     * @tc.desc Verify Float.toShort(Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(Float.MIN_VALUE / 2.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1300
     * @tc.name testFloatToShort013
     * @tc.desc Verify Float.toShort(-Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(-Float.MIN_VALUE / 2.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1400
     * @tc.name testFloatToShort014
     * @tc.desc Verify Float.toShort idempotency: static and instance calls with float value 12345.0f return the same short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 12345.0f;
      const staticResult: short = Float.toShort(v);
      const instanceResult: short = new Float(v).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1500
     * @tc.name testFloatToShort015
     * @tc.desc Verify Float.toShort idempotency: static and instance calls with float value NaN return the same short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(Float.NaN);
      const instanceResult: short = new Float(Float.NaN).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1600
     * @tc.name testFloatToShort016
     * @tc.desc Verify Float.toShort(POSITIVE_INFINITY) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(Float.POSITIVE_INFINITY);
      const instanceResult: short = new Float(Float.POSITIVE_INFINITY).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1700
     * @tc.name testFloatToShort017
     * @tc.desc Verify Float.toShort(NEGATIVE_INFINITY) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(Float.NEGATIVE_INFINITY);
      const instanceResult: short = new Float(Float.NEGATIVE_INFINITY).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1800
     * @tc.name testFloatToShort018
     * @tc.desc Verify Float.toShort(MAX_VALUE) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(Float.MAX_VALUE);
      const instanceResult: short = new Float(Float.MAX_VALUE).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_1900
     * @tc.name testFloatToShort019
     * @tc.desc Verify Float.toShort(MIN_VALUE) static vs instance consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(Float.MIN_VALUE);
      const instanceResult: short = new Float(Float.MIN_VALUE).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2000
     * @tc.name testFloatToShort020
     * @tc.desc Verify Float.toShort arithmetic: toShort(500.0f) - toShort(200.0f) equals 300
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const diff: int = Float.toShort(500.0f) - Float.toShort(200.0f);
      expect(diff).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2100
     * @tc.name testFloatToShort021
     * @tc.desc Verify Float.toShort arithmetic: toShort(10.0f) * toShort(30.0f) equals 300
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const product: int = Float.toShort(10.0f) * Float.toShort(30.0f);
      expect(product).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2200
     * @tc.name testFloatToShort022
     * @tc.desc Verify Float.toShort comparison: toShort(1000.0f)  returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toShort(1000.0f) > Float.toShort(500.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2300
     * @tc.name testFloatToShort023
     * @tc.desc Verify Float.toShort comparison: toShort(-500.0f)  returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toShort(-500.0f) < Float.toShort(0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2400
     * @tc.name testFloatToShort024
     * @tc.desc Verify Float.toShort comparison: toShort(999.0f)  returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = Float.toShort(999.0f) === Float.toShort(999.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2500
     * @tc.name testFloatToShort025
     * @tc.desc Verify Float.toShort(100.0f) returns 100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const roundTrip: float = new Float(Float.toShort(100.0f)).toFloat();
      expect(roundTrip).assertEqual(100.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2600
     * @tc.name testFloatToShort026
     * @tc.desc Verify Float.toShort(-1000.0f) returns -1000.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const roundTrip: float = new Float(Float.toShort(-1000.0f)).toFloat();
      expect(roundTrip).assertEqual(-1000.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2700
     * @tc.name testFloatToShort027
     * @tc.desc Verify Float.toShort(32767.0f) returns 32767.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: short = Float.toShort(32767.0f);
      const back: float = new Float(b).toFloat();
      expect(back).assertEqual(32767.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2800
     * @tc.name testFloatToShort028
     * @tc.desc Verify Float.toShort(50.0f) returns 50
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Float.toShort(50.0f);
      expect(s).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_2900
     * @tc.name testFloatToShort029
     * @tc.desc Verify chained not then assertNull() returns 777
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: float | null = 777.0f;
      expect(value).not().assertNull();
      const result: short = Float.toShort(value!);
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3000
     * @tc.name testFloatToShort030
     * @tc.desc Verify chained not then assertUndefined() returns 333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: float | undefined = 333.0f;
      expect(value).not().assertUndefined();
      const result: short = Float.toShort(value!);
      expect(result).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3100
     * @tc.name testFloatToShort031
     * @tc.desc Verify Float.toShort(0.999f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(0.999f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3200
     * @tc.name testFloatToShort032
     * @tc.desc Verify Float.toShort(20.0f + 30.0f) returns 50
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(20.0f + 30.0f);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3300
     * @tc.name testFloatToShort033
     * @tc.desc Verify Float.toShort(100.0f * 10.0f) returns 1000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(100.0f * 10.0f);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3400
     * @tc.name testFloatToShort034
     * @tc.desc Verify Float.toShort(1000.0f / 3.0f) returns 333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(1000.0f / 3.0f);
      expect(result).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3500
     * @tc.name testFloatToShort035
     * @tc.desc Verify Float.toShort(100.0f) returns 100, then *5 gives 500
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: short = Float.toShort(100.0f);
      const product: int = s * 5;
      expect(product).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3600
     * @tc.name testFloatToShort036
     * @tc.desc Verify Float.toShort idempotency: static and instance calls with float values 500.0f and 1000.0f return the max short result (1000)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: short = Float.toShort(500.0f);
      const b: short = Float.toShort(1000.0f);
      const max: short = a > b ? a : b;
      expect(max).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3700
     * @tc.name testFloatToShort037
     * @tc.desc Verify Float.toShort idempotency: static and instance calls with float value 1234.0f return the same short result (1234)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(new Float(Float.toShort(1234.0f)).toFloat());
      expect(result).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3800
     * @tc.name testFloatToShort038
     * @tc.desc Verify Float.toShort(Float.NaN) returns 0 via direct literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.NaN);
      const result: short = Float.toShort(f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_3900
     * @tc.name testFloatToShort039
     * @tc.desc Verify Float.toShort(-0.0f) returns 0 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(-0.0f);
      expect(result).assertEqual(0 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_4000
     * @tc.name testFloatToShort040
     * @tc.desc Verify Float.toShort(-Float.MAX_SAFE_INTEGER) returns value within short range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(-Float.MAX_SAFE_INTEGER);
      expect(result).assertLargerOrEqual(-32768);
      expect(result).assertLessOrEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_4100
     * @tc.name testFloatToShort041
     * @tc.desc Verify Float.toShort(1.0e-10f) returns 0 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Float.toShort(1.0e-10f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_4200
     * @tc.name testFloatToShort042
     * @tc.desc Verify consistency: Float.toShort(-0.0f) equals instance.toShort(-0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(-0.0f);
      const instanceResult: short = new Float(-0.0f).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_4300
     * @tc.name testFloatToShort043
     * @tc.desc Verify consistency: Float.toShort(1.0e-3f) equals instance.toShort(1.0e-3f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: short = Float.toShort(1.0e-3f);
      const instanceResult: short = new Float(1.0e-3f).toShort();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_TWO_4400
     * @tc.name testFloatToShort044
     * @tc.desc Verify Float.toShort(3.0f) returns 3, used as array index to get 40
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30, 40, 50];
      const index: short = Float.toShort(3.0f);
      expect(arr[index]).assertEqual(40);
    });

  })
}