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

export default function FloatToLong2Test2(): void {
  describe('FloatToLong2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0100
     * @tc.name testFloatToLong001
     * @tc.desc Verify Float.toLong(int 42) returns 42 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      expect(Float.toLong(val)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0200
     * @tc.name testFloatToLong002
     * @tc.desc Verify Float.toLong(float -3.14f) returns -3 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -3.14f;
      expect(Float.toLong(val)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0300
     * @tc.name testFloatToLong003
     * @tc.desc Verify Float.toLong(float 4.0f) returns 4 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      expect(Float.toLong(val)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0400
     * @tc.name testFloatToLong004
     * @tc.desc Verify Float.toLong(float 1.0e3f) returns 1000 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e3f;
      expect(Float.toLong(val)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0500
     * @tc.name testFloatToLong005
     * @tc.desc Verify Float.toLong idempotency: multiple calls with float value 42.0f return the same long result (r2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      const r1: long = Float.toLong(val);
      const r2: long = Float.toLong(val);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0600
     * @tc.name testFloatToLong006
     * @tc.desc Verify Float.toLong(float 42.0f) returns 42 as long
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 42.0f;
      expect(Float.toLong(val)).assertEqual(42);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0700
     * @tc.name testFloatToLong007
     * @tc.desc Verify Float.toLong(-16777217.0f) returns -16777216
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-16777217.0f)).assertEqual(-16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0800
     * @tc.name testFloatToLong008
     * @tc.desc Verify Float.toLong(1.0e20f) returns 9223372036854775807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0e20f)).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_0900
     * @tc.name testFloatToLong009
     * @tc.desc Verify Float.toLong(-1.0e20f) returns -9223372036854775808
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-1.0e20f)).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1000
     * @tc.name testFloatToLong010
     * @tc.desc Verify Float.toLong(1.0e6f) returns 1000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0e6f)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1100
     * @tc.name testFloatToLong011
     * @tc.desc Verify Float.toLong(-1.0e6f) returns -1000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-1.0e6f)).assertEqual(-1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1200
     * @tc.name testFloatToLong012
     * @tc.desc Verify Float.toLong(1.0e10f) returns 10000000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0e10f)).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1300
     * @tc.name testFloatToLong013
     * @tc.desc Verify Float.toLong(1.0e15f) returns 999999986991104 (float precision loss)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0e15f)).assertEqual(999999986991104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1400
     * @tc.name testFloatToLong014
     * @tc.desc Verify Float.toLong(-1.0e10f) returns -10000000000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-1.0e10f)).assertEqual(-10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1500
     * @tc.name testFloatToLong015
     * @tc.desc Verify Float.toLong(-1.0e15f) returns -999999986991104 (float precision loss)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-1.0e15f)).assertEqual(-999999986991104);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1600
     * @tc.name testFloatToLong016
     * @tc.desc Verify Float.toLong(Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(Float.MIN_VALUE / 2.0f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1700
     * @tc.name testFloatToLong017
     * @tc.desc Verify Float.toLong(-Float.MIN_VALUE / 2.0f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-Float.MIN_VALUE / 2.0f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1800
     * @tc.name testFloatToLong018
     * @tc.desc Verify Float.toLong idempotency: multiple calls with float value 42.0f return the same long result (instanceResult)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 42.0f;
      const staticResult: long = Float.toLong(v);
      const instanceResult: long = new Float(v).toLong();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_1900
     * @tc.name testFloatToLong019
     * @tc.desc Verify Float.toLong idempotency: static and instance calls with float value NaN return the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: long = Float.toLong(Float.NaN);
      const instanceResult: long = new Float(Float.NaN).toLong();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2000
     * @tc.name testFloatToLong020
     * @tc.desc Verify Float.toLong idempotency: static and instance calls with float value POSITIVE_INFINITY return the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: long = Float.toLong(Float.POSITIVE_INFINITY);
      const instanceResult: long = new Float(Float.POSITIVE_INFINITY).toLong();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2100
     * @tc.name testFloatToLong021
     * @tc.desc Verify Float.toLong idempotency: static and instance calls with float value NEGATIVE_INFINITY return the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: long = Float.toLong(Float.NEGATIVE_INFINITY);
      const instanceResult: long = new Float(Float.NEGATIVE_INFINITY).toLong();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2200
     * @tc.name testFloatToLong022
     * @tc.desc Verify Float.toLong idempotency: static and instance calls with float value MAX_VALUE return the same long result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: long = Float.toLong(Float.MAX_VALUE);
      const instanceResult: long = new Float(Float.MAX_VALUE).toLong();
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2300
     * @tc.name testFloatToLong023
     * @tc.desc Verify Float.toLong sum: toLong(100.0f) + toLong(200.0f) equals long 300
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sum: long = Float.toLong(100.0f) + Float.toLong(200.0f);
      expect(sum).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2400
     * @tc.name testFloatToLong024
     * @tc.desc Verify Float.toLong(1000.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1000.0f)).assertLarger(Float.toLong(500.0f));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2500
     * @tc.name testFloatToLong025
     * @tc.desc Verify Float.toLong(Float.MAX_SAFE_INTEGER) returns 16777215
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(Float.MAX_SAFE_INTEGER)).assertEqual(16777215);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2600
     * @tc.name testFloatToLong026
     * @tc.desc Verify Float.toLong(0.5f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(0.5f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2700
     * @tc.name testFloatToLong027
     * @tc.desc Verify Float.toLong(-0.5f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-0.5f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2800
     * @tc.name testFloatToLong028
     * @tc.desc Verify Float.toLong(1.5f + 0.5f) returns 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.5f + 0.5f)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_2900
     * @tc.name testFloatToLong029
     * @tc.desc Verify Float.toLong(val) returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | null = 3.0f;
      if (val !== null) {
        expect(Float.toLong(val)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3000
     * @tc.name testFloatToLong030
     * @tc.desc Verify Float.toLong(val) returns 7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float | undefined = 7.0f;
      if (val !== undefined) {
        expect(Float.toLong(val)).assertEqual(7);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3100
     * @tc.name testFloatToLong031
     * @tc.desc Verify Float.toLong idempotency: multiple calls with float value 12345.0f return the same long result (r3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 12345.0f;
      const r1: long = Float.toLong(v);
      const r2: long = Float.toLong(v);
      const r3: long = Float.toLong(v);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(12345);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3200
     * @tc.name testFloatToLong032
     * @tc.desc Verify Float.toLong(1.5e6f) returns 1500000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.5e6f)).assertEqual(1500000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3300
     * @tc.name testFloatToLong033
     * @tc.desc Verify chained assertLargerOrEqual then assertLessOrEqual()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: long = Float.toLong(2147483647.0f);
      expect(result).assertLargerOrEqual(2147483647 - 1);
      expect(result).assertLessOrEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3400
     * @tc.name testFloatToLong034
     * @tc.desc Verify Float.toLong(3.0f * 3.0f) returns 9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(3.0f * 3.0f)).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3500
     * @tc.name testFloatToLong035
     * @tc.desc Verify Float.toLong(-Float.MAX_SAFE_INTEGER) returns -16777215
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-Float.MAX_SAFE_INTEGER)).assertEqual(-16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3600
     * @tc.name testFloatToLong036
     * @tc.desc Verify Float.toLong(1.0e-3f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0e-3f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3700
     * @tc.name testFloatToLong037
     * @tc.desc Verify Float.toLong(1.0e38f) handles large overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(1.0e38f)).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3800
     * @tc.name testFloatToLong038
     * @tc.desc Verify instance.toLong() matches Float.toLong() for -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: Float = new Float(-0.0f).toLong();
      const staticResult: long = Float.toLong(-0.0f);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_3900
     * @tc.name testFloatToLong039
     * @tc.desc Verify Float.toLong(-1.0e-3f) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(-1.0e-3f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_4000
     * @tc.name testFloatToLong040
     * @tc.desc Verify Float.toLong(Float.EPSILON) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Float.toLong(Float.EPSILON)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLONG_TWO_4100
     * @tc.name testFloatToLong041
     * @tc.desc Verify static Float.toLong() matches instance for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToLong041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: long = Float.toLong(Float.DELTA);
      const instanceResult: Float = new Float(Float.DELTA).toLong();
      expect(staticResult).assertEqual(instanceResult);
    });


  })
}