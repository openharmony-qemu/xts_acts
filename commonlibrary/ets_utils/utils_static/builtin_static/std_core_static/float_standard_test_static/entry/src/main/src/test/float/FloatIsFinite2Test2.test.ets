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

export default function FloatIsFinite2Test2(): void {
  describe('FloatIsFinite2Test2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0100
     * @tc.name testFloatIsFiniteInstance001
     * @tc.desc Verify isFinite() on Float(-2147483648) returns true, confirming the input is finite (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const f: Float = new Float(val);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0200
     * @tc.name testFloatIsFiniteInstance002
     * @tc.desc Verify isFinite() on Float(100) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const f: Float = new Float(val);
      expect(f.isFinite()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0300
     * @tc.name testFloatIsFiniteInstance003
     * @tc.desc Verify isFinite() on Float(4.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0400
     * @tc.name testFloatIsFiniteInstance004
     * @tc.desc Verify isFinite() on Float(-2.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -2.0f;
      const f: Float = new Float(val);
      expect(f.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0500
     * @tc.name testFloatIsFiniteInstance005
     * @tc.desc Verify isFinite() on Float(1.0) returns boolean true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const original: float = f.toFloat();
      expect(f.isFinite()).assertTrue();
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0600
     * @tc.name testFloatIsFiniteInstance006
     * @tc.desc Verify isFinite idempotency: multiple calls with float value 1.0f return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const r1: boolean = f.isFinite();
      const r2: boolean = f.isFinite();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0700
     * @tc.name testFloatIsFiniteInstance007
     * @tc.desc Verify isFinite() throws ClassCastError when passing {} as Object as float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const valF: float = {} as Object as float;
        const f: Float = new Float(valF);
        f.isFinite();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0800
     * @tc.name testFloatIsFiniteInstance008
     * @tc.desc Verify isFinite() on Float(Float.MIN_VALUE / 2.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MIN_VALUE / 2.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_0900
     * @tc.name testFloatIsFiniteInstance009
     * @tc.desc Verify isFinite() on Float(-Float.MIN_VALUE / 2.0f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-Float.MIN_VALUE / 2.0f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1000
     * @tc.name testFloatIsFiniteInstance010
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.bitCastFromInt(0x00000001);
      const value: Float = new Float(val);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1100
     * @tc.name testFloatIsFiniteInstance011
     * @tc.desc Verify instance isFinite() matches static isFinite() for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: boolean = new Float(Float.NaN).isFinite();
      const staticResult: boolean = isFinite(Float.NaN);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1200
     * @tc.name testFloatIsFiniteInstance012
     * @tc.desc Verify instance isFinite() matches static isFinite() for Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: boolean = new Float(Float.NEGATIVE_INFINITY).isFinite();
      const staticResult: boolean = isFinite(Float.NEGATIVE_INFINITY);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1300
     * @tc.name testFloatIsFiniteInstance013
     * @tc.desc Verify instance isFinite() matches static isFinite() for Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instanceResult: boolean = new Float(Float.MAX_VALUE).isFinite();
      const staticResult: boolean = isFinite(Float.MAX_VALUE);
      expect(instanceResult).assertEqual(staticResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1400
     * @tc.name testFloatIsFiniteInstance014
     * @tc.desc Verify isFinite() on Float(1.0e10f) returns true, confirming the input is finite for 1.0e10f (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(1.0e10f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1500
     * @tc.name testFloatIsFiniteInstance015
     * @tc.desc Verify isFinite() on Float(-1.0e10f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-1.0e10f);
      expect(value.isFinite()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1600
     * @tc.name testFloatIsFiniteInstance016
     * @tc.desc Verify isFinite() on Float(Float.MAX_VALUE * 0.999f) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MAX_VALUE * 0.999f);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1700
     * @tc.name testFloatIsFiniteInstance017
     * @tc.desc Verify isFinite() on Float(Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: Float = a.add(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1800
     * @tc.name testFloatIsFiniteInstance018
     * @tc.desc Verify isFinite() on Float(-Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-Float.MAX_VALUE);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_1900
     * @tc.name testFloatIsFiniteInstance019
     * @tc.desc Verify isFinite() on Float(Double.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Double.NaN);
      expect(value.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2000
     * @tc.name testFloatIsFiniteInstance020
     * @tc.desc Verify isFinite() on Float(Double.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Double.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2100
     * @tc.name testFloatIsFiniteInstance021
     * @tc.desc Verify isFinite() on Float(Float.POSITIVE_INFINITY) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.POSITIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
      expect(value.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2200
     * @tc.name testFloatIsFiniteInstance022
     * @tc.desc Verify isFinite() on Float(Float.NEGATIVE_INFINITY) returns false, confirming NEGATIVE_INFINITY is not finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.NEGATIVE_INFINITY);
      expect(value.isFinite()).assertFalse();
      expect(!value.isFinite() && !value.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2300
     * @tc.name testFloatIsFiniteInstance023
     * @tc.desc Verify isFinite() on Float(Float.MAX_SAFE_INTEGER) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(Float.MAX_SAFE_INTEGER);
      expect(value.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2400
     * @tc.name testFloatIsFiniteInstance024
     * @tc.desc Verify isFinite() on Float(-Float.MAX_SAFE_INTEGER) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float = new Float(-Float.MAX_SAFE_INTEGER);
      expect(value.isFinite()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2500
     * @tc.name testFloatIsFiniteInstance025
     * @tc.desc Verify isFinite after null narrowing on float value, returns true, confirming finite value survives null-safety check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float | null = new Float(1.0f);
      expect(value).not().assertNull();
      expect(value!.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2600
     * @tc.name testFloatIsFiniteInstance026
     * @tc.desc Verify isFinite after null narrowing on NaN value, returns false, confirming NaN is not finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Float | null = new Float(Float.NaN);
      expect(value).not().assertNull();
      expect(value!.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2700
     * @tc.name testFloatIsFiniteInstance027
     * @tc.desc Verify isFinite() on Float(2147483647) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2147483647 as int);
      const result: boolean = f.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2800
     * @tc.name testFloatIsFiniteInstance028
     * @tc.desc Verify isFinite() on Float(127) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(127 as byte);
      const result: boolean = f.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_2900
     * @tc.name testFloatIsFiniteInstance029
     * @tc.desc Verify isFinite() on Float(-128) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-128 as byte);
      const result: boolean = f.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_3000
     * @tc.name testFloatIsFiniteInstance030
     * @tc.desc Verify isFinite() on Float(32767) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(32767 as short);
      const result: boolean = f.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_3100
     * @tc.name testFloatIsFiniteInstance031
     * @tc.desc Verify isFinite() on Float(-32768) returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-32768 as short);
      const result: boolean = f.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_3200
     * @tc.name testFloatIsFiniteInstance032
     * @tc.desc Verify bitCastFromInt: result from expression returns true, confirming the input is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const result: boolean = f.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISFINITE_INSTANCE_TWO_3300
     * @tc.name testFloatIsFiniteInstance033
     * @tc.desc Verify consistency: static Float.isFinite and instance isFinite return same result for 1.0e-10f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsFiniteInstance033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticResult: boolean = isFinite(1.0e-10f);
      const instanceResult: boolean = new Float(1.0e-10f).isFinite();
      expect(staticResult).assertEqual(instanceResult);
    });

  });
}