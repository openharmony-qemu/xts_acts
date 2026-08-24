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

enum Color { RED, GREEN, BLUE }
class JsonData {
  key: int = 0;
}

export default function FloatDivTest2(): void {
  describe('FloatDivTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0010
     * @tc.name testFloatDiv001
     * @tc.desc Verify div(int 6, int 2, Float new Float(val1)) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 6;
      const val2: int = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0020
     * @tc.name testFloatDiv002
     * @tc.desc Verify div: result from expression returns true for (val1, val2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 2147483647;
      const val2: int = 1;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0030
     * @tc.name testFloatDiv003
     * @tc.desc Verify div(long 100, long 2, Float new Float(val1)) returns 50.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 2;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0040
     * @tc.name testFloatDiv004
     * @tc.desc Verify div(double 6.0, double 2.0, Float new Float(val1)) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: double = 6.0;
      const val2: double = 2.0;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0050
     * @tc.name testFloatDiv005
     * @tc.desc Verify div(byte 12, byte 3, Float new Float(val1)) returns 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: byte = 12;
      const val2: byte = 3;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0060
     * @tc.name testFloatDiv006
     * @tc.desc Verify div(float 20.0f, float 4.0f, Float new Float(val1)) returns 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 20.0f;
      const val2: float = 4.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0070
     * @tc.name testFloatDiv007
     * @tc.desc Verify div(float 10.0f, float -2.0f, Float new Float(val1)) returns -5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 10.0f;
      const val2: float = -2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(-5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0080
     * @tc.name testFloatDiv008
     * @tc.desc Verify div(float 5000.0f, float 1.0e3f, Float new Float(val1)) returns 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 5000.0f;
      const val2: float = 1.0e3f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0090
     * @tc.name testFloatDiv009
     * @tc.desc Verify div throws ClassCastError when passing unsupported type 2 as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const val: int = 2;
        f.div(val as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0100
     * @tc.name testFloatDiv010
     * @tc.desc Verify div throws ClassCastError when passing unsupported type 2 as long as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {

        f.div(2 as long as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0110
     * @tc.name testFloatDiv011
     * @tc.desc Verify div throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const bVal: boolean = true;
        f.div(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0120
     * @tc.name testFloatDiv012
     * @tc.desc Verify div throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        const cVal: char = c'a';
        f.div(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0130
     * @tc.name testFloatDiv013
     * @tc.desc Verify div throws ClassCastError when passing empty string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(10.0);
      try {
        const s: string = '';
        f.div(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0140
     * @tc.name testFloatDiv014
     * @tc.desc Verify div throws ClassCastError when passing unsupported type [1.0, 2.0] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(10.0);
      try {
        f.div([1.0, 2.0] as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0150
     * @tc.name testFloatDiv015
     * @tc.desc Verify div throws ClassCastError when passing unsupported type numList as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(10.0);
      try {
        const numList: Array<double> = new Array<double>(1.0, 2.0);
        f.div(numList as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0160
     * @tc.name testFloatDiv016
     * @tc.desc Verify div throws ClassCastError when passing Map as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      try {
        f.div(map as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0170
     * @tc.name testFloatDiv017
     * @tc.desc Verify div throws ClassCastError when passing enum Color.RED as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(6.0);
      try {
        f.div(Color.RED as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0180
     * @tc.name testFloatDiv018
     * @tc.desc Verify div(Float new Float(6.0))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(6.0);
      const original: float = a.toFloat();
      a.div(new Float(2.0));
      expect(a.toFloat()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0190
     * @tc.name testFloatDiv019
     * @tc.desc Verify div: result from expression returns false for (6.0, 2.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(6.0);
      let r: Float = a.div(new Float(2.0));
      const isSameRef: boolean = r === a;
      expect(isSameRef).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0200
     * @tc.name testFloatDiv020
     * @tc.desc Verify div(new Float(2.0)) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Float = new Float(24.0).div(new Float(2.0)).div(new Float(3.0)).div(new Float(4.0));
      expect(r.toFloat()).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0210
     * @tc.name testFloatDiv021
     * @tc.desc Verify div(Float new Float(42.0)) returns 21.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      const r: Float = val.div(new Float(2.0));
      expect(r.toFloat()).assertEqual(21.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0220
     * @tc.name testFloatDiv022
     * @tc.desc Verify div(new Float(4.0))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float = new Float(20.0);
      const r1: Float = base.div(new Float(4.0));
      const r2: Float = base.div(new Float(4.0));
      expect(r1.toFloat()).assertEqual(r2.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0230
     * @tc.name testFloatDiv023
     * @tc.desc Verify chained div then mul() on Float(10.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Float = new Float(10.0).div(new Float(0.5));
      const m: Float = new Float(10.0).mul(new Float(2.0));
      expect(r.toFloat()).assertEqual(m.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0240
     * @tc.name testFloatDiv024
     * @tc.desc Verify div(Float new Float(42.0)) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(42.0);
      const r: Float = a.div(a);
      expect(r.toFloat()).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0250
     * @tc.name testFloatDiv025
     * @tc.desc Verify div throws ClassCastError when passing unsupported type new Object( as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.div(new Object() as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0260
     * @tc.name testFloatDiv026
     * @tc.desc Verify div throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
        f.div(longStr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0270
     * @tc.name testFloatDiv027
     * @tc.desc Verify Float.div with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
        f.div(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0280
     * @tc.name testFloatDiv028
     * @tc.desc Verify Float.div with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
        f.div(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0290
     * @tc.name testFloatDiv029
     * @tc.desc Verify div throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
        f.div(matrix as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0300
     * @tc.name testFloatDiv030
     * @tc.desc Verify div throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        f.div(list as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0310
     * @tc.name testFloatDiv031
     * @tc.desc Verify div throws ClassCastError when passing BigInt as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bigIntVal: bigint = 123n;
        f.div(bigIntVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0320
     * @tc.name testFloatDiv032
     * @tc.desc Verify div: result from expression returns true for (valA, valB)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0330
     * @tc.name testFloatDiv033
     * @tc.desc Verify div: result from expression returns true for valA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0340
     * @tc.name testFloatDiv034
     * @tc.desc Verify div: result from expression returns true for valB
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0350
     * @tc.name testFloatDiv035
     * @tc.desc Verify div(float 0.0f, short 32767, Float new Float(valA)) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 0.0f;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0360
     * @tc.name testFloatDiv036
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=-2147483648, valB:byte=-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = -1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0370
     * @tc.name testFloatDiv037
     * @tc.desc Verify div(int 2147483647, float 0.0f, Float new Float(valA)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0380
     * @tc.name testFloatDiv038
     * @tc.desc Verify div(int -2147483648, float 0.0f, Float new Float(valA)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0390
     * @tc.name testFloatDiv039
     * @tc.desc Verify div(float Float.MAX_VALUE, int 0, Float new Float(valA)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MAX_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0400
     * @tc.name testFloatDiv040
     * @tc.desc Verify div(float Float.MIN_VALUE, int 0, Float new Float(valA)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.MIN_VALUE;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0410
     * @tc.name testFloatDiv041
     * @tc.desc Verify div(long 9223372036854775807, float 0.0f, Float new Float(valA)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0420
     * @tc.name testFloatDiv042
     * @tc.desc Verify div(short 32767, byte 1, Float new Float(valA)) returns 32767.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(32767f);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0430
     * @tc.name testFloatDiv043
     * @tc.desc Verify div(float -1.0f, int 1, Float new Float(valA)) returns -1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = -1.0f;
      const valB: int = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(-1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0440
     * @tc.name testFloatDiv044
     * @tc.desc Verify div(float 0.0f, int 1, Float new Float(valA)) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 0.0f;
      const valB: int = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0450
     * @tc.name testFloatDiv045
     * @tc.desc Verify div(float 1.5f, int 2, Float new Float(valA)) returns 0.75
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 1.5f;
      const valB: int = 2;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(0.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0460
     * @tc.name testFloatDiv046
     * @tc.desc Verify div(float 10.0f, long 20, Float new Float(valA)) returns 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 10.0f;
      const valB: long = 20;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0470
     * @tc.name testFloatDiv047
     * @tc.desc Verify div(long 1000, float 0.5f, Float new Float(valA)) returns 2000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 1000;
      const valB: float = 0.5f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0480
     * @tc.name testFloatDiv048
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:long=9223372036854775807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = 9223372036854775807;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.toFloat()).assertEqual(5.421010862427522e-19f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0490
     * @tc.name testFloatDiv049
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:long=-9223372036854775808
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = -9223372036854775808;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0500
     * @tc.name testFloatDiv050
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:byte=127 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0510
     * @tc.name testFloatDiv051
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:byte=-128 as byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0520
     * @tc.name testFloatDiv052
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:float=Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0530
     * @tc.name testFloatDiv053
     * @tc.desc Verify div: result from expression returns false for (valA, valB)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0540
     * @tc.name testFloatDiv054
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:short=32767 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = 32767 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0550
     * @tc.name testFloatDiv055
     * @tc.desc Verify div: result from expression returns true via assertTrue with valA:int=5, valB:short=-32768 as short
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = -32768 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0560
     * @tc.name testFloatDiv056
     * @tc.desc Verify div: result from expression returns false for valA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = 0 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: Float = a.div(b);
      expect(r.isFinite()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0570
     * @tc.name testFloatDiv057
     * @tc.desc Verify Float.div with JsonData object throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      const f: Float = new Float(1.0);
      try {
        f.div(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0580
     * @tc.name testFloatDiv058
     * @tc.desc Verify div throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        f.div(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0590
     * @tc.name testFloatDiv059
     * @tc.desc Verify div throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
        f.div(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0600
     * @tc.name testFloatDiv060
     * @tc.desc Verify div throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
        f.div(rec as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0610
     * @tc.name testFloatDiv061
     * @tc.desc Verify div throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        f.div(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0620
     * @tc.name testFloatDiv062
     * @tc.desc Verify div throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        f.div(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0630
     * @tc.name testFloatDiv063
     * @tc.desc Verify div( new Float(-5.0f)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
      const result: Float = a.div(a);
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0640
     * @tc.name testFloatDiv064
     * @tc.desc Verify Float(-42.0f).div(new Float(1.0f)) returns the same value as original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-42.0f);
      const one: Float = new Float(1.0f);
      expect(a.div(one).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0650
     * @tc.name testFloatDiv065
     * @tc.desc Verify Float(0.123456f).div(new Float(1.0f)) returns the same value as original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.123456f);
      const one: Float = new Float(1.0f);
      expect(a.div(one).toFloat()).assertEqual(a.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0660
     * @tc.name testFloatDiv066
     * @tc.desc Verify div( new Float(2.0f)) on 10.0f approximates a.mul(reciprocal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
      const b: Float = new Float(2.0f);
      const reciprocal: Float = new Float(1.0f / b.toFloat());
      const left: Float = a.div(b);
      const right: Float = a.mul(reciprocal);
      expect(left.toFloat()).assertClose(right.toFloat(), 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0670
     * @tc.name testFloatDiv067
     * @tc.desc Verify Float(MIN_VALUE).div(new Float(2.0f)) result is between 0.0f and MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
      const two: Float = new Float(2.0f);
      const result: Float = minVal.div(two);
      expect(result.toFloat()).assertLargerOrEqual(0.0f);
      expect(result.toFloat()).assertLess(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0680
     * @tc.name testFloatDiv068
     * @tc.desc Verify div(new Float(0.5f)) returns Float.MIN_VALUE * 2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: Float = new Float(Float.MIN_VALUE);
      const half: Float = new Float(0.5f);
      const result: Float = minVal.div(half);
      expect(result.toFloat()).assertEqual(Float.MIN_VALUE * 2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0690
     * @tc.name testFloatDiv069
     * @tc.desc Verify div(new Float(0.5f)) returns 2.0e10f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const large: Float = new Float(1.0e10f);
      const small: Float = new Float(0.5f);
      const result: Float = large.div(small);
      expect(result.toFloat()).assertEqual(2.0e10f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0700
     * @tc.name testFloatDiv070
     * @tc.desc Verify div( new Float(0.3f),  new Float(0.1f)) returns approx 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.3f);
      const b: Float = new Float(0.1f);
      const result: Float = a.div(b);
      expect(result.toFloat()).assertClose(3.0f, 0.000001f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0710
     * @tc.name testFloatDiv071
     * @tc.desc Verify div( new Float(-6.0f),  new Float(-2.0f)) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-6.0f);
      const b: Float = new Float(-2.0f);
      const result: Float = a.div(b);
      expect(result.toFloat()).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0720
     * @tc.name testFloatDiv072
     * @tc.desc Verify div( new Float(6.0f),  new Float(-2.0f)) returns -3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(6.0f);
      const b: Float = new Float(-2.0f);
      const result: Float = a.div(b);
      expect(result.toFloat()).assertEqual(-3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0730
     * @tc.name testFloatDiv073
     * @tc.desc Verify div( new Float(-6.0f),  new Float(2.0f)) returns -3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-6.0f);
      const b: Float = new Float(2.0f);
      const result: Float = a.div(b);
      expect(result.toFloat()).assertEqual(-3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0740
     * @tc.name testFloatDiv074
     * @tc.desc Verify div(new Float(0.5f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
      const half: Float = new Float(0.5f);
      const result: Float = maxVal.div(half);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0750
     * @tc.name testFloatDiv075
     * @tc.desc Verify div(new Float(0.999f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: Float = new Float(Float.MAX_VALUE);
      const nearOne: Float = new Float(0.999f);
      const result: Float = maxVal.div(nearOne);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0760
     * @tc.name testFloatDiv076
     * @tc.desc Verify div( new Float(1.0f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const zero: Float = new Float(0.0f);
      const result: Float = a.div(zero);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0770
     * @tc.name testFloatDiv077
     * @tc.desc Verify div( new Float(1.0f)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const negZero: Float = new Float(-0.0f);
      const result: Float = a.div(negZero);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0780
     * @tc.name testFloatDiv078
     * @tc.desc Verify div is immutable operation, original Float instance value will not be changed after calculation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
      const b: Float = new Float(2.0f);
      const aOrig: float = a.toFloat();
      const bOrig: float = b.toFloat();
      const result: Float = a.div(b);
      expect(a.toFloat()).assertEqual(aOrig);
      expect(b.toFloat()).assertEqual(bOrig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0790
     * @tc.name testFloatDiv079
     * @tc.desc Verify Float(6.0f).div(new Float(2.0f)) result is not equal to either operand
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(6.0f);
      const b: Float = new Float(2.0f);
      const result: Float = a.div(b);
      expect(result).not().assertEqual(a);
      expect(result).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0800
     * @tc.name testFloatDiv080
     * @tc.desc Verify Float(10.0f).div(new Float(3.0f)) equals 10.0f / 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(10.0f);
      const b: Float = new Float(3.0f);
      expect(a.div(b).toFloat()).assertEqual(a.toFloat() / b.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0810
     * @tc.name testFloatDiv081
     * @tc.desc Verify div(b) returns 5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float | null = new Float(10.0f);
      const b: Float | null = new Float(2.0f);
      if (a !== null && b !== null) {
        const result: Float = a.div(b);
        expect(result.toFloat()).assertEqual(5.0f);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0820
     * @tc.name testFloatDiv082
     * @tc.desc Verify div(new Float(5.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultVal: Float = new Float();
      const five: Float = new Float(5.0f);
      const result: Float = defaultVal.div(five);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0830
     * @tc.name testFloatDiv083
     * @tc.desc Verify Float(3.0f).div(new Float(0.5f)) equals Float(3.0f).mul(new Float(2.0f))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const half: Float = new Float(0.5f);
      const two: Float = new Float(2.0f);
      const left: Float = a.div(half);
      const right: Float = a.mul(two);
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0840
     * @tc.name testFloatDiv084
     * @tc.desc Verify div( new Float(6.0f),  new Float(2.0)) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(6.0f);
      const b: Float = new Float(2.0);
      const result: Float = a.div(b);
      expect(result.toFloat()).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0850
     * @tc.name testFloatDiv085
     * @tc.desc Verify div(new Float(1.0f)) returns Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafe: Float = new Float(Float.MAX_SAFE_INTEGER);
      const one: Float = new Float(1.0f);
      const result: Float = maxSafe.div(one);
      expect(result.toFloat()).assertEqual(Float.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0860
     * @tc.name testFloatDiv086
     * @tc.desc Verify div(new Float(2.0f)) returns 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(120.0f).div(new Float(2.0f)).div(new Float(3.0f)).div(new Float(5.0f));
      expect(result.toFloat()).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0870
     * @tc.name testFloatDiv087
     * @tc.desc Verify div( new Float(64.0f),  new Float(4.0f)) returns 8.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(64.0f);
      const b: Float = new Float(4.0f);
      const c: Float = new Float(2.0f);
      const step1: Float = a.div(b);
      const result: Float = step1.div(c);
      expect(result.toFloat()).assertEqual(8.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0880
     * @tc.name testFloatDiv088
     * @tc.desc Verify div( new Float(2.0f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
      const val: Float = new Float(2.0f);
      const result: Float = inf.div(val);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0890
     * @tc.name testFloatDiv089
     * @tc.desc Verify div( new Float(2.0f)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
      const val: Float = new Float(2.0f);
      const result: Float = negInf.div(val);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0900
     * @tc.name testFloatDiv090
     * @tc.desc Verify div( new Float(1.0f)) is NaN for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: Float = new Float(Float.NaN);
      const val: Float = new Float(1.0f);
      const result: Float = nan.div(val);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0910
     * @tc.name testFloatDiv091
     * @tc.desc Verify div( new Float(1.0f)) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(1.0f);
      const nan: Float = new Float(Float.NaN);
      const result: Float = val.div(nan);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0920
     * @tc.name testFloatDiv092
     * @tc.desc Verify chained div then add() on Float(20.0f) returns 8.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(20.0f).div(new Float(4.0f)).add(new Float(3.0f));
      expect(result.toFloat()).assertEqual(8.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0930
     * @tc.name testFloatDiv093
     * @tc.desc Verify chained div then sub() on Float(20.0f) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(20.0f).div(new Float(4.0f)).sub(new Float(2.0f));
      expect(result.toFloat()).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0940
     * @tc.name testFloatDiv094
     * @tc.desc Verify chained div then mul() on Float(20.0f) returns 15.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(20.0f).div(new Float(4.0f)).mul(new Float(3.0f));
      expect(result.toFloat()).assertEqual(15.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0950
     * @tc.name testFloatDiv095
     * @tc.desc Verify div: result from expression returns true for (6.0f, 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(6.0f).div(new Float(2.0f));
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0960
     * @tc.name testFloatDiv096
     * @tc.desc Verify div(new Float(2.0f)) is not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(6.0f).div(new Float(2.0f));
      expect(result.isNaN()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0970
     * @tc.name testFloatDiv097
     * @tc.desc Verify div(new Float(4.0f)) on Float(12.0f) returns 3.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(12.0f).div(new Float(4.0f));
      const floatVal: float = result.toFloat();
      expect(floatVal).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0980
     * @tc.name testFloatDiv098
     * @tc.desc Verify div: result from expression returns true for (1.0f, Float.EPSILON)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const eps: Float = new Float(Float.EPSILON);
      const result: Float = a.div(eps);
      expect(result.isFinite()).assertTrue();
      expect(result.toFloat()).assertLarger(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_0990
     * @tc.name testFloatDiv099
     * @tc.desc Verify div: result from expression returns true for (1.0f, Float.DELTA)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const delta: Float = new Float(Float.DELTA);
      const result: Float = a.div(delta);
      expect(result.isFinite()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1000
     * @tc.name testFloatDiv100
     * @tc.desc Verify div(new Float(-2.0f)) returns 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(120.0f).div(new Float(-2.0f)).div(new Float(3.0f)).div(new Float(-5.0f));
      expect(result.toFloat()).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1010
     * @tc.name testFloatDiv101
     * @tc.desc Verify div( new Float(32.0f)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: Float = new Float(32.0f);
      const divisor: Float = new Float(2.0f);
      for (let i = 0; i < 5; i++) {
        val = val.div(divisor);
      }
      expect(val.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1020
     * @tc.name testFloatDiv102
     * @tc.desc Verify div( new Float(100.0f)) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(100.0f);
      const inf: Float = new Float(Float.POSITIVE_INFINITY);
      const result: Float = val.div(inf);
      expect(result.toFloat()).assertEqual(0.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1030
     * @tc.name testFloatDiv103
     * @tc.desc Verify div(new Float(Float.POSITIVE_INFINITY)) is NaN for Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInf: Float = new Float(Float.NEGATIVE_INFINITY);
      const posInf: Float = new Float(Float.POSITIVE_INFINITY);
      const result: Float = negInf.div(posInf);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1040
     * @tc.name testFloatDiv104
     * @tc.desc Verify div( new Float(7.0f)) returns -7.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(7.0f);
      const negOne: Float = new Float(-1.0f);
      const result: Float = a.div(negOne);
      expect(result.toFloat()).assertEqual(-7.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1050
     * @tc.name testFloatDiv105
     * @tc.desc Verify div idempotency: same input multiple calls return the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(24.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(3.0f);
      const aOrig: float = a.toFloat();
      const bOrig: float = b.toFloat();
      const cOrig: float = c.toFloat();
      const step1: Float = a.div(b);
      const result: Float = step1.div(c);
      expect(a.toFloat()).assertEqual(aOrig);
      expect(b.toFloat()).assertEqual(bOrig);
      expect(c.toFloat()).assertEqual(cOrig);
      expect(result.toFloat()).assertEqual(4.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1060
     * @tc.name testFloatDiv106
     * @tc.desc Verify div(new Float(2.0f)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Float = new Float(720.0f)
      .div(new Float(2.0f))
      .div(new Float(3.0f))
      .div(new Float(4.0f))
      .div(new Float(5.0f))
      .div(new Float(6.0f));
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1070
     * @tc.name testFloatDiv107
     * @tc.desc Verify div( new Float(),  new Float()) is NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: Float = a.div(b);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1080
     * @tc.name testFloatDiv108
     * @tc.desc Verify div(0.25f) on 5.0f equals mul(4.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0f);
      const quarter: Float = new Float(0.25f);
      const four: Float = new Float(4.0f);
      const left: Float = a.div(quarter);
      const right: Float = a.mul(four);
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1090
     * @tc.name testFloatDiv109
     * @tc.desc Verify div(0.125f) on 3.0f equals mul(8.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const eighth: Float = new Float(0.125f);
      const eight: Float = new Float(8.0f);
      const left: Float = a.div(eighth);
      const right: Float = a.mul(eight);
      expect(left.toFloat()).assertEqual(right.toFloat());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1100
     * @tc.name testFloatDiv110
     * @tc.desc Verify div( new Float(Float.MAX_VALUE)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const result: Float = a.div(a);
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1110
     * @tc.name testFloatDiv111
     * @tc.desc Verify div( new Float(Float.MIN_VALUE)) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const result: Float = a.div(a);
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1120
     * @tc.name testFloatDiv112
     * @tc.desc Verify div( new Float(-1.0f)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const negZero: Float = new Float(-0.0f);
      const result: Float = a.div(negZero);
      expect(result.toFloat()).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1130
     * @tc.name testFloatDiv113
     * @tc.desc Verify div( new Float(-1.0f)) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const zero: Float = new Float(0.0f);
      const result: Float = a.div(zero);
      expect(result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1140
     * @tc.name testFloatDiv114
     * @tc.desc Verify div: result from expression returns false for (9.0f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(9.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1150
     * @tc.name testFloatDiv115
     * @tc.desc Verify div: result from expression returns false for (-48.0f, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-48.0f);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1160
     * @tc.name testFloatDiv116
     * @tc.desc Verify div: result from expression returns false for (2147483647, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1170
     * @tc.name testFloatDiv117
     * @tc.desc Verify div: result from expression returns false for (-2147483648, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1180
     * @tc.name testFloatDiv118
     * @tc.desc Verify div: result from expression returns false for (127 as byte, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1190
     * @tc.name testFloatDiv119
     * @tc.desc Verify div: result from expression returns false for (-128 as byte, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1200
     * @tc.name testFloatDiv120
     * @tc.desc Verify div: result from expression returns false for (32767 as short, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1210
     * @tc.name testFloatDiv121
     * @tc.desc Verify div: result from expression returns false for (-32768 as short, 0.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1220
     * @tc.name testFloatDiv122
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(0.0f);
      const result: Float = a.div(b);
      expect(result.isFinite()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1230
     * @tc.name testFloatDiv123
     * @tc.desc Verify NaN propagation: NaN / NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(Float.NaN);
      const result: Float = a.div(b);
      expect(result.isNaN()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1240
     * @tc.name testFloatDiv124
     * @tc.desc Verify division by Infinity: 1.0f / Infinity returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: Float = a.div(b);
      expect(result.toFloat()).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1250
     * @tc.name testFloatDiv125
     * @tc.desc Verify self-division: a.div(a) returns 1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5.0f);
      const result: Float = a.div(a);
      expect(result.toFloat()).assertEqual(1.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1260
     * @tc.name testFloatDiv126
     * @tc.desc Verify signed zero division: -0.0f / 1.0f returns -0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-0.0f);
      const b: Float = new Float(1.0f);
      const result: Float = a.div(b);
      expect(1.0f / result.toFloat()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1270
     * @tc.name testFloatDiv127
     * @tc.desc Verify Float.div throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.div(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_DIV_2_1280
     * @tc.name testFloatDiv128
     * @tc.desc Verify Float.MIN_VALUE divided by 2.0f underflows to 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatDiv128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE);
      const b: Float = new Float(2.0f);
      const result: float = a.div(b).toFloat();
      expect(result).assertEqual(0.0f);
    });

  });
}
