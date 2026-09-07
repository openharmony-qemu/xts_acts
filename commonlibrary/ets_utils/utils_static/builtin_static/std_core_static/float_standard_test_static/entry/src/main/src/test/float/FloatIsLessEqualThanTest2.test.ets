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

export default function FloatIsLessEqualThanTest2(): void {
  describe('FloatIsLessEqualThanTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0100
     * @tc.name testFloatIsLessEqualThan001
     * @tc.desc Verify isLessEqualThan(int 2147483647, Float new Float(val), Float new Float(val)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0200
     * @tc.name testFloatIsLessEqualThan002
     * @tc.desc Verify isLessEqualThan(long 50, long 100, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 50;
      const val2: long = 100;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0300
     * @tc.name testFloatIsLessEqualThan003
     * @tc.desc Verify isLessEqualThan(double 2.0, double 3.0, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 2.0;
      const val2: double = 3.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0400
     * @tc.name testFloatIsLessEqualThan004
     * @tc.desc Verify isLessEqualThan(new Float(3.0))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(2.0);
      const original: float = f.toFloat();
      f.isLessEqualThan(new Float(3.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0500
     * @tc.name testFloatIsLessEqualThan005
     * @tc.desc Verify isLessEqualThan(Float new Float(42.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.isLessEqualThan(new Float(42.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0600
     * @tc.name testFloatIsLessEqualThan006
     * @tc.desc Verify isLessEqualThan idempotency: multiple calls with the same input return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0);
      const b: Float = new Float(3.0);
      const r1: boolean = a.isLessEqualThan(b);
      const r2: boolean = a.isLessEqualThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0700
     * @tc.name testFloatIsLessEqualThan007
     * @tc.desc Verify isLessEqualThan(float 4.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.isLessEqualThan(new Float(4.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0800
     * @tc.name testFloatIsLessEqualThan008
     * @tc.desc Verify isLessEqualThan(int -2147483648, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_0900
     * @tc.name testFloatIsLessEqualThan009
     * @tc.desc Verify isLessEqualThan(int 2147483647, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1000
     * @tc.name testFloatIsLessEqualThan010
     * @tc.desc Verify isLessEqualThan(int -2147483648, short 32767, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1100
     * @tc.name testFloatIsLessEqualThan011
     * @tc.desc Verify isLessEqualThan(long -9223372036854775808, int -2147483648, Float new Float(valA), Float new Float(valB))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1200
     * @tc.name testFloatIsLessEqualThan012
     * @tc.desc Verify isLessEqualThan(byte -128, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = -128;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1300
     * @tc.name testFloatIsLessEqualThan013
     * @tc.desc Verify isLessEqualThan(int -2147483648, float 0.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1400
     * @tc.name testFloatIsLessEqualThan014
     * @tc.desc Verify isLessEqualThan(int 2147483647, float 0.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1500
     * @tc.name testFloatIsLessEqualThan015
     * @tc.desc Verify isLessEqualThan(float Float.NEGATIVE_INFINITY, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.NEGATIVE_INFINITY;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1600
     * @tc.name testFloatIsLessEqualThan016
     * @tc.desc Verify isLessEqualThan(float Float.MAX_VALUE, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1700
     * @tc.name testFloatIsLessEqualThan017
     * @tc.desc Verify isLessEqualThan(byte -128, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = -128;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1800
     * @tc.name testFloatIsLessEqualThan018
     * @tc.desc Verify isLessEqualThan(int 3, float 5.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 3;
      const valB: float = 5.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_1900
     * @tc.name testFloatIsLessEqualThan019
     * @tc.desc Verify isLessEqualThan(int 5, float 5.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = 5.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2000
     * @tc.name testFloatIsLessEqualThan020
     * @tc.desc Verify isLessEqualThan(int 5, long 9223372036854775807, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = 9223372036854775807;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2100
     * @tc.name testFloatIsLessEqualThan021
     * @tc.desc Verify isLessEqualThan(int 5, long -9223372036854775808, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = -9223372036854775808;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2200
     * @tc.name testFloatIsLessEqualThan022
     * @tc.desc Verify isLessEqualThan(int 5, float Float.MAX_VALUE, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2300
     * @tc.name testFloatIsLessEqualThan023
     * @tc.desc Verify isLessEqualThan(int 5, float Float.MIN_VALUE, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2400
     * @tc.name testFloatIsLessEqualThan024
     * @tc.desc Verify isLessEqualThan(int 5, byte 12, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = 12 as byte;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2500
     * @tc.name testFloatIsLessEqualThan025
     * @tc.desc Verify isLessEqualThan(int 5, byte -128, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = -128 as byte;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2600
     * @tc.name testFloatIsLessEqualThan026
     * @tc.desc Verify isLessEqualThan( new Float(3.14f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const result: boolean = a.isLessEqualThan(a);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2700
     * @tc.name testFloatIsLessEqualThan027
     * @tc.desc Verify isLessEqualThan( new Float(-3.14f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.14f);
      const result: boolean = a.isLessEqualThan(a);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2800
     * @tc.name testFloatIsLessEqualThan028
     * @tc.desc Verify isLessEqualThan( new Float(1.0f),  new Float(2.0f)) returns true (chained 3 elements)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(3.0f);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isLessEqualThan(c)).assertTrue();
      expect(a.isLessEqualThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_2900
     * @tc.name testFloatIsLessEqualThan029
     * @tc.desc Verify isLessEqualThan( new Float(-3.0f),  new Float(-2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.0f);
      const b: Float = new Float(-2.0f);
      const c: Float = new Float(-1.0f);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isLessEqualThan(c)).assertTrue();
      expect(a.isLessEqualThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3000
     * @tc.name testFloatIsLessEqualThan030
     * @tc.desc Verify isLessEqualThan( new Float(Float.MIN_VALUE / 2.0f),  new Float(Float.MIN_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3100
     * @tc.name testFloatIsLessEqualThan031
     * @tc.desc Verify isLessEqualThan( new Float(0.0f),  new Float(Float.MIN_VALUE / 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
      const b: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3200
     * @tc.name testFloatIsLessEqualThan032
     * @tc.desc Verify isLessEqualThan( new Float(Float.MIN_VALUE),  new Float(Float.MIN_VALUE / 2.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3300
     * @tc.name testFloatIsLessEqualThan033
     * @tc.desc Verify isLessEqualThan( new Float(1.0f),  new Float(1.0f + Float.EPSILON / 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON / 2.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3400
     * @tc.name testFloatIsLessEqualThan034
     * @tc.desc Verify isLessEqualThan( new Float(1.0f),  new Float(1.0f + Float.EPSILON * 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3500
     * @tc.name testFloatIsLessEqualThan035
     * @tc.desc Verify isLessEqualThan( new Float(1.0f + Float.EPSILON * 2.0f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3600
     * @tc.name testFloatIsLessEqualThan036
     * @tc.desc Verify isLessEqualThan( new Float(1.0e10f),  new Float(1.0e10f + 1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3700
     * @tc.name testFloatIsLessEqualThan037
     * @tc.desc Verify isLessEqualThan( new Float(1.0e10f + 1.0f),  new Float(1.0e10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f + 1.0f);
      const b: Float = new Float(1.0e10f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3800
     * @tc.name testFloatIsLessEqualThan038
     * @tc.desc Verify isLessEqualThan( new Float(1.0e-10f),  new Float(2.0e-10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-10f);
      const b: Float = new Float(2.0e-10f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_3900
     * @tc.name testFloatIsLessEqualThan039
     * @tc.desc Verify isLessEqualThan( new Float(2.0e-10f),  new Float(1.0e-10f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0e-10f);
      const b: Float = new Float(1.0e-10f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4000
     * @tc.name testFloatIsLessEqualThan040
     * @tc.desc Verify isLessEqualThan( new Float(3.14f),  new Float(3.14f)) returns true (single call)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(3.14f);
      expect(a.compareTo(b)).assertEqual(0);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4100
     * @tc.name testFloatIsLessEqualThan041
     * @tc.desc Verify isLessEqualThan(10.0f, 5.0f) returns false and compareTo returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
      const b: Float = new Float(5.0f);
      expect(a.compareTo(b)).assertEqual(1);
      expect(a.isLessEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4200
     * @tc.name testFloatIsLessEqualThan042
     * @tc.desc Verify isLessEqualThan idempotency: same input multiple calls return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const firstResult: boolean = a.isLessEqualThan(b);
      const secondResult: boolean = a.isLessEqualThan(b);
      const thirdResult: boolean = a.isLessEqualThan(b);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4300
     * @tc.name testFloatIsLessEqualThan043
     * @tc.desc Verify isLessEqualThan( new Float(1.5f),  new Float(2.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
      const b: Float = new Float(2.5f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4400
     * @tc.name testFloatIsLessEqualThan044
     * @tc.desc Verify isLessEqualThan( new Float(1.5),  new Float(2.5)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5);
      const b: Float = new Float(2.5);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4500
     * @tc.name testFloatIsLessEqualThan045
     * @tc.desc Verify isLessEqualThan( new Float(),  new Float()) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4600
     * @tc.name testFloatIsLessEqualThan046
     * @tc.desc Verify isLessEqualThan( new Float(Float.MAX_SAFE_INTEGER),  new Float(Float.MAX_SAFE_INTEGER)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4700
     * @tc.name testFloatIsLessEqualThan047
     * @tc.desc Verify isLessEqualThan(new Float(Float.MAX_SAFE_INTEGER), new Float(Float.MAX_SAFE_INTEGER + 1.0f)) returns boolean true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4800
     * @tc.name testFloatIsLessEqualThan048
     * @tc.desc Verify isLessEqualThan( new Float(Float.MAX_SAFE_INTEGER + 1.0f),  new Float(Float.MAX_SAFE_INTEGER)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_4900
     * @tc.name testFloatIsLessEqualThan049
     * @tc.desc Verify isLessEqualThan( new Float(Float.DELTA / 2.0f),  new Float(Float.DELTA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA / 2.0f);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5000
     * @tc.name testFloatIsLessEqualThan050
     * @tc.desc Verify isLessEqualThan( new Float(Float.DELTA),  new Float(Float.DELTA / 2.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(Float.DELTA / 2.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5100
     * @tc.name testFloatIsLessEqualThan051
     * @tc.desc Verify isLessEqualThan( new Float(Float.MAX_VALUE),  new Float(Float.POSITIVE_INFINITY)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5200
     * @tc.name testFloatIsLessEqualThan052
     * @tc.desc Verify isLessEqualThan( new Float(Float.NEGATIVE_INFINITY),  new Float(Float.MAX_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5300
     * @tc.name testFloatIsLessEqualThan053
     * @tc.desc Verify isLessEqualThan( new Float(Float.POSITIVE_INFINITY),  new Float(Float.MAX_VALUE)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5400
     * @tc.name testFloatIsLessEqualThan054
     * @tc.desc Verify isLessEqualThan( new Float(values[i]),  new Float(values[j])) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: float[] = [-3.0f, -1.0f, 0.0f, 1.0f, 3.0f, 100.0f];
      let allSymmetric: boolean = true;
      for (let i = 0; i < values.length; i++) {
        for (let j = 0; j < values.length; j++) {
          const a: Float = new Float(values[i]);
          const b: Float = new Float(values[j]);
          if (a.isLessEqualThan(b) !== b.isGreaterEqualThan(a)) {
            allSymmetric = false;
          }
        }
      }
      expect(allSymmetric).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5500
     * @tc.name testFloatIsLessEqualThan055
     * @tc.desc Verify isLessEqualThan( new Float(1.5f),  new Float(3.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
      const b: Float = new Float(3.0f);
      expect(a.isLessEqualThan(b)).assertTrue();
      expect(b.isLessEqualThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5600
     * @tc.name testFloatIsLessEqualThan056
     * @tc.desc Verify isLessEqualThan( new Float(values[i]),  new Float(values[j])) returns true via compareTo()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: float[] = [-5.0f, -1.0f, 0.0f, 1.0f, 5.0f, 10.0f];
      let allConsistent: boolean = true;
      for (let i = 0; i < values.length; i++) {
        for (let j = 0; j < values.length; j++) {
          const a: Float = new Float(values[i]);
          const b: Float = new Float(values[j]);
          const leResult: boolean = a.isLessEqualThan(b);
          const cmpResult: boolean = a.compareTo(b) <= 0;
          if (leResult !== cmpResult) {
            allConsistent = false;
          }
        }
      }
      expect(allConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5700
     * @tc.name testFloatIsLessEqualThan057
     * @tc.desc Verify isLessEqualThan( new Float(2147483647),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5800
     * @tc.name testFloatIsLessEqualThan058
     * @tc.desc Verify isLessEqualThan( new Float(-2147483648),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_5900
     * @tc.name testFloatIsLessEqualThan059
     * @tc.desc Verify isLessEqualThan( new Float(127),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6000
     * @tc.name testFloatIsLessEqualThan060
     * @tc.desc Verify isLessEqualThan( new Float(-128),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6100
     * @tc.name testFloatIsLessEqualThan061
     * @tc.desc Verify isLessEqualThan( new Float(32767),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6200
     * @tc.name testFloatIsLessEqualThan062
     * @tc.desc Verify isLessEqualThan( new Float(-32768),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6300
     * @tc.name testFloatIsLessEqualThan063
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6400
     * @tc.name testFloatIsLessEqualThan064
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x40000000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6500
     * @tc.name testFloatIsLessEqualThan065
     * @tc.desc Verify isLessEqualThan( new Float(Float.MAX_VALUE),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSEQUALTHAN_2_6600
     * @tc.name testFloatIsLessEqualThan066
     * @tc.desc Verify isLessEqualThan( new Float(Float.MIN_VALUE),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessEqualThan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessEqualThan(b);
      expect(result).assertTrue();
    });

  });
}
