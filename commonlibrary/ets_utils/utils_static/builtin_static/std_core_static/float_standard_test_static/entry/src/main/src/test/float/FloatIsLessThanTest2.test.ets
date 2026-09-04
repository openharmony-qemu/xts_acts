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

export default function FloatIsLessThanTest2(): void {
  describe('FloatIsLessThanTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0100
     * @tc.name testFloatIsLessThan001
     * @tc.desc Verify isLessThan(int 2, int 2, Float new Float(val1)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 2;
      const val2: int = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0200
     * @tc.name testFloatIsLessThan002
     * @tc.desc Verify isLessThan(int 2147483647, Float new Float(val), Float new Float(val)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0300
     * @tc.name testFloatIsLessThan003
     * @tc.desc Verify isLessThan(long 50, long 100, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 50;
      const val2: long = 100;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0400
     * @tc.name testFloatIsLessThan004
     * @tc.desc Verify isLessThan(double 1.0, double 2.0, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 1.0;
      const val2: double = 2.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0500
     * @tc.name testFloatIsLessThan005
     * @tc.desc Verify isLessThan(new Float(2.0))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const original: float = f.toFloat();
      f.isLessThan(new Float(2.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0600
     * @tc.name testFloatIsLessThan006
     * @tc.desc Verify isLessThan(Float new Float(42.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.isLessThan(new Float(43.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0700
     * @tc.name testFloatIsLessThan007
     * @tc.desc Verify isLessThan idempotency: multiple calls with the same input return the same boolean result (1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0);
      const b: Float = new Float(2.0);
      const r1: boolean = a.isLessThan(b);
      const r2: boolean = a.isLessThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0800
     * @tc.name testFloatIsLessThan008
     * @tc.desc Verify isLessThan(float 4.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.isLessThan(new Float(5.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_0900
     * @tc.name testFloatIsLessThan009
     * @tc.desc Verify isLessThan(int -2147483648, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1000
     * @tc.name testFloatIsLessThan010
     * @tc.desc Verify isLessThan(int 2147483647, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1100
     * @tc.name testFloatIsLessThan011
     * @tc.desc Verify isLessThan(int -2147483648, short 32767, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1200
     * @tc.name testFloatIsLessThan012
     * @tc.desc Verify isLessThan(long -9223372036854775808, int -2147483648, Float new Float(valA), Float new Float(valB))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1300
     * @tc.name testFloatIsLessThan013
     * @tc.desc Verify isLessThan(byte 127, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 127;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1400
     * @tc.name testFloatIsLessThan014
     * @tc.desc Verify isLessThan(int -2147483648, float 0.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1500
     * @tc.name testFloatIsLessThan015
     * @tc.desc Verify isLessThan(int 2147483647, float 0.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1600
     * @tc.name testFloatIsLessThan016
     * @tc.desc Verify isLessThan(float Float.NEGATIVE_INFINITY, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.NEGATIVE_INFINITY;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1700
     * @tc.name testFloatIsLessThan017
     * @tc.desc Verify isLessThan(float Float.MAX_VALUE, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1800
     * @tc.name testFloatIsLessThan018
     * @tc.desc Verify isLessThan(short -32768, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = -32768;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_1900
     * @tc.name testFloatIsLessThan019
     * @tc.desc Verify isLessThan(int 3, float 5.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 3;
      const valB: float = 5.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2000
     * @tc.name testFloatIsLessThan020
     * @tc.desc Verify isLessThan(float 5.0f, int 5, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 5.0f;
      const valB: int = 5;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2100
     * @tc.name testFloatIsLessThan021
     * @tc.desc Verify isLessThan(int 5, long 9223372036854775807, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = 9223372036854775807;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2200
     * @tc.name testFloatIsLessThan022
     * @tc.desc Verify isLessThan(int 5, long -9223372036854775808, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = -9223372036854775808;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2300
     * @tc.name testFloatIsLessThan023
     * @tc.desc Verify isLessThan(int 5, float Float.MAX_VALUE, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2400
     * @tc.name testFloatIsLessThan024
     * @tc.desc Verify isLessThan(int 5, float Float.MIN_VALUE, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2500
     * @tc.name testFloatIsLessThan025
     * @tc.desc Verify isLessThan(int 5, byte 12, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = 12 as byte;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2600
     * @tc.name testFloatIsLessThan026
     * @tc.desc Verify isLessThan(int 5, byte -128, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = -128 as byte;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isLessThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2700
     * @tc.name testFloatIsLessThan027
     * @tc.desc Verify isLessThan( new Float(3.14f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const result: boolean = a.isLessThan(a);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2800
     * @tc.name testFloatIsLessThan028
     * @tc.desc Verify isLessThan( new Float(-3.14f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.14f);
      const result: boolean = a.isLessThan(a);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_2900
     * @tc.name testFloatIsLessThan029
     * @tc.desc Verify isLessThan( new Float(1.0f),  new Float(2.0f)) returns true (chained 3 elements)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(3.0f);
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isLessThan(c)).assertTrue();
      expect(a.isLessThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3000
     * @tc.name testFloatIsLessThan030
     * @tc.desc Verify isLessThan( new Float(-3.0f),  new Float(-2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.0f);
      const b: Float = new Float(-2.0f);
      const c: Float = new Float(-1.0f);
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isLessThan(c)).assertTrue();
      expect(a.isLessThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3100
     * @tc.name testFloatIsLessThan031
     * @tc.desc Verify isLessThan( new Float(1.0f),  new Float(3.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(3.0f);
      const c: Float = new Float(2.0f);
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isLessThan(c)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3200
     * @tc.name testFloatIsLessThan032
     * @tc.desc Verify isLessThan( new Float(1.0f),  new Float(2.0f)) equaling notLessEqual
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const lessThan: boolean = a.isLessThan(b);
      let notLessEqual = !b.isLessEqualThan(a);
      expect(lessThan).assertEqual(notLessEqual);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3300
     * @tc.name testFloatIsLessThan033
     * @tc.desc Verify isLessThan( new Float(Float.MIN_VALUE / 2.0f),  new Float(Float.MIN_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3400
     * @tc.name testFloatIsLessThan034
     * @tc.desc Verify isLessThan( new Float(0.0f),  new Float(Float.MIN_VALUE / 2.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
      const b: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3500
     * @tc.name testFloatIsLessThan035
     * @tc.desc Verify isLessThan( new Float(Float.MIN_VALUE / 2.0f),  new Float(0.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(0.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3600
     * @tc.name testFloatIsLessThan036
     * @tc.desc Verify isLessThan( new Float(1.0f),  new Float(1.0f + Float.EPSILON / 2.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON / 2.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3700
     * @tc.name testFloatIsLessThan037
     * @tc.desc Verify isLessThan( new Float(1.0f),  new Float(1.0f + Float.EPSILON * 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3800
     * @tc.name testFloatIsLessThan038
     * @tc.desc Verify isLessThan( new Float(1.0e10f),  new Float(1.0e10f + 1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_3900
     * @tc.name testFloatIsLessThan039
     * @tc.desc Verify isLessThan( new Float(1.0e10f),  new Float(1.0e10f + 1000.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1000.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4000
     * @tc.name testFloatIsLessThan040
     * @tc.desc Verify isLessThan( new Float(1.0e-10f),  new Float(2.0e-10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-10f);
      const b: Float = new Float(2.0e-10f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4100
     * @tc.name testFloatIsLessThan041
     * @tc.desc Verify isLessThan( new Float(2.0e-10f),  new Float(1.0e-10f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0e-10f);
      const b: Float = new Float(1.0e-10f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4200
     * @tc.name testFloatIsLessThan042
     * @tc.desc Verify isLessThan idempotency: multiple calls with the same input return the same boolean result (1.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const firstResult: boolean = a.isLessThan(b);
      const secondResult: boolean = a.isLessThan(b);
      const thirdResult: boolean = a.isLessThan(b);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4300
     * @tc.name testFloatIsLessThan043
     * @tc.desc Verify isLessThan( new Float(1.5f),  new Float(2.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
      const b: Float = new Float(2.5f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4400
     * @tc.name testFloatIsLessThan044
     * @tc.desc Verify isLessThan( new Float(1.5),  new Float(2.5)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5);
      const b: Float = new Float(2.5);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4500
     * @tc.name testFloatIsLessThan045
     * @tc.desc Verify isLessThan( new Float(),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4600
     * @tc.name testFloatIsLessThan046
     * @tc.desc Verify isLessThan( new Float(),  new Float()) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4700
     * @tc.name testFloatIsLessThan047
     * @tc.desc Verify isLessThan( new Float(1.0f),  new Float(2.0f)) equaling compareResult
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const lessThan: boolean = a.isLessThan(b);
      const compareResult: boolean = a.compareTo(b) === -1;
      expect(lessThan).assertEqual(compareResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4800
     * @tc.name testFloatIsLessThan048
     * @tc.desc Verify isLessThan(2.0f, 1.0f) returns false and compareTo returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      expect(a.isLessThan(b)).assertFalse();
      expect(a.compareTo(b)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_4900
     * @tc.name testFloatIsLessThan049
     * @tc.desc Verify isLessThan( new Float(Float.DELTA),  new Float(Float.DELTA * 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(Float.DELTA * 2.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5000
     * @tc.name testFloatIsLessThan050
     * @tc.desc Verify isLessThan( new Float(Float.DELTA * 2.0f),  new Float(Float.DELTA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA * 2.0f);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5100
     * @tc.name testFloatIsLessThan051
     * @tc.desc Verify isLessThan( new Float(Float.NEGATIVE_INFINITY),  new Float(Float.MAX_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5200
     * @tc.name testFloatIsLessThan052
     * @tc.desc Verify isLessThan( new Float(Float.MAX_SAFE_INTEGER),  new Float(Float.MAX_SAFE_INTEGER + 1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5300
     * @tc.name testFloatIsLessThan053
     * @tc.desc Verify isLessThan( new Float(Float.MAX_SAFE_INTEGER + 1.0f),  new Float(Float.MAX_SAFE_INTEGER)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5400
     * @tc.name testFloatIsLessThan054
     * @tc.desc Verify isLessThan(-5.0f, 5.0f) returns true and compareTo returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
      const b: Float = new Float(5.0f);
      expect(a.compareTo(b)).assertEqual(-1);
      expect(a.isLessThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5500
     * @tc.name testFloatIsLessThan055
     * @tc.desc Verify isLessThan(7.77f, 7.77f) returns false and compareTo returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.77f);
      const b: Float = new Float(7.77f);
      expect(a.compareTo(b)).assertEqual(0);
      expect(a.isLessThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5600
     * @tc.name testFloatIsLessThan056
     * @tc.desc Verify isLessThan( new Float(-Float.MAX_VALUE),  new Float(-1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-Float.MAX_VALUE);
      const b: Float = new Float(-1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5700
     * @tc.name testFloatIsLessThan057
     * @tc.desc Verify isLessThan( new Float(-1.0f),  new Float(-Float.MAX_VALUE)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const b: Float = new Float(-Float.MAX_VALUE);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5800
     * @tc.name testFloatIsLessThan058
     * @tc.desc Verify isLessThan( new Float(values[i]),  new Float(values[j])) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: float[] = [-3.0f, -1.0f, 0.0f, 1.0f, 3.0f, 100.0f];
      let allSymmetric: boolean = true;
      for (let i = 0; i < values.length; i++) {
        for (let j = 0; j < values.length; j++) {
          const a: Float = new Float(values[i]);
          const b: Float = new Float(values[j]);
          if (a.isLessThan(b) !== b.isGreaterThan(a)) {
            allSymmetric = false;
            expect(allSymmetric).assertTrue();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_5900
     * @tc.name testFloatIsLessThan059
     * @tc.desc Verify isLessThan( new Float(1.5f),  new Float(3.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5f);
      const b: Float = new Float(3.0f);
      expect(a.isLessThan(b)).assertTrue();
      expect(b.isLessThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6000
     * @tc.name testFloatIsLessThan060
     * @tc.desc Verify isLessThan( new Float(1.0e-5f),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6100
     * @tc.name testFloatIsLessThan061
     * @tc.desc Verify isLessThan( new Float(-1.0e3f),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e3f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6200
     * @tc.name testFloatIsLessThan062
     * @tc.desc Verify isLessThan( new Float(-2147483648),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6300
     * @tc.name testFloatIsLessThan063
     * @tc.desc Verify isLessThan( new Float(127),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6400
     * @tc.name testFloatIsLessThan064
     * @tc.desc Verify isLessThan( new Float(-128),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6500
     * @tc.name testFloatIsLessThan065
     * @tc.desc Verify isLessThan( new Float(32767),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6600
     * @tc.name testFloatIsLessThan066
     * @tc.desc Verify isLessThan( new Float(-32768),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6700
     * @tc.name testFloatIsLessThan067
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6800
     * @tc.name testFloatIsLessThan068
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x00000001));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_6900
     * @tc.name testFloatIsLessThan069
     * @tc.desc Verify isLessThan( new Float(Float.MAX_VALUE),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_7000
     * @tc.name testFloatIsLessThan070
     * @tc.desc Verify isLessThan( new Float(Float.MIN_VALUE),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_7100
     * @tc.name testFloatIsLessThan071
     * @tc.desc Verify isLessThan( new Float(-Float.MAX_SAFE_INTEGER),  new Float(0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(0.0f);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_7200
     * @tc.name testFloatIsLessThan072
     * @tc.desc Verify isLessThan( new Float(0.0f),  new Float(Float.DELTA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_7300
     * @tc.name testFloatIsLessThan073
     * @tc.desc Verify isLessThan with Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isLessThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISLESSTHAN_2_7400
     * @tc.name testFloatIsLessThan074
     * @tc.desc Verify isLessThan with Float.DELTA and Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsLessThan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(Float.EPSILON);
      const result: boolean = a.isLessThan(b);
      expect(result).assertFalse();
    });

  });
}
