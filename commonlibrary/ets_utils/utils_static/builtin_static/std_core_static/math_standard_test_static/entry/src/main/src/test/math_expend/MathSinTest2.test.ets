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

export default function mathSinTest2(): void {
  describe('MathSinTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0010
     * @tc.name testMathSin001
     * @tc.desc Verify sin: sin(x + 4PI) = sin(x)(period 2*2PI)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let val1: double = x + 4.0 * Math.PI
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(x)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0020
     * @tc.name testMathSin002
     * @tc.desc Verify sin throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.sin(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0030
     * @tc.name testMathSin003
     * @tc.desc Verify Math.sin() with argument Math.PI * 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = Math.PI * 2;
      const result: number = Math.sin(val);
      const threshold: number = 1.0e-12;
      expect(Math.abs(result) < threshold).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0040
     * @tc.name testMathSin004
     * @tc.desc Verify sin(0.0, 1.0) extra args are ignored
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (Math.sin as Object as (x:number, y:number)=>number)(0.0, 1.0)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0050
     * @tc.name testMathSin005
     * @tc.desc Verify sin cross-type consistency: sin(long 0) and sin(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0060
     * @tc.name testMathSin006
     * @tc.desc Verify Math.sin() with argument 2 * Math.PI / 3, expected value is sqrt3 / 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 2 * Math.PI / 3;
      const result: number = Math.sin(val);
      const expectVal: number = Math.sqrt(3) / 2;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(result - expectVal) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0070
     * @tc.name testMathSin007
     * @tc.desc Verify sin throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.sin(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0080
     * @tc.name testMathSin008
     * @tc.desc Verify sin cross-type consistency: sin(byte 1) and sin(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.8414709848078965, 1e-6)
      expect(result2).assertClose(0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0090
     * @tc.name testMathSin009
     * @tc.desc Verify sin cross-type consistency: sin(int 100) and sin(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(-0.5063656411097225, 1e-6)
      expect(result2).assertClose(-0.5063656411097225, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0100
     * @tc.name testMathSin010
     * @tc.desc Verify sin([]) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin([] as number[] as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0110
     * @tc.name testMathSin011
     * @tc.desc Verify sin: sin^2(x) on [0, 1] within range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let sinSq: double = Math.sin(x) * Math.sin(x)
      expect(sinSq >= 0.0).assertTrue()
      expect(sinSq <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0120
     * @tc.name testMathSin012
     * @tc.desc Verify sin: sin^2(x) + cos^2(x) = 1 holds for multiple values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.0, 0.2, 0.5, 1.0, 1.5, 2.0, Math.PI, 4.0]
      for (let i: int = 0; i < vals.length; i++) {
        let s: double = Math.sin(vals[i])
        let c: double = Math.cos(vals[i])
        let sum: double = s * s + c * c
        expect(sum).assertEqual(1.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0130
     * @tc.name testMathSin013
     * @tc.desc Verify sin: sin(the same input, byte/int/float) consistency across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 42
      let first: double = Math.sin(n)
      let second: double = Math.sin(n)
      let third: double = Math.sin(n)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(-0.9165215479156338, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0140
     * @tc.name testMathSin014
     * @tc.desc Verify sin throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'abc'
        Math.sin(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0150
     * @tc.name testMathSin015
     * @tc.desc Verify sin cross-type consistency: sin(byte 0) and sin(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0160
     * @tc.name testMathSin016
     * @tc.desc Verify sin(2*PI) returns -2.4492935982947064e-16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(2.0 * Math.PI)
      expect(result).assertClose(-2.4492935982947064e-16, 1e-15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0170
     * @tc.name testMathSin017
     * @tc.desc Verify sin: sin(scientific notation -1.5e-3) odd function sin(-x) = -sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sciNeg: double = -1.5e-3
      let sciPos: double = 1.5e-3
      expect(Math.sin(sciNeg)).assertEqual(-Math.sin(sciPos))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0180
     * @tc.name testMathSin018
     * @tc.desc Verify sin(PI/4) returns approximately sqrt(2)/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.PI / 4.0)
      expect(result).assertClose(Math.SQRT2 / 2.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0190
     * @tc.name testMathSin019
     * @tc.desc Verify sin cross-type consistency: sin(byte 1) and sin(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.8414709848078965, 1e-6)
      expect(result2).assertClose(0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0200
     * @tc.name testMathSin020
     * @tc.desc Verify sin idempotent across three calls with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.sin(val)
      expect(result).assertClose(-0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0210
     * @tc.name testMathSin021
     * @tc.desc Verify sin: sin(PI/2 + x) = cos(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.2
      let val1: double = Math.PI / 2.0 + x
      let result1: double = Math.sin(val1)
      let result2: double = Math.cos(x)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0220
     * @tc.name testMathSin022
     * @tc.desc Verify sin: sin(floating-point precision limit 1e-20) approximates 1e-20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-20
      let result: double = Math.sin(x)
      let isClose: boolean = Math.abs(result - 1.0e-20) < 1.0e-30
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0230
     * @tc.name testMathSin023
     * @tc.desc Verify sin: sin(PI/2 - 1e-12) close to 1.0 (approaching the limit)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 2.0 - 1.0e-12
      let result: double = Math.sin(x)
      let isClose: boolean = Math.abs(result - 1.0) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0240
     * @tc.name testMathSin024
     * @tc.desc Verify sin throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.sin(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0250
     * @tc.name testMathSin025
     * @tc.desc Verify sin(false) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin(false as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0260
     * @tc.name testMathSin026
     * @tc.desc Verify sin: sin(x) as x on [0, PI/2] monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.sin(0.2)
      let b: double = Math.sin(0.8)
      let c: double = Math.sin(1.4)
      expect(a <= b).assertTrue()
      expect(b <= c).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0270
     * @tc.name testMathSin027
     * @tc.desc Verify sin cross-type consistency: sin(short 1) and sin(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.8414709848078965, 1e-6)
      expect(result2).assertClose(0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0280
     * @tc.name testMathSin028
     * @tc.desc Verify sin idempotent across three calls with input val [5]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.25
      let result: double = Math.sin(val)
      expect(result).assertClose(0.24740395925452294, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0290
     * @tc.name testMathSin029
     * @tc.desc Verify sin throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.sin(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0300
     * @tc.name testMathSin030
     * @tc.desc Verify sin throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.sin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0310
     * @tc.name testMathSin031
     * @tc.desc Verify sin throws ClassCastError with emoji string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '\u{1F600}测试'
        Math.sin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0320
     * @tc.name testMathSin032
     * @tc.desc Verify sin cross-type consistency: sin(long 0) and sin(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0330
     * @tc.name testMathSin033
     * @tc.desc Verify sin cross-type consistency: sin(int 1) and sin(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.8414709848078965, 1e-6)
      expect(result2).assertClose(0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0340
     * @tc.name testMathSin034
     * @tc.desc Verify sin(100*PI) result is within [-1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(100.0 * Math.PI)
      expect(result >= -1.0 && result <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0350
     * @tc.name testMathSin035
     * @tc.desc Verify sin throws ClassCastError with XSS script string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '<script>alert(1)</script>'
        Math.sin(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0360
     * @tc.name testMathSin036
     * @tc.desc Verify sin(undefined) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin(undefined as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0370
     * @tc.name testMathSin037
     * @tc.desc Verify sin idempotent across three calls with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.sin(val)
      expect(result).assertClose(0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0380
     * @tc.name testMathSin038
     * @tc.desc Verify sin: sin(-5 * PI/6) = -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let degrees: double = -150.0
      let radians: double = degrees * Math.PI / 180.0
      let val: double = radians
      let result: double = Math.sin(val)
      expect(result).assertClose(-0.5, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0390
     * @tc.name testMathSin039
     * @tc.desc Verify sin: sin(x) * csc(x) = 1(using 1/sin(x))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let sinX: double = Math.sin(x)
      let reciprocal: double = 1.0 / sinX
      expect(sinX * reciprocal).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0400
     * @tc.name testMathSin040
     * @tc.desc Verify sin: sin(Double.MAX_VALUE / 2) result is within [-1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.MAX_VALUE / 2.0
      let result: double = Math.sin(x)
      expect(result >= -1.0).assertTrue()
      expect(result <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0410
     * @tc.name testMathSin041
     * @tc.desc Verify sin: sin(2PI - x) = -sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.4
      expect(Math.sin(2.0 * Math.PI - x)).assertClose(-Math.sin(x), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0420
     * @tc.name testMathSin042
     * @tc.desc Verify sin cross-type consistency: sin(int -1) and sin(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(-0.8414709848078965, 1e-6)
      expect(result2).assertClose(-0.8414709848078965, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0430
     * @tc.name testMathSin043
     * @tc.desc Verify sin: abs(sin(x)) <= 1 holds for all types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.abs(Math.sin(0))).assertLess(1.0)
      expect(Math.abs(Math.sin(1))).assertLess(1.0)
      expect(Math.abs(Math.sin(1.0))).assertLess(1.0)
      expect(Math.abs(Math.sin(-1.0))).assertLess(1.0)
      expect(Math.abs(Math.sin(1.0f))).assertLess(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0440
     * @tc.name testMathSin044
     * @tc.desc Verify sin: sin(any non-special value) range does not exceed [-1,1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeVals: double[] = [1e5, -1e5, 1e10, -1e10, 1e15, -1e15]
      for (let i: int = 0; i < largeVals.length; i++) {
        let s: double = Math.sin(largeVals[i])
        expect(s >= -1.0).assertTrue()
        expect(s <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0450
     * @tc.name testMathSin045
     * @tc.desc Verify sin: sin(scientific notation 1.5e3) = sin(1500.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sciVal: double = 1.5e3
      let direct: double = Math.sin(1500.0)
      let val: double = sciVal
      let result: double = Math.sin(val)
      expect(result).assertEqual(direct)
      expect(result).assertClose(-0.9939019569066535, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0460
     * @tc.name testMathSin046
     * @tc.desc Verify sin cross-type consistency: sin(byte 0) and sin(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0470
     * @tc.name testMathSin047
     * @tc.desc Verify sin throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.sin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0480
     * @tc.name testMathSin048
     * @tc.desc Verify sin(Math.E) is close to 0.410781
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.E
      let result: double = Math.sin(x)
      expect(result).assertClose(0.4107812905029054, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0490
     * @tc.name testMathSin049
     * @tc.desc Verify sin(XSS string) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin('<script>alert(1)</script>' as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0500
     * @tc.name testMathSin050
     * @tc.desc Verify sin(-PI) returns -1.2246467991473532e-16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(-Math.PI)
      expect(result).assertClose(-1.2246467991473532e-16, 1e-15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0510
     * @tc.name testMathSin051
     * @tc.desc Verify sin(true) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin(true as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0520
     * @tc.name testMathSin052
     * @tc.desc Verify sin: sin(-1.0e-10) small-angle approximation approximately -1.0e-10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-10
      let result: double = Math.sin(x)
      let isClose: boolean = Math.abs(result - (-1.0e-10)) < 1.0e-20
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0530
     * @tc.name testMathSin053
     * @tc.desc Verify sin throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.sin(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0540
     * @tc.name testMathSin054
     * @tc.desc Verify sin returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let degrees: double = 0.0
      let radians: double = degrees * Math.PI / 180.0
      let val: double = radians
      let result: double = Math.sin(val as object as double)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0550
     * @tc.name testMathSin055
     * @tc.desc Verify sin: sin(270°) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let degrees: double = 270.0
      let radians: double = degrees * Math.PI / 180.0
      let val: double = radians
      let result: double = Math.sin(val)
      expect(result).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0560
     * @tc.name testMathSin056
     * @tc.desc Verify sin batch property with input -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sin(-0.5)).assertEqual(-Math.sin(0.5))
      expect(Math.sin(-1.0)).assertEqual(-Math.sin(1.0))
      expect(Math.sin(-2.0)).assertEqual(-Math.sin(2.0))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0570
     * @tc.name testMathSin057
     * @tc.desc Verify sin: sin(0.999999 * PI/2) close to 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.999999 * Math.PI / 2.0
      let result: double = Math.sin(x)
      let isClose: boolean = Math.abs(result - 1.0) < 1.0e-5
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0580
     * @tc.name testMathSin058
     * @tc.desc Verify sin idempotent across three calls with input val1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: byte = 0
      let val3: byte = 0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      let result3: double = Math.sin(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0590
     * @tc.name testMathSin059
     * @tc.desc Verify sin('abc') throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin('abc' as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0600
     * @tc.name testMathSin060
     * @tc.desc Verify sin throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.sin(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0610
     * @tc.name testMathSin061
     * @tc.desc Verify sin throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.sin(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0620
     * @tc.name testMathSin062
     * @tc.desc Verify sin batch property with input val1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0630
     * @tc.name testMathSin063
     * @tc.desc Verify sin idempotent across three calls with input val [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.sin(val)
      expect(result).assertClose(-0.5440211108893698, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0640
     * @tc.name testMathSin064
     * @tc.desc Verify sin throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.sin(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0650
     * @tc.name testMathSin065
     * @tc.desc Verify sin throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.sin(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0660
     * @tc.name testMathSin066
     * @tc.desc Verify sin(PI/2) returns approximately 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(Math.PI / 2.0)
      expect(result).assertClose(1.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0670
     * @tc.name testMathSin067
     * @tc.desc Verify sin(-0.0) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(-0.0)
      expect(1 / result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0680
     * @tc.name testMathSin068
     * @tc.desc Verify sin throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b']
      Math.sin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0690
     * @tc.name testMathSin069
     * @tc.desc Verify sin periodicity: sin(x + 2*PI) = sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let result1: double = Math.sin(x)
      let result2: double = Math.sin(x + 2.0 * Math.PI)
      expect(result1).assertClose(result2, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0700
     * @tc.name testMathSin070
     * @tc.desc Verify sin throws ClassCastError with CJK string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.sin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0710
     * @tc.name testMathSin071
     * @tc.desc Verify sin(null) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin(null as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0720
     * @tc.name testMathSin072
     * @tc.desc Verify sin throws ClassCastError with UUID string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550e8400-e29b-41d4-a716-446655440000'
        Math.sin(val as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0730
     * @tc.name testMathSin073
     * @tc.desc Verify sin throws ClassCastError with empty string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = ''
        Math.sin(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0740
     * @tc.name testMathSin074
     * @tc.desc Verify sin: sin(PI/6) cross-source consistency(constant/expression/literal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let direct: double = Math.sin(0.5235987755982988)
      let viaPi: double = Math.sin(Math.PI / 6.0)
      let isConsistent: boolean = direct === viaPi
      expect(isConsistent).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0750
     * @tc.name testMathSin075
     * @tc.desc Verify sin: sin(asin(x)) = x(within the domain)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      expect(Math.sin(Math.asin(x))).assertEqual(x)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0760
     * @tc.name testMathSin076
     * @tc.desc Verify sin: sin(x) / cos(x) = tan(x)(x not PI/2 modulo)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let sinX: double = Math.sin(x)
      let cosX: double = Math.cos(x)
      let tanX: double = Math.tan(x)
      let quotient: double = sinX / cosX
      expect(quotient).assertClose(tanX, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0770
     * @tc.name testMathSin077
     * @tc.desc Verify sin: sin(acosh(1.0)) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sin(Math.acosh(1.0))).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0780
     * @tc.name testMathSin078
     * @tc.desc Verify sin: sin(2x) = 2sin(x)cos(x)(double-angle formula)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.4
      let sin2x: double = Math.sin(2.0 * x)
      let doubleProduct: double = 2.0 * Math.sin(x) * Math.cos(x)
      expect(sin2x).assertEqual(doubleProduct)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0790
     * @tc.name testMathSin079
     * @tc.desc Verify sin throws ClassCastError with string '\u200B' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '\u200B'
        Math.sin(str as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0800
     * @tc.name testMathSin080
     * @tc.desc Verify sin throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.sin(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0810
     * @tc.name testMathSin081
     * @tc.desc Verify sin: sin(PI - x) = sin(x) for x=PI/6 Verify
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 6.0
      let val1: double = Math.PI - x
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(x)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0820
     * @tc.name testMathSin082
     * @tc.desc Verify sin([1.0]) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin([1.0] as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0830
     * @tc.name testMathSin083
     * @tc.desc Verify sin: sin(PI/2 + 1e-12) close to 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 2.0 + 1.0e-12
      let result: double = Math.sin(x)
      let isClose: boolean = Math.abs(result - 1.0) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0840
     * @tc.name testMathSin084
     * @tc.desc Verify sin cross-type consistency: sin(float 0.0f) and sin(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0850
     * @tc.name testMathSin085
     * @tc.desc Verify sin cross-type consistency: sin(1) cross-type consistency(int/byte/short)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: int = 1
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0860
     * @tc.name testMathSin086
     * @tc.desc Verify sin('') throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin('' as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0870
     * @tc.name testMathSin087
     * @tc.desc Verify sin throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1, 2, 3]
      Math.sin(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0880
     * @tc.name testMathSin088
     * @tc.desc Verify sin cross-type consistency: sin(int 0) and sin(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0890
     * @tc.name testMathSin089
     * @tc.desc Verify sin result range is within [-1, 1] for various inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: Array<double> = new Array<double>(0.0, 1.0, -1.0, 100.0, -100.0)
      for (let i: int = 0; i < inputs.length; i++) {
        let result: double = Math.sin(inputs[i])
        expect(result >= -1.0 && result <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0900
     * @tc.name testMathSin090
     * @tc.desc Verify sin(' ') throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin(' ' as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0910
     * @tc.name testMathSin091
     * @tc.desc Verify sin throws ClassCastError with Cyrillic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'АБВГД'
        Math.sin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0920
     * @tc.name testMathSin092
     * @tc.desc Verify sin throws ClassCastError with Arabic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'الاختبار'
        Math.sin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0930
     * @tc.name testMathSin093
     * @tc.desc Verify sin idempotent across three calls with input val [4]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.5f
      let result: double = Math.sin(val)
      expect(result).assertClose(0.479425538604203, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0940
     * @tc.name testMathSin094
     * @tc.desc Verify sin is an odd function: sin(-x) = -sin(x) holds for floating-point values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.1, 0.7, 1.3, 2.0, 3.5]
      for (let i: int = 0; i < vals.length; i++) {
        let pos: double = Math.sin(vals[i])
        let neg: double = Math.sin(-vals[i])
        expect(neg).assertEqual(-pos)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0950
     * @tc.name testMathSin095
     * @tc.desc Verify sin throws ClassCastError with Japanese string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'テスト'
        Math.sin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0960
     * @tc.name testMathSin096
     * @tc.desc Verify sin: sin(PI + x) = -sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      expect(Math.sin(Math.PI + x)).assertClose(-Math.sin(x), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0970
     * @tc.name testMathSin097
     * @tc.desc Verify sin: sin(Float.MAX_VALUE / 2) result is within [-1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = Float.MAX_VALUE / 2.0f
      let result: double = Math.sin(x)
      expect(result >= -1.0).assertTrue()
      expect(result <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0980
     * @tc.name testMathSin098
     * @tc.desc Verify sin({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sin({} as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_0990
     * @tc.name testMathSin099
     * @tc.desc Verify sin: sin(PI + PI/6) = -sin(PI/6)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 6.0
      expect(Math.sin(Math.PI + x)).assertClose(-Math.sin(x), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1000
     * @tc.name testMathSin100
     * @tc.desc Verify sin: sin(45°) = sqrt2/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let degrees: double = 45.0
      let radians: double = degrees * Math.PI / 180.0
      let result: double = Math.sin(radians)
      expect(result).assertClose(0.7071067811865476, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1010
     * @tc.name testMathSin101
     * @tc.desc Verify sin batch property with input values[i]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: double[] = [0.0, 0.5, 1.0, 1.5, 2.0, 3.0, 10.0, 100.0]
      for (let i: int = 0; i < values.length; i++) {
        let s: double = Math.sin(values[i])
        expect(s >= -1.0).assertTrue()
        expect(s <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1020
     * @tc.name testMathSin102
     * @tc.desc Verify sin(-PI/2) returns approximately -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(-Math.PI / 2.0)
      expect(result).assertClose(-1.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1030
     * @tc.name testMathSin103
     * @tc.desc Verify sin with a large positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(1e10)
      expect(result >= -1.0 && result <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1040
     * @tc.name testMathSin104
     * @tc.desc Verify sin cross-type consistency: sin(short -30) and sin(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.9880316240928618, 1e-6)
      expect(result2).assertClose(0.9880316240928618, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1050
     * @tc.name testMathSin105
     * @tc.desc Verify sin(0.0) returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.sin(0.0)
      expect(1.0 / result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1060
     * @tc.name testMathSin106
     * @tc.desc Verify sin: sin(x + 2PI * k) = sin(x) for multiple k holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let base: double = Math.sin(x)
      for (let k:int = 1;k <= 3;k++) {
      let periodic: double = Math.sin(x + 2.0 * Math.PI * k)
      expect(periodic).assertClose(base, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1070
     * @tc.name testMathSin107
     * @tc.desc Verify Math.sin(Math.atan(x)) is equivalent to x / sqrt(1 + x * x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 0.5;
      const sinAtan: number = Math.sin(Math.atan(x));
      const expected: number = x / Math.sqrt(1 + x * x);
      const tolerance: number = 1.0e-12;
      const isClose: boolean = Math.abs(sinAtan - expected) < tolerance;
      expect(isClose).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1080
     * @tc.name testMathSin108
     * @tc.desc Verify sin: sin(x) + sin(y) = 2sin((x+y)/2)cos((x-y)/2)(sum-to-product identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let y: double = 0.7
      let left: double = Math.sin(x) + Math.sin(y)
      let right: double = 2.0 * Math.sin((x + y) / 2.0) * Math.cos((x - y) / 2.0)
      expect(left).assertEqual(right)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1090
     * @tc.name testMathSin109
     * @tc.desc Verify sin is an odd function: sin(-x) = -sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0
      let result1: double = Math.sin(x)
      let result2: double = Math.sin(-x)
      expect(result1 + result2).assertClose(0.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1100
     * @tc.name testMathSin110
     * @tc.desc Verify sin throws ClassCastError with Korean string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '테스트'
        Math.sin(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1110
     * @tc.name testMathSin111
     * @tc.desc Verify sin cross-type consistency: sin(short 15) and sin(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.6502878401571168, 1e-6)
      expect(result2).assertClose(0.6502878401571168, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1120
     * @tc.name testMathSin112
     * @tc.desc Verify sin cross-type consistency: sin(short 0) and sin(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1130
     * @tc.name testMathSin113
     * @tc.desc Verify sin: sin(PI - x) = sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let val1: double = Math.PI - x
      let result1: double = Math.sin(val1)
      let result2: double = Math.sin(x)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SIN_1140
     * @tc.name testMathSin114
     * @tc.desc Verify Math.sin(): sin(PI/6 + PI/6) equals sin(PI/3) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSin114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const direct: number = Math.sin(Math.PI / 3.0);
      const val: number = Math.PI / 6.0 + Math.PI / 6.0;
      const result: number = Math.sin(val);
      const tolerance: number = 1.0e-12;
      expect(Math.abs(result - direct) < tolerance).assertEqual(true);
    });

  });
}
