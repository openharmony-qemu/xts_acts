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

export default function mathAsinhTest2(): void {
  describe('MathAsinhTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0100
     * @tc.name testMathAsinh001
     * @tc.desc Verify asinh cross-type consistency: asinh(int 1) and asinh(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.881373587019543, 1e-6)
      expect(result2).assertClose(0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0200
     * @tc.name testMathAsinh002
     * @tc.desc Verify asinh throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.asinh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0300
     * @tc.name testMathAsinh003
     * @tc.desc Verify asinh throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.asinh(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0400
     * @tc.name testMathAsinh004
     * @tc.desc Verify asinh: asinh(float) and asinh(double) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fVal: float = 0.5f
      let dVal: double = 0.5
      let fResult: float = Math.asinh(fVal)
      let dResult: double = Math.asinh(dVal)
      let isClose: boolean = Math.abs(fResult  - dResult) < 1e-7
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0500
     * @tc.name testMathAsinh005
     * @tc.desc Verify asinh: asinh(long 1) = ln(1+sqrt2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 1
      let result: double = Math.asinh(val)
      expect(result).assertClose(0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0600
     * @tc.name testMathAsinh006
     * @tc.desc Verify Math.asinh double overload with -0.0 returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asinh(-0.0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0700
     * @tc.name testMathAsinh007
     * @tc.desc Verify asinh throws ClassCastError with UUID string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550e8400-e29b-41d4-a716-446655440000'
        Math.asinh(val as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0800
     * @tc.name testMathAsinh008
     * @tc.desc Verify asinh(-x) = -asinh(x) odd function property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1: double = 2.0
      let x2: double = 0.5
      let x3: double = 100.0
      let opResult1: boolean = Math.abs(Math.asinh(-x1) + Math.asinh(x1)) < 1e-6
      expect(opResult1).assertTrue()
      let opResult2: boolean = Math.abs(Math.asinh(-x2) + Math.asinh(x2)) < 1e-6
      expect(opResult2).assertTrue()
      let opResult3: boolean = Math.abs(Math.asinh(-x3) + Math.asinh(x3)) < 1e-6
      expect(opResult3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_0900
     * @tc.name testMathAsinh009
     * @tc.desc Verify asinh: asinh(float 0.0f) returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.0f
      let result: float = Math.asinh(val)
      expect(result).assertEqual(0.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1000
     * @tc.name testMathAsinh010
     * @tc.desc Verify asinh cross-type consistency: asinh(byte 1) and asinh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.881373587019543, 1e-6)
      expect(result2).assertClose(0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1100
     * @tc.name testMathAsinh011
     * @tc.desc Verify asinh cross-type consistency: asinh(byte 1) and asinh(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.881373587019543, 1e-6)
      expect(result2).assertClose(0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1200
     * @tc.name testMathAsinh012
     * @tc.desc Verify asinh throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.asinh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1300
     * @tc.name testMathAsinh013
     * @tc.desc Verify Math.asinh double overload with -1.0 returns approx -0.881373587
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asinh(-1.0)
      let opResult1: boolean = Math.abs(result - (-0.881373587019543)) < 1e-6
      expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1400
     * @tc.name testMathAsinh014
     * @tc.desc Verify asinh returns -0.881373587019543 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.asinh(val)
      expect(result).assertClose(-0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1500
     * @tc.name testMathAsinh015
     * @tc.desc Verify asinh throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.asinh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1600
     * @tc.name testMathAsinh016
     * @tc.desc Verify asinh: asinh(1) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let floatVal: float = 1.0f
      let intResult: double = Math.asinh(intVal)
      let dblResult: double = Math.asinh(dblVal)
      let floatResult: double = Math.asinh(floatVal)
      expect(Math.abs(intResult - dblResult) < 1e-6).assertTrue()
      expect(Math.abs(dblResult - floatResult) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1700
     * @tc.name testMathAsinh017
     * @tc.desc Verify asinh throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.asinh(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1800
     * @tc.name testMathAsinh018
     * @tc.desc Verify asinh throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.asinh(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_1900
     * @tc.name testMathAsinh019
     * @tc.desc Verify Math.asinh with 2.0 returns approximately 1.4436354751788103
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.asinh(2.0)
      let opResult1: boolean = Math.abs(result - 1.4436354751788103) < 1e-6
       expect(opResult1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2000
     * @tc.name testMathAsinh020
     * @tc.desc Verify asinh: asinh(-1) = -asinh(1) (odd function)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: double = Math.asinh(1.0)
      let neg: double = Math.asinh(-1.0)
      expect(neg).assertClose(-pos, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2100
     * @tc.name testMathAsinh021
     * @tc.desc Verify asinh cross-type consistency: asinh(float 0.0f) and asinh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2200
     * @tc.name testMathAsinh022
     * @tc.desc Verify asinh: asinh(short 5) large value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
      let result: double = Math.asinh(val)
      expect(result).assertClose(2.3124383412727525, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2300
     * @tc.name testMathAsinh023
     * @tc.desc Verify asinh throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.asinh(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2400
     * @tc.name testMathAsinh024
     * @tc.desc Verify asinh cross-type consistency: asinh(byte 0) and asinh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2500
     * @tc.name testMathAsinh025
     * @tc.desc Verify asinh throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.asinh(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2600
     * @tc.name testMathAsinh026
     * @tc.desc Verify asinh throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.asinh(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2700
     * @tc.name testMathAsinh027
     * @tc.desc Verify asinh: asinh monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.asinh(-2.0)
      let b: double = Math.asinh(0.0)
      let c: double = Math.asinh(2.0)
      expect(a <= b).assertTrue()
      expect(b <= c).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2800
     * @tc.name testMathAsinh028
     * @tc.desc Verify asinh returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAsinh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.asinh(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_2900
     * @tc.name testMathAsinh029
     * @tc.desc Verify asinh: asinh(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.asinh(intVal)
      let dblResult: double = Math.asinh(dblVal)
      let floatResult: double = Math.asinh(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3000
     * @tc.name testMathAsinh030
     * @tc.desc Verify asinh: asinh(short 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.asinh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3100
     * @tc.name testMathAsinh031
     * @tc.desc Verify asinh batch property: asinh(-x) = -asinh(x) for double values 0.5, 1.0, 2.0, 5.0, 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [0.5, 1.0, 2.0, 5.0, 10.0]
      for (let i: int = 0; i < vs.length; i++) {
        let pos: double = Math.asinh(vs[i])
      let neg: double = Math.asinh(-vs[i])
      expect(neg).assertEqual(-pos)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3200
     * @tc.name testMathAsinh032
     * @tc.desc Verify asinh: asinh(1) with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 1.0
      let result: double = Math.asinh(val)
      expect(result).assertClose(0.881373587019543, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3300
     * @tc.name testMathAsinh033
     * @tc.desc Verify asinh: asinh(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]
      let exp: double[] = [-5.298342365610589, -2.99822295029797, -0.881373587019543, 0.0, 0.881373587019543, 2.99822295029797, 5.298342365610589]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.asinh(vs[i])
      expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3400
     * @tc.name testMathAsinh034
     * @tc.desc Verify asinh cross-type consistency: asinh(short 1) and asinh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.881373587019543, 1e-6)
      expect(result2).assertClose(0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3500
     * @tc.name testMathAsinh035
     * @tc.desc Verify asinh cross-type consistency: asinh(long 0) and asinh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3600
     * @tc.name testMathAsinh036
     * @tc.desc Verify asinh cross-type consistency: asinh(short 0) and asinh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3700
     * @tc.name testMathAsinh037
     * @tc.desc Verify asinh returns 0.48121182505960347 with input float 0.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.5f
      let result: double = Math.asinh(val)
      expect(result).assertClose(0.48121182505960347, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3800
     * @tc.name testMathAsinh038
     * @tc.desc Verify asinh cross-type consistency: asinh(short 15) and asinh(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(3.4023066454805946, 1e-6)
      expect(result2).assertClose(3.4023066454805946, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_3900
     * @tc.name testMathAsinh039
     * @tc.desc Verify asinh throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.asinh(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4000
     * @tc.name testMathAsinh040
     * @tc.desc Verify asinh: sinh(asinh(x)) = x for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.5
      let asinhX: double = Math.asinh(x)
      let sinhAsinh: double = Math.sinh(asinhX)
      expect(Math.abs(sinhAsinh - x) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4100
     * @tc.name testMathAsinh041
     * @tc.desc Verify asinh throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.asinh(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4200
     * @tc.name testMathAsinh042
     * @tc.desc Verify asinh cross-type consistency: asinh(short -30) and asinh(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(-4.09462222433053, 1e-6)
      expect(result2).assertClose(-4.09462222433053, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4300
     * @tc.name testMathAsinh043
     * @tc.desc Verify asinh cross-type consistency: asinh(int 0) and asinh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4400
     * @tc.name testMathAsinh044
     * @tc.desc Verify asinh: asinh(large numbers) close to ln(2x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e10
      let result: double = Math.asinh(x)
      let approx: double = Math.log(2.0 * x)
      let isClose: boolean = Math.abs(result - approx) < 1.0e-6
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4500
     * @tc.name testMathAsinh045
     * @tc.desc Verify asinh: asinh(integer) and asinh(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.asinh(intVal)
      let dblResult: double = Math.asinh(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4600
     * @tc.name testMathAsinh046
     * @tc.desc Verify asinh throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.asinh(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4700
     * @tc.name testMathAsinh047
     * @tc.desc Verify asinh is an odd function: asinh(-x) = -asinh(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x1: number = 2.0
      let x2: number = 0.5
      let x3: number = 100.0
      expect(Math.asinh(-x1)).assertEqual(-Math.asinh(x1))
      expect(Math.asinh(-x2)).assertEqual(-Math.asinh(x2))
      expect(Math.asinh(-x3)).assertEqual(-Math.asinh(x3))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4800
     * @tc.name testMathAsinh048
     * @tc.desc Verify asinh batch property with int values 0, 1, 2, 5, 10, -1, -5, -10 returns expected double results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 2, 5, 10, -1, -5, -10]
      let exp: double[] = [0.0, 0.881373587019543, 1.4436354751788103, 2.312438341272753, 2.99822295029797, -0.881373587019543, -2.312438341272753, -2.99822295029797]
      for (let i: int = 0; i < ints.length; i++) {
        let result: double = Math.asinh(ints[i])
      expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_4900
     * @tc.name testMathAsinh049
     * @tc.desc Verify asinh batch property: asinh(-x) = -asinh(x) for double values 0.1, 0.5, 1.0, 2.0, 5.0, 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ps: double[] = [0.1, 0.5, 1.0, 2.0, 5.0, 10.0]
      for (let i: int = 0; i < ps.length; i++) {
        expect(Math.asinh(-ps[i])).assertEqual(-Math.asinh(ps[i]))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5000
     * @tc.name testMathAsinh050
     * @tc.desc Verify asinh: asinh(sinh(x)) = x for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.5
      let sinhX: double = Math.sinh(x)
      let asinhSinh: double = Math.asinh(sinhX)
      let isClose: boolean = Math.abs(asinhSinh - x) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5100
     * @tc.name testMathAsinh051
     * @tc.desc Verify asinh: asinh(byte 1) = ln(1+sqrt2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.asinh(val)
      expect(result).assertClose(0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5200
     * @tc.name testMathAsinh052
     * @tc.desc Verify asinh: asinh(0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
      let result: double = Math.asinh(val)
      expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5300
     * @tc.name testMathAsinh053
     * @tc.desc Verify asinh batch property: asinh(sinh(x)) equals x for double values -2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0]
      for (let i: int = 0; i < xs.length; i++) {
        let sinhVal: double = Math.sinh(xs[i])
      let result: double = Math.asinh(sinhVal)
      let isClose: boolean = Math.abs(result - xs[i]) < 1e-9
      expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5400
     * @tc.name testMathAsinh054
     * @tc.desc Verify asinh throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.asinh(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5500
     * @tc.name testMathAsinh055
     * @tc.desc Verify asinh: asinh(int 2) = ln(2+sqrt5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2
      let result: double = Math.asinh(val)
      expect(result).assertClose(1.4436354751788103, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5600
     * @tc.name testMathAsinh056
     * @tc.desc Verify asinh returns 0.24746646154726345 with input double 0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.25
      let result: double = Math.asinh(val)
      expect(result).assertClose(0.24746646154726345, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5700
     * @tc.name testMathAsinh057
     * @tc.desc Verify asinh cross-type consistency: asinh(byte 0) and asinh(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5800
     * @tc.name testMathAsinh058
     * @tc.desc Verify asinh cross-type consistency: asinh(int -1) and asinh(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(-0.881373587019543, 1e-6)
      expect(result2).assertClose(-0.881373587019543, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_5900
     * @tc.name testMathAsinh059
     * @tc.desc Verify asinh: asinh(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5
      let first: double = Math.asinh(input)
      let second: double = Math.asinh(input)
      let third: double = Math.asinh(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.48121182505960347, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_6000
     * @tc.name testMathAsinh060
     * @tc.desc Verify asinh cross-type consistency: asinh(long 0) and asinh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_6100
     * @tc.name testMathAsinh061
     * @tc.desc Verify asinh throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.asinh(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_6200
     * @tc.name testMathAsinh062
     * @tc.desc Verify asinh throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.asinh(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_6300
     * @tc.name testMathAsinh063
     * @tc.desc Verify asinh: asinh(negative large numbers) close to -ln(2|x|)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e10
      let result: double = Math.asinh(x)
      let approx: double = -Math.log(2.0 * (-x))
      let isClose: boolean = Math.abs(result - approx) < 1.0e-6
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASINH_6400
     * @tc.name testMathAsinh064
     * @tc.desc Verify asinh cross-type consistency: asinh(int 100) and asinh(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsinh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.asinh(val1)
      let result2: double = Math.asinh(val2)
      expect(result1).assertClose(5.2983423656105835, 1e-6)
      expect(result2).assertClose(5.2983423656105835, 1e-6)
    });

  });
}
