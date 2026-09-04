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

export default function FloatEqualsTest2(): void {
  describe('FloatEqualsTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0100
     * @tc.name testFloatEquals001
     * @tc.desc Verify equals(int 5, int 5, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 5;
      const val2: int = 5;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0200
     * @tc.name testFloatEquals002
     * @tc.desc Verify equals(int 5, int 10, Float new Float(val1)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: int = 5;
      const val2: int = 10;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0300
     * @tc.name testFloatEquals003
     * @tc.desc Verify equals(long 100, long 100, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: long = 100;
      const val2: long = 100;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0400
     * @tc.name testFloatEquals004
     * @tc.desc Verify equals(float 4.0f, float 4.0f, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 4.0f;
      const val2: float = 4.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0500
     * @tc.name testFloatEquals005
     * @tc.desc Verify equals(float -2.0f, float -2.0f, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = -2.0f;
      const val2: float = -2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0600
     * @tc.name testFloatEquals006
     * @tc.desc Verify equals(float 1.0e3f, float 1000.0f, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 1.0e3f;
      const val2: float = 1000.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0700
     * @tc.name testFloatEquals007
     * @tc.desc Verify equals(float -1.0e-3f, float -0.001f, Float new Float(val1)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = -1.0e-3f;
      const val2: float = -0.001f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0800
     * @tc.name testFloatEquals008
     * @tc.desc Verify equals throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bVal: boolean = true;
        f.equals(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_0900
     * @tc.name testFloatEquals009
     * @tc.desc Verify equals throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const cVal: char = c'a';
        f.equals(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1000
     * @tc.name testFloatEquals010
     * @tc.desc Verify equals('' as Object as float) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.equals('' as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1100
     * @tc.name testFloatEquals011
     * @tc.desc Verify equals(new Float(1.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      expect(f.equals(f)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1200
     * @tc.name testFloatEquals012
     * @tc.desc Verify equals idempotency: same input multiple calls return the same boolean result (1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0);
      const b: Float = new Float(1.0);
      const r1: boolean = a.equals(b);
      const r2: boolean = a.equals(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1300
     * @tc.name testFloatEquals013
     * @tc.desc Verify equals(Float new Float(42.0)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      expect(val.equals(new Float(42.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1400
     * @tc.name testFloatEquals014
     * @tc.desc Verify equals throws ClassCastError when passing Chinese text string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const s: string = '中文';
        f.equals(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1500
     * @tc.name testFloatEquals015
     * @tc.desc Verify equals throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
        f.equals(longStr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1600
     * @tc.name testFloatEquals016
     * @tc.desc Verify equals with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
        f.equals(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1700
     * @tc.name testFloatEquals017
     * @tc.desc Verify equals with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
        f.equals(arr as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1800
     * @tc.name testFloatEquals018
     * @tc.desc Verify equals throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
        f.equals(matrix as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_1900
     * @tc.name testFloatEquals019
     * @tc.desc Verify equals throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        f.equals(list as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2000
     * @tc.name testFloatEquals020
     * @tc.desc Verify equals(int 2147483647, float Float.MAX_VALUE, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2100
     * @tc.name testFloatEquals021
     * @tc.desc Verify equals(int -2147483648, float Float.MIN_VALUE, Float new Float(valA), Float new Float(valB)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2200
     * @tc.name testFloatEquals022
     * @tc.desc Verify equals(short 32767, int 32767, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: int = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2300
     * @tc.name testFloatEquals023
     * @tc.desc Verify equals(byte 127, short 127, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = 127;
      const valB: short = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2400
     * @tc.name testFloatEquals024
     * @tc.desc Verify equals(byte -128, int -128, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = -128;
      const valB: int = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2500
     * @tc.name testFloatEquals025
     * @tc.desc Verify equals(int 2147483647, float 2147483647.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: float = 2147483647.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2600
     * @tc.name testFloatEquals026
     * @tc.desc Verify equals(int -2147483648, float -2147483648.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = -2147483648.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2700
     * @tc.name testFloatEquals027
     * @tc.desc Verify equals(int 5, float 3.0f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = 3.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2800
     * @tc.name testFloatEquals028
     * @tc.desc Verify equals(float 1.5f, float 1.5f, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 1.5f;
      const valB: float = 1.5f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_2900
     * @tc.name testFloatEquals029
     * @tc.desc Verify equals(int 100, long 200, Float new Float(valA))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 100;
      const valB: long = 200;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3000
     * @tc.name testFloatEquals030
     * @tc.desc Verify equals(int 5, long 9223372036854775807, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = 9223372036854775807;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3100
     * @tc.name testFloatEquals031
     * @tc.desc Verify equals(int 5, long -9223372036854775808, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: long = -9223372036854775808;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3200
     * @tc.name testFloatEquals032
     * @tc.desc Verify equals(int 5, float Float.MAX_VALUE, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MAX_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3300
     * @tc.name testFloatEquals033
     * @tc.desc Verify equals(int 5, float Float.MIN_VALUE, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: float = Float.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3400
     * @tc.name testFloatEquals034
     * @tc.desc Verify equals(int 5, short 127, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = 127 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3500
     * @tc.name testFloatEquals035
     * @tc.desc Verify equals(int 5, short -32768, Float new Float(valA)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: short = -32768 as short;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: boolean = a.equals(b);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3600
     * @tc.name testFloatEquals036
     * @tc.desc Verify equals throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.equals({} as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3700
     * @tc.name testFloatEquals037
     * @tc.desc Verify equals with JsonData object throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      const f: Float = new Float(1.0);
      try {
        f.equals(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3800
     * @tc.name testFloatEquals038
     * @tc.desc Verify equals throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const bigVal: bigint = 123n;
      try {
        f.equals(bigVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_3900
     * @tc.name testFloatEquals039
     * @tc.desc Verify equals throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        f.equals(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4000
     * @tc.name testFloatEquals040
     * @tc.desc Verify equals throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
        f.equals(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4100
     * @tc.name testFloatEquals041
     * @tc.desc Verify equals throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = { 'key': 1 };
      try {
        f.equals(rec as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4200
     * @tc.name testFloatEquals042
     * @tc.desc Verify equals throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        f.equals(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4300
     * @tc.name testFloatEquals043
     * @tc.desc Verify equals throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        f.equals(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4400
     * @tc.name testFloatEquals044
     * @tc.desc Verify equals(Float new Float(Float.MIN_VALUE / 2.0f), Float new Float(Float.MIN_VALUE / 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(Float.MIN_VALUE / 2.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4500
     * @tc.name testFloatEquals045
     * @tc.desc Verify equals(Float new Float(Float.MIN_VALUE / 2.0f), Float new Float(Float.MIN_VALUE / 4.0f)) returns true for Float.MIN_VALUE / 4.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MIN_VALUE / 2.0f);
      const b: Float = new Float(Float.MIN_VALUE / 4.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4600
     * @tc.name testFloatEquals046
     * @tc.desc Verify equals(Float new Float(16777216.0f), Float new Float(16777217.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(16777216.0f);
      const b: Float = new Float(16777217.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4700
     * @tc.name testFloatEquals047
     * @tc.desc Verify equals(Float new Float(1.0f), Float new Float(1.0f + Float.EPSILON / 2.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON / 2.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4800
     * @tc.name testFloatEquals048
     * @tc.desc Verify equals idempotency: same input multiple calls return the same boolean result (3.14f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.14f);
      const b: Float = new Float(3.14f);
      const r1: boolean = a.equals(b);
      const r2: boolean = a.equals(b);
      const r3: boolean = a.equals(b);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_4900
     * @tc.name testFloatEquals049
     * @tc.desc Verify equals(Float new Float(1.0f), Float new Float(1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f);
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5000
     * @tc.name testFloatEquals050
     * @tc.desc Verify when equals returns true for equal Float(2.5f), compareTo returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.5f);
      const b: Float = new Float(2.5f);
      expect(a.equals(b)).assertTrue();
      expect(a.compareTo(b)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5100
     * @tc.name testFloatEquals051
     * @tc.desc Verify equals returns false for NaN but compareTo returns 0, confirming NaN.compareTo(NaN) == 0 semantics
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(Float.NaN);
      const cmpResult: int = a.compareTo(b);
      const eqResult: boolean = a.equals(b);
      expect(cmpResult).assertEqual(0);
      expect(eqResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5200
     * @tc.name testFloatEquals052
     * @tc.desc Verify equals() on Float(1.5f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.5f);
      const other: Float = new Float(1.5f);
      expect(f.equals(other)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5300
     * @tc.name testFloatEquals053
     * @tc.desc Verify chained not then assertNull() on Float(2.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maybeNull: Float | null = new Float(2.0f);
      const a: Float = new Float(2.0f);
      expect(maybeNull).not().assertNull();
      const result: boolean = a.equals(maybeNull!);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5400
     * @tc.name testFloatEquals054
     * @tc.desc Verify equals(Float new Float(3.0f), Float new Float(3.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(3.0f);
      if (a.equals(b)) {
        const cmpResult: boolean = Float.compare(a.toFloat(), b.toFloat());
        expect(cmpResult).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5500
     * @tc.name testFloatEquals055
     * @tc.desc Verify equals(Float new Float(1.0f), Float new Float(1.0f + Float.DELTA / 4.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.DELTA / 4.0f);
      const cmpResult: boolean = Float.compare(a.toFloat(), b.toFloat());
      const eqResult: boolean = a.equals(b);
      expect(cmpResult).assertTrue();
      expect(eqResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5600
     * @tc.name testFloatEquals056
     * @tc.desc Verify equals(Float new Float(3.0), Float new Float(3)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0);
      const b: Float = new Float(3);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5700
     * @tc.name testFloatEquals057
     * @tc.desc Verify equals(Float new Float(100), Float new Float(100.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(100 as long);
      const b: Float = new Float(100.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5800
     * @tc.name testFloatEquals058
     * @tc.desc Verify equals(Float new Float(Float.EPSILON), Float new Float(Float.EPSILON)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(Float.EPSILON);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_5900
     * @tc.name testFloatEquals059
     * @tc.desc Verify equals(Float new Float(Float.DELTA), Float new Float(Float.DELTA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6000
     * @tc.name testFloatEquals060
     * @tc.desc Verify equals(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(Float.MAX_SAFE_INTEGER)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6100
     * @tc.name testFloatEquals061
     * @tc.desc Verify equals(Float new Float(Float.EPSILON), Float new Float(Float.DELTA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6200
     * @tc.name testFloatEquals062
     * @tc.desc Verify equals(Float new Float(Float.MAX_VALUE), Float new Float(Float.POSITIVE_INFINITY)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_VALUE);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6300
     * @tc.name testFloatEquals063
     * @tc.desc Verify equals(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(Float.EPSILON)) returns false for Float.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.EPSILON);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6400
     * @tc.name testFloatEquals064
     * @tc.desc Verify equals(Float new Float(Float.NEGATIVE_INFINITY), Float new Float(Float.MIN_VALUE)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6500
     * @tc.name testFloatEquals065
     * @tc.desc Verify equals(Float new Float(Float.NaN), Float new Float(Float.POSITIVE_INFINITY)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6600
     * @tc.name testFloatEquals066
     * @tc.desc Verify equals(float 3.0f, float 3.0f, Float new Float(valA)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 3.0f;
      const valB: float = 3.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6700
     * @tc.name testFloatEquals067
     * @tc.desc Verify equals(Float new Float(1.0e-3f), Float new Float(0.001f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-3f);
      const b: Float = new Float(0.001f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6800
     * @tc.name testFloatEquals068
     * @tc.desc Verify equals(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(Float.MAX_SAFE_INTEGER + 1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER + 1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_6900
     * @tc.name testFloatEquals069
     * @tc.desc Verify equals(float -Float.MAX_SAFE_INTEGER, Float new Float(val), Float new Float(val)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MAX_SAFE_INTEGER;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7000
     * @tc.name testFloatEquals070
     * @tc.desc Verify equals(Float new Float(-Float.MAX_SAFE_INTEGER), Float new Float(Float.MAX_SAFE_INTEGER)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.MAX_SAFE_INTEGER);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7100
     * @tc.name testFloatEquals071
     * @tc.desc Verify equals(Float new Float(1.0e10f), Float new Float(1.0e10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7200
     * @tc.name testFloatEquals072
     * @tc.desc Verify equals(Float new Float(1.0e10f), Float new Float(1.0e10f + 1.0f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7300
     * @tc.name testFloatEquals073
     * @tc.desc Verify equals(Float new Float(1.0e-10f), Float new Float(1.0e-10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-10f);
      const b: Float = new Float(1.0e-10f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7400
     * @tc.name testFloatEquals074
     * @tc.desc Verify equals( new Float(9.0f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(9.0f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7500
     * @tc.name testFloatEquals075
     * @tc.desc Verify equals( new Float(1.0e3f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e3f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7600
     * @tc.name testFloatEquals076
     * @tc.desc Verify equals( new Float(1.0e-5f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-5f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7700
     * @tc.name testFloatEquals077
     * @tc.desc Verify equals( new Float(-1.0e3f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e3f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7800
     * @tc.name testFloatEquals078
     * @tc.desc Verify equals( new Float(1.0e10f),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_7900
     * @tc.name testFloatEquals079
     * @tc.desc Verify equals( new Float(2147483647),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2147483647 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8000
     * @tc.name testFloatEquals080
     * @tc.desc Verify equals( new Float(-2147483648),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-2147483648 as int);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8100
     * @tc.name testFloatEquals081
     * @tc.desc Verify equals( new Float(127),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(127 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8200
     * @tc.name testFloatEquals082
     * @tc.desc Verify equals( new Float(-128),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-128 as byte);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8300
     * @tc.name testFloatEquals083
     * @tc.desc Verify equals( new Float(32767),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(32767 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8400
     * @tc.name testFloatEquals084
     * @tc.desc Verify equals( new Float(-32768),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-32768 as short);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8500
     * @tc.name testFloatEquals085
     * @tc.desc Verify bitCastFromInt: result from expression returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x3f800000));
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8600
     * @tc.name testFloatEquals086
     * @tc.desc Verify bitCastFromInt: result from expression returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.bitCastFromInt(0x00000001));
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8700
     * @tc.name testFloatEquals087
     * @tc.desc Verify equals( new Float(Float.NaN),  new Float(1.0f)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(1.0f);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8800
     * @tc.name testFloatEquals088
     * @tc.desc Verify equals(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(Float.POSITIVE_INFINITY)) returns false, for Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_8900
     * @tc.name testFloatEquals089
     * @tc.desc Verify equals(Float new Float(Float.NEGATIVE_INFINITY), Float new Float(Float.NaN)) returns false for Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.NaN);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9000
     * @tc.name testFloatEquals090
     * @tc.desc Verify equals(Float new Float(Float.EPSILON), Float new Float(Float.NEGATIVE_INFINITY)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(Float.NEGATIVE_INFINITY);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9100
     * @tc.name testFloatEquals091
     * @tc.desc Verify equals(Float new Float(Float.DELTA), Float new Float(Float.NaN)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(Float.NaN);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9200
     * @tc.name testFloatEquals092
     * @tc.desc Verify equals(Float new Float(-1.0e10f), Float new Float(-1.0e10f)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e10f);
      const b: Float = new Float(-1.0e10f);
      const result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9300
     * @tc.name testFloatEquals093
     * @tc.desc Verify equals(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(Float.DELTA)) returns false, for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9400
     * @tc.name testFloatEquals094
     * @tc.desc Verify equals(Float new Float(Float.NaN), Float new Float(Float.EPSILON)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NaN);
      const b: Float = new Float(Float.EPSILON);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9500
     * @tc.name testFloatEquals095
     * @tc.desc Verify equals(Float new Float(Float.NEGATIVE_INFINITY), Float new Float(Float.DELTA)) returns false for Float.DELTA
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.DELTA);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_EQUALS_2_9600
     * @tc.name testFloatEquals096
     * @tc.desc Verify equals(Float new Float(Float.POSITIVE_INFINITY), Float new Float(Float.EPSILON)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatEquals096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.POSITIVE_INFINITY);
      const b: Float = new Float(Float.EPSILON);
      const result: boolean = a.equals(b);
      expect(result).assertFalse();
    });
  })
}
