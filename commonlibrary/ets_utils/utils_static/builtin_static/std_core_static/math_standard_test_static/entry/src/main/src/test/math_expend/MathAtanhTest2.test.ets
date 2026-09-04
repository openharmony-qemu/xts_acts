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

export default function mathAtanhTest2(): void {
  describe('MathAtanhTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0100
     * @tc.name testMathAtanh001
     * @tc.desc Verify atanh throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.atanh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0200
     * @tc.name testMathAtanh002
     * @tc.desc Verify atanh throws ClassCastError with empty string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = ''
        Math.atanh(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0300
     * @tc.name testMathAtanh003
     * @tc.desc Verify atanh with infinity with input val [5]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.atanh(val)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0400
     * @tc.name testMathAtanh004
     * @tc.desc Verify atanh: atanh(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.3
      let first: double = Math.atanh(input)
      let second: double = Math.atanh(input)
      let third: double = Math.atanh(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.30951960420311175, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0500
     * @tc.name testMathAtanh005
     * @tc.desc Verify atanh throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.atanh(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0600
     * @tc.name testMathAtanh006
     * @tc.desc Verify atanh throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.atanh(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0700
     * @tc.name testMathAtanh007
     * @tc.desc Verify atanh throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.atanh(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0800
     * @tc.name testMathAtanh008
     * @tc.desc Verify atanh returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAtanh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.atanh(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_0900
     * @tc.name testMathAtanh009
     * @tc.desc Verify atanh(tanh(0.5)) approx 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atanh(Math.tanh(0.5))
      let exprResult: boolean = Math.abs(result - 0.5) < 0.000001
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1000
     * @tc.name testMathAtanh010
     * @tc.desc Verify atanh: atanh(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.atanh(intVal)
      let dblResult: double = Math.atanh(dblVal)
      let floatResult: double = Math.atanh(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1100
     * @tc.name testMathAtanh011
     * @tc.desc Verify atanh with infinity with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.atanh(val)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1200
     * @tc.name testMathAtanh012
     * @tc.desc Verify atanh batch property: atanh(-x) = -atanh(x) for double values 0.1, 0.3, 0.5, 0.7, 0.9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [0.1, 0.3, 0.5, 0.7, 0.9]
      for (let i: int = 0; i < vs.length; i++) {
        let pos: double = Math.atanh(vs[i])
        let neg: double = Math.atanh(-vs[i])
        expect(neg).assertEqual(-pos)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1300
     * @tc.name testMathAtanh013
     * @tc.desc Verify atanh cross-type consistency: atanh(short 0) and atanh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1400
     * @tc.name testMathAtanh014
     * @tc.desc Verify atanh throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.atanh(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1500
     * @tc.name testMathAtanh015
     * @tc.desc Verify atanh: atanh(integer) and atanh(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.atanh(intVal)
      let dblResult: double = Math.atanh(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1600
     * @tc.name testMathAtanh016
     * @tc.desc Verify atanh: atanh odd function atanh(-x) = -atanh(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atanh(-0.3)).assertEqual(-Math.atanh(0.3))
      expect(Math.atanh(-0.7)).assertEqual(-Math.atanh(0.7))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1700
     * @tc.name testMathAtanh017
     * @tc.desc Verify atanh cross-type consistency: atanh(short 1) and atanh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1800
     * @tc.name testMathAtanh018
     * @tc.desc Verify atanh out-of-domain value returns NaN consistently across three calls with input val1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 10
      let val2: long = 10
      let val3: long = 10
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      let result3: double = Math.atanh(val3)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
      expect(isNaN(result3)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_1900
     * @tc.name testMathAtanh019
     * @tc.desc Verify atanh throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.atanh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2000
     * @tc.name testMathAtanh020
     * @tc.desc Verify atanh cross-type consistency: atanh(int 0) and atanh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2100
     * @tc.name testMathAtanh021
     * @tc.desc Verify atanh: atanh(-0.25) = -atanh(0.25)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: double = Math.atanh(0.25)
      let neg: double = Math.atanh(-0.25)
      expect(neg).assertClose(-pos, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2200
     * @tc.name testMathAtanh022
     * @tc.desc Verify atanh cross-type consistency: atanh(long 0) and atanh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2300
     * @tc.name testMathAtanh023
     * @tc.desc Verify atanh(-0.0) = -atanh(0.0), odd-function symmetry at zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: number = Math.atanh(0.0)
      let neg: number = Math.atanh(-0.0)
      expect(Math.abs(neg - (-pos)) < 0.000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2400
     * @tc.name testMathAtanh024
     * @tc.desc Verify atanh cross-type consistency: atanh(byte 0) and atanh(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2500
     * @tc.name testMathAtanh025
     * @tc.desc Verify atanh: atanh(0.0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.atanh(val)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2600
     * @tc.name testMathAtanh026
     * @tc.desc Verify atanh cross-type consistency: atanh(short 15) and atanh(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2700
     * @tc.name testMathAtanh027
     * @tc.desc Verify atanh throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.atanh(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2800
     * @tc.name testMathAtanh028
     * @tc.desc Verify atanh out-of-domain value returns NaN consistently across three calls with input val1 [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = 3
      let val2: double = 3
      let val3: double = 3
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      let result3: double = Math.atanh(val3)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
      expect(isNaN(result3)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_2900
     * @tc.name testMathAtanh029
     * @tc.desc Verify atanh with out-of-domain values [1.5,2.0,10.0,-1.5,-2.0,-10.0] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [1.5, 2.0, 10.0, -1.5, -2.0, -10.0]
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.atanh(vals[i])
        expect(isNaN(result)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3000
     * @tc.name testMathAtanh030
     * @tc.desc Verify atanh with infinity with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.atanh(val)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3100
     * @tc.name testMathAtanh031
     * @tc.desc Verify atanh: tanh(atanh(x)) = x for |x| < 1 holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let atanhX: double = Math.atanh(x)
      let tanhResult: double = Math.tanh(atanhX)
      expect(tanhResult).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3200
     * @tc.name testMathAtanh032
     * @tc.desc Verify atanh: atanh on (-1, 1) monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.atanh(-0.5)
      let b: double = Math.atanh(0.0)
      let c: double = Math.atanh(0.5)
      expect(a <= b).assertTrue()
      expect(b <= c).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3300
     * @tc.name testMathAtanh033
     * @tc.desc Verify atanh cross-type consistency: atanh(int -1) and atanh(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3400
     * @tc.name testMathAtanh034
     * @tc.desc Verify atanh with infinity with input val [4]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.atanh(val)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3500
     * @tc.name testMathAtanh035
     * @tc.desc Verify atanh: atanh(0.5) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dblVal: double = 0.5
      let floatVal: float = 0.5f
      let dblResult: double = Math.atanh(dblVal)
      let floatResult: double = Math.atanh(floatVal)
      let isClose: boolean = Math.abs(dblResult - floatResult) < 1e-7
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3600
     * @tc.name testMathAtanh036
     * @tc.desc Verify atanh throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atanh(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3700
     * @tc.name testMathAtanh037
     * @tc.desc Verify atanh batch property: atanh(x) equals 0.5*ln((1+x)/(1-x)) for double values -0.5, -0.2, 0.0, 0.2, 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-0.5, -0.2, 0.0, 0.2, 0.5]
      for (let i: int = 0; i < xs.length; i++) {
        let x: double = xs[i]
        let atanhResult: double = Math.atanh(x)
        let formula: double = 0.5 * Math.log((1.0 + x) / (1.0 - x))
        let isClose: boolean = Math.abs(atanhResult - formula) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3800
     * @tc.name testMathAtanh038
     * @tc.desc Verify atanh with out-of-domain value 2 returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 2
      let result: double = Math.atanh(val)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_3900
     * @tc.name testMathAtanh039
     * @tc.desc Verify atanh cross-type consistency: atanh(byte 0) and atanh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4000
     * @tc.name testMathAtanh040
     * @tc.desc Verify atanh throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.atanh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4100
     * @tc.name testMathAtanh041
     * @tc.desc Verify atanh throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.atanh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4200
     * @tc.name testMathAtanh042
     * @tc.desc Verify atanh: atanh(within the domain |x|<1) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-0.9, -0.5, -0.1, 0.0, 0.1, 0.5, 0.9]
      let exp: double[] = [-1.4722194895832204, -0.5493061443340549, -0.1003353477310756, 0.0, 0.1003353477310756, 0.5493061443340549, 1.4722194895832204]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.atanh(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4300
     * @tc.name testMathAtanh043
     * @tc.desc Verify atanh throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.atanh(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4400
     * @tc.name testMathAtanh044
     * @tc.desc Verify atanh(tanh(-0.5)) approx -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atanh(Math.tanh(-0.5))
      let exprResult: boolean = Math.abs(result - (-0.5)) < 0.000001
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4500
     * @tc.name testMathAtanh045
     * @tc.desc Verify atanh cross-type consistency: atanh(short -30) and atanh(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4600
     * @tc.name testMathAtanh046
     * @tc.desc Verify atanh batch property: tanh(atanh(x)) equals x for double values -0.7, -0.3, 0.0, 0.3, 0.7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-0.7, -0.3, 0.0, 0.3, 0.7]
      for (let i: int = 0; i < xs.length; i++) {
        let atanhX: double = Math.atanh(xs[i])
        let result: double = Math.tanh(atanhX)
        expect(result).assertClose(xs[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4700
     * @tc.name testMathAtanh047
     * @tc.desc Verify atanh: atanh(0.5) with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.5
        let result: double = Math.atanh(val)
        expect(result).assertClose(0.5493061443340549, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4800
     * @tc.name testMathAtanh048
     * @tc.desc Verify atanh out-of-domain value returns NaN consistently across three calls with input val1 [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 2
      let val2: float = 2
      let val3: float = 2
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      let result3: double = Math.atanh(val3)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
      expect(isNaN(result3)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_4900
     * @tc.name testMathAtanh049
     * @tc.desc Verify atanh cross-type consistency: atanh(byte 1) and atanh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5000
     * @tc.name testMathAtanh050
     * @tc.desc Verify atanh cross-type consistency: atanh(int 100) and atanh(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5100
     * @tc.name testMathAtanh051
     * @tc.desc Verify atanh cross-type consistency: atanh(long 0) and atanh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5200
     * @tc.name testMathAtanh052
     * @tc.desc Verify atanh with infinity with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1
      let result: double = Math.atanh(val)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5300
     * @tc.name testMathAtanh053
     * @tc.desc Verify atanh cross-type consistency: atanh(float 0.0f) and atanh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5400
     * @tc.name testMathAtanh054
     * @tc.desc Verify atanh cross-type consistency: atanh(byte 1) and atanh(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5500
     * @tc.name testMathAtanh055
     * @tc.desc Verify atanh throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.atanh(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5600
     * @tc.name testMathAtanh056
     * @tc.desc Verify Math.atanh is odd function: atanh(-0.5) = -atanh(0.5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: double = Math.atanh(0.5)
      let neg: double = Math.atanh(-0.5)
      let exprResult: boolean = Math.abs(neg - (-pos)) < 0.000001
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5700
     * @tc.name testMathAtanh057
     * @tc.desc Verify atanh throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.atanh(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5800
     * @tc.name testMathAtanh058
     * @tc.desc Verify atanh cross-type consistency: atanh(int 1) and atanh(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.atanh(val1)
      let result2: double = Math.atanh(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_5900
     * @tc.name testMathAtanh059
     * @tc.desc Verify atanh throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.atanh(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATANH_6000
     * @tc.name testMathAtanh060
     * @tc.desc Verify atanh throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtanh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.atanh(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}
