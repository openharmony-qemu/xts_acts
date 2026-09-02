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

export default function mathHypotTest2(): void {
  describe('MathHypotTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0100
     * @tc.name testMathHypot001
     * @tc.desc Verify hypot: hypot(long 3, long 4) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 3
      let b: long = 4
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0200
     * @tc.name testMathHypot002
     * @tc.desc Verify hypot returns 6.708203932499369 with input (double 3, double 6)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3
      let b: double = 6
      let result: double = Math.hypot(a, b)
      expect(result).assertClose(6.708203932499369, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0300
     * @tc.name testMathHypot003
     * @tc.desc Verify hypot: hypot(int -3, int -4) absolute value of negative numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -3
      let b: int = -4
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0400
     * @tc.name testMathHypot004
     * @tc.desc Verify hypot method returns Infinity when positive infinity is combined with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.POSITIVE_INFINITY, Double.NaN)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0500
     * @tc.name testMathHypot005
     * @tc.desc Verify hypot: hypot(3,4) = 5 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        expect(Math.hypot(3.0, 4.0)).assertEqual(5.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0600
     * @tc.name testMathHypot006
     * @tc.desc Verify hypot returns 2.23606797749979 with input (int -1, int -2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1
      let b: int = -2
      let result: double = Math.hypot(a, b)
      expect(result).assertClose(2.23606797749979, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0700
     * @tc.name testMathHypot007
     * @tc.desc Verify hypot: hypot(short 5, short 12) = 13
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 5
      let b: short = 12
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(13.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0800
     * @tc.name testMathHypot008
     * @tc.desc Verify hypot: hypot(byte 9 + double 12.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 9
      let b: double = 12.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(15.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0900
     * @tc.name testMathHypot009
     * @tc.desc Verify hypot method returns Infinity when positive infinity is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.POSITIVE_INFINITY, 1.0)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1000
     * @tc.name testMathHypot010
     * @tc.desc Verify hypot method with five arguments of varying sizes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(1.0, 1.0, 1.0, 1.0, 1.0)
      expect(result).assertClose(2.23606797749979, 1.0e-12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1100
     * @tc.name testMathHypot011
     * @tc.desc Verify hypot batch property: result >= |a| for double pairs (1.0,2.0), (3.0,4.0), (5.0,6.0), (1.0,10.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs: double[][] = [[1.0,2.0],[3.0,4.0],[5.0,6.0],[1.0,10.0]]
      for (let i: int = 0; i < pairs.length; i++) {
        let r: double = Math.hypot(pairs[i][0], pairs[i][1])
        expect(r >= Math.abs(pairs[i][0])).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1200
     * @tc.name testMathHypot012
     * @tc.desc Verify hypot: hypot(short 3, short 4) and hypot(int 3, int 4) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aShort: short = 3
      let bShort: short = 4
      let aInt: int = 3
      let bInt: int = 4
      let sR: double = Math.hypot(aShort, bShort)
      let iR: double = Math.hypot(aInt, bInt)
      expect(sR).assertClose(iR, 1e-6)
      expect(sR).assertClose(5.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1300
     * @tc.name testMathHypot013
     * @tc.desc Verify hypot throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.hypot(arr as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1400
     * @tc.name testMathHypot014
     * @tc.desc Verify hypot: hypot(int 7 + double 24.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 7
      let b: double = 24.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(25.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1500
     * @tc.name testMathHypot015
     * @tc.desc Verify hypot: hypot(long 11 + float 60.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 11
      let b: float = 60.0f
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(61.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1600
     * @tc.name testMathHypot016
     * @tc.desc Verify hypot: hypot(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[][] = [[1.0,2.0],[3.0,4.0],[5.0,12.0],[1e10,1e10]]
      let exp: double[] = [2.23606797749979, 5.0, 13.0, 14142135623.730951]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.hypot(vs[i][0], vs[i][1])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1700
     * @tc.name testMathHypot017
     * @tc.desc Verify hypot with infinity with input a, b [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NEGATIVE_INFINITY
      let b: double = Double.NEGATIVE_INFINITY
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1800
     * @tc.name testMathHypot018
     * @tc.desc Verify hypot returns 2.23606797749979 with input (short 1, short 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1
      let b: short = 2
      let result: double = Math.hypot(a, b)
      expect(result).assertClose(2.23606797749979, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1900
     * @tc.name testMathHypot019
     * @tc.desc Verify hypot method with integer MAX_VALUE and zero preserves widened value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Int.MAX_VALUE, 0.0)
      expect(result).assertEqual(2147483647.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2000
     * @tc.name testMathHypot020
     * @tc.desc Verify hypot method with float MIN_VALUE and MIN_VALUE returns positive tiny
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: float = Float.MIN_VALUE
      let input2: float = Float.MIN_VALUE
      let result: double = Math.hypot(input1, input2)
      expect(result).assertClose(1.981735293180747e-45, 1e-30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2100
     * @tc.name testMathHypot021
     * @tc.desc Verify hypot returns 0 with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = -0.0
      let b: double = 0.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2200
     * @tc.name testMathHypot022
     * @tc.desc Verify hypot with infinity with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 1.0
      let b: double = Double.NEGATIVE_INFINITY
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2300
     * @tc.name testMathHypot023
     * @tc.desc Verify hypot: hypot(byte 1, byte 2) and hypot(int 1, int 2) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aByte: byte = 1
      let bByte: byte = 2
      let aInt: int = 1
      let bInt: int = 2
      let bR: double = Math.hypot(aByte, bByte)
      let iR: double = Math.hypot(aInt, bInt)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertClose(2.23606797749979, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2400
     * @tc.name testMathHypot024
     * @tc.desc Verify hypot throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.hypot('abc' as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2500
     * @tc.name testMathHypot025
     * @tc.desc Verify hypot: hypot(float 3.0f, float 4.0f) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 3.0f
      let b: float = 4.0f
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2600
     * @tc.name testMathHypot026
     * @tc.desc Verify hypot: hypot(short 16 + double 30.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 16
      let b: double = 30.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(34.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2700
     * @tc.name testMathHypot027
     * @tc.desc Verify hypot method returns Infinity when negative infinity is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.NEGATIVE_INFINITY, 1.0)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2800
     * @tc.name testMathHypot028
     * @tc.desc Verify hypot throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.hypot(c as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2900
     * @tc.name testMathHypot029
     * @tc.desc Verify hypot method returns NaN for all NaN arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.NaN, Double.NaN)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3000
     * @tc.name testMathHypot030
     * @tc.desc Verify hypot method with integer MIN_VALUE and zero returns absolute value 2147483648.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Int.MIN_VALUE, 0.0)
      expect(result).assertEqual(2147483648.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3100
     * @tc.name testMathHypot031
     * @tc.desc Verify hypot batch property: hypot(a, b as Object as double) equals sqrt(a*a + b*b) for pairs (3.0,4.0), (5.0,12.0), (8.0,15.0), (7.0,24.0), (20.0,21.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs: double[][] = [[3.0,4.0],[5.0,12.0],[8.0,15.0],[7.0,24.0],[20.0,21.0]]
      for (let i: int = 0; i < pairs.length; i++) {
        let a: double = pairs[i][0]
        let b: double = pairs[i][1]
        let r1: double = Math.hypot(a, b as Object as double)
        let r2: double = Math.sqrt(a * a + b * b)
        expect(r1).assertEqual(r2)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3200
     * @tc.name testMathHypot032
     * @tc.desc Verify hypot: hypot(int 0, int 5) = 5(on the axis)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0
      let b: int = 5
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3300
     * @tc.name testMathHypot033
     * @tc.desc Verify hypot with NaN returns NaN with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 1.0
      let b: double = Double.NaN
      let result: double = Math.hypot(a, b)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3400
     * @tc.name testMathHypot034
     * @tc.desc Verify hypot: hypot(3, 4) = 5(3-4-5 Pythagorean triple)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.0
      let b: double = 4.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3500
     * @tc.name testMathHypot035
     * @tc.desc Verify hypot method with absolute consistency for same arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.hypot(3.0, 4.0)
      let second: double = Math.hypot(3.0, 4.0)
      expect(first).assertEqual(second)
      expect(first).assertClose(5.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3600
     * @tc.name testMathHypot036
     * @tc.desc Verify hypot overflow behavior with input a, b [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 100000
      let b: int = 100000
      let r: double = Math.hypot(a, b)
      expect(isFinite(r)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3700
     * @tc.name testMathHypot037
     * @tc.desc Verify hypot: hypot(int 6, int 8) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iR: double = Math.hypot(6, 8)
      let dR: double = Math.hypot(6.0, 8.0)
      expect(iR).assertClose(dR, 1e-6)
      expect(iR).assertClose(10.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3800
     * @tc.name testMathHypot038
     * @tc.desc Verify hypot batch property: hypot(a, b) equals hypot(b, a) for double pairs (1.0,2.0), (3.0,4.0), (6.0,8.0), (10.0,10.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs: double[][] = [[1.0,2.0],[3.0,4.0],[6.0,8.0],[10.0,10.0]]
      for (let i: int = 0; i < pairs.length; i++) {
        let r1: double = Math.hypot(pairs[i][0], pairs[i][1])
        let r2: double = Math.hypot(pairs[i][1], pairs[i][0])
        expect(r1).assertEqual(r2)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3900
     * @tc.name testMathHypot039
     * @tc.desc Verify hypot with infinity with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.POSITIVE_INFINITY
      let b: double = 1.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4000
     * @tc.name testMathHypot040
     * @tc.desc Verify hypot: hypot(a, b) <= |a| + |b|(triangle inequality)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.0
      let b: double = 4.0
      let r: double = Math.hypot(a, b)
      expect(r <= Math.abs(a) + Math.abs(b)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4100
     * @tc.name testMathHypot041
     * @tc.desc Verify hypot method with MIN_VALUE and MIN_VALUE returns a positive tiny value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.MIN_VALUE, Double.MIN_VALUE)
      expect(result).assertClose(6.86e-324, 1e-300)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4200
     * @tc.name testMathHypot042
     * @tc.desc Verify hypot: hypot(float Float.MAX_VALUE + double 1.0) boundary + normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = Float.MAX_VALUE
      let b: double = 1.0
      let result: double = Math.hypot(a, b)
      expect(isFinite(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4300
     * @tc.name testMathHypot043
     * @tc.desc Verify hypot(undefined, 3, 4) with mixed undefined and valid args throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.hypot(undefined as number, 3.0, 4.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4400
     * @tc.name testMathHypot044
     * @tc.desc Verify hypot returns 0.0 with input byte 0, byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathHypot044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0
      let b: byte = 0
      let result: double = Math.hypot(a, b)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4500
     * @tc.name testMathHypot045
     * @tc.desc Verify hypot: hypot(long 28 + double 45.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 28
      let b: double = 45.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(53.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4600
     * @tc.name testMathHypot046
     * @tc.desc Verify hypot returns 4.47213595499958 with input (float 2, float 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2
      let b: float = 4
      let result: double = Math.hypot(a, b)
      expect(result).assertClose(4.47213595499958, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4700
     * @tc.name testMathHypot047
     * @tc.desc Verify hypot with NaN returns NaN with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NaN
      let b: double = 1.0
      let result: double = Math.hypot(a, b)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4800
     * @tc.name testMathHypot048
     * @tc.desc Verify hypot: hypot(int 3 + float 4.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 3
      let b: float = 4.0f
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4900
     * @tc.name testMathHypot049
     * @tc.desc Verify hypot: hypot(a, b) >= max(|a|, |b|)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs: double[][] = [[3.0,4.0],[5.0,12.0],[1.0,2.0],[10.0,10.0]]
      for (let i: int = 0; i < pairs.length; i++) {
        let r: double = Math.hypot(pairs[i][0], pairs[i][1])
        let m: double = Math.max(Math.abs(pairs[i][0]), Math.abs(pairs[i][1]))
        expect(r >= m).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5000
     * @tc.name testMathHypot050
     * @tc.desc Verify hypot throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.hypot(null as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5100
     * @tc.name testMathHypot051
     * @tc.desc Verify hypot method with float NaN in second position returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(1.0, Float.NaN)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5200
     * @tc.name testMathHypot052
     * @tc.desc Verify hypot method with all NaN arguments returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.NaN, Double.NaN, Double.NaN)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5300
     * @tc.name testMathHypot053
     * @tc.desc Verify hypot: hypot(3.0, 0.0) = 3.0, hypot(-5.0, 0.0) = 5.0, hypot(0.0, 7.0) = 7.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.hypot(3.0, 0.0)).assertEqual(3.0)
      expect(Math.hypot(-5.0, 0.0)).assertEqual(5.0)
      expect(Math.hypot(0.0, 7.0)).assertEqual(7.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5400
     * @tc.name testMathHypot054
     * @tc.desc Verify hypot: hypot large-number ratio
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 1.0e150
      let b: double = 1.0e-150
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(1.0e150)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5500
     * @tc.name testMathHypot055
     * @tc.desc Verify hypot throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.hypot(obj as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5600
     * @tc.name testMathHypot056
     * @tc.desc Verify hypot returns 22.360679774997898 with input (long 10, long 20)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10
      let b: long = 20
      let result: double = Math.hypot(a, b)
      expect(result).assertClose(22.360679774997898, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5700
     * @tc.name testMathHypot057
     * @tc.desc Verify hypot: hypot(a, b) = hypot(b, a) symmetry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.hypot(3.0, 4.0)).assertClose(Math.hypot(4.0, 3.0), 1e-9)
      expect(Math.hypot(5.0, 12.0)).assertClose(Math.hypot(12.0, 5.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5800
     * @tc.name testMathHypot058
     * @tc.desc Verify hypot(3.0, 4.0) returns 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathHypot058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.0;
      let b: double = 4.0;
      let result: double = Math.hypot(a, b);
      expect(result).assertClose(5.0, 1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5900
     * @tc.name testMathHypot059
     * @tc.desc Verify hypot overflow behavior with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 1.0e154
      let b: double = 1.0e154
      let r: double = Math.hypot(a, b)
      expect(isFinite(r)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6000
     * @tc.name testMathHypot060
     * @tc.desc Verify hypot method with a mix of NaN and negative infinity returns positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.NEGATIVE_INFINITY, Double.NaN)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6100
     * @tc.name testMathHypot061
     * @tc.desc Verify hypot: hypot(short 30 + float 40.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 30
      let b: float = 40.0f
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(50.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6200
     * @tc.name testMathHypot062
     * @tc.desc Verify hypot throws ClassCastError with 1.0, obj as Object as double parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.hypot(1.0, obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6300
     * @tc.name testMathHypot063
     * @tc.desc Verify hypot: hypot(byte 3 + short 4) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 3
      let b: short = 4
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6400
     * @tc.name testMathHypot064
     * @tc.desc Verify hypot(undefined) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.hypot(undefined as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6500
     * @tc.name testMathHypot065
     * @tc.desc Verify hypot overflow behavior with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.MAX_VALUE / 2.0
      let b: double = Double.MAX_VALUE / 2.0
      let r: double = Math.hypot(a, b)
      expect(isFinite(r)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6600
     * @tc.name testMathHypot066
     * @tc.desc Verify hypot throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.hypot(true as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6700
     * @tc.name testMathHypot067
     * @tc.desc Verify hypot: hypot(0.0, 4.0) = 4.0, hypot(0.0, -2.0) = 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.hypot(0.0, 4.0)).assertEqual(4.0)
      expect(Math.hypot(0.0, -2.0)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6800
     * @tc.name testMathHypot068
     * @tc.desc Verify hypot: hypot(float 1.5f + double 2.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 1.5f
      let b: double = 2.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(2.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6900
     * @tc.name testMathHypot069
     * @tc.desc Verify hypot: hypot(byte 3, byte 4) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 3
      let b: byte = 4
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7000
     * @tc.name testMathHypot070
     * @tc.desc Verify hypot method with float MAX_VALUE and MAX_VALUE returns finite value close to Float.MAX_VALUE * sqrt(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Float.MAX_VALUE, Float.MAX_VALUE)
      expect(result).assertClose(Float.MAX_VALUE * Math.sqrt(2.0), 1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7100
     * @tc.name testMathHypot071
     * @tc.desc Verify hypot: hypot(byte 8 + int 15) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 8
      let b: int = 15
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(17.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7200
     * @tc.name testMathHypot072
     * @tc.desc Verify hypot returns 0 with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 0.0
      let b: double = -0.0
      let result: double = Math.hypot(a, b)
      expect(result).assertEqual(0.0)
    });

  });
}
