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

export default function mathAsinTest2(): void {
  describe('MathAsinTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0100
     * @tc.name testMathAsin001
     * @tc.desc Verify asin throws ClassCastError with Korean string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '테스트'
        Math.asin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0200
     * @tc.name testMathAsin002
     * @tc.desc Verify asin cross-type consistency: asin(int -1) and asin(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(-1.5707963267948966, 1e-6)
      expect(result2).assertClose(-1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0300
     * @tc.name testMathAsin003
     * @tc.desc Verify asin throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.asin(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0400
     * @tc.name testMathAsin004
     * @tc.desc Verify asin returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAsin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.asin(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0500
     * @tc.name testMathAsin005
     * @tc.desc Verify asin throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.asin(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0600
     * @tc.name testMathAsin006
     * @tc.desc Verify asin throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.asin(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0700
     * @tc.name testMathAsin007
     * @tc.desc Verify asin batch property: asin(x) + acos(x) = PI/2 for double values -0.9, -0.5, 0.0, 0.3, 0.7, 0.9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-0.9, -0.5, 0.0, 0.3, 0.7, 0.9]
      for (let i: int = 0; i < xs.length; i++) {
        let sum: double = Math.asin(xs[i]) + Math.acos(xs[i])
      expect(sum).assertClose(Math.PI / 2.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0800
     * @tc.name testMathAsin008
     * @tc.desc Verify asin: asin(sin(x)) = x for x in [-PI/2, PI/2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let sinX: double = Math.sin(x)
      let asinResult: double = Math.asin(sinX)
      let isEqual: boolean = Math.abs(asinResult - x) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0900
     * @tc.name testMathAsin009
     * @tc.desc Verify asin: asin(1) = PI/2 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let floatVal: float = 1.0f
      let intResult: double = Math.asin(intVal)
      let dblResult: double = Math.asin(dblVal)
      let floatResult: double = Math.asin(floatVal)
      expect(intResult).assertClose(Math.PI / 2.0, 1e-6)
      expect(dblResult).assertClose(Math.PI / 2.0, 1e-6)
      expect(floatResult).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1000
     * @tc.name testMathAsin010
     * @tc.desc Verify asin cross-type consistency: asin(float 0.0f) and asin(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1100
     * @tc.name testMathAsin011
     * @tc.desc Verify asin throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.asin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1200
     * @tc.name testMathAsin012
     * @tc.desc Verify asin cross-type consistency: asin(int 100) and asin(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1300
     * @tc.name testMathAsin013
     * @tc.desc Verify asin throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.asin(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1400
     * @tc.name testMathAsin014
     * @tc.desc Verify asin: asin(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.asin(intVal)
      let dblResult: double = Math.asin(dblVal)
      let floatResult: double = Math.asin(floatVal)
      let isEqual: boolean = intResult === dblResult
      let isEqual2: boolean = dblResult === floatResult
      expect(isEqual).assertTrue()
      expect(isEqual2).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1500
     * @tc.name testMathAsin015
     * @tc.desc Verify asin throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.asin(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1600
     * @tc.name testMathAsin016
     * @tc.desc Verify asin: asin range is [-PI/2, PI/2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = -1.0
      let val2: double = 0.0
      let val3: double = 1.0
      let r1: double = Math.asin(val1)
      let r2: double = Math.asin(val2)
      let r3: double = Math.asin(val3)
      expect(r1 >= -Math.PI / 2.0).assertTrue()
      expect(r1 <= Math.PI / 2.0).assertTrue()
      expect(r2 >= -Math.PI / 2.0).assertTrue()
      expect(r2 <= Math.PI / 2.0).assertTrue()
      expect(r3 >= -Math.PI / 2.0).assertTrue()
      expect(r3 <= Math.PI / 2.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1700
     * @tc.name testMathAsin017
     * @tc.desc Verify asin: asin on [-1, 1] monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aVal: double = -0.5
      let bVal: double = 0.0
      let cVal: double = 0.5
      let aResult: double = Math.asin(aVal)
      let bResult: double = Math.asin(bVal)
      let cResult: double = Math.asin(cVal)
      expect(aResult <= bResult).assertTrue()
      expect(bResult <= cResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1800
     * @tc.name testMathAsin018
     * @tc.desc Verify asin: asin(1) = PI/2 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 1.0
      let result: double = Math.asin(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1900
     * @tc.name testMathAsin019
     * @tc.desc Verify Math.asin with -1e-10 scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asin(-1e-10)
      let opResult1: boolean = Math.abs(result + 1e-10) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2000
     * @tc.name testMathAsin020
     * @tc.desc Verify asin: asin(x) + acos(x) = PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let sum: double = Math.asin(x) + Math.acos(x)
      expect(sum).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2100
     * @tc.name testMathAsin021
     * @tc.desc Verify asin returns PI/2 with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.asin(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2200
     * @tc.name testMathAsin022
     * @tc.desc Verify asin: asin(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-1.0, -0.5, 0.0, 0.5, 1.0]
      let exp: double[] = [-1.5707963267948966, -0.5235987755982989, 0.0, 0.5235987755982989, 1.5707963267948966]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.asin(vs[i])
      expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2300
     * @tc.name testMathAsin023
     * @tc.desc Verify asin cross-type consistency: asin(short 15) and asin(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2400
     * @tc.name testMathAsin024
     * @tc.desc Verify asin cross-type consistency: asin(byte 1) and asin(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2500
     * @tc.name testMathAsin025
     * @tc.desc Verify asin returns PI/2 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 1.0f
      let result: float = Math.asin(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2600
     * @tc.name testMathAsin026
     * @tc.desc Verify asin with out-of-domain int values [2,5,10,-2,-5,-10] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: int[] = [2, 5, 10, -2, -5, -10]
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.asin(vals[i])
      expect(isNaN(result)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2700
     * @tc.name testMathAsin027
     * @tc.desc Verify asin returns 0 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.asin(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2800
     * @tc.name testMathAsin028
     * @tc.desc Verify asin: asin(within the domain) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-1.0, -0.5, 0.0, 0.5, 1.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.asin(vs[i])
      expect(result >= -Math.PI / 2.0).assertTrue()
      expect(result <= Math.PI / 2.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2900
     * @tc.name testMathAsin029
     * @tc.desc Verify asin throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.asin(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3000
     * @tc.name testMathAsin030
     * @tc.desc Verify asin returns 0 with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.asin(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3100
     * @tc.name testMathAsin031
     * @tc.desc Verify asin returns 0.5235987755982988 with input float 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.5f
      let result: double = Math.asin(val)
      expect(result).assertClose(0.5235987755982988, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3200
     * @tc.name testMathAsin032
     * @tc.desc Verify asin: asin(-1.0) = -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -1.0
      let result: double = Math.asin(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3300
     * @tc.name testMathAsin033
     * @tc.desc Verify asin returns -1.5707963267948966 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.asin(val)
      expect(result).assertClose(-1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3400
     * @tc.name testMathAsin034
     * @tc.desc Verify asin(x)+acos(x) approximately equals PI/2 (inverse trigonometric identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  let x: number = 0.5
  let sum: number = Math.asin(x) + Math.acos(x)
  expect(sum).assertClose(Math.PI / 2, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3500
     * @tc.name testMathAsin035
     * @tc.desc Verify asin throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.asin(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3600
     * @tc.name testMathAsin036
     * @tc.desc Verify asin throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.asin(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3700
     * @tc.name testMathAsin037
     * @tc.desc Verify asin returns -PI/2 with input val [4]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = -1
      let result: double = Math.asin(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3800
     * @tc.name testMathAsin038
     * @tc.desc Verify asin cross-type consistency: asin(int 0) and asin(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3900
     * @tc.name testMathAsin039
     * @tc.desc Verify asin cross-type consistency: asin(byte 1) and asin(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4000
     * @tc.name testMathAsin040
     * @tc.desc Verify asin: asin(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.3
      let first: double = Math.asin(input)
      let second: double = Math.asin(input)
      let third: double = Math.asin(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.3046926540153975, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4100
     * @tc.name testMathAsin041
     * @tc.desc Verify asin cross-type consistency: asin(short 0) and asin(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4200
     * @tc.name testMathAsin042
     * @tc.desc Verify asin returns PI/2 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.asin(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4300
     * @tc.name testMathAsin043
     * @tc.desc Verify Math.asin with double value 0.8 returns approx PI/3 (greater than PI/6)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asin(0.8)
      let opResult1: boolean = result > Math.PI / 6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4400
     * @tc.name testMathAsin044
     * @tc.desc Verify asin: asin(1.0) = PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 1.0
      let result: double = Math.asin(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4500
     * @tc.name testMathAsin045
     * @tc.desc Verify asin cross-type consistency: asin(int 1) and asin(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4600
     * @tc.name testMathAsin046
     * @tc.desc Verify asin returns -PI/2 with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.asin(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4700
     * @tc.name testMathAsin047
     * @tc.desc Verify asin returns 0 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.asin(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4800
     * @tc.name testMathAsin048
     * @tc.desc Verify Math.asin with 0.3 returns value in valid range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asin(0.3)
      let opResult1: boolean = result >= -Math.PI / 2 && result <= Math.PI / 2
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4900
     * @tc.name testMathAsin049
     * @tc.desc Verify asin: sin(asin(x)) = x holds over the domain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let asinX: double = Math.asin(x)
      let sinAsin: double = Math.sin(asinX)
      let isEqual: boolean = sinAsin === x
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5000
     * @tc.name testMathAsin050
     * @tc.desc Verify Math.asin double overload near lower bound -1.0 + EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asin(-1.0 + Number.EPSILON)
      let opResult1: boolean = result >= -Math.PI / 2
      expect(opResult1).assertTrue()
      let opResult2: boolean = result <= Math.PI / 2
      expect(opResult2).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5100
     * @tc.name testMathAsin051
     * @tc.desc Verify Math.asin double overload near upper bound 1.0 - EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asin(1.0 - Number.EPSILON)
      let opResult1: boolean = result >= -Math.PI / 2
      expect(opResult1).assertTrue()
      let opResult2: boolean = result <= Math.PI / 2
      expect(opResult2).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5200
     * @tc.name testMathAsin052
     * @tc.desc Verify asin: asin(0.0) exact with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
      let result: double = Math.asin(val)
      expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5300
     * @tc.name testMathAsin053
     * @tc.desc Verify asin batch property: result within [-PI/2, PI/2] for double values -1.0, -0.8, -0.3, 0.0, 0.3, 0.8, 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-1.0, -0.8, -0.3, 0.0, 0.3, 0.8, 1.0]
      for (let i: int = 0; i < xs.length; i++) {
        let result: double = Math.asin(xs[i])
      expect(result >= -Math.PI / 2.0).assertTrue()
      expect(result <= Math.PI / 2.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5400
     * @tc.name testMathAsin054
     * @tc.desc Verify asin cross-type consistency: asin(long 0) and asin(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5500
     * @tc.name testMathAsin055
     * @tc.desc Verify asin cross-type consistency: asin(short 1) and asin(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(1.5707963267948966, 1e-6)
      expect(result2).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5600
     * @tc.name testMathAsin056
     * @tc.desc Verify asin returns 0.25268025514207865 with input double 0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.25
      let result: double = Math.asin(val)
      expect(result).assertClose(0.25268025514207865, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5700
     * @tc.name testMathAsin057
     * @tc.desc Verify asin throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.asin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5800
     * @tc.name testMathAsin058
     * @tc.desc Verify asin returns 1.5707963267948966 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.asin(val)
      expect(result).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5900
     * @tc.name testMathAsin059
     * @tc.desc Verify asin batch property: asin(sin(x)) equals x for double values -1.2, -0.8, -0.3, 0.0, 0.3, 0.8, 1.2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-1.2, -0.8, -0.3, 0.0, 0.3, 0.8, 1.2]
      for (let i: int = 0; i < xs.length; i++) {
        let sinVal: double = Math.sin(xs[i])
      let asinResult: double = Math.asin(sinVal)
      let isClose: boolean = Math.abs(asinResult - xs[i]) < 1e-9
      expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6000
     * @tc.name testMathAsin060
     * @tc.desc Verify asin with out-of-domain values [1.5,-1.5,2.0,-2.0,100.0,-100.0] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [1.5, -1.5, 2.0, -2.0, 100.0, -100.0]
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.asin(vals[i])
      expect(isNaN(result)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6100
     * @tc.name testMathAsin061
     * @tc.desc Verify asin: asin(integer) and asin(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.asin(intVal)
      let dblResult: double = Math.asin(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6200
     * @tc.name testMathAsin062
     * @tc.desc Verify Math.asin with 1e-10 scientific notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asin(1e-10)
      let opResult1: boolean = Math.abs(result - 1e-10) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6300
     * @tc.name testMathAsin063
     * @tc.desc Verify asin: asin(float) and asin(double) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatVal: float = 0.5f
      let dblVal: double = 0.5
      let floatResult: float = Math.asin(floatVal)
      let dblResult: double = Math.asin(dblVal)
      expect(floatResult).assertClose(dblResult, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6400
     * @tc.name testMathAsin064
     * @tc.desc Verify asin returns -PI/2 with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = -1.0f
      let result: float = Math.asin(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6500
     * @tc.name testMathAsin065
     * @tc.desc Verify asin returns -PI/2 with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.asin(val)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6600
     * @tc.name testMathAsin066
     * @tc.desc Verify asin is an odd function: asin(-x) = -asin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.7
      let result1: number = Math.asin(-x)
      let result2: number = -Math.asin(x)
      expect(result1).assertClose(result2, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6700
     * @tc.name testMathAsin067
     * @tc.desc Verify asin throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.asin(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6800
     * @tc.name testMathAsin068
     * @tc.desc Verify asin throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.asin(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6900
     * @tc.name testMathAsin069
     * @tc.desc Verify asin cross-type consistency: asin(byte 0) and asin(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7000
     * @tc.name testMathAsin070
     * @tc.desc Verify asin cross-type consistency: asin(long 0) and asin(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7100
     * @tc.name testMathAsin071
     * @tc.desc Verify Math.asin float overload with -0.5f returns -PI/6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = -0.5f
      let result: float = Math.asin(value)
      let opResult1: boolean = Math.abs(result - (-Math.PI / 6)) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7200
     * @tc.name testMathAsin072
     * @tc.desc Verify Math.asin float overload with 0.5f returns PI/6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 0.5f
      let result: float = Math.asin(value)
      let opResult1: boolean = Math.abs(result - Math.PI / 6) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7300
     * @tc.name testMathAsin073
     * @tc.desc Verify Math.asin with binary int literal 0b1 returns approx PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b1
      let result: double = Math.asin(val)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7400
     * @tc.name testMathAsin074
     * @tc.desc Verify asin with out-of-domain value -128 returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -128
      let result: double = Math.asin(val)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7500
     * @tc.name testMathAsin075
     * @tc.desc Verify asin throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.asin(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7600
     * @tc.name testMathAsin076
     * @tc.desc Verify asin throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.asin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7700
     * @tc.name testMathAsin077
     * @tc.desc Verify asin cross-type consistency: asin(short -30) and asin(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7800
     * @tc.name testMathAsin078
     * @tc.desc Verify asin throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.asin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7900
     * @tc.name testMathAsin079
     * @tc.desc Verify asin cross-type consistency: asin(byte 0) and asin(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8000
     * @tc.name testMathAsin080
     * @tc.desc Verify asin out-of-domain value returns NaN consistently across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 10
      let val2: long = 10
      let val3: long = 10
      let result1: double = Math.asin(val1)
      let result2: double = Math.asin(val2)
      let result3: double = Math.asin(val3)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
      expect(isNaN(result3)).assertTrue()
    });

  });
}
