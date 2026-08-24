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

export default function FloatToShort1Test2(): void {
  describe('FloatToShort1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0100
     * @tc.name testFloatToShort001
     * @tc.desc Verify toShort() on Float(42) returns 42 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0200
     * @tc.name testFloatToShort002
     * @tc.desc Verify toShort() on Float(100) returns 100 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0300
     * @tc.name testFloatToShort003
     * @tc.desc Verify toShort() on Float(3.14) returns 3 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 3.14;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(3 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0400
     * @tc.name testFloatToShort004
     * @tc.desc Verify toShort() on Float(-3.14f) returns -3 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(-3 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0500
     * @tc.name testFloatToShort005
     * @tc.desc Verify toShort() on Float(4.0f) returns 4 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(4 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0600
     * @tc.name testFloatToShort006
     * @tc.desc Verify toShort() on Float(1.0e3f) returns 1000 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(1000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0700
     * @tc.name testFloatToShort007
     * @tc.desc Verify toShort() does not modify the original Float value (immutability test), original stays 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const original: float = f.toFloat();
      f.toShort();
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0800
     * @tc.name testFloatToShort008
     * @tc.desc Verify toShort idempotency: multiple calls with float value 42.0f return the same short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const r1: short = f.toShort();
      const r2: short = f.toShort();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_0900
     * @tc.name testFloatToShort009
     * @tc.desc Verify toShort() on Float(42.0) returns 42 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.toShort()).assertEqual(42 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1000
     * @tc.name testFloatToShort010
     * @tc.desc Verify toShort() on Float(Float.NaN) returns 0 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.NaN;
      const f: Float = new Float(val);
      expect(f.toShort()).assertEqual(0 as short);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1100
     * @tc.name testFloatToShort011
     * @tc.desc Verify chained assertLargerOrEqual then assertLessOrEqual then assertLargerOrEqual then assertLessOrEqual then assertLargerOrEqual then assertLessOrEqual() on Float(Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: short = new Float(Float.NaN).toShort();
      const r2: short = new Float(Float.POSITIVE_INFINITY).toShort();
      const r3: short = new Float(Float.NEGATIVE_INFINITY).toShort();
      expect(r1).assertLargerOrEqual(-32768);
      expect(r1).assertLessOrEqual(32767);
      expect(r2).assertLargerOrEqual(-32768);
      expect(r2).assertLessOrEqual(32767);
      expect(r3).assertLargerOrEqual(-32768);
      expect(r3).assertLessOrEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1200
     * @tc.name testFloatToShort012
     * @tc.desc Verify toShort() on Float(1000.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: float = 1000.0f;
      const shortVal: short = new Float(original).toShort();
      const roundTrip: float = new Float(shortVal).toFloat();
      expect(roundTrip).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1300
     * @tc.name testFloatToShort013
     * @tc.desc Verify toShort() on Float(-32768.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: float = -32768.0f;
      const shortVal: short = new Float(original).toShort();
      const roundTrip: float = new Float(shortVal).toFloat();
      expect(roundTrip).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1400
     * @tc.name testFloatToShort014
     * @tc.desc Verify toShort() on Float(1024.0f) returns 1024
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(1024.0f).toShort();
      expect(result & 0xFFFF).assertEqual(1024);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1500
     * @tc.name testFloatToShort015
     * @tc.desc Verify toShort idempotency: same input multiple calls return the same short result (1024.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: short = new Float(1024.0f).toShort();
      const staticResult: short = Float.toShort(1024.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1600
     * @tc.name testFloatToShort016
     * @tc.desc Verify toShort idempotency: same input multiple calls return the same short result (32767.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: short = new Float(32767.0f).toShort();
      const staticResult: short = Float.toShort(32767.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1700
     * @tc.name testFloatToShort017
     * @tc.desc Verify toShort() on Float(3.14f) returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 3.14f;
      const f: Float = new Float(val);
      const result: short = f.toShort();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1800
     * @tc.name testFloatToShort018
     * @tc.desc Verify toShort() on Float(2.718) returns 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 2.718;
      const f: Float = new Float(val);
      const result: short = f.toShort();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_1900
     * @tc.name testFloatToShort019
     * @tc.desc Verify toShort idempotency: same input multiple calls return the same short result (1234.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.0f);
      const r1: short = f.toShort();
      const r2: short = f.toShort();
      const r3: short = f.toShort();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2000
     * @tc.name testFloatToShort020
     * @tc.desc Verify toShort idempotency: same input multiple calls return the same short result (999.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(999.0f);
      const f2: Float = new Float(999.0f);
      const f3: Float = new Float(999.0f);
      const r1: short = f1.toShort();
      const r2: short = f2.toShort();
      const r3: short = f3.toShort();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2100
     * @tc.name testFloatToShort021
     * @tc.desc Verify toShort idempotency: same input multiple calls return the same short result (500.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(500.0f);
      const r1: short = f.toShort();
      const floatVal: float = f.toFloat();
      const r2: short = f.toShort();
      expect(r1).assertEqual(r2);
      expect(floatVal).assertEqual(500.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2200
     * @tc.name testFloatToShort022
     * @tc.desc Verify toShort() on Float(123.456f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(123.456f);
      const before: float = f.toFloat();
      f.toShort();
      const after: float = f.toFloat();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2300
     * @tc.name testFloatToShort023
     * @tc.desc Verify toShort() on Float(-555.0f) returns -555
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-555.0f);
      const initialFloat: float = f.toFloat();
      for (let i = 0; i < 5; i++) {
        const s: short = f.toShort();
        expect(s).assertEqual(-555);
      expect(f.toFloat()).assertEqual(initialFloat);
    }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2400
     * @tc.name testFloatToShort024
     * @tc.desc Verify toShort() on Float(-48.0f) returns -48
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-48.0f);
      const result: short = f.toShort();
      expect(result).assertEqual(-48);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2500
     * @tc.name testFloatToShort025
     * @tc.desc Verify toShort() on Float(-1.0e3f) returns -1000f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-1.0e3f);
      const result: short = f.toShort();
      expect(result).assertEqual(-1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2600
     * @tc.name testFloatToShort026
     * @tc.desc Verify toShort() on Float(1.0e10f) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e10f);
      const result: short = f.toShort();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2700
     * @tc.name testFloatToShort027
     * @tc.desc Verify toShort() on Float(2147483647) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      const result: short = f.toShort();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2800
     * @tc.name testFloatToShort028
     * @tc.desc Verify toShort() on Float(-2147483648) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2147483648 as int);
      const result: short = f.toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_2900
     * @tc.name testFloatToShort029
     * @tc.desc Verify toShort() on Float(127) returns 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(127 as byte);
      const result: short = f.toShort();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3000
     * @tc.name testFloatToShort030
     * @tc.desc Verify consistency: instance.toShort(-0.0f) equals Float.toShort(-0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: short = new Float(-0.0f).toShort();
      const staticResult: short = Float.toShort(-0.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3100
     * @tc.name testFloatToShort031
     * @tc.desc Verify consistency: instance.toShort(DELTA) equals Float.toShort(DELTA)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: short = new Float(Float.DELTA).toShort();
      const staticResult: short = Float.toShort(Float.DELTA);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3200
     * @tc.name testFloatToShort032
     * @tc.desc Verify consistency: instance.toShort(MAX_SAFE_INTEGER) equals Float.toShort(MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: short = new Float(Float.MAX_SAFE_INTEGER).toShort();
      const staticResult: short = Float.toShort(Float.MAX_SAFE_INTEGER);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3300
     * @tc.name testFloatToShort033
     * @tc.desc Verify toShort() on Float(0.0f / 0.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(0.0f / 0.0f).toShort();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3400
     * @tc.name testFloatToShort034
     * @tc.desc Verify toShort() on Float(-98303.0f) returns -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-98303.0f).toShort();
      expect(result).assertClose(-32768, 0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3500
     * @tc.name testFloatToShort035
     * @tc.desc Verify toShort() on Float(Float.MAX_VALUE) returns -1 (Float.MAX_VALUE truncates to -1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.MAX_VALUE).toShort();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3600
     * @tc.name testFloatToShort036
     * @tc.desc Verify toShort() on Float(Float.MAX_SAFE_INTEGER) returns -1 due to truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(Float.MAX_SAFE_INTEGER).toShort();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSHORT_ONE_3700
     * @tc.name testFloatToShort037
     * @tc.desc Verify toShort() on Float(-Float.MAX_SAFE_INTEGER) returns 1 due to truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToShort037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = new Float(-Float.MAX_SAFE_INTEGER).toShort();
      expect(result).assertEqual(1);
    });


  });
}
