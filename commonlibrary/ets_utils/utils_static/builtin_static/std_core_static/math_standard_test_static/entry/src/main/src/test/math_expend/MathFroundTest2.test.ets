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

function froundOneArg(x: number): number {
  return Math.fround(x);
}

export default function mathFroundTest2(): void {
  describe('MathFroundTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0100
     * @tc.name testMathFround001
     * @tc.desc Verify fround throws ClassCastError with XSS script string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '<script>alert(1)</script>'
      Math.fround(str as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0200
     * @tc.name testMathFround002
     * @tc.desc Verify Math.fround(2^24) returns exact integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, 24.0))
      expect(result).assertEqual(16777216.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0300
     * @tc.name testMathFround003
     * @tc.desc Verify Math.fround(2^-149) returns float32 min subnormal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, -149.0))
      expect(result).assertClose(1.401298464324817e-45, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0400
     * @tc.name testMathFround004
     * @tc.desc Verify fround overflow behavior: double value -1.0e39 returns double negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -1.0e39
      let result: double = Math.fround(val)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0500
     * @tc.name testMathFround005
     * @tc.desc Verify fround returns -1 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.fround(val)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0600
     * @tc.name testMathFround006
     * @tc.desc Verify fround throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.fround(u as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0700
     * @tc.name testMathFround007
     * @tc.desc Verify fround cross-type consistency: fround(float 0.0f) and fround(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0800
     * @tc.name testMathFround008
     * @tc.desc Verify fround cross-type consistency: fround(byte 1) and fround(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0900
     * @tc.name testMathFround009
     * @tc.desc Verify fround: fround(ceil(2.3)) = fround(3.0) = 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: double = Math.ceil(2.3)
      expect(Math.fround(c)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1000
     * @tc.name testMathFround010
     * @tc.desc Verify fround cross-type consistency: fround(byte 1) and fround(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1100
     * @tc.name testMathFround011
     * @tc.desc Verify fround with radix literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: int = 0xA
      expect(Math.fround(hex)).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1200
     * @tc.name testMathFround012
     * @tc.desc Verify fround throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.fround(matrix as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1300
     * @tc.name testMathFround013
     * @tc.desc Verify Math.fround(2^128) returns Number.POSITIVE_INFINITY (beyond float32 max)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, 128.0))
      expect(result).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1400
     * @tc.name testMathFround014
     * @tc.desc Verify fround cross-type consistency: fround(int 1) and fround(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1500
     * @tc.name testMathFround015
     * @tc.desc Verify fround with extra arg uses first arg, or throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = (froundOneArg as Object as (x: number, y: number) => number)(1.5, 2.5)
        expect(result as number).assertEqual(1.5)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1600
     * @tc.name testMathFround016
     * @tc.desc Verify fround throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.fround(arr as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1700
     * @tc.name testMathFround017
     * @tc.desc Verify fround cross-type consistency: fround(int -1) and fround(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(-1.0, 1e-6)
      expect(result2).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1800
     * @tc.name testMathFround018
     * @tc.desc Verify Math.fround(0) and fround(-0) differ in sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let posZero: double = Math.fround(0.0)
      let negZero: double = Math.fround(-0.0)
      let opResult1 = 1.0 / posZero
      expect(opResult1).assertEqual(Number.POSITIVE_INFINITY)
      let opResult2 = 1.0 / negZero
      expect(opResult2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1900
     * @tc.name testMathFround019
     * @tc.desc Verify fround throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
      Math.fround(obj as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2000
     * @tc.name testMathFround020
     * @tc.desc Verify fround throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.fround(list as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2100
     * @tc.name testMathFround021
     * @tc.desc Verify fround: fround(trunc(2.7)) = fround(2.0) = 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: double = Math.trunc(2.7)
      expect(Math.fround(t)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2200
     * @tc.name testMathFround022
     * @tc.desc Verify fround cross-type consistency: fround(int 100) and fround(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(100.0, 1e-6)
      expect(result2).assertClose(100.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2300
     * @tc.name testMathFround023
     * @tc.desc Verify fround returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathFround023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.fround(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2400
     * @tc.name testMathFround024
     * @tc.desc Verify fround cross-type consistency: fround(byte 0) and fround(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2500
     * @tc.name testMathFround025
     * @tc.desc Verify fround: fround(0) with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i:int = 0;i < 10;i++) {
      let val: double = 0.0
      let result: double = Math.fround(val as object as double)
      expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2600
     * @tc.name testMathFround026
     * @tc.desc Verify fround: fround(float → double) precision-loss verification
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.141592653589793
      let f: double = Math.fround(x)
      let loss: double = Math.abs(x - f)
      expect(loss).assertLess(1.0e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2700
     * @tc.name testMathFround027
     * @tc.desc Verify fround cross-type consistency: fround(byte 0) and fround(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2800
     * @tc.name testMathFround028
     * @tc.desc Verify fround with MIN_VALUE with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -1.0e-50
      let result: double = Math.fround(val)
      expect(result).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2900
     * @tc.name testMathFround029
     * @tc.desc Verify fround throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
      Math.fround(fn as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3000
     * @tc.name testMathFround030
     * @tc.desc Verify fround: fround(1.2 + 2.3) = fround(3.5) = 3.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expr: double = 1.2 + 2.3
      expect(Math.fround(expr)).assertEqual(3.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3100
     * @tc.name testMathFround031
     * @tc.desc Verify Math.fround(2^127) returns expected float32 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, 127.0))
      expect(result).assertClose(1.7014118346046923e38, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3200
     * @tc.name testMathFround032
     * @tc.desc Verify fround(2^128) overflows to Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.pow(2, 128)
      let result: double = Math.fround(input)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3300
     * @tc.name testMathFround033
     * @tc.desc Verify fround throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
      Math.fround(c as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3400
     * @tc.name testMathFround034
     * @tc.desc Verify fround cross-type consistency: fround(long 0) and fround(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3500
     * @tc.name testMathFround035
     * @tc.desc Verify fround cross-type consistency: fround(long 0) and fround(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3600
     * @tc.name testMathFround036
     * @tc.desc Verify fround with MIN_VALUE with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 1.0e-50
      let result: double = Math.fround(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3700
     * @tc.name testMathFround037
     * @tc.desc Verify Math.fround(2^24+1) precision loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, 24.0) + 1.0)
      expect(result).assertEqual(16777216.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3800
     * @tc.name testMathFround038
     * @tc.desc Verify fround: fround(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fs: double[] = [-1.5, -0.5, 0.0, 0.5, 1.5, 10.3, 100.9]
      let exp: double[] = [-1.5, -0.5, 0.0, 0.5, 1.5, 10.3, 100.9]
      for (let i:int = 0;i < fs.length;i++) {
        let result: double = Math.fround(fs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3900
     * @tc.name testMathFround039
     * @tc.desc Verify fround cross-type consistency: fround(int 0) and fround(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4000
     * @tc.name testMathFround040
     * @tc.desc Verify fround cross-type consistency: fround(short -30) and fround(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(-30.0, 1e-6)
      expect(result2).assertClose(-30.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4100
     * @tc.name testMathFround041
     * @tc.desc Verify Math.fround(0.1+0.2) float32 precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(0.1 + 0.2)
      expect(result).assertClose(Math.fround(0.3), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4200
     * @tc.name testMathFround042
     * @tc.desc Verify Math.fround is idempotent: fround(fround(x)) equals fround(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3.14159
      let once: double = Math.fround(val)
      let twice: double = Math.fround(once)
      expect(twice).assertEqual(once)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4300
     * @tc.name testMathFround043
     * @tc.desc Verify fround returns 1 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.fround(val)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4400
     * @tc.name testMathFround044
     * @tc.desc Verify fround returns 10 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.fround(val)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4500
     * @tc.name testMathFround045
     * @tc.desc Verify fround throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.fround(arr as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4600
     * @tc.name testMathFround046
     * @tc.desc Verify fround: fround(floor(2.7)) = fround(2.0) = 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: double = Math.floor(2.7)
      expect(Math.fround(f)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4700
     * @tc.name testMathFround047
     * @tc.desc Verify fround throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
      Math.fround(longStr as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4800
     * @tc.name testMathFround048
     * @tc.desc Verify fround cross-type consistency: fround(short 15) and fround(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(15.0, 1e-6)
      expect(result2).assertClose(15.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4900
     * @tc.name testMathFround049
     * @tc.desc Verify fround: fround(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: double = Math.PI
      let f: double = Math.fround(n)
      let s: double = Math.fround(n)
      let t: double = Math.fround(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(3.141592653589793, 1e-7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5000
     * @tc.name testMathFround050
     * @tc.desc Verify fround throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
      Math.fround(b as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5100
     * @tc.name testMathFround051
     * @tc.desc Verify Math.fround with byte value 0 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.fround(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5200
     * @tc.name testMathFround052
     * @tc.desc Verify Math.fround(2^-126) returns float32 min normal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, -126.0))
      expect(result).assertClose(1.1754943508222875e-38, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5300
     * @tc.name testMathFround053
     * @tc.desc Verify fround method with Math.pow(2, 127) for expected return 1.7014118346046923e38
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.pow(2, 127)
      let result: double = Math.fround(input)
      expect(result).assertClose(1.7014118346046923e38, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5400
     * @tc.name testMathFround054
     * @tc.desc Verify fround: fround(long 100) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 100
      expect(Math.fround(x)).assertEqual(100.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5500
     * @tc.name testMathFround055
     * @tc.desc Verify fround: fround(abs(-4.2)) = fround(4.2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-4.2)
      expect(Math.fround(a)).assertClose(4.2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5600
     * @tc.name testMathFround056
     * @tc.desc Verify fround: fround(integer) and fround(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5700
     * @tc.name testMathFround057
     * @tc.desc Verify fround: fround(sqrt2) single-precision truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.fround(Math.sqrt(2.0))).assertClose(1.4142135381698608, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5800
     * @tc.name testMathFround058
     * @tc.desc Verify Math.fround(2^-150) returns 0 (beyond float32 subnormal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(Math.pow(2.0, -150.0))
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5900
     * @tc.name testMathFround059
     * @tc.desc Verify fround method with Math.pow(2, -126) for subnormal handling
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.pow(2, -126)
      let result: double = Math.fround(input)
      expect(result).assertClose(1.1754943508222875e-38, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6000
     * @tc.name testMathFround060
     * @tc.desc Verify fround throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.fround(map as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6100
     * @tc.name testMathFround061
     * @tc.desc Verify fround throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.fround(arr as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6200
     * @tc.name testMathFround062
     * @tc.desc Verify Math.fround(0.3) float32 precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.fround(0.3)
      let opResult1: boolean = Math.abs(result - 0.30000001192092896) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6300
     * @tc.name testMathFround063
     * @tc.desc Verify fround throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.fround(null as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6400
     * @tc.name testMathFround064
     * @tc.desc Verify fround throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.fround(set as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6500
     * @tc.name testMathFround065
     * @tc.desc Verify fround: fround(max(3.14, 2.71)) = fround(3.14)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(3.14, 2.71)
      expect(Math.fround(m)).assertClose(3.14, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6600
     * @tc.name testMathFround066
     * @tc.desc Verify fround throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.fround(arr as object as double)
      expect().assertFail()
      } catch (e) {    expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6700
     * @tc.name testMathFround067
     * @tc.desc Verify fround cross-type consistency: fround(short 1) and fround(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6800
     * @tc.name testMathFround068
     * @tc.desc Verify fround cross-type consistency: fround(short 0) and fround(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.fround(val1)
      let result2: double = Math.fround(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

  });
}
