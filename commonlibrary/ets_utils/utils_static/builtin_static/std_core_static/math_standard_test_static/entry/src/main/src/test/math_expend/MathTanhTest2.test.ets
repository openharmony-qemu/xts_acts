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

export default function mathTanhTest2(): void {
  describe('MathTanhTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0100
     * @tc.name testMathTanh001
     * @tc.desc Verify Math.tanh() satisfies identity tanh(x) = sinh(x) / cosh(x) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 1.5;
      const tanhX: number = Math.tanh(x);
      const expected: number = Math.sinh(x) / Math.cosh(x);
      const diff: number = tanhX - expected;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0200
     * @tc.name testMathTanh002
     * @tc.desc Verify tanh({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Record<string, string> = {}
        Math.tanh(obj as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0300
     * @tc.name testMathTanh003
     * @tc.desc Verify tanh: tanh(byte 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.tanh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0400
     * @tc.name testMathTanh004
     * @tc.desc Verify tanh batch property: tanh(-x) = -tanh(x) for double values 1.0, 2.0, 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.tanh(-1.0)).assertClose(-Math.tanh(1.0), 1e-6)
      expect(Math.tanh(-2.0)).assertClose(-Math.tanh(2.0), 1e-6)
      expect(Math.tanh(-3.0)).assertClose(-Math.tanh(3.0), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0500
     * @tc.name testMathTanh005
     * @tc.desc Verify tanh throws ClassCastError with emoji string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '\u{1F600}测试'
        Math.tanh(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0600
     * @tc.name testMathTanh006
     * @tc.desc Verify tanh: tanh(atanh(x)) = x for |x| < 1 holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let atanhX: double = Math.atanh(x)
      expect(Math.tanh(atanhX)).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0700
     * @tc.name testMathTanh007
     * @tc.desc Verify tanh throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
        Math.tanh(map as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0800
     * @tc.name testMathTanh008
     * @tc.desc Verify tanh: atanh(tanh(x)) = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let tanhX: double = Math.tanh(x)
      let atanhResult: double = Math.atanh(tanhX)
      let isClose: boolean = Math.abs(atanhResult - x) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_0900
     * @tc.name testMathTanh009
     * @tc.desc Verify tanh cross-type consistency: tanh(byte 0) and tanh(float 0.0f) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1000
     * @tc.name testMathTanh010
     * @tc.desc Verify tanh: tanh(short -1) = -0.7615941559557649
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.tanh(val)
      expect(result).assertClose(-0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1100
     * @tc.name testMathTanh011
     * @tc.desc Verify tanh cross-type consistency: tanh(long 0) and tanh(double 0.0) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1200
     * @tc.name testMathTanh012
     * @tc.desc Verify tanh throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.tanh(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1300
     * @tc.name testMathTanh013
     * @tc.desc Verify tanh batch property: result within (-1, 1) for int values 0, 1, 2, 3, 5, -1, -2, -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 2, 3, 5, -1, -2, -5]
      for (let i: int = 0; i < ints.length; i++) {
        let r: double = Math.tanh(ints[i])
        expect(r > -1.0).assertTrue()
        expect(r < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1400
     * @tc.name testMathTanh014
     * @tc.desc Verify tanh: tanh(short 1) = tanh(int 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sR: double = Math.tanh(1 as short)
      let iR: double = Math.tanh(1 as int)
      expect(sR).assertClose(iR, 1e-6)
      expect(sR).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1500
     * @tc.name testMathTanh015
     * @tc.desc Verify tanh cross-type consistency: tanh(short 1) and tanh(double 1.0) cross-type consistency, expect tanh(1)=0.7615941559557649
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.7615941559557649, 1e-6)
      expect(result2).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1600
     * @tc.name testMathTanh016
     * @tc.desc Verify tanh batch property: result within (-1, 1) for double values -10.0, -1.0, 0.0, 1.0, 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-10.0, -1.0, 0.0, 1.0, 10.0]
      for (let i: int = 0; i < vs.length; i++) {
        let r: double = Math.tanh(vs[i])
        expect(r > -1.0).assertTrue()
        expect(r < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1700
     * @tc.name testMathTanh017
     * @tc.desc Verify tanh throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
        Math.tanh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1800
     * @tc.name testMathTanh018
     * @tc.desc Verify Math.tanh() against identity tanh(x) = (exp(x) - exp(-x)) / (exp(x) + exp(-x)) for multiple inputs within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xs: number[] = [-1.0, -0.5, 0.0, 0.5, 1.0];
      const tolerance: number = 1.0e-12;
      for (let i: int = 0; i < xs.length; i++) {
        const x: number = xs[i];
        const tanhX: number = Math.tanh(x);
        const expX: number = Math.exp(x);
        const expNegX: number = Math.exp(-x);
        const expected: number = (expX - expNegX) / (expX + expNegX);
        const diff: number = tanhX - expected;
        expect(Math.abs(diff) < tolerance).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_1900
     * @tc.name testMathTanh019
     * @tc.desc Verify Math.tanh(): tanh(1.0 + 0.0) equals tanh(1.0) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: number = Math.tanh(1.0 + 0.0);
      const right: number = Math.tanh(1.0);
      const diff: number = left - right;
      const tolerance: number = 1.0e-6;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2000
     * @tc.name testMathTanh020
     * @tc.desc Verify tanh: tanh(0.0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.tanh(val)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2100
     * @tc.name testMathTanh021
     * @tc.desc Verify tanh returns 0.9950547536867305 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.tanh(val)
      expect(result).assertClose(0.9950547536867305, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2200
     * @tc.name testMathTanh022
     * @tc.desc Verify tanh: tanh(1) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.tanh(intVal)
      let dblResult: double = Math.tanh(dblVal)
      expect(Math.abs(intResult - dblResult) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2300
     * @tc.name testMathTanh023
     * @tc.desc Verify tanh throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
        Math.tanh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2400
     * @tc.name testMathTanh024
     * @tc.desc Verify tanh: tanh(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5
      let first: double = Math.tanh(input)
      let second: double = Math.tanh(input)
      let third: double = Math.tanh(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.46211715726000974, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2500
     * @tc.name testMathTanh025
     * @tc.desc Verify tanh: tanh(max(0,1)) = tanh(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(0.0, 1.0)
      expect(Math.tanh(m)).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2600
     * @tc.name testMathTanh026
     * @tc.desc Verify tanh with NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.NaN
      let result: float = Math.tanh(val)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2700
     * @tc.name testMathTanh027
     * @tc.desc Verify tanh throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.tanh(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2800
     * @tc.name testMathTanh028
     * @tc.desc Verify tanh: tanh(byte 1) = tanh(int 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aByte: byte = 1
      let bR: double = Math.tanh(aByte)
      let aInt: int = 1
      let iR: double = Math.tanh(aInt)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_2900
     * @tc.name testMathTanh029
     * @tc.desc Verify tanh returns 0.7615941559557649 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.tanh(val)
      expect(result).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3000
     * @tc.name testMathTanh030
     * @tc.desc Verify tanh is an odd function: tanh(-x) = -tanh(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.0
      let result1: number = Math.tanh(x)
      let result2: number = Math.tanh(-x)
      expect(result1 + result2).assertClose(0.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3100
     * @tc.name testMathTanh031
     * @tc.desc Verify tanh cross-type consistency: tanh(int 100) and tanh(long 100) cross-type consistency, expect tanh(100)=1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3200
     * @tc.name testMathTanh032
     * @tc.desc Verify tanh: tanh(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.tanh(intVal)
      let dblResult: double = Math.tanh(dblVal)
      let floatResult: double = Math.tanh(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3300
     * @tc.name testMathTanh033
     * @tc.desc Verify tanh returns -0.7615941559557649 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.tanh(val)
      expect(result).assertClose(-0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3400
     * @tc.name testMathTanh034
     * @tc.desc Verify tanh: tanh(x) in (-1, 1) for all finite x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-5.0, -2.0, -0.5, 0.0, 0.5, 2.0, 5.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.tanh(vs[i])
        expect(result > -1.0).assertTrue()
        expect(result < 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3500
     * @tc.name testMathTanh035
     * @tc.desc Verify tanh cross-type consistency: tanh(int -1) and tanh(long -1) cross-type consistency, expect tanh(-1)=-0.7615941559557649
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(-0.7615941559557649, 1e-6)
      expect(result2).assertClose(-0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3600
     * @tc.name testMathTanh036
     * @tc.desc Verify tanh: tanh(short 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.tanh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3700
     * @tc.name testMathTanh037
     * @tc.desc Verify tanh: tanh(long 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.tanh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3800
     * @tc.name testMathTanh038
     * @tc.desc Verify tanh returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathTanh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.tanh(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_3900
     * @tc.name testMathTanh039
     * @tc.desc Verify tanh: tanh(int 2) = 0.9640275800758169
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2
      let result: double = Math.tanh(val)
      expect(result).assertClose(0.9640275800758169, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4000
     * @tc.name testMathTanh040
     * @tc.desc Verify Math.tanh(): tanh(0.5 * 2.0) equals tanh(1.0) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: number = Math.tanh(0.5 * 2.0);
      const right: number = Math.tanh(1.0);
      const diff: number = left - right;
      const tolerance: number = 1.0e-6;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4100
     * @tc.name testMathTanh041
     * @tc.desc Verify tanh: tanh(exp(0)) = tanh(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.tanh(Math.exp(0.0))).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4200
     * @tc.name testMathTanh042
     * @tc.desc Verify tanh cross-type consistency: tanh(long 0) and tanh(float 0.0f) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4300
     * @tc.name testMathTanh043
     * @tc.desc Verify tanh cross-type consistency: tanh(short 0) and tanh(float 0.0f) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4400
     * @tc.name testMathTanh044
     * @tc.desc Verify tanh cross-type consistency: tanh(int 0) and tanh(double 0.0) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4500
     * @tc.name testMathTanh045
     * @tc.desc Verify tanh throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
        Math.tanh(list as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4600
     * @tc.name testMathTanh046
     * @tc.desc Verify tanh cross-type consistency: tanh(byte 1) and tanh(double 1.0) cross-type consistency, expect tanh(1)=0.7615941559557649
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.7615941559557649, 1e-6)
      expect(result2).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4700
     * @tc.name testMathTanh047
     * @tc.desc Verify tanh result range is within [-1, 1] for finite input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.tanh(100.0)
      expect(result <= 1.0 && result >= -1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4800
     * @tc.name testMathTanh048
     * @tc.desc Verify tanh cross-type consistency: tanh(int 1) and tanh(float 1.0f) cross-type consistency, expect tanh(1)=0.7615941559557649
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.7615941559557649, 1e-6)
      expect(result2).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_4900
     * @tc.name testMathTanh049
     * @tc.desc Verify tanh batch property: tanh(-x) = -tanh(x) for double values 0.1, 0.5, 1.0, 2.0, 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ps: double[] = [0.1, 0.5, 1.0, 2.0, 5.0]
      for (let i: int = 0; i < ps.length; i++) {
        expect(Math.tanh(-ps[i])).assertEqual(-Math.tanh(ps[i]))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5000
     * @tc.name testMathTanh050
     * @tc.desc Verify tanh: tanh(integer) and tanh(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.tanh(intVal)
      let dblResult: double = Math.tanh(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5100
     * @tc.name testMathTanh051
     * @tc.desc Verify tanh cross-type consistency: tanh(short -30) and tanh(long -30) cross-type consistency, expect tanh(-30)=-1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(-1.0, 1e-6)
      expect(result2).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5200
     * @tc.name testMathTanh052
     * @tc.desc Verify tanh cross-type consistency: tanh(short 15) and tanh(int 15) cross-type consistency, expect tanh(15)=1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5300
     * @tc.name testMathTanh053
     * @tc.desc Verify tanh throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
        set.add(1)
        Math.tanh(set as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5400
     * @tc.name testMathTanh054
     * @tc.desc Verify tanh returns 0.9999999958776927 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.tanh(val)
      expect(result).assertClose(0.9999999958776927, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5500
     * @tc.name testMathTanh055
     * @tc.desc Verify tanh throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.tanh(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5600
     * @tc.name testMathTanh056
     * @tc.desc Verify tanh: tanh(sqrt(4)) = tanh(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.tanh(Math.sqrt(4.0))).assertClose(0.9640275800758169, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5700
     * @tc.name testMathTanh057
     * @tc.desc Verify tanh throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.tanh(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5800
     * @tc.name testMathTanh058
     * @tc.desc Verify tanh returns 0.9640275800758169 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.tanh(val)
      expect(result).assertClose(0.9640275800758169, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_5900
     * @tc.name testMathTanh059
     * @tc.desc Verify tanh throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.tanh(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6000
     * @tc.name testMathTanh060
     * @tc.desc Verify tanh cross-type consistency: tanh(byte 0) and tanh(short 0) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6100
     * @tc.name testMathTanh061
     * @tc.desc Verify tanh cross-type consistency: tanh(float 0.0f) and tanh(double 0.0) cross-type consistency, expect tanh(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6200
     * @tc.name testMathTanh062
     * @tc.desc Verify tanh throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.tanh(null as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6300
     * @tc.name testMathTanh063
     * @tc.desc Verify tanh throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.tanh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6400
     * @tc.name testMathTanh064
     * @tc.desc Verify tanh throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.tanh(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6500
     * @tc.name testMathTanh065
     * @tc.desc Verify tanh throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
        Math.tanh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6600
     * @tc.name testMathTanh066
     * @tc.desc Verify tanh: tanh(abs(-2)) = tanh(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-2.0)
      expect(Math.tanh(a)).assertClose(0.9640275800758169, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6700
     * @tc.name testMathTanh067
     * @tc.desc Verify tanh cross-type consistency: tanh(byte 1) and tanh(int 1) cross-type consistency, expect tanh(1)=0.7615941559557649
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.tanh(val1)
      let result2: double = Math.tanh(val2)
      expect(result1).assertClose(0.7615941559557649, 1e-6)
      expect(result2).assertClose(0.7615941559557649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TANH_6800
     * @tc.name testMathTanh068
     * @tc.desc Verify tanh throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTanh068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
        Math.tanh(matrix as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}
