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

export default function FloatCompareToTest2(): void {
  describe('FloatCompareToTest2', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0100
     * @tc.name testFloatCompareTo001
     * @tc.desc Verify compareTo(int 2147483647, Float new Float(val), Float new Float(val)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 2147483647;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0200
     * @tc.name testFloatCompareTo002
     * @tc.desc Verify compareTo(int -2147483648, Float new Float(val), Float new Float(val)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = -2147483648;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0300
     * @tc.name testFloatCompareTo003
     * @tc.desc Verify compareTo(long 9223372036854775807, Float new Float(val), Float new Float(val)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 9223372036854775807;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0400
     * @tc.name testFloatCompareTo004
     * @tc.desc Verify compareTo(short 127, short 127, Float new Float(val1)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: short = 127 as short;
      const val2: short = 127 as short;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0500
     * @tc.name testFloatCompareTo005
     * @tc.desc Verify compareTo(short 32767, Float new Float(val), Float new Float(val)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 32767 as short;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0600
     * @tc.name testFloatCompareTo006
     * @tc.desc Verify compareTo(byte 12, byte 12, Float new Float(val1)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: byte = 12 as byte;
      const val2: byte = 12 as byte;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0700
     * @tc.name testFloatCompareTo007
     * @tc.desc Verify compareTo(byte 127, Float new Float(val), Float new Float(val)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 127;
      const a: Float = new Float(val);
      const b: Float = new Float(val);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0800
     * @tc.name testFloatCompareTo008
     * @tc.desc Verify compareTo(float -2.0f, float -2.0f, Float new Float(val1)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = -2.0f;
      const val2: float = -2.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_0900
     * @tc.name testFloatCompareTo009
     * @tc.desc Verify compareTo(float 1.0e3f, float 1000.0f, Float new Float(val1)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = 1.0e3f;
      const val2: float = 1000.0f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1000
     * @tc.name testFloatCompareTo010
     * @tc.desc Verify compareTo(float -1.0e-3f, float -0.001f, Float new Float(val1)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val1: float = -1.0e-3f;
      const val2: float = -0.001f;
      const a: Float = new Float(val1);
      const b: Float = new Float(val2);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1100
     * @tc.name testFloatCompareTo011
     * @tc.desc Verify compareTo throws ClassCastError when passing int 1 upcast to Object then cast back to int as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const val: int = 1;
        f.compareTo(val as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1200
     * @tc.name testFloatCompareTo012
     * @tc.desc Verify compareTo throws ClassCastError when passing boolean true as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const bVal: boolean = true;
        f.compareTo(bVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1300
     * @tc.name testFloatCompareTo013
     * @tc.desc Verify compareTo throws ClassCastError when passing char type 'a' as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const cVal: char = c'a';
        f.compareTo(cVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1400
     * @tc.name testFloatCompareTo014
     * @tc.desc Verify compareTo throws ClassCastError when passing null value as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.compareTo(null as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1500
     * @tc.name testFloatCompareTo015
     * @tc.desc Verify compareTo throws ClassCastError when passing empty string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const s: string = '';
        f.compareTo(s as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1600
     * @tc.name testFloatCompareTo016
     * @tc.desc Verify compareTo throws ClassCastError when passing Object instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const obj: Object = new Object();
        f.compareTo(obj as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1700
     * @tc.name testFloatCompareTo017
     * @tc.desc Verify compareTo throws ClassCastError when passing unsupported type [1.0, 2.0] as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.compareTo([1.0, 2.0] as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1800
     * @tc.name testFloatCompareTo018
     * @tc.desc Verify compareTo throws ClassCastError when passing unsupported type numList as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        const numList: Array<double> = new Array<double>(1.0, 2.0);
        f.compareTo(numList as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_1900
     * @tc.name testFloatCompareTo019
     * @tc.desc Verify compareTo throws ClassCastError when passing Map as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const map: Map<string, int> = new Map<string, int>();
      map.set('key', 1);
      try {
        f.compareTo(map as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2000
     * @tc.name testFloatCompareTo020
     * @tc.desc Verify compareTo throws ClassCastError when passing enum Color.RED as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.compareTo(Color.RED as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2100
     * @tc.name testFloatCompareTo021
     * @tc.desc Verify compareTo idempotency: multiple calls with Float values 1.0 and 2.0 return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0);
      const b: Float = new Float(2.0);
      const r1: int = a.compareTo(b);
      const r2: int = a.compareTo(b);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2200
     * @tc.name testFloatCompareTo022
     * @tc.desc Verify compareTo(Float new Float(42.0)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: Float = new Float(42.0);
      const result: int = val.compareTo(new Float(42.0));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2300
     * @tc.name testFloatCompareTo023
     * @tc.desc Verify compareTo throws ClassCastError when passing max length repeated string as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const longStr: string = 'x'.repeat(65535);
      try {
        f.compareTo(longStr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2400
     * @tc.name testFloatCompareTo024
     * @tc.desc Verify compareTo with array type throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: int[] = [];
      try {
        f.compareTo(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2500
     * @tc.name testFloatCompareTo025
     * @tc.desc Verify compareTo with boolean true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let arr: Object[] = [1, 'test', true];
      try {
        f.compareTo(arr as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2600
     * @tc.name testFloatCompareTo026
     * @tc.desc Verify compareTo throws ClassCastError when passing two-dimensional matrix as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      let matrix: int[][] = [];
      try {
        f.compareTo(matrix as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2700
     * @tc.name testFloatCompareTo027
     * @tc.desc Verify compareTo throws ClassCastError when passing List as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const list: Array<string> = new Array<string>('a', 'b');
      try {
        f.compareTo(list as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2800
     * @tc.name testFloatCompareTo028
     * @tc.desc Verify compareTo(int 2147483647, short 32767, Float new Float(valA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: short = 32767;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_2900
     * @tc.name testFloatCompareTo029
     * @tc.desc Verify compareTo(int 2147483647, byte 127, Float new Float(valA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 2147483647;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3000
     * @tc.name testFloatCompareTo030
     * @tc.desc Verify compareTo(int -2147483648, byte -128, Float new Float(valA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3100
     * @tc.name testFloatCompareTo031
     * @tc.desc Verify compareTo(long 9223372036854775807, int 2147483647, Float new Float(valA), Float new Float(valB)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: int = 2147483647;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3200
     * @tc.name testFloatCompareTo032
     * @tc.desc Verify compareTo(long -9223372036854775808, int -2147483648, Float new Float(valA), Float new Float(valB)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = -9223372036854775808;
      const valB: int = -2147483648;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3300
     * @tc.name testFloatCompareTo033
     * @tc.desc Verify compareTo(short 32767, byte 127, Float new Float(valA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = 32767;
      const valB: byte = 127;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3400
     * @tc.name testFloatCompareTo034
     * @tc.desc Verify compareTo(short -32768, byte -128, Float new Float(valA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: short = -32768;
      const valB: byte = -128;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3500
     * @tc.name testFloatCompareTo035
     * @tc.desc Verify compareTo(int -2147483648, float 0.0f, Float new Float(valA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = -2147483648;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3600
     * @tc.name testFloatCompareTo036
     * @tc.desc Verify compareTo(float Float.NEGATIVE_INFINITY, int 0, Float new Float(valA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = Float.NEGATIVE_INFINITY;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3700
     * @tc.name testFloatCompareTo037
     * @tc.desc Verify compareTo(long 9223372036854775807, float 0.0f, Float new Float(valA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: long = 9223372036854775807;
      const valB: float = 0.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3800
     * @tc.name testFloatCompareTo038
     * @tc.desc Verify compareTo(byte -128, int 0, Float new Float(valA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: byte = -128;
      const valB: int = 0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_3900
     * @tc.name testFloatCompareTo039
     * @tc.desc Verify compareTo(double 3.0, int 2, Float new Float(valA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: double = 3.0;
      const valB: int = 2;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4000
     * @tc.name testFloatCompareTo040
     * @tc.desc Verify compareTo(float 1.0f, int 1, Float new Float(valA)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 1.0f;
      const valB: int = 1;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4100
     * @tc.name testFloatCompareTo041
     * @tc.desc Verify compareTo(int 50, double 25.0, Float new Float(valA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 50;
      const valB: double = 25.0;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4200
     * @tc.name testFloatCompareTo042
     * @tc.desc Verify compareTo(int 5, double Double.MIN_VALUE, Float new Float(valA)) returns 1 (comparing int 5 vs Double.MIN_VALUE)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: int = 5;
      const valB: double = Double.MIN_VALUE;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const r: int = a.compareTo(b);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4300
     * @tc.name testFloatCompareTo043
     * @tc.desc Verify compareTo throws ClassCastError when passing empty object literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      try {
        f.compareTo({} as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4400
     * @tc.name testFloatCompareTo044
     * @tc.desc Verify compareTo throws ClassCastError when passing custom JsonData instance as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const jsonData: JsonData = new JsonData();
      jsonData.key = 123;
      try {
        f.compareTo(jsonData as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4500
     * @tc.name testFloatCompareTo045
     * @tc.desc Verify compareTo throws ClassCastError when passing bigint literal as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const bigVal: bigint = 123n;
      try {
        f.compareTo(bigVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4600
     * @tc.name testFloatCompareTo046
     * @tc.desc Verify compareTo throws ClassCastError when passing Date object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const dateVal: Date = new Date();
      try {
        f.compareTo(dateVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4700
     * @tc.name testFloatCompareTo047
     * @tc.desc Verify compareTo throws ClassCastError when passing RegExp as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const regVal: RegExp = new RegExp('test');
      try {
        f.compareTo(regVal as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4800
     * @tc.name testFloatCompareTo048
     * @tc.desc Verify compareTo throws ClassCastError when passing Record object as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const rec: Record<string, number> = {'key': 1};
      try {
        f.compareTo(rec as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_4900
     * @tc.name testFloatCompareTo049
     * @tc.desc Verify compareTo throws ClassCastError when passing WeakMap as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const keyObj: Object = new Object();
      const wm: WeakMap<Object, int> = new WeakMap<Object, int>();
      wm.set(keyObj, 1);
      try {
        f.compareTo(wm as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5000
     * @tc.name testFloatCompareTo050
     * @tc.desc Verify compareTo throws ClassCastError when passing WeakSet as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1.0);
      const wsObj: Object = new Object();
      const ws: WeakSet<Object> = new WeakSet<Object>();
      ws.add(wsObj);
      try {
        f.compareTo(ws as Object as Float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5100
     * @tc.name testFloatCompareTo051
     * @tc.desc Verify compareTo(Float new Float(-5.5f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.5f);
      const result: int = a.compareTo(a);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5200
     * @tc.name testFloatCompareTo052
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(2.0f)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const c: Float = new Float(3.0f);
      const ab: int = a.compareTo(b);
      const bc: int = b.compareTo(c);
      const ac: int = a.compareTo(c);
      expect(ab).assertEqual(-1);
      expect(bc).assertEqual(-1);
      expect(ac).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5300
     * @tc.name testFloatCompareTo053
     * @tc.desc Verify compareTo(Float new Float(-3.0f), Float new Float(-2.0f)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-3.0f);
      const b: Float = new Float(-2.0f);
      const c: Float = new Float(-1.0f);
      const ab: int = a.compareTo(b);
      const bc: int = b.compareTo(c);
      const ac: int = a.compareTo(c);
      expect(ab).assertEqual(-1);
      expect(bc).assertEqual(-1);
      expect(ac).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5400
     * @tc.name testFloatCompareTo054
     * @tc.desc Verify compareTo idempotency: symmetrical calls with Float values 1.0f and 2.0f return opposite int results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const ab: int = a.compareTo(b);
      const ba: int = b.compareTo(a);
      expect(ab).assertEqual(-1);
      expect(ba).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5500
     * @tc.name testFloatCompareTo055
     * @tc.desc Verify compareTo idempotency: symmetrical calls with Float values -5.0f and -2.0f return opposite int results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-5.0f);
      const b: Float = new Float(-2.0f);
      const ab: int = a.compareTo(b);
      const ba: int = b.compareTo(a);
      expect(ab).assertEqual(-1);
      expect(ba).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5600
     * @tc.name testFloatCompareTo056
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(1.0f + Float.EPSILON * 2.0f)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.EPSILON * 2.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5700
     * @tc.name testFloatCompareTo057
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(1.0f + Float.DELTA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f + Float.DELTA);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5800
     * @tc.name testFloatCompareTo058
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(1.0f - Float.DELTA)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f - Float.DELTA);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_5900
     * @tc.name testFloatCompareTo059
     * @tc.desc Verify compareTo(Float new Float(16777216.0f), Float new Float(16777217.0f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(16777216.0f);
      const b: Float = new Float(16777217.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6000
     * @tc.name testFloatCompareTo060
     * @tc.desc Verify compareTo(Float new Float(1.0e10f), Float new Float(1.0e10f + 1.0f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f + 1.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6100
     * @tc.name testFloatCompareTo061
     * @tc.desc Verify compareTo(Float new Float(1.0e-10f), Float new Float(2.0e-10f)) returns 0 (comparing 1.0e-10f vs 2.0e-10f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e-10f);
      const b: Float = new Float(2.0e-10f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6200
     * @tc.name testFloatCompareTo062
     * @tc.desc Verify compareTo(Float new Float(-1.0f), Float new Float(-2.0f)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0f);
      const b: Float = new Float(-2.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6300
     * @tc.name testFloatCompareTo063
     * @tc.desc Verify compareTo(Float new Float(1.5), Float new Float(2.5)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5);
      const b: Float = new Float(2.5);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6400
     * @tc.name testFloatCompareTo064
     * @tc.desc Verify compareTo(Float new Float(2.5), Float new Float(1.5)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(2.5);
      const b: Float = new Float(1.5);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6500
     * @tc.name testFloatCompareTo065
     * @tc.desc Verify compareTo(Float new Float(1.5), Float new Float(1.5)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.5);
      const b: Float = new Float(1.5);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6600
     * @tc.name testFloatCompareTo066
     * @tc.desc Verify compareTo(Float new Float(), Float new Float(0.0f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float(0.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6700
     * @tc.name testFloatCompareTo067
     * @tc.desc Verify compareTo(Float new Float(), Float new Float()) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float();
      const b: Float = new Float();
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6800
     * @tc.name testFloatCompareTo068
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(1.0f))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0f);
      const cmpResult: int = a.compareTo(b);
      expect(cmpResult).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_6900
     * @tc.name testFloatCompareTo069
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(2.0f)) returns !floatCmpResult
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(2.0f);
      const cmpResult: int = a.compareTo(b);
      const floatCmpResult: boolean = Float.compare(a.toFloat(), b.toFloat());
      expect(cmpResult !== 0).assertEqual(!floatCmpResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7000
     * @tc.name testFloatCompareTo070
     * @tc.desc Verify chained not then assertNull() on Float(3.0f) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maybeNull: Float | null = new Float(3.0f);
      const a: Float = new Float(1.0f);
      expect(maybeNull).not().assertNull();
      const result: int = a.compareTo(maybeNull!);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7100
     * @tc.name testFloatCompareTo071
     * @tc.desc Verify compareTo(Float new Float(-Float.MAX_SAFE_INTEGER), Float new Float(-Float.MAX_SAFE_INTEGER + 1.0f)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(-Float.MAX_SAFE_INTEGER + 1.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7200
     * @tc.name testFloatCompareTo072
     * @tc.desc Verify compareTo(Float new Float(0.0f), Float new Float(Float.DELTA / 2.0f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
      const b: Float = new Float(Float.DELTA / 2.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7300
     * @tc.name testFloatCompareTo073
     * @tc.desc Verify compareTo(Float new Float(0.0f), Float new Float(Float.EPSILON)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(0.0f);
      const b: Float = new Float(Float.EPSILON);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7400
     * @tc.name testFloatCompareTo074
     * @tc.desc Verify compareTo(Float new Float(Float.NEGATIVE_INFINITY), Float new Float(Float.MIN_VALUE)) returns -1 for Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(Float.MIN_VALUE);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7500
     * @tc.name testFloatCompareTo075
     * @tc.desc Verify compareTo(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(Float.POSITIVE_INFINITY)) returns -1 for Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7600
     * @tc.name testFloatCompareTo076
     * @tc.desc Verify compareTo(Float new Float(Float.NEGATIVE_INFINITY), Float new Float(-Float.MAX_SAFE_INTEGER)) returns -1 for -Float.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7700
     * @tc.name testFloatCompareTo077
     * @tc.desc Verify compareTo(Float new Float(1.0f), Float new Float(1.0)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0f);
      const b: Float = new Float(1.0);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7800
     * @tc.name testFloatCompareTo078
     * @tc.desc Verify compareTo(Float new Float(5), Float new Float(5.0f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(5);
      const b: Float = new Float(5.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_7900
     * @tc.name testFloatCompareTo079
     * @tc.desc Verify compareTo(float 3.0f, float 5.0f, Float new Float(valA)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valA: float = 3.0f;
      const valB: float = 5.0f;
      const a: Float = new Float(valA);
      const b: Float = new Float(valB);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8000
     * @tc.name testFloatCompareTo080
     * @tc.desc Verify compareTo(Float new Float(Float.EPSILON), Float new Float(Float.EPSILON)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(Float.EPSILON);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8100
     * @tc.name testFloatCompareTo081
     * @tc.desc Verify compareTo(Float new Float(Float.DELTA), Float new Float(Float.DELTA)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.DELTA);
      const b: Float = new Float(Float.DELTA);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8200
     * @tc.name testFloatCompareTo082
     * @tc.desc Verify compareTo idempotency: multiple calls with Float values 3.0f and 7.0f return the same int result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(3.0f);
      const b: Float = new Float(7.0f);
      const r1: int = a.compareTo(b);
      const r2: int = a.compareTo(b);
      const r3: int = a.compareTo(b);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8300
     * @tc.name testFloatCompareTo083
     * @tc.desc Verify compareTo(Float new Float(1.0e5f), Float new Float(100000.0f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e5f);
      const b: Float = new Float(100000.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8400
     * @tc.name testFloatCompareTo084
     * @tc.desc Verify compareTo(Float new Float(Float.MAX_SAFE_INTEGER), Float new Float(-Float.MAX_SAFE_INTEGER)) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.MAX_SAFE_INTEGER);
      const b: Float = new Float(-Float.MAX_SAFE_INTEGER);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8500
     * @tc.name testFloatCompareTo085
     * @tc.desc Verify compareTo(Float new Float(Float.NEGATIVE_INFINITY), Float new Float(0.0f)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.NEGATIVE_INFINITY);
      const b: Float = new Float(0.0f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8600
     * @tc.name testFloatCompareTo086
     * @tc.desc Verify compareTo(Float new Float(1.0e10f), Float new Float(1.0e10f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(1.0e10f);
      const b: Float = new Float(1.0e10f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8700
     * @tc.name testFloatCompareTo087
     * @tc.desc Verify compareTo(Float new Float(-1.0e10f), Float new Float(-1.0e10f)) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(-1.0e10f);
      const b: Float = new Float(-1.0e10f);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_COMPARETO_2_8800
     * @tc.name testFloatCompareTo088
     * @tc.desc Verify compareTo(Float new Float(Float.EPSILON), Float new Float(Float.POSITIVE_INFINITY)) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatCompareTo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float = new Float(Float.EPSILON);
      const b: Float = new Float(Float.POSITIVE_INFINITY);
      const result: int = a.compareTo(b);
      expect(result).assertEqual(-1);
    });

  })
}
