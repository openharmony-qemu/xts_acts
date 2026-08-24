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

export default function FloatToLong1Test2(): void {
  describe('FloatToLong1Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0100
     * @tc.name testFloatToLong001
     * @tc.desc Verify toLong() on Float(42) returns 42 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const f: Float = new Float(val);
      expect(f.toLong()).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0200
     * @tc.name testFloatToLong002
     * @tc.desc Verify toLong() on Float(3.14) returns 3 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 3.14;
      const f: Float = new Float(val);
      expect(f.toLong()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0300
     * @tc.name testFloatToLong003
     * @tc.desc Verify toLong() on Float(-3.14f) returns -3 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      const f: Float = new Float(val);
      expect(f.toLong()).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0400
     * @tc.name testFloatToLong004
     * @tc.desc Verify toLong() on Float(4.0f) returns 4 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.toLong()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0500
     * @tc.name testFloatToLong005
     * @tc.desc Verify toLong() on Float(1.0e3f) returns 1000 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      const f: Float = new Float(val);
      expect(f.toLong()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0600
     * @tc.name testFloatToLong006
     * @tc.desc Verify toLong() on Float(42.0) returns 42 as long for original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const original: float = f.toFloat();
      f.toLong();
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0700
     * @tc.name testFloatToLong007
     * @tc.desc Verify toLong idempotency: multiple calls with float value 42.0f return the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.0);
      const r1: long = f.toLong();
      const r2: long = f.toLong();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0800
     * @tc.name testFloatToLong008
     * @tc.desc Verify toLong() on Float(-16777217.0f) returns -16777216 via direct literal equaling -16777216
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-16777217.0f).toLong();
      expect(result).assertEqual(-16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_0900
     * @tc.name testFloatToLong009
     * @tc.desc Verify toLong() on Float(1.0e30f) returns 9223372036854775807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(1.0e30f).toLong();
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1000
     * @tc.name testFloatToLong010
     * @tc.desc Verify toLong() on Float(-1.0e30f) returns -9223372036854775808
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-1.0e30f).toLong();
      expect(result).assertEqual(-9223372036854775808);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1100
     * @tc.name testFloatToLong011
     * @tc.desc Verify toLong idempotency: same input multiple calls return the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: long = new Float(12.5f).toLong();
      const staticResult: long = Float.toLong(12.5f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1200
     * @tc.name testFloatToLong012
     * @tc.desc Verify toLong() on Float(42.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: float = 42.0f;
      const l: long = new Float(original).toLong();
      const back: float = Long.toFloat(l);
      expect(back).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1300
     * @tc.name testFloatToLong013
     * @tc.desc Verify toLong() on Float(-99.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: float = -99.0f;
      const l: long = new Float(original).toLong();
      const back: float = Long.toFloat(l);
      expect(back).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1400
     * @tc.name testFloatToLong014
     * @tc.desc Verify toLong() on Float(300.0f) returns 300, then +200 gives 500
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(300.0f).toLong() + 200;
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1500
     * @tc.name testFloatToLong015
     * @tc.desc Verify toLong() on Float(50.0f) returns 50, then *3 gives 150
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(50.0f).toLong() * 3;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1600
     * @tc.name testFloatToLong016
     * @tc.desc Verify toLong() on Float(1000.0f) returns 1000, then -500 gives 500
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(1000.0f).toLong() - 500;
      expect(result).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1700
     * @tc.name testFloatToLong017
     * @tc.desc Verify toLong() on Float(25.5f) returns 25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(25.5f);
      const result: long = f.toLong();
      expect(result).assertEqual(25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1800
     * @tc.name testFloatToLong018
     * @tc.desc Verify toLong() on Float(Float.MAX_SAFE_INTEGER) returns 16777215
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(Float.MAX_SAFE_INTEGER).toLong();
      expect(result).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_1900
     * @tc.name testFloatToLong019
     * @tc.desc Verify toLong() on two Float(42.5f) instances returns the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f1: Float = new Float(42.5f);
      const f2: Float = new Float(42.5f);
      expect(f1.toLong()).assertEqual(f2.toLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2000
     * @tc.name testFloatToLong020
     * @tc.desc Verify toLong() does not modify the original Float value (immutability test), original stays 42.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(42.5f);
      const l: long = f.toLong();
      const after: float = f.toFloat();
      expect(after).assertEqual(42.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2100
     * @tc.name testFloatToLong021
     * @tc.desc Verify toLong() on Float(500.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(500.0f).toLong();
      expect(result).assertEqual(500);
      expect(result).assertLess(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2200
     * @tc.name testFloatToLong022
     * @tc.desc Verify toLong() on Float(-48.0f) returns -48
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-48.0f);
      const result: long = f.toLong();
      expect(result).assertEqual(-48);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2300
     * @tc.name testFloatToLong023
     * @tc.desc Verify toLong() on Float(2147483647) returns 2147483648f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      const result: long = f.toLong();
      expect(result).assertEqual(2147483648f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2400
     * @tc.name testFloatToLong024
     * @tc.desc Verify toLong() on Float(-2147483648) returns -2147483648f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-2147483648 as int);
      const result: long = f.toLong();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2500
     * @tc.name testFloatToLong025
     * @tc.desc Verify toLong() on Float(127) returns 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(127 as byte);
      const result: long = f.toLong();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2600
     * @tc.name testFloatToLong026
     * @tc.desc Verify toLong() on Float(-128) returns -128f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-128 as byte);
      const result: long = f.toLong();
      expect(result).assertEqual(-128f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2700
     * @tc.name testFloatToLong027
     * @tc.desc Verify toLong() on Float(32767) returns 32767f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(32767 as short);
      const result: long = f.toLong();
      expect(result).assertEqual(32767f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2800
     * @tc.name testFloatToLong028
     * @tc.desc Verify toLong() on Float(-32768) returns -32768f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-32768 as short);
      const result: long = f.toLong();
      expect(result).assertEqual(-32768f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_2900
     * @tc.name testFloatToLong029
     * @tc.desc Verify toLong() on Float(Float.bitCastFromInt(0x3f800000)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const result: long = f.toLong();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3000
     * @tc.name testFloatToLong030
     * @tc.desc Verify toLong() on Float(Float.bitCastFromInt(0x40000000)) returns 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x40000000));
      const result: long = f.toLong();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3100
     * @tc.name testFloatToLong031
     * @tc.desc Verify toLong() on Float(Float.bitCastFromInt(0x00000001)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x00000001));
      const result: long = f.toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3200
     * @tc.name testFloatToLong032
     * @tc.desc Verify toLong() on Float(Float.bitCastFromInt(0x007fffff)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x007fffff));
      const result: long = f.toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3300
     * @tc.name testFloatToLong033
     * @tc.desc Verify toLong() on Float(-Float.MAX_SAFE_INTEGER) returns -16777215
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const result: long = f.toLong();
      expect(result).assertEqual(-16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3400
     * @tc.name testFloatToLong034
     * @tc.desc Verify toLong() on Float(1.0e-3f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0e-3f);
      const result: long = f.toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3500
     * @tc.name testFloatToLong035
     * @tc.desc Verify instance.toLong() matches Float.toLong() for Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(Float.MAX_SAFE_INTEGER).toLong();
      const staticResult: long = Float.toLong(Float.MAX_SAFE_INTEGER);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3600
     * @tc.name testFloatToLong036
     * @tc.desc Verify instance.toLong() matches Float.toLong() for Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(Float.NEGATIVE_INFINITY).toLong();
      const staticResult: long = Float.toLong(Float.NEGATIVE_INFINITY);
      expect(instanceResult).assertEqual(staticResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3700
     * @tc.name testFloatToLong037
     * @tc.desc Verify instance.toLong() matches Float.toLong() for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(Float.DELTA).toLong();
      const staticResult: long = Float.toLong(Float.DELTA);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3800
     * @tc.name testFloatToLong038
     * @tc.desc Verify toLong() on Float(1.0e18f) returns large but within long range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(1.0e18f).toLong();
      expect(result).assertEqual(999999984306749440);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_3900
     * @tc.name testFloatToLong039
     * @tc.desc Verify toLong() on Float(-1.0e38f) returns long MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-1.0e38f).toLong();
      expect(result).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_4000
     * @tc.name testFloatToLong040
     * @tc.desc Verify toLong() on Float(0.0f / 0.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(0.0f / 0.0f).toLong();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_4100
     * @tc.name testFloatToLong041
     * @tc.desc Verify toLong() on Float(9.223372e18f) returns 9223372036854775807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(9.223372e18f).toLong();
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_ONE_4200
     * @tc.name testFloatToLong042
     * @tc.desc Verify toLong() on Float(-9.223372e18f) returns -9223372036854775808
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = new Float(-9.223372e18f).toLong();
      expect(result).assertEqual(-9223372036854775808);
    });

  });
}
