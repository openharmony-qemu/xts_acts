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

export default function mathCoshTest2(): void {
  describe('MathCoshTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0100
     * @tc.name testMathCosh001
     * @tc.desc Verify cosh cross-type consistency: cosh(long 0) and cosh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0200
     * @tc.name testMathCosh002
     * @tc.desc Verify cosh throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'abc'
        Math.cosh(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0300
     * @tc.name testMathCosh003
     * @tc.desc Verify cosh batch property: cosh(x) equals cosh(-x) for double values 0.5, 1.0, 2.0, 3.0, 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [0.5, 1.0, 2.0, 3.0, 5.0]
      for (let i: int = 0; i < vs.length; i++) {
        expect(Math.cosh(vs[i])).assertClose(Math.cosh(-vs[i]), 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0400
     * @tc.name testMathCosh004
     * @tc.desc Verify cosh cross-type consistency: cosh(byte 0) and cosh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0500
     * @tc.name testMathCosh005
     * @tc.desc Verify cosh throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.cosh(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0600
     * @tc.name testMathCosh006
     * @tc.desc Verify cosh returns 1.5430806348152437 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.cosh(val)
      expect(result).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0700
     * @tc.name testMathCosh007
     * @tc.desc Verify cosh returns 1.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathCosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.cosh(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0800
     * @tc.name testMathCosh008
     * @tc.desc Verify the even-function property: for multiple values, cosh(-x) equals cosh(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cosh(5.0)).assertClose(Math.cosh(-5.0), 1e-6)
      expect(Math.cosh(0.5)).assertClose(Math.cosh(-0.5), 1e-6)
      expect(Math.cosh(100.0)).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0900
     * @tc.name testMathCosh009
     * @tc.desc Verify cosh: cosh(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5
      let first: double = Math.cosh(input)
      let second: double = Math.cosh(input)
      let third: double = Math.cosh(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(1.1276259652063807, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1000
     * @tc.name testMathCosh010
     * @tc.desc Verify cosh cross-type consistency: cosh(long 0) and cosh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1100
     * @tc.name testMathCosh011
     * @tc.desc Verify cosh throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.cosh(u as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1200
     * @tc.name testMathCosh012
     * @tc.desc Verify fundamental definition identity: cosh(x) = (exp(x) + exp(-x)) / 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.5;
      let coshX: double = Math.cosh(x);
      let rhs: double = (Math.exp(x) + Math.exp(-x)) / 2.0;
      expect(Math.abs(coshX - rhs)).assertLess(1e-14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1300
     * @tc.name testMathCosh013
     * @tc.desc Verify double angle identity: cosh(2*x) = 2 * cosh(x) * cosh(x) - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let cosh2x: double = Math.cosh(2.0 * x);
      let rhs: double = 2.0 * Math.cosh(x) * Math.cosh(x) - 1.0;
      expect(Math.abs(cosh2x - rhs)).assertLess(1e-14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1400
     * @tc.name testMathCosh014
     * @tc.desc Verify cosh throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.cosh(longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1500
     * @tc.name testMathCosh015
     * @tc.desc Verify cosh: cosh(0.0) = 1 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.cosh(val as Object as double)
        expect(result).assertEqual(1.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1600
     * @tc.name testMathCosh016
     * @tc.desc Verify Math.cosh with expression 0.5 * 2, consistent with cosh(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.cosh(0.5 * 2.0);
      let rhs: double = Math.cosh(1.0);
      expect(Math.abs(lhs - rhs)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1700
     * @tc.name testMathCosh017
     * @tc.desc Verify identity: cosh(ln(x)) equals (x + 1 / x) / 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 2.0;
      let lnX: double = Math.log(x);
      let coshLn: double = Math.cosh(lnX);
      let rhs: double = (x + 1.0 / x) / 2.0;
      expect(Math.abs(coshLn - rhs)).assertLess(1e-14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1800
     * @tc.name testMathCosh018
     * @tc.desc Verify cosh throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.cosh(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1900
     * @tc.name testMathCosh019
     * @tc.desc Verify cosh: cosh(abs(-2)) = cosh(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-2.0)
      expect(Math.cosh(a)).assertClose(3.7621956910836314, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2000
     * @tc.name testMathCosh020
     * @tc.desc Verify cosh(-Infinity) returns Infinity (not -Infinity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.cosh(Number.NEGATIVE_INFINITY)
      expect(result).assertEqual(Number.POSITIVE_INFINITY)
      expect(result !== Number.NEGATIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2100
     * @tc.name testMathCosh021
     * @tc.desc Verify cosh: cosh(integer) and cosh(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.cosh(intVal)
      let dblResult: double = Math.cosh(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2200
     * @tc.name testMathCosh022
     * @tc.desc Verify the hyperbolic identity: cosh^2(x) - sinh^2(x) equals 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.0
      let coshVal: number = Math.cosh(x)
      let sinhVal: number = Math.sinh(x)
      let identity: number = coshVal * coshVal - sinhVal * sinhVal
      expect(identity).assertClose(1.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2300
     * @tc.name testMathCosh023
     * @tc.desc Verify cosh cross-type consistency: cosh(int 1) and cosh(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.5430806348152437, 1e-6)
      expect(result2).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2400
     * @tc.name testMathCosh024
     * @tc.desc Verify cosh returns 10.067661995777765 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.cosh(val)
      expect(result).assertClose(10.067661995777765, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2500
     * @tc.name testMathCosh025
     * @tc.desc Verify cosh: cosh(0) = 1 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.cosh(intVal)
      let dblResult: double = Math.cosh(dblVal)
      let floatResult: double = Math.cosh(floatVal)
      expect(intResult).assertEqual(1.0)
      expect(dblResult).assertEqual(1.0)
      expect(floatResult).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2600
     * @tc.name testMathCosh026
     * @tc.desc Verify cosh: cosh(sqrt(4)) = cosh(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cosh(Math.sqrt(4.0))).assertClose(3.7621956910836314, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2700
     * @tc.name testMathCosh027
     * @tc.desc Verify cosh returns 1.5430806348152437 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.cosh(val)
      expect(result).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2800
     * @tc.name testMathCosh028
     * @tc.desc Verify cosh cross-type consistency: cosh(byte 1) and cosh(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.5430806348152437, 1e-6)
      expect(result2).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2900
     * @tc.name testMathCosh029
     * @tc.desc Verify cosh cross-type consistency: cosh(int -1) and cosh(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.5430806348152437, 1e-6)
      expect(result2).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3000
     * @tc.name testMathCosh030
     * @tc.desc Verify Math.cosh(Number.MIN_VALUE) returns approximately 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cosh(Number.MIN_VALUE)
      let opResult1: boolean = Math.abs(result - 1.0) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3100
     * @tc.name testMathCosh031
     * @tc.desc Verify cosh throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.cosh(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3200
     * @tc.name testMathCosh032
     * @tc.desc Verify cosh(x) return value is >= 1.0 for finite real input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cosh(100.0) >= 1.0).assertTrue()
      expect(Math.cosh(0.001) >= 1.0).assertTrue()
      expect(Math.cosh(-100.0) >= 1.0).assertTrue()
      expect(Math.cosh(0.0) >= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3300
     * @tc.name testMathCosh033
     * @tc.desc Verify cosh throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.cosh(matrix as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3400
     * @tc.name testMathCosh034
     * @tc.desc Verify cosh throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.cosh(list as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3500
     * @tc.name testMathCosh035
     * @tc.desc Verify Math.cosh with expression 1 + 0, consistent with cosh(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.cosh(1.0 + 0.0);
      let rhs: double = Math.cosh(1.0);
      expect(Math.abs(lhs - rhs)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3600
     * @tc.name testMathCosh036
     * @tc.desc Verify cosh throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.cosh(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3700
     * @tc.name testMathCosh037
     * @tc.desc Verify cosh batch property with int values 0, 1, 2, 3, 5, -1, -2, -5 returns expected double results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 2, 3, 5, -1, -2, -5]
      let exp: double[] = [1.0, 1.5430806348152437, 3.7621956910836314, 10.067661995777765, 74.20994852478785, 1.5430806348152437, 3.7621956910836314, 74.20994852478785]
      for (let i: int = 0; i < ints.length; i++) {
        let result: double = Math.cosh(ints[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3800
     * @tc.name testMathCosh038
     * @tc.desc Verify cosh: cosh(long 0) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.cosh(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3900
     * @tc.name testMathCosh039
     * @tc.desc Verify Math.cosh float overload with 1.0f returns approximately 1.543
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 1.0f
      let result: float = Math.cosh(value)
      let opResult1: boolean = Math.abs(result - 1.5430806f) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4000
     * @tc.name testMathCosh040
     * @tc.desc Verify cosh throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.cosh(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4100
     * @tc.name testMathCosh041
     * @tc.desc Verify cosh cross-type consistency: cosh(int 1) equals cosh(double 1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.cosh(intVal)
      let dblResult: double = Math.cosh(dblVal)
      expect(Math.abs(intResult - dblResult) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4200
     * @tc.name testMathCosh042
     * @tc.desc Verify cosh throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.cosh(map as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4300
     * @tc.name testMathCosh043
     * @tc.desc Verify cosh returns 3.7621956910836314 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.cosh(val)
      expect(result).assertClose(3.7621956910836314, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4400
     * @tc.name testMathCosh044
     * @tc.desc Verify cosh cross-type consistency: cosh(short 0) and cosh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4500
     * @tc.name testMathCosh045
     * @tc.desc Verify cosh cross-type consistency: cosh(byte 1) and cosh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.5430806348152437, 1e-6)
      expect(result2).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4600
     * @tc.name testMathCosh046
     * @tc.desc Verify cosh cross-type consistency: cosh(short 15) and cosh(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1634508.6862362083, 1e-6)
      expect(result2).assertClose(1634508.6862362083, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4700
     * @tc.name testMathCosh047
     * @tc.desc Verify cosh: cosh(short -1) = 1.5430806348152437
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.cosh(val)
      expect(result).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4800
     * @tc.name testMathCosh048
     * @tc.desc Verify cosh throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.cosh(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4900
     * @tc.name testMathCosh049
     * @tc.desc Verify cosh cross-type consistency: cosh(byte 0) and cosh(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5000
     * @tc.name testMathCosh050
     * @tc.desc Verify cosh throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.cosh(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5100
     * @tc.name testMathCosh051
     * @tc.desc Verify cosh batch property: result >= 1.0 for double values -100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]
      for (let i: int = 0; i < vs.length; i++) {
        expect(Math.cosh(vs[i]) >= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5200
     * @tc.name testMathCosh052
     * @tc.desc Verify cosh throws ClassCastError with Color.RED as Object as float parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.cosh(Color.RED as Object as float)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5300
     * @tc.name testMathCosh053
     * @tc.desc Verify cosh throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.cosh(null as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5400
     * @tc.name testMathCosh054
     * @tc.desc Verify Math.cosh(-1.0) returns approximately 1.5430806 (even function)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cosh(-1.0)
      let opResult1: boolean = Math.abs(result - 1.5430806348152437) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5500
     * @tc.name testMathCosh055
     * @tc.desc Verify cosh throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.cosh(fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5600
     * @tc.name testMathCosh056
     * @tc.desc Verify cosh cross-type consistency: cosh(float 0.0f) and cosh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5700
     * @tc.name testMathCosh057
     * @tc.desc Verify cosh: cosh(exp(0)) = cosh(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cosh(Math.exp(0.0))).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5800
     * @tc.name testMathCosh058
     * @tc.desc Verify cosh returns 11013.232920103323 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.cosh(val)
      expect(result).assertClose(11013.232920103323, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5900
     * @tc.name testMathCosh059
     * @tc.desc Verify cosh cross-type consistency: cosh(int 100) and cosh(long 100) cross-type consistency, both return Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6000
     * @tc.name testMathCosh060
     * @tc.desc Verify cosh throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.cosh(set as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6100
     * @tc.name testMathCosh061
     * @tc.desc Verify cosh: cosh(x) >= 1 for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-5.0, -2.0, -0.5, 0.0, 0.5, 2.0, 5.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.cosh(vs[i])
        expect(result >= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6200
     * @tc.name testMathCosh062
     * @tc.desc Verify cosh cross-type consistency: cosh(short 1) and cosh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(1.5430806348152437, 1e-6)
      expect(result2).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6300
     * @tc.name testMathCosh063
     * @tc.desc Verify cosh cross-type consistency: cosh(short -30) and cosh(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.cosh(val1)
      let result2: double = Math.cosh(val2)
      expect(result1).assertClose(5343237290762.231, 1e-6)
      expect(result2).assertClose(5343237290762.231, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6400
     * @tc.name testMathCosh064
     * @tc.desc Verify cosh: cosh(max(0,1)) = cosh(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(0.0, 1.0)
      expect(Math.cosh(m)).assertClose(1.5430806348152437, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6500
     * @tc.name testMathCosh065
     * @tc.desc Verify Math.cosh(10.0) returns approximately 11013.2329
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cosh(10.0)
      let diff: double = Math.abs(result - 11013.232920103324)
      let opResult1: boolean = diff / 11013.232920103324 < 1e-4
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6600
     * @tc.name testMathCosh066
     * @tc.desc Verify cosh(-1.0) equals cosh(1.0) (even-function property)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: number = Math.cosh(-1.0)
      let result2: number = Math.cosh(1.0)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6700
     * @tc.name testMathCosh067
     * @tc.desc Verify cosh: cosh(short 0) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.cosh(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6800
     * @tc.name testMathCosh068
     * @tc.desc Verify cosh(x) is monotonically increasing on the positive axis
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cosh(2.0) > Math.cosh(1.0)).assertTrue()
      expect(Math.cosh(10.0) > Math.cosh(5.0)).assertTrue()
      expect(Math.cosh(50.0) > Math.cosh(25.0)).assertTrue()
    });

  });
}
