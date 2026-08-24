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
import Utils from '../../test/Util.test';
class JsonData {
  key: int = 0;
}

export default function FloatMulTest2(): void {
  describe('FloatMulTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0010
     * @tc.name testFloatMul001
     * @tc.desc Verify mul(int 3, int 2, Float new Float(val1)) returns 6.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 3;
      const val2: int = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0020
     * @tc.name testFloatMul002
     * @tc.desc Verify mul result isFinite returns true for (val1, val2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 2147483647;
      const val2: int = 1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0030
     * @tc.name testFloatMul003
     * @tc.desc Verify mul(long 100, long 2, Float new Float(val1)) returns 200.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(200.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0040
     * @tc.name testFloatMul004
     * @tc.desc Verify mul(double 3.0, double 1.5, Float new Float(val1)) returns 4.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 3.0;
      const val2: double = 1.5;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0050
     * @tc.name testFloatMul005
     * @tc.desc Verify mul(float 3.0f, float -2.0f, Float new Float(val1)) returns -6.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 3.0f;
      const val2: float = -2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(-6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0060
     * @tc.name testFloatMul006
     * @tc.desc Verify mul(float 3.0f, float 4.0f, Float new Float(val1)) returns 12.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 3.0f;
      const val2: float = 4.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0070
     * @tc.name testFloatMul007
     * @tc.desc Verify mul(float 5.0f, float 1.0e3f, Float new Float(val1)) returns 5000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 5.0f;
      const val2: float = 1.0e3f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(5000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0080
     * @tc.name testFloatMul008
     * @tc.desc Verify mul throws ClassCastError when passing unsupported type 2 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const val: int = 2;
        f.mul(val as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0090
     * @tc.name testFloatMul009
     * @tc.desc Verify mul throws ClassCastError when passing unsupported type 2 as long as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
      f.mul(2 as long as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0100
     * @tc.name testFloatMul010
     * @tc.desc Verify mul throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const bVal: boolean = true;
        f.mul(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0110
     * @tc.name testFloatMul011
     * @tc.desc Verify mul throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const cVal: char = c'a';
        f.mul(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0120
     * @tc.name testFloatMul012
     * @tc.desc Verify mul throws ClassCastError when passing unsupported type '2' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const s: string = '2';
        f.mul(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0130
     * @tc.name testFloatMul013
     * @tc.desc Verify mul throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const obj: Object = new Object();
        f.mul(obj as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0140
     * @tc.name testFloatMul014
     * @tc.desc Verify mul throws ClassCastError when passing unsupported type [1.0, 2.0] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
      f.mul([1.0, 2.0] as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0150
     * @tc.name testFloatMul015
     * @tc.desc Verify mul throws ClassCastError when passing Map as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      try {
      f.mul(map as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0160
     * @tc.name testFloatMul016
     * @tc.desc Verify mul(Float new Float(3.0))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0);
      const original: float = a.toFloat();
      a.mul(new Float(2.0));
      expect(a.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0170
     * @tc.name testFloatMul017
     * @tc.desc Verify mul result isFinite returns false for (3.0, 2.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0);
      const b: Float = new Float(2.0);
      let r: Float = a.mul(b);
      const isSameRef: boolean = r === a;
      expect(isSameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0180
     * @tc.name testFloatMul018
     * @tc.desc Verify mul(new Float(3.0)) returns 24.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Float = new Float(2.0).mul(new Float(3.0)).mul(new Float(4.0));
      expect(r.toFloat()).assertEqual(24.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0190
     * @tc.name testFloatMul019
     * @tc.desc Verify mul(Float new Float(5.0)) returns 15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(5.0);
      const r: Float = val.mul(new Float(3.0));
      expect(r.toFloat()).assertEqual(15.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0200
     * @tc.name testFloatMul020
     * @tc.desc Verify mul throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
      f.mul(longStr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0210
     * @tc.name testFloatMul021
     * @tc.desc Verify Float.mul with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
      f.mul(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0220
     * @tc.name testFloatMul022
     * @tc.desc Verify Float.mul with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
      f.mul(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0230
     * @tc.name testFloatMul023
     * @tc.desc Verify mul throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
      f.mul(matrix as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0240
     * @tc.name testFloatMul024
     * @tc.desc Verify mul throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
      f.mul(list as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0250
     * @tc.name testFloatMul025
     * @tc.desc Verify mul throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bigIntVal: bigint = 123n;
        f.mul(bigIntVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0260
     * @tc.name testFloatMul026
     * @tc.desc Verify mul result isFinite returns true for (valA, valB)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0270
     * @tc.name testFloatMul027
     * @tc.desc Verify mul result isFinite returns true for valA (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0280
     * @tc.name testFloatMul028
     * @tc.desc Verify mul result isFinite returns true for valA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0290
     * @tc.name testFloatMul029
     * @tc.desc Verify mul result isFinite returns true for valB
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0300
     * @tc.name testFloatMul030
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:int=2147483647, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0310
     * @tc.name testFloatMul031
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:int=2147483647, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0320
     * @tc.name testFloatMul032
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:int=-2147483648, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0330
     * @tc.name testFloatMul033
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:int=-2147483648, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0340
     * @tc.name testFloatMul034
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:long=9223372036854775807, valB:int=2147483647)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0350
     * @tc.name testFloatMul035
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:long=-9223372036854775808, valB:int=-2147483648)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0360
     * @tc.name testFloatMul036
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:long=9223372036854775807, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0370
     * @tc.name testFloatMul037
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:long=-9223372036854775808, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0380
     * @tc.name testFloatMul038
     * @tc.desc Verify mul(Float.MAX_VALUE, 2147483647) result isFinite returns false (overflow to Infinity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0390
     * @tc.name testFloatMul039
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:float=Float.MIN_VALUE, valB:int=-2147483648)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MIN_VALUE;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0400
     * @tc.name testFloatMul040
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:short=32767, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0410
     * @tc.name testFloatMul041
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:short=-32768, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = -32768;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0420
     * @tc.name testFloatMul042
     * @tc.desc Verify mul(int 2147483647, float 0.0f, Float new Float(valA)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(0.0f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0430
     * @tc.name testFloatMul043
     * @tc.desc Verify mul(int -2147483648, float 0.0f, Float new Float(valA)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(0.0f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0440
     * @tc.name testFloatMul044
     * @tc.desc Verify mul(float Float.MAX_VALUE, int 0, Float new Float(valA)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(0.0f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0450
     * @tc.name testFloatMul045
     * @tc.desc Verify mul(float Float.MIN_VALUE, int 0, Float new Float(valA)) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MIN_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0460
     * @tc.name testFloatMul046
     * @tc.desc Verify mul(long 9223372036854775807, float 0.0f, Float new Float(valA)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(0.0f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0470
     * @tc.name testFloatMul047
     * @tc.desc Verify mul(short 32767, byte 1, Float new Float(valA)) returns 32767.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(32767f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0480
     * @tc.name testFloatMul048
     * @tc.desc Verify mul(float -1.0f, int 1, Float new Float(valA)) returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = -1.0f;
      const valB: int = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0490
     * @tc.name testFloatMul049
     * @tc.desc Verify mul(int 5, float 3.0f, Float new Float(valA)) returns 15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = 3.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0500
     * @tc.name testFloatMul050
     * @tc.desc Verify mul(float 1.5f, int 2, Float new Float(valA)) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 1.5f;
      const valB: int = 2;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0510
     * @tc.name testFloatMul051
     * @tc.desc Verify mul(float 10.0f, long 20, Float new Float(valA)) returns 200.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 10.0f;
      const valB: long = 20;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0520
     * @tc.name testFloatMul052
     * @tc.desc Verify mul(byte 3, int 7, Float new Float(valA)) returns 21.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 3;
      const valB: int = 7;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0530
     * @tc.name testFloatMul053
     * @tc.desc Verify mul(long 1000, float 0.5f, Float new Float(valA)) returns 500.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 1000;
      const valB: float = 0.5f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.toFloat()).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0540
     * @tc.name testFloatMul054
     * @tc.desc Verify mul result isFinite returns false for valA (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0550
     * @tc.name testFloatMul055
     * @tc.desc Verify mul result isFinite returns true via assertTrue() (valA:int=5, valB:float=Float.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.mul(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0560
     * @tc.name testFloatMul056
     * @tc.desc Verify mul throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.mul({} as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0570
     * @tc.name testFloatMul057
     * @tc.desc Verify Float.mul with JsonData object throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      const f: Float = new Float(1.0);
      try {
      f.mul(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0580
     * @tc.name testFloatMul058
     * @tc.desc Verify mul throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
      f.mul(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0590
     * @tc.name testFloatMul059
     * @tc.desc Verify mul throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
      f.mul(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0600
     * @tc.name testFloatMul060
     * @tc.desc Verify mul throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
      f.mul(rec as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0610
     * @tc.name testFloatMul061
     * @tc.desc Verify mul throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
      f.mul(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

