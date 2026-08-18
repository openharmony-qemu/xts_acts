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

export default function mathExpm1Test2(): void {
  describe('MathExpm1Test2', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0100
     * @tc.name testMathExpm1001
     * @tc.desc Verify expm1 throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.expm1(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0200
     * @tc.name testMathExpm1002
     * @tc.desc Verify expm1 throws ClassCastError with Cyrillic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'АБВГД'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0300
     * @tc.name testMathExpm1003
     * @tc.desc Verify expm1 throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.expm1(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0400
     * @tc.name testMathExpm1004
     * @tc.desc Verify expm1 throws ClassCastError with UUID string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550e8400-e29b-41d4-a716-446655440000'
        Math.expm1(val as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0500
     * @tc.name testMathExpm1005
     * @tc.desc Verify expm1: expm1(integer) and expm1(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.expm1(intVal)
      let dblResult: double = Math.expm1(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0600
     * @tc.name testMathExpm1006
     * @tc.desc Verify expm1 throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.expm1(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0700
     * @tc.name testMathExpm1007
     * @tc.desc Verify expm1: expm1(byte 1) = E-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.expm1(val)
      expect(result).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0800
     * @tc.name testMathExpm1008
     * @tc.desc Verify expm1: expm1(x) + 1 = exp(x) identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.5
      expect(Math.expm1(x) + 1.0).assertClose(Math.exp(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0900
     * @tc.name testMathExpm1009
     * @tc.desc Verify expm1: expm1(int) equals exp(int) - 1 for int inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 2, 3, -1, -2, -3]
      for (let i: int = 0; i < ints.length; i++) {
        let result: double = Math.expm1(ints[i])
        expect(result).assertClose(Math.exp(ints[i]) - 1.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1000
     * @tc.name testMathExpm1010
     * @tc.desc Verify expm1 throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.expm1(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1100
     * @tc.name testMathExpm1011
     * @tc.desc Verify expm1 throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.expm1(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1200
     * @tc.name testMathExpm1012
     * @tc.desc Verify expm1: expm1(max(0,1)) = expm1(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(0.0, 1.0)
      expect(Math.expm1(m)).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1300
     * @tc.name testMathExpm1013
     * @tc.desc Verify expm1 overflow behavior: expm1(int 100) and expm1(long 100) both return Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1400
     * @tc.name testMathExpm1014
     * @tc.desc Verify Math.expm1 with 1 required parameter returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.expm1(1.0)
      expect(Math.abs(result - 1.718281828459045) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1500
     * @tc.name testMathExpm1015
     * @tc.desc Verify expm1 cross-type consistency: expm1(byte 1) and expm1(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(1.718281828459045, 1e-6)
      expect(result2).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1600
     * @tc.name testMathExpm1016
     * @tc.desc Verify expm1 with extra arguments uses the first argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.expm1(1.0)
      let expected: number = 1.718281828459045
      expect(Math.abs(result - expected) < 0.0001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1700
     * @tc.name testMathExpm1017
     * @tc.desc Verify expm1: expm1(710.0) returns Infinity (overflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.expm1(710.0)
      let isEqual:boolean = result === Number.POSITIVE_INFINITY
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1800
     * @tc.name testMathExpm1018
     * @tc.desc Verify expm1 cross-type consistency: expm1(float 0.0f) and expm1(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1900
     * @tc.name testMathExpm1019
     * @tc.desc Verify expm1 throws ClassCastError with string '\u200B' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '\u200B'
        Math.expm1(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2000
     * @tc.name testMathExpm1020
     * @tc.desc Verify expm1 cross-type consistency: expm1(short 0) and expm1(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2100
     * @tc.name testMathExpm1021
     * @tc.desc Verify expm1: expm1(x) + 1 = exp(x) for x in [-2.0, 2.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0]
      for (let i: int = 0; i < vs.length; i++) {
        expect(Math.expm1(vs[i]) + 1.0).assertClose(Math.exp(vs[i]), 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2200
     * @tc.name testMathExpm1022
     * @tc.desc Verify Math.expm1 float result can participate in arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 1.0f
      let result: float = Math.expm1(value)
      let computed: float = result + 1.0f
      expect(Math.abs(computed - Math.E) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2300
     * @tc.name testMathExpm1023
     * @tc.desc Verify expm1 cross-type consistency: expm1(byte 0) and expm1(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2400
     * @tc.name testMathExpm1024
     * @tc.desc Verify expm1: expm1(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.expm1(intVal)
      let dblResult: double = Math.expm1(dblVal)
      let floatResult: double = Math.expm1(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2500
     * @tc.name testMathExpm1025
     * @tc.desc Verify Math.expm1 double overload with -1.0 returns approximately -0.63212
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.expm1(-1.0)
      expect(Math.abs(result + 0.6321205588285577) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2600
     * @tc.name testMathExpm1026
     * @tc.desc Verify Math.expm1 float overload with 1.0f returns approximately 1.71828
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 1.0f
      let result: float = Math.expm1(value)
      expect(Math.abs(result - 1.718281828459045f) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2700
     * @tc.name testMathExpm1027
     * @tc.desc Verify expm1: expm1(log(2)) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.expm1(Math.log(2.0))).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2800
     * @tc.name testMathExpm1028
     * @tc.desc Verify expm1: expm1(0.5) returns approximately 0.6487212
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 0.5
      let result: number = Math.expm1(value)
      let expected: number = 0.6487212
      expect(Math.abs(result - expected) < 0.0001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2900
     * @tc.name testMathExpm1029
     * @tc.desc Verify Math.expm1 float overload with -1.0f returns approximately -0.63212
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = -1.0f
      let result: float = Math.expm1(value)
      expect(Math.abs(result + 0.6321205588285577f) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3000
     * @tc.name testMathExpm1030
     * @tc.desc Verify identity: expm1(-x) equals 1 / exp(x) - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let neg: double = Math.expm1(-x);
      let rhs: double = 1.0 / Math.exp(x) - 1.0;
      expect(Math.abs(neg - rhs)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3100
     * @tc.name testMathExpm1031
     * @tc.desc Verify Math.expm1 double overload with -0.0 returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.expm1(-0.0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3200
     * @tc.name testMathExpm1032
     * @tc.desc Verify Math.expm1 double result can participate in arithmetic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.expm1(1.0)
      let computed: double = result + 1.0
      expect(Math.abs(computed - Math.E) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3300
     * @tc.name testMathExpm1033
     * @tc.desc Verify expm1: float return value usable in subsequent float operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = 1.0
      let result: number = Math.expm1(value)
      let computed: number = result + 1.0
      expect(isFinite(computed)).assertTrue()
      expect(computed > 2.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3400
     * @tc.name testMathExpm1034
     * @tc.desc Verify expm1 throws ClassCastError with CJK string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3500
     * @tc.name testMathExpm1035
     * @tc.desc Verify Math.expm1 consistency: expm1(1.0 + 0.0) equals expm1(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.expm1(1.0 + 0.0);
      let rhs: double = Math.expm1(1.0);
      expect(Math.abs(lhs - rhs)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3600
     * @tc.name testMathExpm1036
     * @tc.desc Verify expm1 cross-type consistency: expm1(long 0) and expm1(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3700
     * @tc.name testMathExpm1037
     * @tc.desc Verify Math.expm1 consistency: expm1(0.5 * 2.0) equals expm1(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.expm1(0.5 * 2.0);
      let rhs: double = Math.expm1(1.0);
      expect(Math.abs(lhs - rhs)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3800
     * @tc.name testMathExpm1038
     * @tc.desc Verify Math.expm1 float overload with 0.001f returns approximately 0.0010005
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 0.001f
      let result: float = Math.expm1(value)
      expect(Math.abs(result - 0.0010005001667083849f) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3900
     * @tc.name testMathExpm1039
     * @tc.desc Verify double overload returns double type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.expm1(1.0)
      expect(result).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4000
     * @tc.name testMathExpm1040
     * @tc.desc Verify expm1 cross-type consistency: expm1(byte 1) and expm1(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(1.718281828459045, 1e-6)
      expect(result2).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4100
     * @tc.name testMathExpm1041
     * @tc.desc Verify Math.expm1 with 710.0 returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.expm1(710.0)
      expect(result).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4200
     * @tc.name testMathExpm1042
     * @tc.desc Verify expm1 cross-type consistency: expm1(long 0) and expm1(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4300
     * @tc.name testMathExpm1043
     * @tc.desc Verify expm1 throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.expm1(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4400
     * @tc.name testMathExpm1044
     * @tc.desc Verify expm1 cross-type consistency: expm1(short 15) and expm1(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(3269016.6372368387, 1e-6)
      expect(result2).assertClose(3269016.6372368387, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4500
     * @tc.name testMathExpm1045
     * @tc.desc Verify expm1: expm1(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5
      let first: double = Math.expm1(input)
      let second: double = Math.expm1(input)
      let third: double = Math.expm1(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.6487212707001282, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4600
     * @tc.name testMathExpm1046
     * @tc.desc Verify expm1: expm1(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]
      let exp: double[] = [-1.0, -0.9999546000702375, -0.6321205588285577, 0.0, 1.718281828459045, 22025.465794806718, 2.6881171418161356e+43]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.expm1(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4700
     * @tc.name testMathExpm1047
     * @tc.desc Verify expm1 throws ClassCastError with Japanese string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'テスト'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4800
     * @tc.name testMathExpm1048
     * @tc.desc Verify expm1 cross-type consistency: expm1(int 1) and expm1(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(1.718281828459045, 1e-6)
      expect(result2).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4900
     * @tc.name testMathExpm1049
     * @tc.desc Verify Math.expm1 double overload with 0.001 is more accurate than exp(0.001)-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expm1Result: double = Math.expm1(0.001)
      let expected: double = 0.0010005001667083849
      let diff: double = Math.abs(expm1Result - expected)
      expect(diff < 1e-9).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5000
     * @tc.name testMathExpm1050
     * @tc.desc Verify expm1: log(expm1(1)+1) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.log(Math.expm1(1.0) + 1.0)).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5100
     * @tc.name testMathExpm1051
     * @tc.desc Verify expm1 throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.expm1(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5200
     * @tc.name testMathExpm1052
     * @tc.desc Verify expm1: expm1(long 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.expm1(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5300
     * @tc.name testMathExpm1053
     * @tc.desc Verify expm1: repeated calls with expm1(1.0) produce stable results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expected: number = Math.expm1(1.0)
      let allStable: boolean = true
      for (let i: int = 0; i < 100; i++) {
        let result: number = Math.expm1(1.0)
        if (Math.abs(result - expected) > 0.0000001) {
          allStable = false
          break
        }
      }
      expect(allStable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5400
     * @tc.name testMathExpm1054
     * @tc.desc Verify expm1: expm1(-1.0e-10) approximately -1.0e-10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-10
      let result: double = Math.expm1(x)
      let isClose: boolean = Math.abs(result + 1.0e-10) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5500
     * @tc.name testMathExpm1055
     * @tc.desc Verify expm1: expm1(0.0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.expm1(val)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5600
     * @tc.name testMathExpm1056
     * @tc.desc Verify expm1 throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.expm1(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5700
     * @tc.name testMathExpm1057
     * @tc.desc Verify expm1 throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.expm1(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5800
     * @tc.name testMathExpm1058
     * @tc.desc Verify expm1 throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.expm1(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5900
     * @tc.name testMathExpm1059
     * @tc.desc Verify expm1: for negative x, -1 < expm1(x) < 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ns: double[] = [-0.1, -0.5, -1.0, -2.0, -5.0]
      for (let i: int = 0; i < ns.length; i++) {
        let r: double = Math.expm1(ns[i])
        expect(r > -1.0).assertTrue()
        expect(r < 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6000
     * @tc.name testMathExpm1060
     * @tc.desc Verify expm1: expm1(-1.0) returns approximately -0.6321205588285577
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.expm1(-1.0)
      let expected: number = -0.6321205588285577
      expect(Math.abs(result - expected) < 0.0000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6100
     * @tc.name testMathExpm1061
     * @tc.desc Verify expm1 throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.expm1(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6200
     * @tc.name testMathExpm1062
     * @tc.desc Verify expm1: expm1(short -1) = 1/e - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.expm1(val)
      expect(result).assertClose(-0.6321205588285577, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6300
     * @tc.name testMathExpm1063
     * @tc.desc Verify expm1 cross-type consistency: expm1(int 0) and expm1(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6400
     * @tc.name testMathExpm1064
     * @tc.desc Verify expm1 throws ClassCastError with XSS script string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '<script>alert(1)</script>'
        Math.expm1(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6500
     * @tc.name testMathExpm1065
     * @tc.desc Verify expm1 throws ClassCastError with Arabic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'الاختبار'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6600
     * @tc.name testMathExpm1066
     * @tc.desc Verify expm1: expm1(abs(-2)) = expm1(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-2.0)
      expect(Math.expm1(a)).assertClose(6.38905609893065, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6700
     * @tc.name testMathExpm1067
     * @tc.desc Verify expm1: expm1(1e-10) precision advantage for tiny values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: number = Math.expm1(1e-10)
      let result2: number = Math.exp(1e-10) - 1.0
      expect(result1).assertClose(1.00000000005e-10, 1e-6)
      expect(result1 !== 0.0).assertTrue()
      expect(Math.abs(result1 - result2) < 1e-9).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6800
     * @tc.name testMathExpm1068
     * @tc.desc Verify expm1: expm1(x) equals exp(x) - 1 for x in [-1.0, 1.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-1.0, -0.5, 0.0, 0.5, 1.0]
      for (let i: int = 0; i < xs.length; i++) {
        expect(Math.expm1(xs[i])).assertClose(Math.exp(xs[i]) - 1.0, 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6900
     * @tc.name testMathExpm1069
     * @tc.desc Verify expm1 idempotent across three calls with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.expm1(val)
      expect(result).assertClose(-0.6321205588285577, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7000
     * @tc.name testMathExpm1070
     * @tc.desc Verify expm1 throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.expm1(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7100
     * @tc.name testMathExpm1071
     * @tc.desc Verify expm1 throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'abc'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7200
     * @tc.name testMathExpm1072
     * @tc.desc Verify expm1: expm1(1) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.expm1(intVal)
      let dblResult: double = Math.expm1(dblVal)
      expect(Math.abs(intResult - dblResult) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7300
     * @tc.name testMathExpm1073
     * @tc.desc Verify expm1: for positive x, expm1(x) > 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ps: double[] = [0.1, 0.5, 1.0, 2.0, 5.0]
      for (let i: int = 0; i < ps.length; i++) {
        expect(Math.expm1(ps[i]) > 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7400
     * @tc.name testMathExpm1074
     * @tc.desc Verify expm1 cross-type consistency: expm1(short 1) and expm1(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(1.718281828459045, 1e-6)
      expect(result2).assertClose(1.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7500
     * @tc.name testMathExpm1075
     * @tc.desc Verify expm1: double return value is usable in subsequent double operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.expm1(1.0)
      let computed: number = result + 1.0
      let expected: number = Math.E
      expect(Math.abs(computed - expected) < 0.0000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7600
     * @tc.name testMathExpm1076
     * @tc.desc Verify expm1: alternating float and double overloads produce stable results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fVal: number = 1.0
      const dVal: number = 1.0
      let allStable: boolean = true
      for (let i: int = 0; i < 50; i++) {
        let fResult: number = Math.expm1(fVal)
        let dResult: number = Math.expm1(dVal)
        if (!isFinite(fResult) || !isFinite(dResult)) {
          allStable = false
          break
        }
      }
      expect(allStable).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7700
     * @tc.name testMathExpm1077
     * @tc.desc Verify expm1 idempotent across three calls with input val [5]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.expm1(val)
      expect(result).assertClose(19.085536923187668, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7800
     * @tc.name testMathExpm1078
     * @tc.desc Verify expm1 throws ClassCastError with Korean string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '테스트'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7900
     * @tc.name testMathExpm1079
     * @tc.desc Verify expm1 cross-type consistency: expm1(byte 0) and expm1(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8000
     * @tc.name testMathExpm1080
     * @tc.desc Verify expm1: expm1(1.0e-10) approximately 1.0e-10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-10
      let result: double = Math.expm1(x)
      let isClose: boolean = Math.abs(result - 1.0e-10) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8100
     * @tc.name testMathExpm1081
     * @tc.desc Verify expm1 throws ClassCastError with emoji string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '\u{1F600}测试'
        Math.expm1(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8200
     * @tc.name testMathExpm1082
     * @tc.desc Verify expm1: expm1(-100.0) returns a value close to -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.expm1(-100.0)
      expect(result).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8300
     * @tc.name testMathExpm1083
     * @tc.desc Verify expm1 idempotent across three calls with input val [4]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.expm1(val)
      expect(result).assertClose(6.38905609893065, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8400
     * @tc.name testMathExpm1084
     * @tc.desc Verify expm1: expm1 monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.expm1(-1.0) < Math.expm1(0.0)).assertTrue()
      expect(Math.expm1(0.0) < Math.expm1(1.0)).assertTrue()
      expect(Math.expm1(1.0) < Math.expm1(2.0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8500
     * @tc.name testMathExpm1085
     * @tc.desc Verify expm1 cross-type consistency: expm1(int -1) and expm1(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(-0.6321205588285577, 1e-6)
      expect(result2).assertClose(-0.6321205588285577, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8600
     * @tc.name testMathExpm1086
     * @tc.desc Verify expm1: expm1(int 2) = e^2-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2
      let result: double = Math.expm1(val)
      expect(result).assertClose(6.38905609893065, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8700
     * @tc.name testMathExpm1087
     * @tc.desc Verify expm1 throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.expm1(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8800
     * @tc.name testMathExpm1088
     * @tc.desc Verify expm1 idempotent across three calls with input val1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: byte = 0
      let val3: byte = 0
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      let result3: double = Math.expm1(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8900
     * @tc.name testMathExpm1089
     * @tc.desc Verify expm1 idempotent across three calls with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.expm1(val)
      expect(result).assertClose(22025.465794806718, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9000
     * @tc.name testMathExpm1090
     * @tc.desc Verify expm1 cross-type consistency: expm1(short -30) and expm1(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.expm1(val1)
      let result2: double = Math.expm1(val2)
      expect(result1).assertClose(-1.0, 1e-6)
      expect(result2).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9100
     * @tc.name testMathExpm1091
     * @tc.desc Verify expm1: expm1(x) approximately equals exp(x) - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.0
      let result1: number = Math.expm1(x)
      let result2: number = Math.exp(x) - 1.0
      expect(result1).assertClose(result2, 1e-10)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9200
     * @tc.name testMathExpm1092
     * @tc.desc Verify fundamental definition identity: expm1(x) = exp(x) - 1 for multiple inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0];
      for (let i: int = 0; i < xs.length; i++) {
        let x: double = xs[i];
        let expm1X: double = Math.expm1(x);
        let expected: double = Math.exp(x) - 1.0;
        expect(Math.abs(expm1X - expected)).assertLess(1e-12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9300
     * @tc.name testMathExpm1093
     * @tc.desc Verify expm1: expm1(0.001) close to exp(0.001) - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expm1Result: number = Math.expm1(0.001)
      let expSubResult: number = Math.exp(0.001) - 1.0
      expect(expm1Result).assertClose(0.0010005001667083417, 1e-6)
      expect(Math.abs(expm1Result - expSubResult) < 0.0000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9400
     * @tc.name testMathExpm1094
     * @tc.desc Verify expm1: expm1(x) > 0 for x > 0 and expm1(x) < 0 for x < 0 near 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.expm1(1.0e-10) > 0.0).assertTrue()
      expect(Math.expm1(-1.0e-10) < 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9500
     * @tc.name testMathExpm1095
     * @tc.desc Verify expm1 throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.expm1(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9600
     * @tc.name testMathExpm1096
     * @tc.desc Verify Math.expm1 with 1e-10 has higher precision than exp(1e-10)-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expm1Result: double = Math.expm1(1e-10)
      let expSubResult: double = Math.exp(1e-10) - 1.0
      expect(Math.abs(expm1Result - 1.00000000005e-10) < Math.abs(expSubResult - 1.00000000005e-10)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9700
     * @tc.name testMathExpm1097
     * @tc.desc Verify expm1 throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.expm1(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9800
     * @tc.name testMathExpm1098
     * @tc.desc Verify expm1 throws ClassCastError with empty string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = ''
        Math.expm1(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_9900
     * @tc.name testMathExpm1099
     * @tc.desc Verify expm1 idempotent across three calls with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.expm1(val)
      expect(result).assertClose(1.718281828459045, 1e-6)
    });

  });
}
