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
class JsonData {
  key: int = 0;
}

export default function FloatIsGreaterEqualThanTest2(): void {
  describe('FloatIsGreaterEqualThanTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0100
     * @tc.name testFloatIsGreaterEqualThan001
     * @tc.desc Verify isGreaterEqualThan(int 2147483647, Float new Float(val), Float new Float(val)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0200
     * @tc.name testFloatIsGreaterEqualThan002
     * @tc.desc Verify isGreaterEqualThan(long 100, long 50, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 50;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0300
     * @tc.name testFloatIsGreaterEqualThan003
     * @tc.desc Verify isGreaterEqualThan(double 3.0, double 2.0, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 3.0;
      const val2: double = 2.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0400
     * @tc.name testFloatIsGreaterEqualThan004
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        const bVal: boolean = true;
        f.isGreaterEqualThan(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0500
     * @tc.name testFloatIsGreaterEqualThan005
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        const cVal: char = c'a';
        f.isGreaterEqualThan(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0600
     * @tc.name testFloatIsGreaterEqualThan006
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing digit string '1' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        const s: string = '1';
        f.isGreaterEqualThan(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0700
     * @tc.name testFloatIsGreaterEqualThan007
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        const obj: Object = new Object();
        f.isGreaterEqualThan(obj as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0800
     * @tc.name testFloatIsGreaterEqualThan008
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing unsupported type [1.0, 2.0] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      try {
        f.isGreaterEqualThan([1.0, 2.0] as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_0900
     * @tc.name testFloatIsGreaterEqualThan009
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing Map as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      try {
        f.isGreaterEqualThan(map as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1000
     * @tc.name testFloatIsGreaterEqualThan010
     * @tc.desc Verify isGreaterEqualThan(new Float(2.0))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(3.0);
      const original: float = f.toFloat();
      f.isGreaterEqualThan(new Float(2.0));
      expect(f.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1100
     * @tc.name testFloatIsGreaterEqualThan011
     * @tc.desc Verify isGreaterEqualThan(Float new Float(42.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.isGreaterEqualThan(new Float(42.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1200
     * @tc.name testFloatIsGreaterEqualThan012
     * @tc.desc Verify isGreaterEqualThan idempotency: multiple calls with the same input return the same boolean result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0);
      const b: Float = new Float(2.0);
      const r1: boolean = a.isGreaterEqualThan(b);
      const r2: boolean = a.isGreaterEqualThan(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1300
     * @tc.name testFloatIsGreaterEqualThan013
     * @tc.desc Verify isGreaterEqualThan(float 4.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 4.0f;
      const f: Float = new Float(val);
      expect(f.isGreaterEqualThan(new Float(4.0))).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1400
     * @tc.name testFloatIsGreaterEqualThan014
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
        f.isGreaterEqualThan(longStr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1500
     * @tc.name testFloatIsGreaterEqualThan015
     * @tc.desc Verify isGreaterEqualThan with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
        f.isGreaterEqualThan(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1600
     * @tc.name testFloatIsGreaterEqualThan016
     * @tc.desc Verify isGreaterEqualThan with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
        f.isGreaterEqualThan(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1700
     * @tc.name testFloatIsGreaterEqualThan017
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
        f.isGreaterEqualThan(matrix as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1800
     * @tc.name testFloatIsGreaterEqualThan018
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        f.isGreaterEqualThan(list as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_1900
     * @tc.name testFloatIsGreaterEqualThan019
     * @tc.desc Verify isGreaterEqualThan(int 2147483647, short 32767, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2000
     * @tc.name testFloatIsGreaterEqualThan020
     * @tc.desc Verify isGreaterEqualThan(int -2147483648, short 32767, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2100
     * @tc.name testFloatIsGreaterEqualThan021
     * @tc.desc Verify isGreaterEqualThan(int 2147483647, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2200
     * @tc.name testFloatIsGreaterEqualThan022
     * @tc.desc Verify isGreaterEqualThan(long -9223372036854775808, byte -128, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2300
     * @tc.name testFloatIsGreaterEqualThan023
     * @tc.desc Verify isGreaterEqualThan(byte 127, short -32768, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 127;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2400
     * @tc.name testFloatIsGreaterEqualThan024
     * @tc.desc Verify isGreaterEqualThan(int 2147483647, float 0.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2500
     * @tc.name testFloatIsGreaterEqualThan025
     * @tc.desc Verify isGreaterEqualThan(int -2147483648, float 0.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2600
     * @tc.name testFloatIsGreaterEqualThan026
     * @tc.desc Verify isGreaterEqualThan(float Float.MAX_VALUE, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2700
     * @tc.name testFloatIsGreaterEqualThan027
     * @tc.desc Verify isGreaterEqualThan(float Float.NEGATIVE_INFINITY, int 0, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.NEGATIVE_INFINITY;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2800
     * @tc.name testFloatIsGreaterEqualThan028
     * @tc.desc Verify isGreaterEqualThan(byte 127, int 127, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 127;
      const valB: int = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_2900
     * @tc.name testFloatIsGreaterEqualThan029
     * @tc.desc Verify isGreaterEqualThan(int 3, float 5.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 3;
      const valB: float = 5.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.isGreaterEqualThan(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3000
     * @tc.name testFloatIsGreaterEqualThan030
     * @tc.desc Verify isGreaterEqualThan(int 5, long 9223372036854775807, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = 9223372036854775807;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3100
     * @tc.name testFloatIsGreaterEqualThan031
     * @tc.desc Verify isGreaterEqualThan(int 5, long -9223372036854775808, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = -9223372036854775808;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3200
     * @tc.name testFloatIsGreaterEqualThan032
     * @tc.desc Verify isGreaterEqualThan(int 5, float Float.MAX_VALUE, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3300
     * @tc.name testFloatIsGreaterEqualThan033
     * @tc.desc Verify isGreaterEqualThan(int 5, float Float.MIN_VALUE, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3400
     * @tc.name testFloatIsGreaterEqualThan034
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const f2: Float = new Float(1.0);
        f2.isGreaterEqualThan({} as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3500
     * @tc.name testFloatIsGreaterEqualThan035
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        f.isGreaterEqualThan(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3600
     * @tc.name testFloatIsGreaterEqualThan036
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const bigVal: bigint = 123n;
      try {
        f.isGreaterEqualThan(bigVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3700
     * @tc.name testFloatIsGreaterEqualThan037
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        f.isGreaterEqualThan(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3800
     * @tc.name testFloatIsGreaterEqualThan038
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
        f.isGreaterEqualThan(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_3900
     * @tc.name testFloatIsGreaterEqualThan039
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
        f.isGreaterEqualThan(rec as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4000
     * @tc.name testFloatIsGreaterEqualThan040
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        f.isGreaterEqualThan(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4100
     * @tc.name testFloatIsGreaterEqualThan041
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        f.isGreaterEqualThan(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4200
     * @tc.name testFloatIsGreaterEqualThan042
     * @tc.desc Verify isGreaterEqualThan( new Float(3.14f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const result: boolean = a.isGreaterEqualThan(a);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4300
     * @tc.name testFloatIsGreaterEqualThan043
     * @tc.desc Verify isGreaterEqualThan( new Float(-3.14f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.14f);
      const result: boolean = a.isGreaterEqualThan(a);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4400
     * @tc.name testFloatIsGreaterEqualThan044
     * @tc.desc Verify isGreaterEqualThan( new Float(3.0f),  new Float(2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(1.0f);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(b.isGreaterEqualThan(c)).assertTrue();
      expect(a.isGreaterEqualThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4500
     * @tc.name testFloatIsGreaterEqualThan045
     * @tc.desc Verify isGreaterEqualThan( new Float(-1.0f),  new Float(-2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const b: Float = new Float(-2.0f);
      const c: Float = new Float(-3.0f);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(b.isGreaterEqualThan(c)).assertTrue();
      expect(a.isGreaterEqualThan(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4600
     * @tc.name testFloatIsGreaterEqualThan046
     * @tc.desc Verify isGreaterEqualThan(3.14f, 3.14f) with symmetric aGeB && bGeA (test059)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(3.14f);
      const aGeB: boolean = a.isGreaterEqualThan(b);
      const bGeA: boolean = b.isGreaterEqualThan(a);
      expect(aGeB && bGeA).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4700
     * @tc.name testFloatIsGreaterEqualThan047
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MIN_VALUE),  new Float(Float.MIN_VALUE / 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4800
     * @tc.name testFloatIsGreaterEqualThan048
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MIN_VALUE / 2.0f),  new Float(0.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(0.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_4900
     * @tc.name testFloatIsGreaterEqualThan049
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MIN_VALUE / 2.0f),  new Float(Float.MIN_VALUE)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5000
     * @tc.name testFloatIsGreaterEqualThan050
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0f + Float.EPSILON / 2.0f),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f + Float.EPSILON / 2.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5100
     * @tc.name testFloatIsGreaterEqualThan051
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0f),  new Float(1.0f + Float.EPSILON * 2.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5200
     * @tc.name testFloatIsGreaterEqualThan052
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0f + Float.EPSILON * 2.0f),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5300
     * @tc.name testFloatIsGreaterEqualThan053
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0e10f + 1000.0f),  new Float(1.0e10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f + 1000.0f);
      const b: Float = new Float(1.0e10f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5400
     * @tc.name testFloatIsGreaterEqualThan054
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0e10f),  new Float(1.0e10f + 1000.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1000.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5500
     * @tc.name testFloatIsGreaterEqualThan055
     * @tc.desc Verify isGreaterEqualThan( new Float(2.0e-10f),  new Float(1.0e-10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0e-10f);
      const b: Float = new Float(1.0e-10f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5600
     * @tc.name testFloatIsGreaterEqualThan056
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0e-10f),  new Float(2.0e-10f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-10f);
      const b: Float = new Float(2.0e-10f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5700
     * @tc.name testFloatIsGreaterEqualThan057
     * @tc.desc Verify isGreaterEqualThan( new Float(-2.0f),  new Float(-1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2.0f);
      const b: Float = new Float(-1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5800
     * @tc.name testFloatIsGreaterEqualThan058
     * @tc.desc Verify isGreaterEqualThan(2.0f, 1.0f) with symmetric aGeB equals bLeA (test075)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b) === b.isLessEqualThan(a);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_5900
     * @tc.name testFloatIsGreaterEqualThan059
     * @tc.desc Verify isGreaterEqualThan(2.0f, 1.0f) with aGeB assertTrue and aGt assertTrue (test076)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(a.isGreaterThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6000
     * @tc.name testFloatIsGreaterEqualThan060
     * @tc.desc Verify isGreaterEqualThan( new Float(2.0f),  new Float(1.0f))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      const greaterEqual: boolean = a.isGreaterEqualThan(b);
      const compareGeZero: boolean = a.compareTo(b) >= 0;
      expect(greaterEqual).assertEqual(compareGeZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6100
     * @tc.name testFloatIsGreaterEqualThan061
     * @tc.desc Verify isGreaterEqualThan(7.77f, 7.77f) returns true and compareTo returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.77f);
      const b: Float = new Float(7.77f);
      expect(a.compareTo(b)).assertEqual(0);
      expect(a.isGreaterEqualThan(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6200
     * @tc.name testFloatIsGreaterEqualThan062
     * @tc.desc Verify isGreaterEqualThan(5.0f, 10.0f) returns false and compareTo returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0f);
      const b: Float = new Float(10.0f);
      expect(a.compareTo(b)).assertEqual(-1);
      expect(a.isGreaterEqualThan(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6300
     * @tc.name testFloatIsGreaterEqualThan063
     * @tc.desc Verify isGreaterEqualThan idempotency: same input multiple calls return the same boolean r
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(1.0f);
      const firstResult: boolean = a.isGreaterEqualThan(b);
      const secondResult: boolean = a.isGreaterEqualThan(b);
      const thirdResult: boolean = a.isGreaterEqualThan(b);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6400
     * @tc.name testFloatIsGreaterEqualThan064
     * @tc.desc Verify isGreaterEqualThan( new Float(2.5f),  new Float(1.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.5f);
      const b: Float = new Float(1.5f);
      const result: boolean = a.isGreaterEqualThan(b);
      const aAfter: Float = new Float(2.5f);
      expect(a.isGreaterEqualThan(aAfter) && aAfter.isGreaterEqualThan(a)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6500
     * @tc.name testFloatIsGreaterEqualThan065
     * @tc.desc Verify isGreaterEqualThan( new Float(2.5),  new Float(1.5)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.5);
      const b: Float = new Float(1.5);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6600
     * @tc.name testFloatIsGreaterEqualThan066
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0f),  new Float()) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float();
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6700
     * @tc.name testFloatIsGreaterEqualThan067
     * @tc.desc Verify isGreaterEqualThan( new Float(),  new Float()) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6800
     * @tc.name testFloatIsGreaterEqualThan068
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MAX_SAFE_INTEGER + 1.0f),  new Float(Float.MAX_SAFE_INTEGER)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_6900
     * @tc.name testFloatIsGreaterEqualThan069
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MAX_SAFE_INTEGER),  new Float(Float.MAX_SAFE_INTEGER + 1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7000
     * @tc.name testFloatIsGreaterEqualThan070
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MAX_SAFE_INTEGER),  new Float(Float.MAX_SAFE_INTEGER)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7100
     * @tc.name testFloatIsGreaterEqualThan071
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.POSITIVE_INFINITY),  new Float(Float.MAX_VALUE)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7200
     * @tc.name testFloatIsGreaterEqualThan072
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MAX_VALUE),  new Float(Float.NEGATIVE_INFINITY)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7300
     * @tc.name testFloatIsGreaterEqualThan073
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MAX_VALUE),  new Float(Float.POSITIVE_INFINITY)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7400
     * @tc.name testFloatIsGreaterEqualThan074
     * @tc.desc Verify isGreaterEqualThan( new Float(2.0f),  new Float(8.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(8.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7500
     * @tc.name testFloatIsGreaterEqualThan075
     * @tc.desc Verify isGreaterEqualThan( new Float(1.0e-37f),  new Float(1.0e-38f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-37f);
      const b: Float = new Float(1.0e-38f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7600
     * @tc.name testFloatIsGreaterEqualThan076
     * @tc.desc Verify isGreaterEqualThan( new Float(values[i]),  new Float(values[j])) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: float[] = [-3.0f, -1.0f, 0.0f, 1.0f, 3.0f, 100.0f];
      let allSymmetric: boolean = true;
      for (let i = 0; i < values.length; i++) {
        for (let j = 0; j < values.length; j++) {
          const a: Float = new Float(values[i]);
          const b: Float = new Float(values[j]);
          if (a.isGreaterEqualThan(b) !== b.isLessEqualThan(a)) {
            allSymmetric = false;
          }
        }
      }
      expect(allSymmetric).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7700
     * @tc.name testFloatIsGreaterEqualThan077
     * @tc.desc Verify isGreaterEqualThan( new Float(3.0f),  new Float(1.5f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(1.5f);
      expect(a.isGreaterEqualThan(b)).assertTrue();
      expect(b.isGreaterEqualThan(a)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7800
     * @tc.name testFloatIsGreaterEqualThan078
     * @tc.desc Verify isGreaterEqualThan( new Float(values[i]),  new Float(values[j])) returns true via compareTo()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: float[] = [-5.0f, -1.0f, 0.0f, 1.0f, 5.0f, 10.0f];
      let allConsistent: boolean = true;
      for (let i = 0; i < values.length; i++) {
        for (let j = 0; j < values.length; j++) {
          const a: Float = new Float(values[i]);
          const b: Float = new Float(values[j]);
          const geResult: boolean = a.isGreaterEqualThan(b);
          const cmpResult: boolean = a.compareTo(b) >= 0;
          if (geResult !== cmpResult) {
            allConsistent = false;
          }
        }
      }
      expect(allConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_7900
     * @tc.name testFloatIsGreaterEqualThan079
     * @tc.desc Verify isGreaterEqualThan( new Float(2147483647),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8000
     * @tc.name testFloatIsGreaterEqualThan080
     * @tc.desc Verify isGreaterEqualThan( new Float(-2147483648),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8100
     * @tc.name testFloatIsGreaterEqualThan081
     * @tc.desc Verify isGreaterEqualThan( new Float(127),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8200
     * @tc.name testFloatIsGreaterEqualThan082
     * @tc.desc Verify isGreaterEqualThan( new Float(-128),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8300
     * @tc.name testFloatIsGreaterEqualThan083
     * @tc.desc Verify isGreaterEqualThan( new Float(32767),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8400
     * @tc.name testFloatIsGreaterEqualThan084
     * @tc.desc Verify isGreaterEqualThan( new Float(-32768),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8500
     * @tc.name testFloatIsGreaterEqualThan085
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8600
     * @tc.name testFloatIsGreaterEqualThan086
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x00000001));
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8700
     * @tc.name testFloatIsGreaterEqualThan087
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.NEGATIVE_INFINITY),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8800
     * @tc.name testFloatIsGreaterEqualThan088
     * @tc.desc Verify isGreaterEqualThan( new Float(-0.0f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_8900
     * @tc.name testFloatIsGreaterEqualThan089
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MAX_VALUE),  new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_9000
     * @tc.name testFloatIsGreaterEqualThan090
     * @tc.desc Verify isGreaterEqualThan( new Float(Float.MIN_VALUE),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(1.0f);
      const result: boolean = a.isGreaterEqualThan(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_ISGREATEREQUALTHAN_2_9100
     * @tc.name testFloatIsGreaterEqualThan091
     * @tc.desc Verify isGreaterEqualThan throws ClassCastError when passing null as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatIsGreaterEqualThan091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.isGreaterEqualThan(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

  });
}
