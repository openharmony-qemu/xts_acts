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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0620
     * @tc.name testFloatMul062
     * @tc.desc Verify mul throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        f.mul(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0630
     * @tc.name testFloatMul063
     * @tc.desc Verify mul associativity: (2.0f * 3.0f) * 4.0f equals 2.0f * (3.0f * 4.0f), both return 24.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(3.0f);
      const c: Float = new Float(4.0f);
      let left = (a.mul(b)).mul(c);
      const right: Float = a.mul(b.mul(c));
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0640
     * @tc.name testFloatMul064
     * @tc.desc Verify mul associativity: (-2.0f * 3.0f) * 4.0f equals -2.0f * (3.0f * 4.0f), both return -24.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2.0f);
      const b: Float = new Float(3.0f);
      const c: Float = new Float(4.0f);
      let left = (a.mul(b)).mul(c);
      const right: Float = a.mul(b.mul(c));
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0650
     * @tc.name testFloatMul065
     * @tc.desc Verify mul is commutative: a.mul(b) equals b.mul(a)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(2.86f);
      expect(a.mul(b).toFloat()).assertEqual(b.mul(a).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0660
     * @tc.name testFloatMul066
     * @tc.desc Verify mul is commutative: a.mul(b) equals b.mul(a) for -5.0f and 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
      const b: Float = new Float(3.0f);
      expect(a.mul(b).toFloat()).assertEqual(b.mul(a).toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0670
     * @tc.name testFloatMul067
     * @tc.desc Verify mul with identity element: 42.0f * 1.0f returns 42.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(42.0f);
      const one: Float = new Float(1.0f);
      expect(a.mul(one).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0680
     * @tc.name testFloatMul068
     * @tc.desc Verify mul with identity element: -42.0f * 1.0f returns -42.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-42.0f);
      const one: Float = new Float(1.0f);
      expect(a.mul(one).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0690
     * @tc.name testFloatMul069
     * @tc.desc Verify mul( new Float(7.5f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.5f);
      const zero: Float = new Float(0.0f);
      expect(a.mul(zero).toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0700
     * @tc.name testFloatMul070
     * @tc.desc Verify mul( new Float(-7.5f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-7.5f);
      const zero: Float = new Float(0.0f);
      expect(a.mul(zero).toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0710
     * @tc.name testFloatMul071
     * @tc.desc Verify mul distributivity: 2.0f * (3.0f + 4.0f) equals 2.0f * 3.0f + 2.0f * 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(3.0f);
      const c: Float = new Float(4.0f);
      const left: Float = a.mul(b.add(c));
      const right: Float = a.mul(b).add(a.mul(c));
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0720
     * @tc.name testFloatMul072
     * @tc.desc Verify mul distributivity: 2.0f * (-3.0f + 4.0f) equals 2.0f * -3.0f + 2.0f * 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(-3.0f);
      const c: Float = new Float(4.0f);
      const left: Float = a.mul(b.add(c));
      const right: Float = a.mul(b).add(a.mul(c));
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0730
     * @tc.name testFloatMul073
     * @tc.desc Verify mul(new Float(0.5f)) for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
      const half: Float = new Float(0.5f);
      const result: Float = minVal.mul(half);
      expect(result.toFloat()).assertLargerOrEqual(0.0f);
      expect(result.toFloat()).assertLess(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0740
     * @tc.name testFloatMul074
     * @tc.desc Verify mul(new Float(2.0f)) returns Float.MIN_VALUE * 2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
      const two: Float = new Float(2.0f);
      const result: Float = minVal.mul(two);
      expect(result.toFloat()).assertEqual(Float.MIN_VALUE * 2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0750
     * @tc.name testFloatMul075
     * @tc.desc Verify mul(new Float(0.5f)) returns 5.0e9f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Float = new Float(1.0e10f);
      const small: Float = new Float(0.5f);
      const result: Float = large.mul(small);
      expect(result.toFloat()).assertEqual(5.0e9f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0760
     * @tc.name testFloatMul076
     * @tc.desc Verify mul( new Float(0.1f),  new Float(0.1f)) returns approx 0.01f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.1f);
      const b: Float = new Float(0.1f);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertClose(0.01f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0770
     * @tc.name testFloatMul077
     * @tc.desc Verify mul( new Float(-1.0f),  new Float(-1.0f)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const b: Float = new Float(-1.0f);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0780
     * @tc.name testFloatMul078
     * @tc.desc Verify mul( new Float(1.0f),  new Float(-1.0f)) returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(-1.0f);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0790
     * @tc.name testFloatMul079
     * @tc.desc Verify mul( new Float(-6.0f),  new Float(3.0f)) returns -18.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-6.0f);
      const b: Float = new Float(3.0f);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(-18.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0800
     * @tc.name testFloatMul080
     * @tc.desc Verify mul(new Float(1.5f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
      const factor: Float = new Float(1.5f);
      const result: Float = maxVal.mul(factor);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0810
     * @tc.name testFloatMul081
     * @tc.desc Verify mul associativity: (3.0f * 4.0f) * 5.0f equals 3.0f * (4.0f * 5.0f), both return 60.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(4.0f);
      expect(a.mul(b).toFloat()).assertEqual(a.toFloat() * b.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0820
     * @tc.name testFloatMul082
     * @tc.desc Verify mul(b) returns 12.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float | null = new Float(3.0f);
      const b: Float | null = new Float(4.0f);
      if (a !== null && b !== null) {
        const result: Float = a.mul(b);
        expect(result.toFloat()).assertEqual(12.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0830
     * @tc.name testFloatMul083
     * @tc.desc Verify mul(new Float(5.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultVal: Float = new Float();
      const five: Float = new Float(5.0f);
      const result: Float = defaultVal.mul(five);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0840
     * @tc.name testFloatMul084
     * @tc.desc Verify mul( new Float(2.0f)) returns 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const result: Float = a.mul(new Float(2.0f));
      expect(result.toFloat()).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0850
     * @tc.name testFloatMul085
     * @tc.desc Verify mul(new Float(-1.0f)) returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negOne: Float = new Float(-1.0f);
      const step1: Float = negOne.mul(negOne);
      const result: Float = step1.mul(negOne);
      expect(result.toFloat()).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0860
     * @tc.name testFloatMul086
     * @tc.desc Verify mul(new Float(2.0f)) returns 16.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const two: Float = new Float(2.0f);
      const step1: Float = two.mul(two);
      const step2: Float = step1.mul(two);
      const result: Float = step2.mul(two);
      expect(result.toFloat()).assertEqual(16.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0870
     * @tc.name testFloatMul087
     * @tc.desc Verify mul( new Float(3.0f),  new Float(2.0)) returns 6.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(2.0);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(6.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0880
     * @tc.name testFloatMul088
     * @tc.desc Verify mul(new Float(1.0f)) returns Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafe: Float = new Float(Float.MAX_SAFE_INTEGER);
      const one: Float = new Float(1.0f);
      const result: Float = maxSafe.mul(one);
      expect(result.toFloat()).assertEqual(Float.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0890
     * @tc.name testFloatMul089
     * @tc.desc Verify mul(new Float(3.0f)) returns 120.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(2.0f).mul(new Float(3.0f)).mul(new Float(4.0f)).mul(new Float(5.0f));
      expect(result.toFloat()).assertEqual(120.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0900
     * @tc.name testFloatMul090
     * @tc.desc Verify mul( new Float(2.0f),  new Float(4.0f)) returns 64.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(4.0f);
      const c: Float = new Float(8.0f);
      const step1: Float = a.mul(b);
      const result: Float = step1.mul(c);
      expect(result.toFloat()).assertEqual(64.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0910
     * @tc.name testFloatMul091
     * @tc.desc Verify mul( new Float(2.0f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
      const val: Float = new Float(2.0f);
      const result: Float = inf.mul(val);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0920
     * @tc.name testFloatMul092
     * @tc.desc Verify mul( new Float(2.0f)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
      const val: Float = new Float(2.0f);
      const result: Float = negInf.mul(val);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0930
     * @tc.name testFloatMul093
     * @tc.desc Verify mul( new Float(1.0f)) is NaN for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: Float = new Float(Float.NaN);
      const val: Float = new Float(1.0f);
      const result: Float = nan.mul(val);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0940
     * @tc.name testFloatMul094
     * @tc.desc Verify chained mul then add() on Float(2.0f) returns 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(2.0f).mul(new Float(3.0f)).add(new Float(4.0f));
      expect(result.toFloat()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0950
     * @tc.name testFloatMul095
     * @tc.desc Verify chained mul then sub() on Float(5.0f) returns 10.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(5.0f).mul(new Float(3.0f)).sub(new Float(5.0f));
      expect(result.toFloat()).assertEqual(10.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0960
     * @tc.name testFloatMul096
     * @tc.desc Verify chained mul then div() on Float(6.0f) returns 12.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(6.0f).mul(new Float(4.0f)).div(new Float(2.0f));
      expect(result.toFloat()).assertEqual(12.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0970
     * @tc.name testFloatMul097
     * @tc.desc Verify mul result isFinite returns true for (2.0f, 3.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(2.0f).mul(new Float(3.0f));
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0980
     * @tc.name testFloatMul098
     * @tc.desc Verify mul(new Float(3.0f)) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(2.0f).mul(new Float(3.0f));
      expect(result.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_0990
     * @tc.name testFloatMul099
     * @tc.desc Verify mul is immutable operation, original Float instance value will not be changed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(3.0f).mul(new Float(4.0f));
      const floatVal: float = result.toFloat();
      expect(floatVal).assertEqual(12.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1000
     * @tc.name testFloatMul100
     * @tc.desc Verify mul( new Float(1.0f)) returns Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const eps: Float = new Float(Float.EPSILON);
      const result: Float = a.mul(eps);
      expect(result.toFloat()).assertEqual(Float.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1010
     * @tc.name testFloatMul101
     * @tc.desc Verify mul( new Float(2.0f))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const delta: Float = new Float(Float.DELTA);
      const result: Float = a.mul(delta);
      expect(result.toFloat()).assertLarger(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1020
     * @tc.name testFloatMul102
     * @tc.desc Verify mul(new Float(-2.0f)) returns 24.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(1.0f).mul(new Float(-2.0f)).mul(new Float(3.0f)).mul(new Float(-4.0f));
      expect(result.toFloat()).assertEqual(24.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1030
     * @tc.name testFloatMul103
     * @tc.desc Verify mul(new Float(2.0f)) returns 32.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let product: Float = new Float(1.0f);
      const factor: Float = new Float(2.0f);
      for (let i = 0; i < 5; i++) {
        product = product.mul(factor);
      }
      expect(product.toFloat()).assertEqual(32.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1040
     * @tc.name testFloatMul104
     * @tc.desc Verify mul( new Float(1.0f)) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(1.0f);
      const nan: Float = new Float(Float.NaN);
      const result: Float = val.mul(nan);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1050
     * @tc.name testFloatMul105
     * @tc.desc Verify mul( new Float(),  new Float()) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1060
     * @tc.name testFloatMul106
     * @tc.desc Verify mul idempotency: same input multiple calls return the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.0f);
      const b: Float = new Float(3.0f);
      const c: Float = new Float(4.0f);
      const aOrig: float = a.toFloat();
      const bOrig: float = b.toFloat();
      const cOrig: float = c.toFloat();
      const step1: Float = a.mul(b);
      const result: Float = step1.mul(c);
      expect(a.toFloat()).assertEqual(aOrig);
      expect(b.toFloat()).assertEqual(bOrig);
      expect(c.toFloat()).assertEqual(cOrig);
      expect(result.toFloat()).assertEqual(24.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1070
     * @tc.name testFloatMul107
     * @tc.desc Verify mul(new Float(2.0f)) returns 720.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(1.0f)
      .mul(new Float(2.0f))
      .mul(new Float(3.0f))
      .mul(new Float(4.0f))
      .mul(new Float(5.0f))
      .mul(new Float(6.0f));
      expect(result.toFloat()).assertEqual(720.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1080
     * @tc.name testFloatMul108
     * @tc.desc Verify mul( new Float(10.0f),  new Float(2.0f)) returns approx a.toFloat() / b.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
      const b: Float = new Float(2.0f);
      const reciprocal: Float = new Float(1.0f / b.toFloat());
      const result: Float = a.mul(reciprocal);
      expect(result.toFloat()).assertClose(a.toFloat() / b.toFloat(), 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1090
     * @tc.name testFloatMul109
     * @tc.desc Verify mul result isFinite returns true for (Float.MAX_VALUE, 0.5f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
      const half: Float = new Float(0.5f);
      const result: Float = maxVal.mul(half);
      expect(result.isFinite()).assertTrue();
      expect(result.toFloat()).assertLess(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1100
     * @tc.name testFloatMul110
     * @tc.desc Verify mul(new Float(Float.NEGATIVE_INFINITY)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf1: Float = new Float(Float.NEGATIVE_INFINITY);
      const negInf2: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: Float = negInf1.mul(negInf2);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1110
     * @tc.name testFloatMul111
     * @tc.desc Verify mul(new Float(Float.NEGATIVE_INFINITY)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInf: Float = new Float(Float.POSITIVE_INFINITY);
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: Float = posInf.mul(negInf);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1120
     * @tc.name testFloatMul112
     * @tc.desc Verify mul(new Float(1.0f + Float.EPSILON)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
      const factor: Float = new Float(1.0f + Float.EPSILON);
      const result: Float = maxVal.mul(factor);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1130
     * @tc.name testFloatMul113
     * @tc.desc Verify mul result isFinite returns true for (9.0f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(9.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1140
     * @tc.name testFloatMul114
     * @tc.desc Verify mul result isFinite returns true for (-48.0f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-48.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1150
     * @tc.name testFloatMul115
     * @tc.desc Verify mul result isFinite returns true for (1.0e3f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e3f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1160
     * @tc.name testFloatMul116
     * @tc.desc Verify mul result isFinite returns true for (1.0e-5f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1170
     * @tc.name testFloatMul117
     * @tc.desc Verify mul result isFinite returns true for (-1.0e3f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e3f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1180
     * @tc.name testFloatMul118
     * @tc.desc Verify mul result isFinite returns true for (1.0e10f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1190
     * @tc.name testFloatMul119
     * @tc.desc Verify mul result isFinite returns true for (2147483647, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1200
     * @tc.name testFloatMul120
     * @tc.desc Verify mul result isFinite returns true for (-2147483648, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1210
     * @tc.name testFloatMul121
     * @tc.desc Verify mul result isFinite returns true for (127 as byte, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1220
     * @tc.name testFloatMul122
     * @tc.desc Verify mul result isFinite returns true for (-128 as byte, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1230
     * @tc.name testFloatMul123
     * @tc.desc Verify mul result isFinite returns true for (32767 as short, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1240
     * @tc.name testFloatMul124
     * @tc.desc Verify mul result isFinite returns true for (-32768 as short, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1250
     * @tc.name testFloatMul125
     * @tc.desc Verify mul with bitCastFromInt(0x3f800000) constructed operand and zero returns finite result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(result.isFinite()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1260
     * @tc.name testFloatMul126
     * @tc.desc Verify Infinity multiplication: Infinity * Infinity returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1270
     * @tc.name testFloatMul127
     * @tc.desc Verify Infinity multiplication: Infinity * (-1.0f) returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(-1.0f);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1280
     * @tc.name testFloatMul128
     * @tc.desc Verify signed zero multiplication: -0.0f * 0.0f equals -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.mul(b);
      expect(1.0f / result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1290
     * @tc.name testFloatMul129
     * @tc.desc Verify multiplicative identity: a.mul(new Float(1.0f)) equals a
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(42.0f);
      const one: Float = new Float(1.0f);
      const result: Float = a.mul(one);
      expect(result.toFloat()).assertEqual(42.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1300
     * @tc.name testFloatMul130
     * @tc.desc Verify multiplication by zero: a.mul(new Float(0.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(99.99f);
      const zero: Float = new Float(0.0f);
      const result: Float = a.mul(zero);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1310
     * @tc.name testFloatMul131
     * @tc.desc Verify overflow: Float.MAX_VALUE * 2.0f returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(2.0f);
      const result: Float = a.mul(b);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1320
     * @tc.name testFloatMul132
     * @tc.desc Verify Float.mul throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.mul(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1330
     * @tc.name testFloatMul133
     * @tc.desc Verify commutativity property of Float.mul: a.mul(b) equals b.mul(a)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(2.71f);
      const left: float = a.mul(b).toFloat();
      const right: float = b.mul(a).toFloat();
      expect(left).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1340
     * @tc.name testFloatMul134
     * @tc.desc Verify Float.MIN_VALUE multiplied by 0.5f underflows to 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(0.5f);
      const result: float = a.mul(b).toFloat();
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_MUL_2_1350
     * @tc.name testFloatMul135
     * @tc.desc Verify Float.MIN_VALUE multiplied by 2.0f does not underflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatMul135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(2.0f);
      const result: float = a.mul(b).toFloat();
      expect(result).assertLarger(0.0f);
    });

  });
}
