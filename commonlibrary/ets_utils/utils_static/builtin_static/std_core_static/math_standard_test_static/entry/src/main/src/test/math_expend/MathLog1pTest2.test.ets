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

function log1pOneArg(x: number): number {
  return Math.log1p(x);
}

export default function mathLog1pTest2(): void {
  describe('MathLog1pTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0100
     * @tc.name testMathLog1p001
     * @tc.desc Verify log1p: log1p(x) equals log(1 + x) for a batch of normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.1, 0.5, 1.0, 2.0, 10.0, 100.0]
      for (let val of values) {
        let log1pResult: double = Math.log1p(val)
        let logResult: double = Math.log(1.0 + val)
        expect(log1pResult).assertClose(logResult, 1.0e-10)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0200
     * @tc.name testMathLog1p002
     * @tc.desc Verify log1p throws ClassCastError with Arabic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'الاختبار'
        Math.log1p(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0300
     * @tc.name testMathLog1p003
     * @tc.desc Verify log1p method with double input 0.001 for precision comparison with log(1+x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let log1pResult: double = Math.log1p(0.001)
      let logResult: double = Math.log(1.0 + 0.001)
      expect(log1pResult).assertClose(logResult, 1.0e-12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0400
     * @tc.name testMathLog1p004
     * @tc.desc Verify log1p cross-type consistency: log1p(int 0) and log1p(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0500
     * @tc.name testMathLog1p005
     * @tc.desc Verify log1p throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.log1p(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0600
     * @tc.name testMathLog1p006
     * @tc.desc Verify log1p: log1p(e^2-1) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Math.E * Math.E - 1.0
      let result: double = Math.log1p(val)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0700
     * @tc.name testMathLog1p007
     * @tc.desc Verify log1p: log1p(short 1) = 0.6931471805599453
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.log1p(val)
      expect(result).assertClose(0.6931471805599453, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0800
     * @tc.name testMathLog1p008
     * @tc.desc Verify log1p throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.log1p(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0900
     * @tc.name testMathLog1p009
     * @tc.desc Verify log1p: log1p(byte 1) = ln2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.log1p(val)
      expect(result).assertClose(0.6931471805599453, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1000
     * @tc.name testMathLog1p010
     * @tc.desc Verify log1p: log1p(-1.0e-10) approximately -1.0e-10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-10
      let result: double = Math.log1p(x)
      let isClose: boolean = Math.abs(result + 1.0e-10) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1100
     * @tc.name testMathLog1p011
     * @tc.desc Verify log1p: log1p(E - 1) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Math.E - 1.0
      let result: double = Math.log1p(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1200
     * @tc.name testMathLog1p012
     * @tc.desc Verify log1p method with double input 0.5 equals log(1.5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log1p(0.5)
      expect(result).assertClose(Math.log(1.5), 1.0e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1300
     * @tc.name testMathLog1p013
     * @tc.desc Verify log1p throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.log1p(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1400
     * @tc.name testMathLog1p014
     * @tc.desc Verify log1p cross-type consistency: log1p(byte 0) and log1p(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1500
     * @tc.name testMathLog1p015
     * @tc.desc Verify log1p: log1p(int -2) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -2
      let result: double = Math.log1p(val)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1600
     * @tc.name testMathLog1p016
     * @tc.desc Verify log1p: log1p(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5
      let first: double = Math.log1p(input)
      let second: double = Math.log1p(input)
      let third: double = Math.log1p(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.4054651081081644, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1700
     * @tc.name testMathLog1p017
     * @tc.desc Verify log1p: log1p(integer) and log1p(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.log1p(intVal)
      let dblResult: double = Math.log1p(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1800
     * @tc.name testMathLog1p018
     * @tc.desc Verify log1p: log1p(int 2147483647) returns a finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2147483647
      let result: double = Math.log1p(val)
      expect(result).assertClose(21.487562597358306, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1900
     * @tc.name testMathLog1p019
     * @tc.desc Verify log1p cross-type consistency: log1p(byte 1) and log1p(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.6931471805599453, 1e-6)
      expect(result2).assertClose(0.6931471805599453, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2000
     * @tc.name testMathLog1p020
     * @tc.desc Verify log1p cross-type consistency: log1p(int -1) and log1p(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2100
     * @tc.name testMathLog1p021
     * @tc.desc Verify log1p cross-type consistency: log1p(byte 0) and log1p(float 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2200
     * @tc.name testMathLog1p022
     * @tc.desc Verify log1p throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.log1p(true as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2300
     * @tc.name testMathLog1p023
     * @tc.desc Verify log1p: log1p(x) on x>-1 monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.log1p(-0.5) < Math.log1p(0.0)).assertTrue()
      expect(Math.log1p(0.0) < Math.log1p(0.5)).assertTrue()
      expect(Math.log1p(0.5) < Math.log1p(1.0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2400
     * @tc.name testMathLog1p024
     * @tc.desc Verify log1p method with double input 0.5 and 0.5 as separate calls for consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: double = Math.log1p(0.5)
      let second: double = Math.log1p(0.5)
      expect(first).assertEqual(second)
      expect(first).assertClose(0.4054651081081644, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2500
     * @tc.name testMathLog1p025
     * @tc.desc Verify log1p method with Number.EPSILON for positive near-zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log1p(Number.EPSILON)
      expect(result).assertClose(Number.EPSILON, Number.EPSILON)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2600
     * @tc.name testMathLog1p026
     * @tc.desc Verify log1p accepts Math.E minus one expression for return of one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.E - 1.0
      let result: double = Math.log1p(input)
      expect(result).assertClose(1.0, 1.0e-15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2700
     * @tc.name testMathLog1p027
     * @tc.desc Verify log1p: log1p(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-0.9, -0.5, 0.0, 0.5, 1.0, 10.0, 100.0]
      let exp: double[] = [-2.302585092994046, -0.6931471805599453, 0.0, 0.4054651081081644, 0.6931471805599453, 2.3978952727983707, 4.61512051684126]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.log1p(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2800
     * @tc.name testMathLog1p028
     * @tc.desc Verify log1p: log1p(1.0e-5) precision for small values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-5
      let result: double = Math.log1p(x)
      let isClose: boolean = Math.abs(result - 0.00000999995) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2900
     * @tc.name testMathLog1p029
     * @tc.desc Verify log1p cross-type consistency: log1p(byte 1) and log1p(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.6931471805599453, 1e-6)
      expect(result2).assertClose(0.6931471805599453, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3000
     * @tc.name testMathLog1p030
     * @tc.desc Verify log1p throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.log1p(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3100
     * @tc.name testMathLog1p031
     * @tc.desc Verify log1p: log1p(x) equals log(1 + x) for x in [-0.9, 10.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-0.9, -0.5, 0.0, 0.5, 1.0, 2.0, 5.0, 10.0]
      for (let i: int = 0; i < xs.length; i++) {
        let r1: double = Math.log1p(xs[i])
        let r2: double = Math.log(1.0 + xs[i])
        expect(r1).assertClose(r2, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3200
     * @tc.name testMathLog1p032
     * @tc.desc Verify log1p throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.log1p(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3300
     * @tc.name testMathLog1p033
     * @tc.desc Verify log1p cross-type consistency: log1p(long 0) and log1p(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3400
     * @tc.name testMathLog1p034
     * @tc.desc Verify log1p cross-type consistency: log1p(short 15) and log1p(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(2.772588722239781, 1e-6)
      expect(result2).assertClose(2.772588722239781, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3500
     * @tc.name testMathLog1p035
     * @tc.desc Verify log1p cross-type consistency: log1p(int 1) and log1p(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.6931471805599453, 1e-6)
      expect(result2).assertClose(0.6931471805599453, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3600
     * @tc.name testMathLog1p036
     * @tc.desc Verify log1p: log1p(long 10) = 2.3978952727983707
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.log1p(val)
      expect(result).assertClose(2.3978952727983707, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3700
     * @tc.name testMathLog1p037
     * @tc.desc Verify log1p method with Double.MAX_VALUE divided by 10 for expected large return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Double.MAX_VALUE / 10.0
      let result: double = Math.log1p(input)
      expect(result).assertClose(707.4801278003899, 1.0e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3800
     * @tc.name testMathLog1p038
     * @tc.desc Verify log1p: log1p(short -32768) returns NaN (below domain)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -32768
      let result: double = Math.log1p(val)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3900
     * @tc.name testMathLog1p039
     * @tc.desc Verify log1p cross-type consistency: log1p(short -30) and log1p(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4000
     * @tc.name testMathLog1p040
     * @tc.desc Verify log1p: log1p(short 32767) returns a finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 32767
      let result: double = Math.log1p(val)
      expect(result).assertClose(10.39720770839918, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4100
     * @tc.name testMathLog1p041
     * @tc.desc Verify log1p cross-type consistency: log1p(float 0.0f) and log1p(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4200
     * @tc.name testMathLog1p042
     * @tc.desc Verify log1p: log1p(x) = ln(1+x) identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let r1: double = Math.log1p(x)
      let r2: double = Math.log(1.0 + x)
      expect(r1).assertEqual(r2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4300
     * @tc.name testMathLog1p043
     * @tc.desc Verify log1p method with expression Double.toFloat(Math.pow(Math.E, 2.0) - 1.0) returns approximately 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(Math.pow(Math.E, 2.0) - 1.0)
      let result: float = Math.log1p(input)
      expect(result).assertClose(2.0, 1.0e-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4400
     * @tc.name testMathLog1p044
     * @tc.desc Verify log1p accepts Math.E squared minus one expression for return of two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.pow(Math.E, 2.0) - 1.0
      let result: double = Math.log1p(input)
      expect(result).assertClose(2.0, 1.0e-15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4500
     * @tc.name testMathLog1p045
     * @tc.desc Verify log1p: log1p(int) returns NaN for x < -1, -Infinity for x == -1, finite otherwise
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 2, 5, 10, -1, -2, -5]
      for (let i: int = 0; i < ints.length; i++) {
        let r: double = Math.log1p(ints[i])
        if (ints[i] < -1) {      expect(isNaN(r)).assertTrue()
        } else if (ints[i] === -1) {      expect(r).assertEqual(Number.NEGATIVE_INFINITY)
        } else {      expect(isFinite(r)).assertTrue()
        }  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4600
     * @tc.name testMathLog1p046
     * @tc.desc Verify log1p: log1p(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.log1p(intVal)
      let dblResult: double = Math.log1p(dblVal)
      let floatResult: double = Math.log1p(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4700
     * @tc.name testMathLog1p047
     * @tc.desc Verify log1p throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.log1p(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4800
     * @tc.name testMathLog1p048
     * @tc.desc Verify log1p: log1p(short 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.log1p(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4900
     * @tc.name testMathLog1p049
     * @tc.desc Verify log1p: log1p(x) equals log(1 + x) for x in [-0.5, 5.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-0.5, 0.0, 0.5, 1.0, 2.0, 5.0]
      for (let i: int = 0; i < xs.length; i++) {
        expect(Math.log1p(xs[i])).assertClose(Math.log(1.0 + xs[i]), 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5000
     * @tc.name testMathLog1p050
     * @tc.desc Verify log1p throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.log1p('abc' as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5100
     * @tc.name testMathLog1p051
     * @tc.desc Verify log1p({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Record<string, string> = {}
        Math.log1p(obj as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5200
     * @tc.name testMathLog1p052
     * @tc.desc Verify log1p cross-type consistency: log1p(int 100) and log1p(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.log1p(val1)
      let result2: double = Math.log1p(val2)
      expect(result1).assertClose(4.61512051684126, 1e-6)
      expect(result2).assertClose(4.61512051684126, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5300
     * @tc.name testMathLog1p053
     * @tc.desc Verify log1p: log1p(0.0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.log1p(val as object as double)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5400
     * @tc.name testMathLog1p054
     * @tc.desc Verify log1p throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.log1p(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5500
     * @tc.name testMathLog1p055
     * @tc.desc Verify log1p returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathLog1p055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.log1p(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5600
     * @tc.name testMathLog1p056
     * @tc.desc Verify log1p: log1p(byte 0) = log1p(int 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(Math.log1p(0)).assertClose(0.0, 1e-6)
    expect(Math.log1p(0)).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5700
     * @tc.name testMathLog1p057
     * @tc.desc Verify log1p method with double input -0.5 equals log(0.5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log1p(-0.5)
      expect(result).assertClose(Math.log(0.5), 1.0e-8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5800
     * @tc.name testMathLog1p058
     * @tc.desc Verify log1p with out-of-domain value -2.0 returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.log1p(-1.0)).assertEqual(Double.NEGATIVE_INFINITY)
      let r: double = Math.log1p(-2.0)
      expect(isNaN(r)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5900
     * @tc.name testMathLog1p059
     * @tc.desc Verify log1p: log1p(binary literal 0b1) returns approximately 0.6931471805599453
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b1
      let result: double = Math.log1p(val)
      expect(result).assertClose(0.6931471805599453, 1e-6)
    });

  });
}

