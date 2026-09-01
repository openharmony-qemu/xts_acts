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

export default function mathCbrtTest2(): void {
  describe('MathCbrtTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0100
     * @tc.name testMathCbrt001
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 1) and cbrt(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0200
     * @tc.name testMathCbrt002
     * @tc.desc Verify cbrt: cbrt(long 8) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 8
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0300
     * @tc.name testMathCbrt003
     * @tc.desc Verify Math.cbrt with 1e-10 returns correct cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(1e-10)
      let expected: double = 1e-10 ** (1.0 / 3.0)
      let exprResult: boolean = Math.abs(result - expected) < 1e-9
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0400
     * @tc.name testMathCbrt004
     * @tc.desc Verify cbrt: cbrt(a/b) = cbrt(a)/cbrt(b) (b != 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 216.0
      let b: double = 8.0
      expect(Math.cbrt(a / b)).assertClose(Math.cbrt(a) / Math.cbrt(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0500
     * @tc.name testMathCbrt005
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int -1) and cbrt(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(-1.0)
      expect(result2).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0600
     * @tc.name testMathCbrt006
     * @tc.desc Verify cbrt: cbrt(x)^3 equals x for values in [-64.0, 125.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [1.0, 8.0, 64.0, 125.0, -27.0, -64.0]
      for (let i: int = 0; i < xs.length; i++) {
        let cr: double = Math.cbrt(xs[i])
        expect(cr * cr * cr).assertClose(xs[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0700
     * @tc.name testMathCbrt007
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int 1) and cbrt(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0800
     * @tc.name testMathCbrt008
     * @tc.desc Verify Math.cbrt with 1e10 returns correct cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(1e10)
      let expected: double = 1e10 ** (1.0 / 3.0)
      let exprResult: boolean = Math.abs(result - expected) / expected < 1e-4
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0900
     * @tc.name testMathCbrt009
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 0) and cbrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1000
     * @tc.name testMathCbrt010
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short 15) and cbrt(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertClose(2.466212074330470, 1e-6)
      expect(result2).assertClose(2.466212074330470, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1100
     * @tc.name testMathCbrt011
     * @tc.desc Verify cbrt: cube root of positive zero is positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(0.0)
      expect(result).assertEqual(0.0)
      expect(result === 0 && 1 / result === Number.POSITIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1200
     * @tc.name testMathCbrt012
     * @tc.desc Verify cbrt: cbrt(8) = 2 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 8
      let dblVal: double = 8.0
      let floatVal: float = 8.0f
      let intResult: double = Math.cbrt(intVal)
      let dblResult: double = Math.cbrt(dblVal)
      let floatResult: double = Math.cbrt(floatVal)
      expect(intResult).assertEqual(2.0)
      expect(dblResult).assertEqual(2.0)
      expect(floatResult).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1300
     * @tc.name testMathCbrt013
     * @tc.desc Verify cbrt: cbrt(-x) = -cbrt(x) odd function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(-27.0)).assertEqual(-Math.cbrt(27.0))
      expect(Math.cbrt(-64.0)).assertEqual(-Math.cbrt(64.0))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1400
     * @tc.name testMathCbrt014
     * @tc.desc Verify cbrt returns 1.2599210498948732 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.cbrt(val)
      expect(result).assertClose(1.2599210498948732, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1500
     * @tc.name testMathCbrt015
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short -30) and cbrt(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertClose(-3.107232505953859, 1e-6)
      expect(result2).assertClose(-3.107232505953859, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1600
     * @tc.name testMathCbrt016
     * @tc.desc Verify cbrt: cbrt(1e-10) returns the correct cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(1e-10)).assertClose(1e-10 ** (1.0 / 3.0), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1700
     * @tc.name testMathCbrt017
     * @tc.desc Verify cbrt: cbrt(x)^3 = x holds for all numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 27.0
      let cbrtX: double = Math.cbrt(x)
      let cube: double = cbrtX * cbrtX * cbrtX
      expect(cube).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1800
     * @tc.name testMathCbrt018
     * @tc.desc Verify cbrt: cbrt(x^3) = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.0
      let cube: double = x * x * x
      let cbrtCube: double = Math.cbrt(cube)
      expect(cbrtCube).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1900
     * @tc.name testMathCbrt019
     * @tc.desc Verify cbrt cross-type consistency: cbrt(long 0) and cbrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2000
     * @tc.name testMathCbrt020
     * @tc.desc Verify cbrt returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathCbrt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.cbrt(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2100
     * @tc.name testMathCbrt021
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int 0) and cbrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2200
     * @tc.name testMathCbrt022
     * @tc.desc Verify cbrt returns 1.0 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.cbrt(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2300
     * @tc.name testMathCbrt023
     * @tc.desc Verify cbrt: cbrt(0.0) with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.cbrt(val)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2400
     * @tc.name testMathCbrt024
     * @tc.desc Verify cbrt: cbrt(exp(3)) = exp(1) = E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.exp(3.0)
      let result: double = Math.cbrt(x)
      expect(result).assertClose(Math.E, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2500
     * @tc.name testMathCbrt025
     * @tc.desc Verify cbrt: cbrt(1) = 1 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.cbrt(intVal)
      let dblResult: double = Math.cbrt(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2600
     * @tc.name testMathCbrt026
     * @tc.desc Verify cbrt returns 2.154434690031884 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.cbrt(val)
      expect(result).assertClose(2.154434690031884, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2700
     * @tc.name testMathCbrt027
     * @tc.desc Verify cbrt returns 1.4422495703074083 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.cbrt(val)
      expect(result).assertClose(1.4422495703074083, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2800
     * @tc.name testMathCbrt028
     * @tc.desc Verify cbrt: cbrt(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.cbrt(intVal)
      let dblResult: double = Math.cbrt(dblVal)
      let floatResult: double = Math.cbrt(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2900
     * @tc.name testMathCbrt029
     * @tc.desc Verify cbrt cross-type consistency: cbrt(float 0.0f) and cbrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3000
     * @tc.name testMathCbrt030
     * @tc.desc Verify cbrt: cbrt(x)^3 = x for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-125.0, -64.0, -27.0, -8.0, -1.0, 0.0, 1.0, 8.0, 27.0, 64.0, 125.0]
      for (let i: int = 0; i < xs.length; i++) {
        let cr: double = Math.cbrt(xs[i])
        let isClose: boolean = Math.abs(cr * cr * cr - xs[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3100
     * @tc.name testMathCbrt031
     * @tc.desc Verify cbrt returns -1.0 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.cbrt(val)
      expect(result).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3200
     * @tc.name testMathCbrt032
     * @tc.desc Verify cbrt throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.cbrt(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3300
     * @tc.name testMathCbrt033
     * @tc.desc Verify cbrt: cbrt(hex literal 0x8) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0x8
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3400
     * @tc.name testMathCbrt034
     * @tc.desc Verify cbrt: cube root of negative zero is negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(-0.0)
      expect(result === 0 && 1 / result === Number.NEGATIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3500
     * @tc.name testMathCbrt035
     * @tc.desc Verify cbrt: cbrt(pow(x,3)) = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.0
      expect(Math.cbrt(Math.pow(x, 3.0))).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3600
     * @tc.name testMathCbrt036
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 0) and cbrt(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3700
     * @tc.name testMathCbrt037
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int 100) and cbrt(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertClose(4.641588833612779, 1e-6)
      expect(result2).assertClose(4.641588833612779, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3800
     * @tc.name testMathCbrt038
     * @tc.desc Verify cbrt: cbrt(int)^3 equals int for ints in [-64, 125]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 8, 27, 64, 125, -1, -8, -27, -64]
      for (let i: int = 0; i < ints.length; i++) {
        let cr: double = Math.cbrt(ints[i])
        let isClose: boolean = Math.abs(cr * cr * cr - ints[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3900
     * @tc.name testMathCbrt039
     * @tc.desc Verify Math.cbrt with -0.0 returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(-0.0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4000
     * @tc.name testMathCbrt040
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 1) and cbrt(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4100
     * @tc.name testMathCbrt041
     * @tc.desc Verify cbrt: cbrt(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 27.0
      let first: double = Math.cbrt(input)
      let second: double = Math.cbrt(input)
      let third: double = Math.cbrt(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4200
     * @tc.name testMathCbrt042
     * @tc.desc Verify cbrt: cbrt odd function cbrt(-x) = -cbrt(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [1.0, 8.0, 27.0, 64.0, 125.0]
      for (let i: int = 0; i < vs.length; i++) {
        expect(Math.cbrt(-vs[i])).assertEqual(-Math.cbrt(vs[i]))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4300
     * @tc.name testMathCbrt043
     * @tc.desc Verify cbrt: cbrt(-0.0) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.cbrt(-0.0)
      expect(result === 0 && 1 / result === Number.NEGATIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4400
     * @tc.name testMathCbrt044
     * @tc.desc Verify cbrt: cbrt(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-1000.0, -1.0, 0.0, 1.0, 1000.0, 1e10, 1e20]
      let exp: double[] = [-9.999999999999998, -1.0, 0.0, 1.0, 9.999999999999998, 2154.434690031883, 4641588.8336127745]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.cbrt(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4500
     * @tc.name testMathCbrt045
     * @tc.desc Verify cbrt cross-type consistency: cbrt(long 0) and cbrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4600
     * @tc.name testMathCbrt046
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short 1) and cbrt(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4700
     * @tc.name testMathCbrt047
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short 0) and cbrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4800
     * @tc.name testMathCbrt048
     * @tc.desc Verify cbrt: cbrt(a*b) = cbrt(a)*cbrt(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 8.0
      let b: double = 27.0
      let left: double = Math.cbrt(a * b)
      let right: double = Math.cbrt(a) * Math.cbrt(b)
      expect(left).assertClose(right, 1e-6)
    });

  });
}
