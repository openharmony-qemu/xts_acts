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

enum Color { RED, GREEN, BLUE }

export default function mathAcosTest2(): void {
  describe('MathAcosTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0100
     * @tc.name testMathAcos001
     * @tc.desc Verify acos batch property: acos(x) + acos(-x) = PI for double values -0.9, -0.5, 0.0, 0.3, 0.7, 0.9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-0.9, -0.5, 0.0, 0.3, 0.7, 0.9]
      for (let i: int = 0; i < xs.length; i++) {
        let sum: double = Math.acos(xs[i]) + Math.acos(-xs[i])
        let isClose: boolean = Math.abs(sum - Math.PI) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0200
     * @tc.name testMathAcos002
     * @tc.desc Verify acos cross-type consistency: acos(long 0) and acos(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0300
     * @tc.name testMathAcos003
     * @tc.desc Verify acos throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.acos(fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0400
     * @tc.name testMathAcos004
     * @tc.desc Verify acos returns PI with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.acos(val)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0500
     * @tc.name testMathAcos005
     * @tc.desc Verify acos throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.acos(matrix as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0600
     * @tc.name testMathAcos006
     * @tc.desc Verify acos cross-type consistency: acos(int 100) and acos(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0700
     * @tc.name testMathAcos007
     * @tc.desc Verify acos: acos(0) cross-type consistency (PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.acos(intVal)
      let dblResult: double = Math.acos(dblVal)
      let floatResult: double = Math.acos(floatVal)
      expect(intResult).assertClose(dblResult, 1e-6)
      expect(dblResult).assertClose(floatResult, 1e-6)
      expect(intResult).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0800
     * @tc.name testMathAcos008
     * @tc.desc Verify acos cross-type consistency: acos(integer) and acos(floating-point) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.acos(intVal)
      let dblResult: double = Math.acos(dblVal)
      expect(intResult).assertClose(dblResult, 1e-6)
      expect(intResult).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0900
     * @tc.name testMathAcos009
     * @tc.desc Verify acos returns 0 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.acos(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1000
     * @tc.name testMathAcos010
     * @tc.desc Verify acos throws ClassCastError with CJK string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.acos(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1100
     * @tc.name testMathAcos011
     * @tc.desc Verify acos cross-type consistency: acos(byte 1) and acos(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1200
     * @tc.name testMathAcos012
     * @tc.desc Verify different call orders produce consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Math.acos(0.5)
      let r2: number = Math.acos(1.0)
      let r3: number = Math.acos(-1.0)
      let r1_again: number = Math.acos(0.5)
      expect(r1).assertEqual(r1_again)
      expect(r1).assertClose(1.0471975511965979, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1300
     * @tc.name testMathAcos013
     * @tc.desc Verify acos(0.5) returns PI/3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.acos(0.5)
      expect(result).assertClose(Math.PI / 3, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1400
     * @tc.name testMathAcos014
     * @tc.desc Verify acos with out-of-domain values [1.5,-1.5,2.0,-2.0,100.0,-100.0] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [1.5, -1.5, 2.0, -2.0, 100.0, -100.0]
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.acos(vals[i])
        expect(isNaN(result)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1500
     * @tc.name testMathAcos015
     * @tc.desc Verify acos returns PI/2 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = -0.0f
      let result: float = Math.acos(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1600
     * @tc.name testMathAcos016
     * @tc.desc Verify acos cross-type consistency: acos(byte 0) and acos(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1700
     * @tc.name testMathAcos017
     * @tc.desc Verify acos cross-type consistency: acos(byte 0) and acos(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1800
     * @tc.name testMathAcos018
     * @tc.desc Verify acos: acos(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.3
      let first: double = Math.acos(input)
      let second: double = Math.acos(input)
      let third: double = Math.acos(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(1.2661036727794992, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1900
     * @tc.name testMathAcos019
     * @tc.desc Verify Math.acos with binary int literal 0b1 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b1
      let result: double = Math.acos(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2000
     * @tc.name testMathAcos020
     * @tc.desc Verify acos is the inverse of cos: acos(cos(x)) = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Math.PI / 4
      let result: number = Math.acos(Math.cos(x))
      expect(Math.abs(result - x)).assertLess(1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2100
     * @tc.name testMathAcos021
     * @tc.desc Verify acos cross-type consistency: acos(short -30) and acos(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2200
     * @tc.name testMathAcos022
     * @tc.desc Verify acos throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.acos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2300
     * @tc.name testMathAcos023
     * @tc.desc Verify acos returns 1.5707963267948966 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAcos023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.acos(val)
      expect(result).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2400
     * @tc.name testMathAcos024
     * @tc.desc Verify acos cross-type consistency: acos(int -1) and acos(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(3.141592653589793, 1e-6)
      expect(result2).assertClose(3.141592653589793, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2500
     * @tc.name testMathAcos025
     * @tc.desc Verify acos cross-type consistency: acos(short 0) and acos(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2600
     * @tc.name testMathAcos026
     * @tc.desc Verify acos throws ClassCastError with Color.RED as Object as double parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acos(Color.RED as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2700
     * @tc.name testMathAcos027
     * @tc.desc Verify acos: cos(acos(x)) = x holds over the domain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let acosX: double = Math.acos(x)
      let cosAcos: double = Math.cos(acosX)
      expect(cosAcos).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2800
     * @tc.name testMathAcos028
     * @tc.desc Verify acos returns PI/2 with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.acos(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2900
     * @tc.name testMathAcos029
     * @tc.desc Verify the return value decreases monotonically from PI to 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prev: number = Math.acos(-1.0)
      let isMonotonic: boolean = true
      for (let i: int = -9; i <= 9; i++) {
        let x: number = i / 10.0
        let curr: number = Math.acos(x)
        if (curr > prev) {
          isMonotonic = false
          break
        }
        prev = curr
      }
      expect(isMonotonic).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3000
     * @tc.name testMathAcos030
     * @tc.desc Verify acos(-0.0) with negative zero returns PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.acos(-0.0)
      expect(Math.abs(result - Math.PI / 2)).assertLess(1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3100
     * @tc.name testMathAcos031
     * @tc.desc Verify acos throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.acos(map as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3200
     * @tc.name testMathAcos032
     * @tc.desc Verify the return value of valid input is within [0, PI]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: number[] = [-1.0, -0.8, -0.5, -0.2, 0.0, 0.2, 0.5, 0.8, 1.0]
      for (let val of testValues) {
        let result: number = Math.acos(val)
        expect(result).assertLargerOrEqual(0.0)
        expect(result).assertLessOrEqual(Math.PI)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3300
     * @tc.name testMathAcos033
     * @tc.desc Verify repeated calls with the same input return consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: number[] = []
      for (let i: int = 0; i < 100; i++) {
        results.push(Math.acos(0.5))
      }
      let isConsistent: boolean = true
      for (let result of results) {
        if (result !== results[0]) {
          isConsistent = false
          break
        }
      }
      expect(isConsistent).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3400
     * @tc.name testMathAcos034
     * @tc.desc Verify acos throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.acos(list as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3500
     * @tc.name testMathAcos035
     * @tc.desc Verify acos returns 3.141592653589793 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.acos(val)
      expect(result).assertClose(3.141592653589793, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3600
     * @tc.name testMathAcos036
     * @tc.desc Verify acos returns 1.0471975511965976 with input float 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.5f
      let result: double = Math.acos(val)
      expect(result).assertClose(1.0471975511965976, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3700
     * @tc.name testMathAcos037
     * @tc.desc Verify acos cross-type consistency: acos(short 15) and acos(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3800
     * @tc.name testMathAcos038
     * @tc.desc Verify acos throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.acos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3900
     * @tc.name testMathAcos039
     * @tc.desc Verify acos(-0.5) returns 2PI/3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.acos(-0.5)
      expect(Math.abs(result - 2 * Math.PI / 3)).assertLess(1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4000
     * @tc.name testMathAcos040
     * @tc.desc Verify acos cross-type consistency: acos(int 0) and acos(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4100
     * @tc.name testMathAcos041
     * @tc.desc Verify acos(x) + asin(x) = PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.5
      let sum: number = Math.acos(x) + Math.asin(x)
      expect(Math.abs(sum - Math.PI / 2)).assertLess(1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4200
     * @tc.name testMathAcos042
     * @tc.desc Verify acos: acos(float) and acos(double) consistent within the domain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatVal: float = 0.5f
      let dblVal: double = 0.5
      let floatResult: float = Math.acos(floatVal)
      let dblResult: double = Math.acos(dblVal)
      expect(floatResult).assertClose(dblResult, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4300
     * @tc.name testMathAcos043
     * @tc.desc Verify acos throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acos(null as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4400
     * @tc.name testMathAcos044
     * @tc.desc Verify acos throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.acos(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4500
     * @tc.name testMathAcos045
     * @tc.desc Verify acos throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.acos(longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4600
     * @tc.name testMathAcos046
     * @tc.desc Verify acos: acos on [-1, 1] monotonically decreasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aVal: double = -0.5
      let bVal: double = 0.0
      let cVal: double = 0.5
      let aResult: double = Math.acos(aVal)
      let bResult: double = Math.acos(bVal)
      let cResult: double = Math.acos(cVal)
      expect(aResult >= bResult).assertTrue()
      expect(bResult >= cResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4700
     * @tc.name testMathAcos047
     * @tc.desc Verify acos: acos(int 1) and acos(double 1.0) cross-type consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.acos(intVal)
      let dblResult: double = Math.acos(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4800
     * @tc.name testMathAcos048
     * @tc.desc Verify acos cross-type consistency: acos(byte 1) and acos(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4900
     * @tc.name testMathAcos049
     * @tc.desc Verify acos returns 1.318116071652818 with input double 0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.25
      let result: double = Math.acos(val)
      expect(result).assertClose(1.318116071652818, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5000
     * @tc.name testMathAcos050
     * @tc.desc Verify acos cross-type consistency: acos(int 1) and acos(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5100
     * @tc.name testMathAcos051
     * @tc.desc Verify acos returns PI with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.acos(val)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5200
     * @tc.name testMathAcos052
     * @tc.desc Verify acos: acos(within the domain) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-1.0, -0.5, 0.0, 0.5, 1.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.acos(vs[i])
        expect(result >= 0.0).assertTrue()
        expect(result <= Math.PI).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5300
     * @tc.name testMathAcos053
     * @tc.desc Verify acos throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.acos(u as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5400
     * @tc.name testMathAcos054
     * @tc.desc Verify acos: acos range is [0, PI]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = -1.0
      let val2: double = 0.0
      let val3: double = 1.0
      let r1: double = Math.acos(val1)
      let r2: double = Math.acos(val2)
      let r3: double = Math.acos(val3)
      expect(r1 >= 0.0).assertTrue()
      expect(r1 <= Math.PI).assertTrue()
      expect(r2 >= 0.0).assertTrue()
      expect(r2 <= Math.PI).assertTrue()
      expect(r3 >= 0.0).assertTrue()
      expect(r3 <= Math.PI).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5500
     * @tc.name testMathAcos055
     * @tc.desc Verify acos cross-type consistency: acos(short 1) and acos(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5600
     * @tc.name testMathAcos056
     * @tc.desc Verify acos(-1.0) returns PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.acos(-1.0)
      expect(Math.abs(result - Math.PI)).assertLess(1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5700
     * @tc.name testMathAcos057
     * @tc.desc Verify acos returns 0 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.acos(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5800
     * @tc.name testMathAcos058
     * @tc.desc Verify acos cross-type consistency: acos(float 0.0f) and acos(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5900
     * @tc.name testMathAcos059
     * @tc.desc Verify acos: acos(1) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let floatVal: float = 1.0f
      let intResult: double = Math.acos(intVal)
      let dblResult: double = Math.acos(dblVal)
      let floatResult: double = Math.acos(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6000
     * @tc.name testMathAcos060
     * @tc.desc Verify acos returns PI with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = -1.0f
      let result: float = Math.acos(val)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6100
     * @tc.name testMathAcos061
     * @tc.desc Verify acos: acos(x) + acos(-x) = PI identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let sum: double = Math.acos(x) + Math.acos(-x)
      expect(sum).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6200
     * @tc.name testMathAcos062
     * @tc.desc Verify acos returns 0.0 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.acos(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6300
     * @tc.name testMathAcos063
     * @tc.desc Verify acos: acos(cos(x)) = x for x in [0, PI] holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let cosX: double = Math.cos(x)
      let acosCos: double = Math.acos(cosX)
      let isEqual: boolean = Math.abs(acosCos - x) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6400
     * @tc.name testMathAcos064
     * @tc.desc Verify acos with out-of-domain int values [2,5,10,-2,-5,-10] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: int[] = [2, 5, 10, -2, -5, -10]
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.acos(vals[i])
        expect(isNaN(result)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6500
     * @tc.name testMathAcos065
     * @tc.desc Verify acos batch property: acos(cos(x)) equals x for double values 0.0, 0.3, 0.8, 1.2, 1.8, 2.5, 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [0.0, 0.3, 0.8, 1.2, 1.8, 2.5, 3.0]
      for (let i: int = 0; i < xs.length; i++) {
        let cosVal: double = Math.cos(xs[i])
        let acosResult: double = Math.acos(cosVal)
        let isClose: boolean = Math.abs(acosResult - xs[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6600
     * @tc.name testMathAcos066
     * @tc.desc Verify acos: acos(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-1.0, -0.5, 0.0, 0.5, 1.0]
      let exp: double[] = [3.141592653589793, 2.0943951023931957, 1.5707963267948966, 1.0471975511965979, 0.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.acos(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6700
     * @tc.name testMathAcos067
     * @tc.desc Verify acos batch property: result within [0, PI] for double values -1.0, -0.8, -0.3, 0.0, 0.3, 0.8, 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-1.0, -0.8, -0.3, 0.0, 0.3, 0.8, 1.0]
      for (let i: int = 0; i < xs.length; i++) {
        let result: double = Math.acos(xs[i])
        expect(result >= 0.0).assertTrue()
        expect(result <= Math.PI).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6800
     * @tc.name testMathAcos068
     * @tc.desc Verify acos throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.acos(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_6900
     * @tc.name testMathAcos069
     * @tc.desc Verify acos returns PI/2 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.acos(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7000
     * @tc.name testMathAcos070
     * @tc.desc Verify acos(0.0) returns PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.acos(0.0)
      expect(Math.abs(result - Math.PI / 2)).assertLess(1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7100
     * @tc.name testMathAcos071
     * @tc.desc Verify acos throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.acos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7200
     * @tc.name testMathAcos072
     * @tc.desc Verify acos: acos(0.0) exact with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.acos(val)
        expect(result).assertClose(Math.PI / 2.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7300
     * @tc.name testMathAcos073
     * @tc.desc Verify acos throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.acos(set as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7400
     * @tc.name testMathAcos074
     * @tc.desc Verify acos cross-type consistency: acos(long 0) and acos(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7500
     * @tc.name testMathAcos075
     * @tc.desc Verify acos throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.acos(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7600
     * @tc.name testMathAcos076
     * @tc.desc Verify acos throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.acos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7700
     * @tc.name testMathAcos077
     * @tc.desc Verify acos out-of-domain value returns NaN consistently across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 10
      let val2: long = 10
      let val3: long = 10
      let result1: double = Math.acos(val1)
      let result2: double = Math.acos(val2)
      let result3: double = Math.acos(val3)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
      expect(isNaN(result3)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7800
     * @tc.name testMathAcos078
     * @tc.desc Verify acos(0.0) and acos(-0.0) return the same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: number = Math.acos(0.0)
      let r2: number = Math.acos(-0.0)
      expect(r1).assertEqual(r2)
      expect(r1).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_7900
     * @tc.name testMathAcos079
     * @tc.desc Verify acos: acos(finite) finite with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcos079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 5; i++) {
        let val: double = 0.5
        let result: double = Math.acos(val)
        expect(result).assertClose(1.0471975511965976, 1e-6)
      }
    });

  });
}
