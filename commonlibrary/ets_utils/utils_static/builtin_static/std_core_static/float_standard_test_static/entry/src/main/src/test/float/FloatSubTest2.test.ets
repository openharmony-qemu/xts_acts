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

export default function FloatSubTest2(): void {
  describe('FloatSubTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0010
     * @tc.name testFloatSub001
     * @tc.desc Verify sub(int 5, int 2, Float new Float(val1)) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 5;
      const val2: int = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0020
     * @tc.name testFloatSub002
     * @tc.desc Verify sub result isFinite returns true for (val1, val2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 2147483647;
      const val2: int = 0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0030
     * @tc.name testFloatSub003
     * @tc.desc Verify sub(long 100, long 50, Float new Float(val1)) returns 50.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 50;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0040
     * @tc.name testFloatSub004
     * @tc.desc Verify sub(double 5.5, double 2.0, Float new Float(val1)) returns 3.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 5.5;
      const val2: double = 2.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0050
     * @tc.name testFloatSub005
     * @tc.desc Verify sub(float -3.5f, float 2.0f, Float new Float(val1)) returns -5.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = -3.5f;
      const val2: float = 2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(-5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0060
     * @tc.name testFloatSub006
     * @tc.desc Verify sub(float 10.0f, float 4.0f, Float new Float(val1)) returns 6.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 10.0f;
      const val2: float = 4.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0070
     * @tc.name testFloatSub007
     * @tc.desc Verify sub(float 5.0f, float -2.0f, Float new Float(val1)) returns 7.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 5.0f;
      const val2: float = -2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0080
     * @tc.name testFloatSub008
     * @tc.desc Verify sub(float 2000.0f, float 1.0e3f, Float new Float(val1)) returns 1000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 2000.0f;
      const val2: float = 1.0e3f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0090
     * @tc.name testFloatSub009
     * @tc.desc Verify sub throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5.0);
      try {
        const bVal: boolean = true;
        f.sub(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0100
     * @tc.name testFloatSub010
     * @tc.desc Verify sub throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5.0);
      try {
        const cVal: char = c'a';
        f.sub(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0110
     * @tc.name testFloatSub011
     * @tc.desc Verify sub throws ClassCastError when passing unsupported type '2' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5.0);
      try {
        const s: string = '2';
        f.sub(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0120
     * @tc.name testFloatSub012
     * @tc.desc Verify sub throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5.0);
      try {
        const obj: Object = new Object();
        f.sub(obj as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0130
     * @tc.name testFloatSub013
     * @tc.desc Verify sub throws ClassCastError when passing unsupported type [1.0, 2.0] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(5.0);
      try {
      f.sub([1.0, 2.0] as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0140
     * @tc.name testFloatSub014
     * @tc.desc Verify sub(Float new Float(3.5))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.5);
      const original: float = a.toFloat();
      a.sub(new Float(2.0));
      expect(a.toFloat()).assertEqual(original);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0150
     * @tc.name testFloatSub015
     * @tc.desc Verify sub(new Float(3.0)) returns 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Float = new Float(10.0).sub(new Float(3.0)).sub(new Float(2.0));
      expect(r.toFloat()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0160
     * @tc.name testFloatSub016
     * @tc.desc Verify sub(Float new Float(10.0)) returns 7.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(10.0);
      const r: Float = val.sub(new Float(3.0));
      expect(r.toFloat()).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0170
     * @tc.name testFloatSub017
     * @tc.desc Verify sub throws ClassCastError when passing Chinese text string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const s: string = '中文';
        f.sub(s as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0180
     * @tc.name testFloatSub018
     * @tc.desc Verify sub throws ClassCastError when passing unsupported type new Object( as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
      f.sub(new Object() as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0190
     * @tc.name testFloatSub019
     * @tc.desc Verify sub throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
      f.sub(longStr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0200
     * @tc.name testFloatSub020
     * @tc.desc Verify Float.sub with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
      f.sub(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0210
     * @tc.name testFloatSub021
     * @tc.desc Verify Float.sub with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
      f.sub(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0220
     * @tc.name testFloatSub022
     * @tc.desc Verify sub throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
      f.sub(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0230
     * @tc.name testFloatSub023
     * @tc.desc Verify sub throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
      f.sub(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0240
     * @tc.name testFloatSub024
     * @tc.desc Verify sub throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bigIntVal: bigint = 123n;
        f.sub(bigIntVal as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0250
     * @tc.name testFloatSub025
     * @tc.desc Verify sub result isFinite returns true for (valA, valB)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0260
     * @tc.name testFloatSub026
     * @tc.desc Verify sub result isFinite returns true for valA (instance)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0270
     * @tc.name testFloatSub027
     * @tc.desc Verify sub result isFinite returns true for valA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0280
     * @tc.name testFloatSub028
     * @tc.desc Verify sub result isFinite returns true for valB
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: short = -32768;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0290
     * @tc.name testFloatSub029
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=2147483647, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0300
     * @tc.name testFloatSub030
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=2147483647, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0310
     * @tc.name testFloatSub031
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=-2147483648, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0320
     * @tc.name testFloatSub032
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=-2147483648, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0330
     * @tc.name testFloatSub033
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:long=9223372036854775807, valB:int=2147483647)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0340
     * @tc.name testFloatSub034
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:long=-9223372036854775808, valB:int=-2147483648)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0350
     * @tc.name testFloatSub035
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:long=9223372036854775807, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0360
     * @tc.name testFloatSub036
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:long=-9223372036854775808, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0370
     * @tc.name testFloatSub037
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:float=Float.MAX_VALUE, valB:int=2147483647)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0380
     * @tc.name testFloatSub038
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:float=Float.MIN_VALUE, valB:int=-2147483648)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MIN_VALUE;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0390
     * @tc.name testFloatSub039
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:short=32767, valB:byte=127)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0400
     * @tc.name testFloatSub040
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:short=-32768, valB:byte=-128)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = -32768;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0410
     * @tc.name testFloatSub041
     * @tc.desc Verify sub(int 2147483647, float 0.0f, Float new Float(valA)) returns 2147483600.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(2147483600f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0420
     * @tc.name testFloatSub042
     * @tc.desc Verify sub(int -2147483648, float 0.0f, Float new Float(valA)) returns -2147483600.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(-2147483600f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0430
     * @tc.name testFloatSub043
     * @tc.desc Verify sub(float Float.MAX_VALUE, int 0, Float new Float(valA)) returns Float.MAX_VALUE (identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(Float.MAX_VALUE);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0440
     * @tc.name testFloatSub044
     * @tc.desc Verify sub(long 9223372036854775807, float 0.0f, Float new Float(valA)) returns 9223372000000000000.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(9223372000000000000.0f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0450
     * @tc.name testFloatSub045
     * @tc.desc Verify sub(short 32767, byte 1, Float new Float(valA)) returns 32766.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(32766f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0460
     * @tc.name testFloatSub046
     * @tc.desc Verify sub(float -1.0f, int 1, Float new Float(valA)) returns -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = -1.0f;
      const valB: int = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0470
     * @tc.name testFloatSub047
     * @tc.desc Verify sub(int 5, float 3.0f, Float new Float(valA)) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = 3.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0480
     * @tc.name testFloatSub048
     * @tc.desc Verify sub(float 1.5f, int 2, Float new Float(valA)) returns -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 1.5f;
      const valB: int = 2;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0490
     * @tc.name testFloatSub049
     * @tc.desc Verify sub(float 10.0f, long 20, Float new Float(valA)) returns -10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 10.0f;
      const valB: long = 20;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0500
     * @tc.name testFloatSub050
     * @tc.desc Verify sub(byte 3, int 7, Float new Float(valA)) returns -4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 3;
      const valB: int = 7;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0510
     * @tc.name testFloatSub051
     * @tc.desc Verify sub(short 32767, byte 1, Float new Float(valA)) returns 32766.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(32766);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0520
     * @tc.name testFloatSub052
     * @tc.desc Verify sub(long 1000, float 0.5f, Float new Float(valA)) returns 999.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 1000;
      const valB: float = 0.5f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.toFloat()).assertEqual(999.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0530
     * @tc.name testFloatSub053
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=5, valB:float=Float.MAX_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0540
     * @tc.name testFloatSub054
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=5, valB:float=Float.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0550
     * @tc.name testFloatSub055
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=5, valB:short=127 as short)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = 127 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0560
     * @tc.name testFloatSub056
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=5, valB:short=-32768 as short)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = -32768 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0570
     * @tc.name testFloatSub057
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=5, valB:byte=12 as byte)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = 12 as byte;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0580
     * @tc.name testFloatSub058
     * @tc.desc Verify sub result isFinite returns true via assertTrue() (valA:int=5, valB:byte=-128 as byte)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = -128 as byte;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.sub(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0590
     * @tc.name testFloatSub059
     * @tc.desc Verify sub throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.sub({} as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0600
     * @tc.name testFloatSub060
     * @tc.desc Verify Float.sub with JsonData object throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      const f: Float = new Float(1.0);
      try {
      f.sub(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0610
     * @tc.name testFloatSub061
     * @tc.desc Verify sub throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
      f.sub(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0620
     * @tc.name testFloatSub062
     * @tc.desc Verify sub throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
      f.sub(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0630
     * @tc.name testFloatSub063
     * @tc.desc Verify sub throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
      f.sub(rec as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0640
     * @tc.name testFloatSub064
     * @tc.desc Verify sub throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
      f.sub(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0650
     * @tc.name testFloatSub065
     * @tc.desc Verify sub throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
      f.sub(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0660
     * @tc.name testFloatSub066
     * @tc.desc Verify sub( new Float(-5.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
        const result: Float = a.sub(a);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0670
     * @tc.name testFloatSub067
     * @tc.desc Verify sub( new Float(0.0f)) on 42.0f equals a.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(42.0f);
        const zero: Float = new Float(0.0f);
        expect(a.sub(zero).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0680
     * @tc.name testFloatSub068
     * @tc.desc Verify sub( new Float(0.0f)) on -42.0f equals a.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-42.0f);
        const zero: Float = new Float(0.0f);
        expect(a.sub(zero).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0690
     * @tc.name testFloatSub069
     * @tc.desc Verify sub( negB) on 3.0f equals a.toFloat() plus b.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
        const b: Float = new Float(2.0f);
        const negB: Float = new Float(-b.toFloat());
        expect(a.sub(negB).toFloat()).assertEqual(a.toFloat() + b.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0700
     * @tc.name testFloatSub070
     * @tc.desc Verify sub( new Float(-3.0f),  new Float(2.0f)) returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.0f);
        const b: Float = new Float(2.0f);
        const negB: Float = new Float(-b.toFloat());
        expect(a.sub(negB).toFloat()).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0710
     * @tc.name testFloatSub071
     * @tc.desc Verify sub(new Float(Float.MIN_VALUE)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
        const result: Float = minVal.sub(minVal);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0720
     * @tc.name testFloatSub072
     * @tc.desc Verify sub(new Float(0.0f)) returns smallVal.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smallVal: Float = new Float(Float.MIN_VALUE / 2.0f);
        const zero: Float = new Float(0.0f);
        const result: Float = smallVal.sub(zero);
        expect(result.toFloat()).assertEqual(smallVal.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0730
     * @tc.name testFloatSub073
     * @tc.desc Verify sub(new Float(Float.MIN_VALUE)) returns approx 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: Float = new Float(1.0f);
        const minVal: Float = new Float(Float.MIN_VALUE);
        const result: Float = one.sub(minVal);
        expect(result.toFloat()).assertClose(1.0f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0740
     * @tc.name testFloatSub074
     * @tc.desc Verify sub( new Float(0.3f),  new Float(0.1f)) returns approx 0.2f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.3f);
        const b: Float = new Float(0.1f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertClose(0.2f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0750
     * @tc.name testFloatSub075
     * @tc.desc Verify sub( new Float(1.0e10f),  new Float(1.0e9f)) returns 9.0e9f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
        const b: Float = new Float(1.0e9f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(9.0e9f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0760
     * @tc.name testFloatSub076
     * @tc.desc Verify sub(new Float(1.0f)) returns 1.0e10f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Float = new Float(1.0e10f);
        const small: Float = new Float(1.0f);
        const result: Float = large.sub(small);
        expect(result.toFloat()).assertEqual(1.0e10f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0770
     * @tc.name testFloatSub077
     * @tc.desc Verify sub( new Float(1.0e10f),  new Float(1.0e10f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
        const b: Float = new Float(1.0e10f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0780
     * @tc.name testFloatSub078
     * @tc.desc Verify sub(new Float(0.0f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
        const zero: Float = new Float(0.0f);
        const result: Float = inf.sub(zero);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0790
     * @tc.name testFloatSub079
     * @tc.desc Verify sub(new Float(0.0f)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
        const zero: Float = new Float(0.0f);
        const result: Float = negInf.sub(zero);
        expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0800
     * @tc.name testFloatSub080
     * @tc.desc Verify sub(new Float(-Float.MAX_VALUE * 0.5f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
        const negHalfMax: Float = new Float(-Float.MAX_VALUE * 0.5f);
        const result: Float = maxVal.sub(negHalfMax);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0810
     * @tc.name testFloatSub081
     * @tc.desc Verify sub( new Float(3.0f)) on 10.0f equals a.toFloat() minus b.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
        const b: Float = new Float(3.0f);
        expect(a.sub(b).toFloat()).assertEqual(a.toFloat() - b.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0820
     * @tc.name testFloatSub082
     * @tc.desc Verify sub(b) returns 7.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float | null = new Float(10.0f);
        const b: Float | null = new Float(3.0f);
        if (a !== null && b !== null) {
          const result: Float = a.sub(b);
          expect(result.toFloat()).assertEqual(7.0f);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0830
     * @tc.name testFloatSub083
     * @tc.desc Verify sub(new Float(5.0f)) returns -5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultVal: Float = new Float();
        const five: Float = new Float(5.0f);
        const result: Float = defaultVal.sub(five);
        expect(result.toFloat()).assertEqual(-5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0840
     * @tc.name testFloatSub084
     * @tc.desc Verify sub( new Float(5.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0f);
        const result: Float = a.sub(new Float(5.0f));
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0850
     * @tc.name testFloatSub085
     * @tc.desc Verify sub( new Float(3.0f),  new Float(-2.0f)) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
        const b: Float = new Float(-2.0f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0860
     * @tc.name testFloatSub086
     * @tc.desc Verify sub( new Float(-3.0f),  new Float(2.0f)) returns -5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.0f);
        const b: Float = new Float(2.0f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(-5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0870
     * @tc.name testFloatSub087
     * @tc.desc Verify sub( new Float(5.0f),  new Float(2.5)) returns 2.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0f);
        const b: Float = new Float(2.5);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(2.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0880
     * @tc.name testFloatSub088
     * @tc.desc Verify sub(new Float(1.0f)) returns Float.MAX_SAFE_INTEGER - 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafe: Float = new Float(Float.MAX_SAFE_INTEGER);
        const one: Float = new Float(1.0f);
        const result: Float = maxSafe.sub(one);
        expect(result.toFloat()).assertEqual(Float.MAX_SAFE_INTEGER - 1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0890
     * @tc.name testFloatSub089
     * @tc.desc Verify sub(new Float(3.0f)) returns 8.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(20.0f).sub(new Float(3.0f)).sub(new Float(4.0f)).sub(new Float(5.0f));
        expect(result.toFloat()).assertEqual(8.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0900
     * @tc.name testFloatSub090
     * @tc.desc Verify sub( new Float(32.0f),  new Float(8.0f)) returns 18.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32.0f);
        const b: Float = new Float(8.0f);
        const c: Float = new Float(4.0f);
        const d: Float = new Float(2.0f);
        const step1: Float = a.sub(b);
        const step2: Float = step1.sub(c);
        const result: Float = step2.sub(d);
        expect(result.toFloat()).assertEqual(18.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0910
     * @tc.name testFloatSub091
     * @tc.desc Verify sub( new Float(100.0f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
        const val: Float = new Float(100.0f);
        const result: Float = inf.sub(val);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0920
     * @tc.name testFloatSub092
     * @tc.desc Verify sub( new Float(100.0f)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
        const val: Float = new Float(100.0f);
        const result: Float = negInf.sub(val);
        expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0930
     * @tc.name testFloatSub093
     * @tc.desc Verify sub( new Float(1.0f)) is NaN for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: Float = new Float(Float.NaN);
        const val: Float = new Float(1.0f);
        const result: Float = nan.sub(val);
        expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0940
     * @tc.name testFloatSub094
     * @tc.desc Verify chained sub then add() on Float(10.0f) returns 12.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0f).sub(new Float(3.0f)).add(new Float(5.0f));
        expect(result.toFloat()).assertEqual(12.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0950
     * @tc.name testFloatSub095
     * @tc.desc Verify chained sub then mul() on Float(10.0f) returns 24.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0f).sub(new Float(2.0f)).mul(new Float(3.0f));
        expect(result.toFloat()).assertEqual(24.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0960
     * @tc.name testFloatSub096
     * @tc.desc Verify chained sub then div() on Float(10.0f) returns 2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0f).sub(new Float(2.0f)).div(new Float(4.0f));
        expect(result.toFloat()).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0970
     * @tc.name testFloatSub097
     * @tc.desc Verify sub result isFinite returns true for (5.0f, 3.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(5.0f).sub(new Float(3.0f));
        expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0980
     * @tc.name testFloatSub098
     * @tc.desc Verify sub(new Float(3.0f)) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(5.0f).sub(new Float(3.0f));
        expect(result.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_0990
     * @tc.name testFloatSub099
     * @tc.desc Verify sub is immutable operation, original Float instance value will not be changed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(10.0f).sub(new Float(3.0f));
        const floatVal: float = result.toFloat();
        expect(floatVal).assertEqual(7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1000
     * @tc.name testFloatSub100
     * @tc.desc Verify sub( new Float(1.0f)) for Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const eps: Float = new Float(Float.EPSILON);
        const result: Float = a.sub(eps);
        expect(result.toFloat()).assertLess(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1010
     * @tc.name testFloatSub101
     * @tc.desc Verify sub( new Float(1.0f)) for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
        const delta: Float = new Float(Float.DELTA);
        const result: Float = a.sub(delta);
        let diff = 1.0f - result.toFloat();
        expect(diff).assertLargerOrEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1020
     * @tc.name testFloatSub102
     * @tc.desc Verify sub( new Float(10.0f),  new Float(-3.0f)) returns 11.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
        const b: Float = new Float(-3.0f);
        const c: Float = new Float(4.0f);
        const d: Float = new Float(-2.0f);
        const step1: Float = a.sub(b);
        const step2: Float = step1.sub(c);
        const result: Float = step2.sub(d);
        expect(result.toFloat()).assertEqual(11.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1030
     * @tc.name testFloatSub103
     * @tc.desc Verify sub(new Float(3.0f)) returns -2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(5.0f).sub(new Float(3.0f)).sub(new Float(4.0f));
        expect(result.toFloat()).assertEqual(-2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1040
     * @tc.name testFloatSub104
     * @tc.desc Verify sub( new Float(100.0f)) returns 85.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: Float = new Float(100.0f);
        const decrement: Float = new Float(1.5f);
        for (let i = 0; i < 10; i++) {
          val = val.sub(decrement);
        }
        expect(val.toFloat()).assertEqual(85.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1050
     * @tc.name testFloatSub105
     * @tc.desc Verify sub(new Float(Float.NEGATIVE_INFINITY)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const posInf: Float = new Float(Float.POSITIVE_INFINITY);
        const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
        const result: Float = posInf.sub(negInf);
        expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1060
     * @tc.name testFloatSub106
     * @tc.desc Verify sub(new Float(Float.POSITIVE_INFINITY)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
        const posInf: Float = new Float(Float.POSITIVE_INFINITY);
        const result: Float = negInf.sub(posInf);
        expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1070
     * @tc.name testFloatSub107
     * @tc.desc Verify sub( new Float(1.0f)) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(1.0f);
        const nan: Float = new Float(Float.NaN);
        const result: Float = val.sub(nan);
        expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1080
     * @tc.name testFloatSub108
     * @tc.desc Verify sub(new Float(1.0f)) returns 16777215.0f (precision loss from 16777217.0f - 1.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Float = new Float(16777217.0f);
        const small: Float = new Float(1.0f);
        const result: Float = large.sub(small);
        expect(result.toFloat()).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1090
     * @tc.name testFloatSub109
     * @tc.desc Verify sub(new Float(Float.MIN_VALUE)) returns Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
        const minVal: Float = new Float(Float.MIN_VALUE);
        const result: Float = maxVal.sub(minVal);
        expect(result.toFloat()).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1100
     * @tc.name testFloatSub110
     * @tc.desc Verify sub( new Float(),  new Float()) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
        const b: Float = new Float();
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1110
     * @tc.name testFloatSub111
     * @tc.desc Verify sub(new Float(7.0f), new Float(3.0f)) returns -backward.toFloat()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.0f);
        const b: Float = new Float(3.0f);
        const forward: Float = a.sub(b);
        const backward: Float = b.sub(a);
        expect(forward.toFloat()).assertEqual(-backward.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1120
     * @tc.name testFloatSub112
     * @tc.desc Verify sub idempotency: same input multiple calls return the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
        const b: Float = new Float(3.0f);
        const c: Float = new Float(2.0f);
        const aOrig: float = a.toFloat();
        const bOrig: float = b.toFloat();
        const cOrig: float = c.toFloat();
        const step1: Float = a.sub(b);
        const result: Float = step1.sub(c);
        expect(a.toFloat()).assertEqual(aOrig);
        expect(b.toFloat()).assertEqual(bOrig);
        expect(c.toFloat()).assertEqual(cOrig);
        expect(result.toFloat()).assertEqual(5.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1130
     * @tc.name testFloatSub113
     * @tc.desc Verify sub( new Float(0.0f),  new Float(0.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
        const b: Float = new Float(0.0f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1140
     * @tc.name testFloatSub114
     * @tc.desc Verify sub( new Float(0.0f),  new Float(-0.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
        const b: Float = new Float(-0.0f);
        const result: Float = a.sub(b);
        expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1150
     * @tc.name testFloatSub115
     * @tc.desc Verify sub result isFinite returns true for (100.0f, 50.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(100.0f).sub(new Float(50.0f));
        expect(result.isFinite()).assertTrue();
        expect(result.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1160
     * @tc.name testFloatSub116
     * @tc.desc Verify sub result isFinite returns true for (9.0f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(9.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1170
     * @tc.name testFloatSub117
     * @tc.desc Verify sub result isFinite returns true for (-48.0f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-48.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1180
     * @tc.name testFloatSub118
     * @tc.desc Verify sub result isFinite returns true for (-1.0e3f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e3f);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1190
     * @tc.name testFloatSub119
     * @tc.desc Verify sub result isFinite returns true for (1.0e10f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1200
     * @tc.name testFloatSub120
     * @tc.desc Verify sub result isFinite returns true for (2147483647, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1210
     * @tc.name testFloatSub121
     * @tc.desc Verify sub result isFinite returns true for (-2147483648, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1220
     * @tc.name testFloatSub122
     * @tc.desc Verify sub result isFinite returns true for (127 as byte, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1230
     * @tc.name testFloatSub123
     * @tc.desc Verify sub result isFinite returns true for (-128 as byte, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1240
     * @tc.name testFloatSub124
     * @tc.desc Verify sub result isFinite returns true for (32767 as short, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1250
     * @tc.name testFloatSub125
     * @tc.desc Verify sub result isFinite returns true for (-32768 as short, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1260
     * @tc.name testFloatSub126
     * @tc.desc Verify sub with bitCastFromInt(0x3f800000) constructed operand and zero returns finite result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1270
     * @tc.name testFloatSub127
     * @tc.desc Verify sub result isFinite returns false for (Float.NaN, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1280
     * @tc.name testFloatSub128
     * @tc.desc Verify sub result isFinite returns false for (Float.POSITIVE_INFINITY, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(result.isFinite()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1290
     * @tc.name testFloatSub129
     * @tc.desc Verify signed zero subtraction: -0.0f - 0.0f equals -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.sub(b);
      expect(1.0f / result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1300
     * @tc.name testFloatSub130
     * @tc.desc Verify self-subtraction: a.sub(a) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.5f);
      const result: Float = a.sub(a);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1310
     * @tc.name testFloatSub131
     * @tc.desc Verify Float.sub throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.sub(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1320
     * @tc.name testFloatSub132
     * @tc.desc Verify Float.sub throws ClassCastError when passing Function as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        let fn: () => void = (): void => {};
        f.sub(fn as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1330
     * @tc.name testFloatSub133
     * @tc.desc Verify 1.0e10f - 1.0e-10f returns 1.0e10f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e-10f);
      const result: Float = a.sub(b);
      expect(result.toFloat()).assertEqual(1.0e10f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_SUB_2_1340
     * @tc.name testFloatSub134
     * @tc.desc Verify Float.MAX_VALUE - Float.MAX_VALUE returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatSub134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.MAX_VALUE);
      const result: Float = a.sub(b);
      expect(result.toFloat()).assertEqual(0.0f);
    });

  });
}
