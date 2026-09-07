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

export default function mathAtanTest2(): void {
  describe('MathAtanTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0100
     * @tc.name testMathAtan001
     * @tc.desc Verify atan throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.atan(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0200
     * @tc.name testMathAtan002
     * @tc.desc Verify atan returns PI/2 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.MAX_VALUE
      let result: float = Math.atan(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0300
     * @tc.name testMathAtan003
     * @tc.desc Verify atan(x)+atan(1/x) equals PI/2 when x>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 3.0
      let sum: number = Math.atan(x) + Math.atan(1.0 / x)
      expect(sum).assertClose(Math.PI / 2, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0400
     * @tc.name testMathAtan004
     * @tc.desc Verify atan returns -0.7853981633974483 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.atan(val)
      expect(result).assertClose(-0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0500
     * @tc.name testMathAtan005
     * @tc.desc Verify atan returns 0 with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.atan(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0600
     * @tc.name testMathAtan006
     * @tc.desc Verify atan: atan monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aVal: double = -2.0
      let bVal: double = 0.0
      let cVal: double = 2.0
      let aResult: double = Math.atan(aVal)
      let bResult: double = Math.atan(bVal)
      let cResult: double = Math.atan(cVal)
      expect(aResult <= bResult).assertTrue()
      expect(bResult <= cResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0700
     * @tc.name testMathAtan007
     * @tc.desc Verify atan cross-type consistency: atan(short 1) and atan(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.7853981633974483, 1e-6)
      expect(result2).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0800
     * @tc.name testMathAtan008
     * @tc.desc Verify atan throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.atan(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0900
     * @tc.name testMathAtan009
     * @tc.desc Verify atan throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.atan(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1000
     * @tc.name testMathAtan010
     * @tc.desc Verify atan: atan(1) = PI/4 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let floatVal: float = 1.0f
      let intResult: double = Math.atan(intVal)
      let dblResult: double = Math.atan(dblVal)
      let floatResult: double = Math.atan(floatVal)
      expect(intResult).assertClose(0.7853981633974483, 1e-6)
      expect(dblResult).assertClose(0.7853981633974483, 1e-6)
      expect(floatResult).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1100
     * @tc.name testMathAtan011
     * @tc.desc Verify atan float overload return value is number type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.0
      let result: number = Math.atan(value)
      expect(result).assertClose(0.7853981633974483, 1e-6)
      expect(result).assertClose(Math.PI / 4, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1200
     * @tc.name testMathAtan012
     * @tc.desc Verify for any finite input x the return value satisfies -PI/2 <= atan(x) <= PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: number[] = [0.0, 1.0, -1.0, 0.5, -0.5, 10.0, -10.0, 100.0, -100.0, 10000.0, -10000.0]
      for (let i: int = 0; i < testValues.length; i++) {
        let result: number = Math.atan(testValues[i])
        expect(result >= -Math.PI / 2).assertTrue()
        expect(result <= Math.PI / 2).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1300
     * @tc.name testMathAtan013
     * @tc.desc Verify atan: atan(tan(x)) = x for x in (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let tanX: double = Math.tan(x)
      let atanResult: double = Math.atan(tanX)
      let isClose: boolean = Math.abs(atanResult - x) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1400
     * @tc.name testMathAtan014
     * @tc.desc Verify atan returns 0.7853981633974483 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.atan(val)
      expect(result).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1500
     * @tc.name testMathAtan015
     * @tc.desc Verify atan returns 0 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.atan(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1600
     * @tc.name testMathAtan016
     * @tc.desc Verify atan(-x) = -atan(x), i.e. atan is an odd function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: number[] = [0.5, 1.0, 2.0, 10.0, 100.0]
      for (let i: int = 0; i < testValues.length; i++) {
        let positive: number = Math.atan(testValues[i])
        let negative: number = Math.atan(-testValues[i])
        expect(negative).assertEqual(-positive)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1700
     * @tc.name testMathAtan017
     * @tc.desc Verify atan throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.atan(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1800
     * @tc.name testMathAtan018
     * @tc.desc Verify atan cross-type consistency: atan(int -1) and atan(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(-0.7853981633974483, 1e-6)
      expect(result2).assertClose(-0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1900
     * @tc.name testMathAtan019
     * @tc.desc Verify atan throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.atan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2000
     * @tc.name testMathAtan020
     * @tc.desc Verify atan throws ClassCastError with Korean string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '테스트'
        Math.atan(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2100
     * @tc.name testMathAtan021
     * @tc.desc Verify atan throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.atan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2200
     * @tc.name testMathAtan022
     * @tc.desc Verify atan batch property: atan(tan(x)) equals x for double values -1.2, -0.5, 0.0, 0.3, 0.8, 1.2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-1.2, -0.5, 0.0, 0.3, 0.8, 1.2]
      for (let i: int = 0; i < xs.length; i++) {
        let tanVal: double = Math.tan(xs[i])
        let atanResult: double = Math.atan(tanVal)
        let isClose: boolean = Math.abs(atanResult - xs[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2300
     * @tc.name testMathAtan023
     * @tc.desc Verify atan returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAtan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.atan(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2400
     * @tc.name testMathAtan024
     * @tc.desc Verify atan cross-type consistency: atan(short -30) and atan(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(-1.5374753309166493, 1e-6)
      expect(result2).assertClose(-1.5374753309166493, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2500
     * @tc.name testMathAtan025
     * @tc.desc Verify atan cross-type consistency: atan(short 15) and atan(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(1.5042281630110733, 1e-6)
      expect(result2).assertClose(1.5042281630110733, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2600
     * @tc.name testMathAtan026
     * @tc.desc Verify atan: atan(0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i:int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.atan(val)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2700
     * @tc.name testMathAtan027
     * @tc.desc Verify atan returns PI/4 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 1
      let result: double = Math.atan(val)
      expect(result).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2800
     * @tc.name testMathAtan028
     * @tc.desc Verify atan(Float.NEGATIVE_INFINITY) returns -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.NEGATIVE_INFINITY
      let result: float = Math.atan(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2900
     * @tc.name testMathAtan029
     * @tc.desc Verify atan returns -PI/4 with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = -1
      let result: double = Math.atan(val)
      expect(result).assertClose(-0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3000
     * @tc.name testMathAtan030
     * @tc.desc Verify atan throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.atan(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3100
     * @tc.name testMathAtan031
     * @tc.desc Verify atan(Double.POSITIVE_INFINITY) returns PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.POSITIVE_INFINITY
      let result: double = Math.atan(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3200
     * @tc.name testMathAtan032
     * @tc.desc Verify atan cross-type consistency: atan(short 0) and atan(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3300
     * @tc.name testMathAtan033
     * @tc.desc Verify atan cross-type consistency: atan(long 0) and atan(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3400
     * @tc.name testMathAtan034
     * @tc.desc Verify atan(+Infinity) returns PI/2 and atan(-Infinity) returns -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan(Double.POSITIVE_INFINITY)).assertClose(Math.PI / 2.0, 1e-6)
      expect(Math.atan(Double.NEGATIVE_INFINITY)).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3500
     * @tc.name testMathAtan035
     * @tc.desc Verify atan: atan(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.3
      let first: double = Math.atan(input)
      let second: double = Math.atan(input)
      let third: double = Math.atan(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.2914567944778671, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3600
     * @tc.name testMathAtan036
     * @tc.desc Verify atan returns PI/2 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.MAX_VALUE
      let result: double = Math.atan(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3700
     * @tc.name testMathAtan037
     * @tc.desc Verify atan cross-type consistency: atan(byte 1) and atan(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.7853981633974483, 1e-6)
      expect(result2).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3800
     * @tc.name testMathAtan038
     * @tc.desc Verify atan: atan(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.atan(intVal)
      let dblResult: double = Math.atan(dblVal)
      let floatResult: double = Math.atan(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3900
     * @tc.name testMathAtan039
     * @tc.desc Verify atan returns 1.2490457723982544 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.atan(val)
      expect(result).assertClose(1.2490457723982544, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4000
     * @tc.name testMathAtan040
     * @tc.desc Verify atan: atan(Double.MIN_VALUE) approximately MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.MIN_VALUE
      let result: double = Math.atan(val)
      let isClose: boolean = Math.abs(result - Double.MIN_VALUE) < 1e-323
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4100
     * @tc.name testMathAtan041
     * @tc.desc Verify atan cross-type consistency: atan(byte 0) and atan(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4200
     * @tc.name testMathAtan042
     * @tc.desc Verify atan: tan(atan(x)) = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let atanX: double = Math.atan(x)
      let tanAtan: double = Math.tan(atanX)
      let isEqual: boolean = tanAtan === x
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4300
     * @tc.name testMathAtan043
     * @tc.desc Verify atan cross-type consistency: atan(long 0) and atan(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4400
     * @tc.name testMathAtan044
     * @tc.desc Verify atan returns PI/4 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.atan(val)
      expect(result).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4500
     * @tc.name testMathAtan045
     * @tc.desc Verify Math.atan with double value -Double.MAX_VALUE returns approx -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -Double.MAX_VALUE
      let result: double = Math.atan(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4600
     * @tc.name testMathAtan046
     * @tc.desc Verify atan cross-type consistency: atan(byte 0) and atan(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4700
     * @tc.name testMathAtan047
     * @tc.desc Verify atan throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.atan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4800
     * @tc.name testMathAtan048
     * @tc.desc Verify atan: atan(positive) returns a positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan(0.1) > 0.0).assertTrue()
      expect(Math.atan(1.0) > 0.0).assertTrue()
      expect(Math.atan(10.0) > 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4900
     * @tc.name testMathAtan049
     * @tc.desc Verify atan cross-type consistency: atan(int 0) and atan(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5000
     * @tc.name testMathAtan050
     * @tc.desc Verify atan throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.atan(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5100
     * @tc.name testMathAtan051
     * @tc.desc Verify atan throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.atan(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5200
     * @tc.name testMathAtan052
     * @tc.desc Verify atan cross-type consistency: atan(int 1) and atan(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.7853981633974483, 1e-6)
      expect(result2).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5300
     * @tc.name testMathAtan053
     * @tc.desc Verify atan returns 0 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.atan(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5400
     * @tc.name testMathAtan054
     * @tc.desc Verify atan throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.atan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5500
     * @tc.name testMathAtan055
     * @tc.desc Verify atan throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atan(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5600
     * @tc.name testMathAtan056
     * @tc.desc Verify atan: atan range is (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = -Double.MAX_VALUE
      let val2: double = 0.0
      let val3: double = Double.MAX_VALUE
      let r1: double = Math.atan(val1)
      let r2: double = Math.atan(val2)
      let r3: double = Math.atan(val3)
      expect(r1 >= -Math.PI / 2.0).assertTrue()
      expect(r1 <= Math.PI / 2.0).assertTrue()
      expect(r2 >= -Math.PI / 2.0).assertTrue()
      expect(r2 <= Math.PI / 2.0).assertTrue()
      expect(r3 >= -Math.PI / 2.0).assertTrue()
      expect(r3 <= Math.PI / 2.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5700
     * @tc.name testMathAtan057
     * @tc.desc Verify atan throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.atan(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5800
     * @tc.name testMathAtan058
     * @tc.desc Verify atan(Float.POSITIVE_INFINITY) returns PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.POSITIVE_INFINITY
      let result: float = Math.atan(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5900
     * @tc.name testMathAtan059
     * @tc.desc Verify atan: atan(large numbers) close to PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan(1e10) < Math.PI / 2.0).assertTrue()
      expect(Math.atan(1e15) < Math.PI / 2.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6000
     * @tc.name testMathAtan060
     * @tc.desc Verify atan returns -PI/4 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.atan(val)
      expect(result).assertClose(-0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6100
     * @tc.name testMathAtan061
     * @tc.desc Verify atan: atan(negative) returns a negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan(-0.1) < 0.0).assertTrue()
      expect(Math.atan(-1.0) < 0.0).assertTrue()
      expect(Math.atan(-10.0) < 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6200
     * @tc.name testMathAtan062
     * @tc.desc Verify atan cross-type consistency: atan(byte 1) and atan(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.7853981633974483, 1e-6)
      expect(result2).assertClose(0.7853981633974483, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6300
     * @tc.name testMathAtan063
     * @tc.desc Verify atan(Double.NEGATIVE_INFINITY) returns -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.NEGATIVE_INFINITY
      let result: double = Math.atan(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6400
     * @tc.name testMathAtan064
     * @tc.desc Verify atan returns 1.4711276743037347 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.atan(val)
      expect(result).assertClose(1.4711276743037347, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6500
     * @tc.name testMathAtan065
     * @tc.desc Verify atan cross-type consistency: atan(float 0.0f) and atan(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6600
     * @tc.name testMathAtan066
     * @tc.desc Verify atan cross-type consistency: atan(int 100) and atan(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.atan(val1)
      let result2: double = Math.atan(val2)
      expect(result1).assertClose(1.5607966601082315, 1e-6)
      expect(result2).assertClose(1.5607966601082315, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6700
     * @tc.name testMathAtan067
     * @tc.desc Verify atan batch property: atan(-x) = -atan(x) for double values 0.5, 1.0, 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan(-0.5)).assertClose(-Math.atan(0.5), 1e-6)
      expect(Math.atan(-1.0)).assertClose(-Math.atan(1.0), 1e-6)
      expect(Math.atan(-2.0)).assertClose(-Math.atan(2.0), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6800
     * @tc.name testMathAtan068
     * @tc.desc Verify atan: atan(int negativelarge numbers -1000000) close to -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1000000
      let result: double = Math.atan(val)
      let isClose: boolean = Math.abs(result + Math.PI / 2.0) < 1.0e-5
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6900
     * @tc.name testMathAtan069
     * @tc.desc Verify atan batch property: result within (-PI/2, PI/2) for double values -1e10, -5.0, -0.1, 0.0, 0.1, 5.0, 1e10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-1e10, -5.0, -0.1, 0.0, 0.1, 5.0, 1e10]
      for (let i: int = 0; i < xs.length; i++) {
        let result: double = Math.atan(xs[i])
        expect(result > -Math.PI / 2.0).assertTrue()
        expect(result < Math.PI / 2.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7000
     * @tc.name testMathAtan070
     * @tc.desc Verify atan: atan(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]
      let exp: double[] = [-1.5607966601082315, -1.4711276743037347, -0.7853981633974483, 0.0, 0.7853981633974483, 1.4711276743037347, 1.5607966601082315]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.atan(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7100
     * @tc.name testMathAtan071
     * @tc.desc Verify atan: atan(float) and atan(double) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatVal: float = 0.5f
      let dblVal: double = 0.5
      let floatResult: float = Math.atan(floatVal)
      let dblResult: double = Math.atan(dblVal)
      let isClose: boolean = Math.abs(Float.toDouble(floatResult) - dblResult) < 1e-7
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7200
     * @tc.name testMathAtan072
     * @tc.desc Verify atan throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.atan(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7300
     * @tc.name testMathAtan073
     * @tc.desc Verify atan returns 1.1071487177940904 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.atan(val)
      expect(result).assertClose(1.1071487177940904, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7400
     * @tc.name testMathAtan074
     * @tc.desc Verify atan: atan(int large numbers 1000000) close to PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000000
      let result: double = Math.atan(val)
      let isClose: boolean = Math.abs(result - Math.PI / 2.0) < 1.0e-5
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7500
     * @tc.name testMathAtan075
     * @tc.desc Verify atan throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.atan(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}
