'use static';

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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function mathPowTest2(): void {
  describe('MathPowTest2', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0100
     * @tc.name testMathPow001
     * @tc.desc Verify Math.pow throws ClassCastError when Cyrillic Unicode string is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'Дел';
        Math.pow(s as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0200
     * @tc.name testMathPow002
     * @tc.desc Verify Math.pow returns 8.000000 for base 2 exponent 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathPow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 2
      let exponent: double = 3.0
      let result: double = Math.pow(base, exponent)
      expect(result).assertClose(8.000000, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0300
     * @tc.name testMathPow003
     * @tc.desc Verify Math.pow with float base 1.5 and double exponent 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 1.5f;
      let exp: double = 2.0;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 2.25)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0400
     * @tc.name testMathPow004
     * @tc.desc Verify Math.pow with null base throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (exp: number, base: number) => number)(null as Object as number, 2.0)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0500
     * @tc.name testMathPow005
     * @tc.desc Verify Math.pow with float base Float.MAX_VALUE and double exponent 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.MAX_VALUE;
      let exp: double = 1.0;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 3.4028234663852886e38)).assertLess(1e30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0600
     * @tc.name testMathPow006
     * @tc.desc Verify Math.pow returns 216.000000 for base 6 exponent 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathPow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 6
      let exponent: double = 3.0
      let result: double = Math.pow(base, exponent)
      expect(result).assertClose(216.000000, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0700
     * @tc.name testMathPow007
     * @tc.desc Verify Math.pow with int base Integer.MAX_VALUE and byte exponent 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2147483647;
      let exp: byte = 2;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 4.6116860141324206e18)).assertLess(1e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0800
     * @tc.name testMathPow008
     * @tc.desc Verify Math.pow with int base Integer.MIN_VALUE and float exponent 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = -2147483648;
      let exp: float = 2.0f;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 4611686018427387904.0)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_0900
     * @tc.name testMathPow009
     * @tc.desc Verify Math.pow with double base 16.0 and double exponent 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 16.0;
      let exp: double = 0.5;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1000
     * @tc.name testMathPow010
     * @tc.desc Verify Math.pow with int base Integer.MAX_VALUE and double exponent Double.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2147483647;
      let exp: double = Double.MAX_VALUE;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1100
     * @tc.name testMathPow011
     * @tc.desc Verify Math.pow throws ClassCastError when boolean is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.pow(true as object as double, 2.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1200
     * @tc.name testMathPow012
     * @tc.desc Verify Math.pow with XSS string exponent throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (base: number, exp: number) => number)(2.0, '<script>alert(1)</script>' as Object as number)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1300
     * @tc.name testMathPow013
     * @tc.desc Verify Math.pow identity: pow(x, 0) equals 1 with decimal literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 511;
      let result: double = Math.pow(val, 0.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1400
     * @tc.name testMathPow014
     * @tc.desc Verify Math.pow results are finite for moderate integer inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[][] = [[2.0, 3.0], [4.0, 2.0], [10.0, 2.0]];
      let exp: double[] = [8.0, 16.0, 100.0];
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.pow(vs[i][0], vs[i][1]);
        expect(result).assertClose(exp[i], 1e-6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1500
     * @tc.name testMathPow015
     * @tc.desc Verify Math.pow consistency between int and double parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intResult: double = Math.pow(2, 3);
      let dblResult: double = Math.pow(2.0, 3.0);
      expect(Math.abs(intResult - dblResult)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1600
     * @tc.name testMathPow016
     * @tc.desc Verify Math.pow with int base 5 and long exponent 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 5;
      let exp: long = 0;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1700
     * @tc.name testMathPow017
     * @tc.desc Verify Math.pow throws ClassCastError when undefined is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined;
        Math.pow(u as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1800
     * @tc.name testMathPow018
     * @tc.desc Verify Math.pow with byte base 12 and int exponent 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = 12;
      let exp: int = 2;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(144.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_1900
     * @tc.name testMathPow019
     * @tc.desc Verify Math.pow with long base Long.MAX_VALUE and float exponent 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = 9223372036854775807;
      let exp: float = 1.0f;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 9.223372036854776e18)).assertLess(1e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2000
     * @tc.name testMathPow020
     * @tc.desc Verify Math.pow with int base 2 and double exponent Double.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2;
      let exp: double = Double.MIN_VALUE;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 1.0)).assertLess(1e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2100
     * @tc.name testMathPow021
     * @tc.desc Verify Math.pow with long base 100 and double exponent 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = 100;
      let exp: double = 0.5;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2200
     * @tc.name testMathPow022
     * @tc.desc Verify Math.pow with empty string base throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (exp: number, base: number) => number)('' as Object as number, 2.0)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2300
     * @tc.name testMathPow023
     * @tc.desc Verify Math.pow with boolean exponent true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (base: number, exp: number) => number)(2.0, true as Object as number)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2400
     * @tc.name testMathPow024
     * @tc.desc Verify Math.pow identity: pow(-1, even exponent) equals 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: double = Math.pow(-1.0, 2.0);
      expect(result1).assertEqual(1.0);
      let result2: double = Math.pow(-1.0, 4.0);
      expect(result2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2500
     * @tc.name testMathPow025
     * @tc.desc Verify Math.pow with float base 2.0 and double exponent Double.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 2.0f;
      let exp: double = Double.MIN_VALUE;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 1.0)).assertLess(1e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2600
     * @tc.name testMathPow026
     * @tc.desc Verify Math.pow with int base 10 and long exponent Long.MAX_VALUE returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 10;
      let exp: long = 9223372036854775807;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2700
     * @tc.name testMathPow027
     * @tc.desc Verify Math.pow throws ClassCastError when string "abc" is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.pow('abc' as object as double, 2.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2800
     * @tc.name testMathPow028
     * @tc.desc Verify Math.pow with long base 8 and float exponent 1/3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = 8;
      let exp: float = 1.0f / 3.0f;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 2.0)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_2900
     * @tc.name testMathPow029
     * @tc.desc Verify Math.pow identity: pow(0, x) equals 0 for positive x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: double = Math.pow(0.0, 1.0);
      expect(result1).assertEqual(0.0);
      let result2: double = Math.pow(0.0, 5.0);
      expect(result2).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3000
     * @tc.name testMathPow030
     * @tc.desc Verify Math.pow identity: pow(x, 0) equals 1 for different MIN_VALUE inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1:short = -32768
      let val2:int = -2147483648
      let sR: double = Math.pow(val1, 0.0);
      let iR: double = Math.pow(val2, 0.0);
      expect(Math.abs(sR - iR)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3100
     * @tc.name testMathPow031
     * @tc.desc Verify Math.pow returns 27.000000 for base 3 exponent 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathPow031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 3
      let exponent: double = 3.0
      let result: double = Math.pow(base, exponent)
      expect(result).assertClose(27.000000, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3200
     * @tc.name testMathPow032
     * @tc.desc Verify Math.pow consistency between byte and int typed parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bBase: byte = 2;
      let bExp: byte = 3;
      let bR: double = Math.pow(bBase, bExp);
      let iBase: int = 2;
      let iExp: int = 3;
      let iR: double = Math.pow(iBase, iExp);
      expect(Math.abs(bR - iR)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3300
     * @tc.name testMathPow033
     * @tc.desc Verify Math.pow with byte base 3 and float exponent 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = 3;
      let exp: float = 2.0f;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3400
     * @tc.name testMathPow034
     * @tc.desc Verify Math.pow with int base 2 and float exponent Float.MAX_VALUE returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2;
      let exp: float = Float.MAX_VALUE;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3500
     * @tc.name testMathPow035
     * @tc.desc Verify Math.pow with int base 2 and long exponent Long.MIN_VALUE returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2;
      let exp: long = -9223372036854775808;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3600
     * @tc.name testMathPow036
     * @tc.desc Verify Math.pow with int base 9 and double exponent 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 9;
      let exp: double = 0.5;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3700
     * @tc.name testMathPow037
     * @tc.desc Verify Math.pow identity: pow(x, 0) equals 1 with binary literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b11111111;
      let result: double = Math.pow(val, 0.0);
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3800
     * @tc.name testMathPow038
     * @tc.desc Verify Math.pow with int base 10 and float exponent Float.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 10;
      let exp: float = Float.MIN_VALUE;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 1.0)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_3900
     * @tc.name testMathPow039
     * @tc.desc Verify Math.pow with negative int base -3 and float exponent 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = -3;
      let exp: float = 2.0f;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4000
     * @tc.name testMathPow040
     * @tc.desc Verify Math.pow throws ClassCastError when Set<int> is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>();
        set.add(1);
        Math.pow(set as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4100
     * @tc.name testMathPow041
     * @tc.desc Verify Math.pow throws ClassCastError when Object array is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true];
        Math.pow(arr as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4200
     * @tc.name testMathPow042
     * @tc.desc Verify Math.pow with int base Integer.MAX_VALUE and double exponent 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2147483647;
      let exp: double = 0.5;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 46340.950001051984)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4300
     * @tc.name testMathPow043
     * @tc.desc Verify Math.pow with int base 2 and long exponent 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2;
      let exp: long = 10;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(1024.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4400
     * @tc.name testMathPow044
     * @tc.desc Verify Math.pow identity: pow(x, 0) equals 1 for different MAX_VALUE inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1:byte = 127
      let val2:int = 2147483647
      let bR: double = Math.pow(val1, 0.0);
      let iR: double = Math.pow(val2, 0.0);
      expect(Math.abs(bR - iR)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4500
     * @tc.name testMathPow045
     * @tc.desc Verify Math.pow with extra arguments handles correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (Math.pow as Object as (x:number, y:number, z:number)=>number)(2.0, 3.0, 4.0)
      expect(result).assertClose(Math.pow(2.0, 3.0), 1e-12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4600
     * @tc.name testMathPow046
     * @tc.desc Verify Math.pow with byte base 3 and short exponent 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = 3;
      let exp: short = 4;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(81.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4700
     * @tc.name testMathPow047
     * @tc.desc Verify Math.pow with long base Long.MAX_VALUE and float exponent Float.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = 9223372036854775807;
      let exp: float = Float.MAX_VALUE;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4800
     * @tc.name testMathPow048
     * @tc.desc Verify Math.pow: pow(NaN, 1.0) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NaN, 1.0)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_4900
     * @tc.name testMathPow049
     * @tc.desc Verify Math.pow with short base Short.MAX_VALUE and long exponent 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: short = 32767;
      let exp: long = 2;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(1073676289.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5000
     * @tc.name testMathPow050
     * @tc.desc Verify Math.pow with null exponent throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (base: number, exp: number) => number)(2.0, null as Object as number)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5100
     * @tc.name testMathPow051
     * @tc.desc Verify Math.pow with int base 4 and float exponent 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 4;
      let exp: float = 0.5f;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5200
     * @tc.name testMathPow052
     * @tc.desc Verify Math.pow with boolean base true throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (exp:number, base:number)=>number)(true as Object as number, 2.0)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5300
     * @tc.name testMathPow053
     * @tc.desc Verify Math.pow throws ClassCastError when Array<number> is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = [1, 2, 3];
        Math.pow(list as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5400
     * @tc.name testMathPow054
     * @tc.desc Verify Math.pow with long base Long.MIN_VALUE and double exponent 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = -9223372036854775808;
      let exp: double = 2.0;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 8.507059173023461e37)).assertLess(1e24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5500
     * @tc.name testMathPow055
     * @tc.desc Verify Math.pow with int base 2 and float exponent -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2;
      let exp: float = -1.0f;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5600
     * @tc.name testMathPow056
     * @tc.desc Verify Math.pow returns 125.000000 for base 5 exponent 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathPow056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 5
      let exponent: double = 3.0
      let result: double = Math.pow(base, exponent)
      expect(result).assertClose(125.000000, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5700
     * @tc.name testMathPow057
     * @tc.desc Verify Math.pow throws ClassCastError when Object is passed as first parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object();
        Math.pow(obj as object as double, 2.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5800
     * @tc.name testMathPow058
     * @tc.desc Verify Math.pow throws ClassCastError when Function is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {};
        Math.pow(fn as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_5900
     * @tc.name testMathPow059
     * @tc.desc Verify Math.pow throws ClassCastError when 2D int array is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]];
        Math.pow(matrix as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6000
     * @tc.name testMathPow060
     * @tc.desc Verify Math.pow with int base Integer.MAX_VALUE and long exponent 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2147483647;
      let exp: long = 1;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 2147483647.0)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6100
     * @tc.name testMathPow061
     * @tc.desc Verify Math.pow with int base Integer.MAX_VALUE and float exponent 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2147483647;
      let exp: float = 1.0f;
      let result: double = Math.pow(base, exp);
      expect(Math.abs(result - 2147483647.0)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6200
     * @tc.name testMathPow062
     * @tc.desc Verify Math.pow with float base 4.0 and double exponent 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 4.0f;
      let exp: double = 0.5;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6300
     * @tc.name testMathPow063
     * @tc.desc Verify Math.pow throws ClassCastError when Object is passed as second parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object();
        Math.pow(2.0, obj as object as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6400
     * @tc.name testMathPow064
     * @tc.desc Verify Math.pow with short base 3 and int exponent 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: short = 3;
      let exp: int = 3;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(27.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6500
     * @tc.name testMathPow065
     * @tc.desc Verify Math.pow with int base 2 and byte exponent 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 2;
      let exp: byte = 5;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(32.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6600
     * @tc.name testMathPow066
     * @tc.desc Verify Math.pow with undefined base throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (exp: number, base: number) => number)(undefined as Object as number, 2.0)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6700
     * @tc.name testMathPow067
     * @tc.desc Verify Math.pow throws ClassCastError when null is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.pow(null as object as double, 2.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6800
     * @tc.name testMathPow068
     * @tc.desc Verify Math.pow with long base Long.MIN_VALUE and double exponent Double.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = -9223372036854775808;
      let exp: double = Double.MIN_VALUE;
      let result: double = Math.pow(base, exp);
      expect(isNaN(result) || Math.abs(result - 1.0) < 1e-9).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_6900
     * @tc.name testMathPow069
     * @tc.desc Verify Math.pow throws ClassCastError when double array is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0];
        Math.pow(arr as object as double, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7000
     * @tc.name testMathPow070
     * @tc.desc Verify Math.pow with long base 0 and float exponent 2.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: long = 0;
      let exp: float = 2.5f;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7100
     * @tc.name testMathPow071
     * @tc.desc Verify Math.pow consistency between short and int typed parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sBase: short = 5;
      let sExp: short = 2;
      let sR: double = Math.pow(sBase, sExp);
      let iBase: int = 5;
      let iExp: int = 2;
      let iR: double = Math.pow(iBase, iExp);
      expect(Math.abs(sR - iR)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7200
     * @tc.name testMathPow072
     * @tc.desc Verify Math.pow with byte base 2 and long exponent 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: byte = 2;
      let exp: long = 8;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(256.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7300
     * @tc.name testMathPow073
     * @tc.desc Verify Math.pow throws ClassCastError when char is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a';
        Math.pow(c as object as double, 2.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7400
     * @tc.name testMathPow074
     * @tc.desc Verify Math.pow with short base 5 and double exponent 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: short = 5;
      let exp: double = 2.0;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(25.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7500
     * @tc.name testMathPow075
     * @tc.desc Verify Math.pow with float base 2.0 and double exponent Double.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = 2.0f;
      let exp: double = Double.MAX_VALUE;
      let result: double = Math.pow(base, exp);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7600
     * @tc.name testMathPow076
     * @tc.desc Verify Math.pow with undefined exponent throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Math.pow as Object as (base: number, exp: number) => number)(2.0, undefined as Object as number)
        expect(0).assertEqual(1)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7700
     * @tc.name testMathPow077
     * @tc.desc Verify Math.pow with NaN base returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: float = Float.NaN;
      let exp: double = 2.0;
      let result: double = Math.pow(base, exp);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7800
     * @tc.name testMathPow078
     * @tc.desc Verify Math.pow returns 64.000000 for base 4 exponent 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathPow078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: double = 4
      let exponent: double = 3.0
      let result: double = Math.pow(base, exponent)
      expect(result).assertClose(64.000000, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_POW_7900
     * @tc.name testMathPow079
     * @tc.desc Verify Math.pow: pow(NaN, NaN) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathPow079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.pow(Double.NaN, Double.NaN)
      expect(isNaN(result)).assertTrue()
    });

  });
}
