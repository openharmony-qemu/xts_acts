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

export default function mathSqrtTest2(): void {
  describe('MathSqrtTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0100
     * @tc.name testMathSqrt001
     * @tc.desc Verify sqrt cross-type consistency: sqrt(int 0) and sqrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0200
     * @tc.name testMathSqrt002
     * @tc.desc Verify Math constant property: sqrt(0.5) == Math.SQRT1_2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let computed: double = Math.sqrt(0.5)
      let isEqual: boolean = computed === Math.SQRT1_2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0300
     * @tc.name testMathSqrt003
     * @tc.desc Verify sqrt throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.sqrt(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0400
     * @tc.name testMathSqrt004
     * @tc.desc Verify sqrt throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.sqrt(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0500
     * @tc.name testMathSqrt005
     * @tc.desc Verify Math.sqrt() with expression 3 + 6 + 7, expected result near 4.0 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 3.0 + 6.0 + 7.0;
      const result: number = Math.sqrt(val);
      const expectVal: number = 4.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0600
     * @tc.name testMathSqrt006
     * @tc.desc Verify sqrt throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'abc'
        Math.sqrt(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0700
     * @tc.name testMathSqrt007
     * @tc.desc Verify sqrt: sqrt(abs(-9)) = 3 (combination with absolute value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sqrt(Math.abs(-9))).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0800
     * @tc.name testMathSqrt008
     * @tc.desc Verify sqrt cross-type consistency: sqrt(int 100) and sqrt(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(10.0, 1e-6)
      expect(result2).assertClose(10.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_0900
     * @tc.name testMathSqrt009
     * @tc.desc Verify sqrt: sqrt(1.0) always 1.0 repeated-call verification
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 1.0
        let result: double = Math.sqrt(val)
        expect(result).assertEqual(1.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1000
     * @tc.name testMathSqrt010
     * @tc.desc Verify sqrt throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
        Math.sqrt(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1100
     * @tc.name testMathSqrt011
     * @tc.desc Verify sqrt returns 1.7320508075688772 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.sqrt(val)
      expect(result).assertClose(1.7320508075688772, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1200
     * @tc.name testMathSqrt012
     * @tc.desc Verify sqrt throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.sqrt(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1300
     * @tc.name testMathSqrt013
     * @tc.desc Verify sqrt idempotent across three calls with input n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 42
      let f: double = Math.sqrt(n)
      let s: double = Math.sqrt(n)
      let t: double = Math.sqrt(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(6.48074069840786, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1400
     * @tc.name testMathSqrt014
     * @tc.desc Verify sqrt: sqrt(sin^2(x) + cos^2(x)) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let s: double = Math.sin(x)
      let c: double = Math.cos(x)
      let val: double = s * s + c * c
      let result: double = Math.sqrt(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1500
     * @tc.name testMathSqrt015
     * @tc.desc Verify sqrt cross-type consistency: sqrt(byte 1) and sqrt(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1600
     * @tc.name testMathSqrt016
     * @tc.desc Verify sqrt cross-type consistency: sqrt(short 1) and sqrt(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1700
     * @tc.name testMathSqrt017
     * @tc.desc Verify sqrt: sqrt(long large positive numbers 1e18) finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1000000000000000000
      let result: double = Math.sqrt(x)
      expect(result).assertClose(1000000000.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1800
     * @tc.name testMathSqrt018
     * @tc.desc Verify sqrt returns 1.4142135623730951 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.sqrt(val)
      expect(result).assertClose(1.4142135623730951, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_1900
     * @tc.name testMathSqrt019
     * @tc.desc Verify sqrt: sqrt(short 25) and sqrt(int 25) return equal results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 25
      let val2: int = 25
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2000
     * @tc.name testMathSqrt020
     * @tc.desc Verify Math.sqrt() with octal literal 0o11 (decimal 9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oct: number = 0o11;
      const val: number = oct;
      const result: number = Math.sqrt(val);
      const expectVal: number = 3.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2100
     * @tc.name testMathSqrt021
     * @tc.desc Verify sqrt returns 3.1622776601683795 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.sqrt(val)
      expect(result).assertClose(3.1622776601683795, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2200
     * @tc.name testMathSqrt022
     * @tc.desc Verify sqrt cross-type consistency: sqrt(int -1) and sqrt(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2300
     * @tc.name testMathSqrt023
     * @tc.desc Verify sqrt: sqrt monotonicity for [0,1,4,9,16,25] holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.0, 1.0, 4.0, 9.0, 16.0, 25.0]
      for (let i: int = 0 ;i < vals.length - 1;i++) {
      expect(Math.sqrt(vals[i]) <= Math.sqrt(vals[i+1])).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2400
     * @tc.name testMathSqrt024
     * @tc.desc Verify sqrt cross-type consistency: sqrt(short 15) and sqrt(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(3.872983346207417, 1e-6)
      expect(result2).assertClose(3.872983346207417, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2500
     * @tc.name testMathSqrt025
     * @tc.desc Verify Math constant property: sqrt(2.0) == Math.SQRT2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let computed: double = Math.sqrt(2.0)
      let isEqual: boolean = computed === Math.SQRT2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2600
     * @tc.name testMathSqrt026
     * @tc.desc Verify sqrt cross-type consistency: sqrt(byte 0) and sqrt(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2700
     * @tc.name testMathSqrt027
     * @tc.desc Verify Math.sqrt() with expression 4 * 9, expected result near 6.0 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 4.0 * 9.0;
      const result: number = Math.sqrt(val);
      const expectVal: number = 6.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2800
     * @tc.name testMathSqrt028
     * @tc.desc Verify sqrt throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.sqrt(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_2900
     * @tc.name testMathSqrt029
     * @tc.desc Verify sqrt cross-type consistency: sqrt(float 0.0f) and sqrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3000
     * @tc.name testMathSqrt030
     * @tc.desc Verify sqrt cross-type consistency: sqrt(int 1) and sqrt(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3100
     * @tc.name testMathSqrt031
     * @tc.desc Verify sqrt throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.sqrt(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3200
     * @tc.name testMathSqrt032
     * @tc.desc Verify sqrt throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
        set.add(1)
        Math.sqrt(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3300
     * @tc.name testMathSqrt033
     * @tc.desc Verify sqrt: sqrt(finite positive numbers) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pos: double[] = [0.01, 0.1, 1.0, 100.0, 10000.0, 1e10, 1e20]
      let exp: double[] = [0.1, 0.31622776601683794, 1.0, 10.0, 100.0, 100000.0, 10000000000.0]
      for (let i: int = 0; i < pos.length; i++) {
        let result: double = Math.sqrt(pos[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3400
     * @tc.name testMathSqrt034
     * @tc.desc Verify sqrt([]) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sqrt([] as number[] as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3500
     * @tc.name testMathSqrt035
     * @tc.desc Verify sqrt idempotent across three calls with input val1 [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: int = -1
      let val3: int = -1
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      let result3: double = Math.sqrt(val3)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
      expect(isNaN(result3)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3600
     * @tc.name testMathSqrt036
     * @tc.desc Verify sqrt(ceil(2.5)) equals sqrt(3.0) ~= 1.732
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathSqrt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: double = Math.ceil(2.5)
      expect(c).assertEqual(3.0)
      let result: double = Math.sqrt(c)
      expect(result).assertClose(1.7320508075688772, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3700
     * @tc.name testMathSqrt037
     * @tc.desc Verify sqrt: sqrt(2.0) * sqrt(2.0) = 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: double = Math.sqrt(2.0)
      expect(s * s).assertClose(2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3800
     * @tc.name testMathSqrt038
     * @tc.desc Verify sqrt throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
        Math.sqrt(list as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_3900
     * @tc.name testMathSqrt039
     * @tc.desc Verify sqrt throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
        Math.sqrt(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4000
     * @tc.name testMathSqrt040
     * @tc.desc Verify sqrt: sqrt(exp(x)) = exp(x/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 2.0
      expect(Math.sqrt(Math.exp(x))).assertClose(Math.exp(x / 2.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4100
     * @tc.name testMathSqrt041
     * @tc.desc Verify sqrt: sqrt(consecutive natural numbers 1-10) finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exp: double[] = [1.0, 1.4142135623730951, 1.7320508075688772, 2.0, 2.23606797749979, 2.449489742783178, 2.6457513110645907, 2.8284271247461903, 3.0, 3.1622776601683795]
      for (let i:int = 1;i <= 10;i++) {
        let result: double = Math.sqrt(i)
        expect(result).assertClose(exp[i - 1], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4200
     * @tc.name testMathSqrt042
     * @tc.desc Verify sqrt: sqrt(Math.SQRT2) squared approximately equals Math.SQRT2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.sqrt(Math.SQRT2)
      expect(r * r).assertClose(Math.SQRT2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4300
     * @tc.name testMathSqrt043
     * @tc.desc Verify sqrt throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.sqrt(null as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4400
     * @tc.name testMathSqrt044
     * @tc.desc Verify sqrt throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
        Math.sqrt(map as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4500
     * @tc.name testMathSqrt045
     * @tc.desc Verify sqrt returns 1.0 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.sqrt(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4600
     * @tc.name testMathSqrt046
     * @tc.desc Verify sqrt: sqrt(x^2) equals x for x in [1.0, 2.0, 3.0, 5.0, 10.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [1.0, 2.0, 3.0, 5.0, 10.0]
      for (let i: int = 0; i < vals.length; i++) {
        let val: double = vals[i] * vals[i]
        let result: double = Math.sqrt(val)
        expect(result).assertEqual(vals[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4700
     * @tc.name testMathSqrt047
     * @tc.desc Verify sqrt cross-type consistency: sqrt(short -30) and sqrt(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4800
     * @tc.name testMathSqrt048
     * @tc.desc Verify sqrt cross-type consistency: sqrt(short 0) and sqrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_4900
     * @tc.name testMathSqrt049
     * @tc.desc Verify sqrt cross-type consistency: sqrt(long 0) and sqrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5000
     * @tc.name testMathSqrt050
     * @tc.desc Verify sqrt returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathSqrt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.sqrt(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5100
     * @tc.name testMathSqrt051
     * @tc.desc Verify sqrt cross-type consistency: sqrt(byte 1) and sqrt(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5200
     * @tc.name testMathSqrt052
     * @tc.desc Verify sqrt: sqrt on [0, 100] monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.sqrt(1.0)
      let b: double = Math.sqrt(25.0)
      let c: double = Math.sqrt(100.0)
      expect(a <= b).assertTrue()
      expect(b <= c).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5300
     * @tc.name testMathSqrt053
     * @tc.desc Verify sqrt(4.0, 9.0) with extra arguments returns sqrt(4.0)=2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (Math.sqrt as Object as (x: number, y: number) => number)(4.0, 9.0)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5400
     * @tc.name testMathSqrt054
     * @tc.desc Verify sqrt cross-type consistency: sqrt(0) = 0 cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let result1: double = Math.sqrt(val1)
      expect(result1).assertEqual(0.0)
      let val2: double = 0.0
      let result2: double = Math.sqrt(val2)
      expect(result2).assertEqual(0.0)
      let val3: float = 0.0f
      let result3: double = Math.sqrt(val3)
      expect(result3).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5500
     * @tc.name testMathSqrt055
     * @tc.desc Verify sqrt throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.sqrt(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5600
     * @tc.name testMathSqrt056
     * @tc.desc Verify sqrt: sqrt(a/b) = sqrt(a)/sqrt(b) holds for non-negative numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 16.0
      let b: double = 4.0
      expect(Math.sqrt(a / b)).assertClose(Math.sqrt(a) / Math.sqrt(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5700
     * @tc.name testMathSqrt057
     * @tc.desc Verify sqrt with negative value -1 returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = -1
      let r: double = Math.sqrt(x)
      expect(isNaN(r)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5800
     * @tc.name testMathSqrt058
     * @tc.desc Verify sqrt cross-type consistency: sqrt(long 0) and sqrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_5900
     * @tc.name testMathSqrt059
     * @tc.desc Verify sqrt throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
        Math.sqrt(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6000
     * @tc.name testMathSqrt060
     * @tc.desc Verify sqrt cross-type consistency: sqrt(byte 0) and sqrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.sqrt(val1)
      let result2: double = Math.sqrt(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6100
     * @tc.name testMathSqrt061
     * @tc.desc Verify Math.sqrt() with expression 100 / 4, expected result near 5.0 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 100.0 / 4.0;
      const result: number = Math.sqrt(val);
      const expectVal: number = 5.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6200
     * @tc.name testMathSqrt062
     * @tc.desc Verify sqrt: sqrt(pow(x,2)) = |x| combination pow+sqrt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 4.0
      expect(Math.sqrt(Math.pow(x, 2.0))).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6300
     * @tc.name testMathSqrt063
     * @tc.desc Verify sqrt throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.sqrt(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6400
     * @tc.name testMathSqrt064
     * @tc.desc Verify sqrt(hypot(3,4)) equals sqrt(5) ~= 2.236
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathSqrt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h: double = Math.hypot(3.0, 4.0)
      expect(h).assertEqual(5.0)
      let result: double = Math.sqrt(h)
      expect(result).assertClose(2.23606797749979, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6500
     * @tc.name testMathSqrt065
     * @tc.desc Verify sqrt: sqrt(a * b) = sqrt(a) * sqrt(b) for pairs of non-negative values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs: double[][] = [[4.0,9.0],[16.0,25.0],[36.0,49.0]]
      for (let i: int = 0; i < pairs.length; i++) {
        let a: double = pairs[i][0]
        let b: double = pairs[i][1]
        expect(Math.sqrt(a * b)).assertClose(Math.sqrt(a) * Math.sqrt(b), 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6600
     * @tc.name testMathSqrt066
     * @tc.desc Verify sqrt with negative values [-1,-4,-9,-16,-100] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negs: int[] = [-1, -4, -9, -16, -100]
      for (let i: int = 0; i < negs.length; i++) {
        let r: double = Math.sqrt(negs[i])
        expect(isNaN(r)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6700
     * @tc.name testMathSqrt067
     * @tc.desc Verify Math.sqrt() with expression 9 + 16, expected result near 5.0 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 9.0 + 16.0;
      const result: number = Math.sqrt(val);
      const expectVal: number = 5.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6800
     * @tc.name testMathSqrt068
     * @tc.desc Verify sqrt: sqrt(cbrt(64)) = sqrt(4) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: double = Math.cbrt(64.0)
      let val: double = c
      let result: double = Math.sqrt(val)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_6900
     * @tc.name testMathSqrt069
     * @tc.desc Verify sqrt throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
        Math.sqrt(matrix as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SQRT_7000
     * @tc.name testMathSqrt070
     * @tc.desc Verify sqrt({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSqrt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = Math.sqrt({} as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}
