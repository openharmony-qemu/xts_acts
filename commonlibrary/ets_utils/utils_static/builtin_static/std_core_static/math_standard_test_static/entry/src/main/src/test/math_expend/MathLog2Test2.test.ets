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

export default function mathLog2Test2(): void {
  describe('MathLog2Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0100
     * @tc.name testMathLog2001
     * @tc.desc Verify log2 throws ClassCastError with Cyrillic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'АБВГД'
        Math.log2(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0200
     * @tc.name testMathLog2002
     * @tc.desc Verify log2: log2(1.0e-5) approximately -16.609
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.log2(1.0e-5)
      let isClose: boolean = Math.abs(r + 16.60964047443681) < 0.001
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0300
     * @tc.name testMathLog2003
     * @tc.desc Verify log2 throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.log2(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0400
     * @tc.name testMathLog2004
     * @tc.desc Verify log2 throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.log2(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0500
     * @tc.name testMathLog2005
     * @tc.desc Verify log2: log2(1) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 1.0
        let result: double = Math.log2(val as object as double)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0600
     * @tc.name testMathLog2006
     * @tc.desc Verify log2 throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.log2(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0700
     * @tc.name testMathLog2007
     * @tc.desc Verify log2: log2(a*b) = log2(a) + log2(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 2.0
      let b: double = 4.0
      expect(Math.log2(a * b)).assertClose(Math.log2(a) + Math.log2(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0800
     * @tc.name testMathLog2008
     * @tc.desc Verify log2 throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.log2(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0900
     * @tc.name testMathLog2009
     * @tc.desc Verify log2 throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.log2(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1000
     * @tc.name testMathLog2010
     * @tc.desc Verify log2: log2(short 1) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.log2(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1100
     * @tc.name testMathLog2011
     * @tc.desc Verify log2: log2(finite positive numbers) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ps: double[] = [0.01, 0.1, 1.0, 10.0, 100.0, 10000.0]
      let exp: double[] = [-6.643856189774724, -3.321928094887362, 0.0, 3.321928094887362, 6.643856189774724, 13.287712379549449]
      for (let i: int = 0; i < ps.length; i++) {
        let result: double = Math.log2(ps[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1200
     * @tc.name testMathLog2012
     * @tc.desc Verify log2 throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.log2(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1300
     * @tc.name testMathLog2013
     * @tc.desc Verify log2 cross-type consistency: log2(byte 1) and log2(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1400
     * @tc.name testMathLog2014
     * @tc.desc Verify log2: log2(int -1) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.log2(val)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1500
     * @tc.name testMathLog2015
     * @tc.desc Verify log2 cross-type consistency: log2(byte 1) and log2(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1600
     * @tc.name testMathLog2016
     * @tc.desc Verify log2: log2(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 16
      let f: double = Math.log2(n)
      let s: double = Math.log2(n)
      let t: double = Math.log2(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1700
     * @tc.name testMathLog2017
     * @tc.desc Verify log2: log2(a^k) = k*log2(a)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 2.0
      let k: double = 3.0
      expect(Math.log2(Math.pow(a, k))).assertClose(k * Math.log2(a), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1800
     * @tc.name testMathLog2018
     * @tc.desc Verify log2: log2(long 16) and log2(int 16) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aLong: long = 16
      let lR: double = Math.log2(aLong)
      let aInt: int = 16
      let iR: double = Math.log2(aInt)
      expect(lR).assertClose(iR, 1e-6)
      expect(lR).assertClose(4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1900
     * @tc.name testMathLog2019
     * @tc.desc Verify log2: log2(2^x) = x holds for integer powers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.log2(Math.pow(2.0, 1.0))).assertClose(1.0, 1e-6)
      expect(Math.log2(Math.pow(2.0, 2.0))).assertClose(2.0, 1e-6)
      expect(Math.log2(Math.pow(2.0, 3.0))).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2000
     * @tc.name testMathLog2020
     * @tc.desc Verify log2: log2(short 8) and log2(int 8) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sR: double = Math.log2(8 as short)
      let iR: double = Math.log2(8)
      expect(sR).assertClose(iR, 1e-6)
      expect(sR).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2100
     * @tc.name testMathLog2021
     * @tc.desc Verify log2 cross-type consistency: log2(int 0) and log2(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2200
     * @tc.name testMathLog2022
     * @tc.desc Verify Math.log2 with expression 2.0 * 4.0, expected result 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.log2(2.0 * 4.0);
      expect(Math.abs(lhs - 3.0)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2300
     * @tc.name testMathLog2023
     * @tc.desc Verify log2 throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.log2(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2400
     * @tc.name testMathLog2024
     * @tc.desc Verify Math.log2("<script>alert(1)</script>") throws exception for XSS string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.log2('<script>alert(1)</script>' as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2500
     * @tc.name testMathLog2025
     * @tc.desc Verify log2: log2(a/b) = log2(a) - log2(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 8.0
      let b: double = 2.0
      expect(Math.log2(a / b)).assertClose(Math.log2(a) - Math.log2(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2600
     * @tc.name testMathLog2026
     * @tc.desc Verify Math constant property: log2(Math.E) == Math.LOG2E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let computed: double = Math.log2(Math.E)
      let isEqual: boolean = computed === Math.LOG2E
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2700
     * @tc.name testMathLog2027
     * @tc.desc Verify log2: log2(1.0e5) approximately 16.609
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.log2(1.0e5)
      let isClose: boolean = Math.abs(r - 16.60964047443681) < 0.001
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2800
     * @tc.name testMathLog2028
     * @tc.desc Verify log2: log2(2^n) equals n for n in [-3, 3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let n:int = -3;n <= 3;n++) {
      let p: double = Math.pow(2.0, n)
      let val: double = p
      let result: double = Math.log2(val as object as double)
      expect(result).assertEqual(n)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2900
     * @tc.name testMathLog2029
     * @tc.desc Verify log2: log2(byte 2) and log2(int 2) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aByte: byte = 2
      let bR: double = Math.log2(aByte)
      let aInt: int = 2
      let iR: double = Math.log2(aInt)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3000
     * @tc.name testMathLog2030
     * @tc.desc Verify log2 cross-type consistency: log2(byte 0) and log2(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3100
     * @tc.name testMathLog2031
     * @tc.desc Verify log2: log2(float 2) = 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.log2(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3200
     * @tc.name testMathLog2032
     * @tc.desc Verify log2: log2(x) on (0,1) is negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.log2(0.5) < 0.0).assertTrue()
      expect(Math.log2(0.25) < 0.0).assertTrue()
      expect(Math.log2(0.125) < 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3300
     * @tc.name testMathLog2033
     * @tc.desc Verify log2: log2(long 10) = 3.321928094887362
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.log2(val)
      expect(result).assertClose(3.321928094887362, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3400
     * @tc.name testMathLog2034
     * @tc.desc Verify log2: log2(exp(1)) = log2(E) approximately 1.4427
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.log2(Math.E)
      expect(r).assertClose(1.4426950408889634, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3500
     * @tc.name testMathLog2035
     * @tc.desc Verify log2: log2 monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.log2(1.0) < Math.log2(2.0)).assertTrue()
      expect(Math.log2(2.0) < Math.log2(4.0)).assertTrue()
      expect(Math.log2(4.0) < Math.log2(8.0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3600
     * @tc.name testMathLog2036
     * @tc.desc Verify log2: log2(min(4,8)) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.min(4.0, 8.0)
      expect(Math.log2(m)).assertClose(2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3700
     * @tc.name testMathLog2037
     * @tc.desc Verify Math.log2 with expression 16.0 / 2.0, expected result 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.log2(16.0 / 2.0);
      expect(Math.abs(lhs - 3.0)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3800
     * @tc.name testMathLog2038
     * @tc.desc Verify log2: log2(byte 127) returns a finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 127
      let r: double = Math.log2(x)
      expect(r).assertClose(6.988684686772166, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3900
     * @tc.name testMathLog2039
     * @tc.desc Verify log2 throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.log2(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4000
     * @tc.name testMathLog2040
     * @tc.desc Verify log2 throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.log2(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4100
     * @tc.name testMathLog2041
     * @tc.desc Verify log2 throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.log2(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4200
     * @tc.name testMathLog2042
     * @tc.desc Verify log2: log2(max(1,8)) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(1.0, 8.0)
      expect(Math.log2(m)).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4300
     * @tc.name testMathLog2043
     * @tc.desc Verify log2: log2(short 32767) returns a finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 32767
      let r: double = Math.log2(x)
      expect(r).assertClose(14.999955928241045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4400
     * @tc.name testMathLog2044
     * @tc.desc Verify log2: log2(hex literal 0x10) returns 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: int = 0x10
      expect(Math.log2(hex)).assertClose(4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4500
     * @tc.name testMathLog2045
     * @tc.desc Verify log2 throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.log2(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4600
     * @tc.name testMathLog2046
     * @tc.desc Verify log2 cross-type consistency: log2(short -30) and log2(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4700
     * @tc.name testMathLog2047
     * @tc.desc Verify log2: log2(int 1) and log2(double 1.0) return equal results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: double = 1.0
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4800
     * @tc.name testMathLog2048
     * @tc.desc Verify log2: log2(1) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.log2(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4900
     * @tc.name testMathLog2049
     * @tc.desc Verify log2 cross-type consistency: log2(float 0.0f) and log2(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5000
     * @tc.name testMathLog2050
     * @tc.desc Verify log2 cross-type consistency: log2(byte 0) and log2(float 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5100
     * @tc.name testMathLog2051
     * @tc.desc Verify log2: log2(int 2147483647) returns a finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647
      let r: double = Math.log2(x)
      expect(r).assertClose(31.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5200
     * @tc.name testMathLog2052
     * @tc.desc Verify log2 cross-type consistency: log2(int 100) and log2(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertClose(6.643856189774724, 1e-6)
      expect(result2).assertClose(6.643856189774724, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5300
     * @tc.name testMathLog2053
     * @tc.desc Verify Math.log2 with expression 4.0 + 4.0, expected result 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lhs: double = Math.log2(4.0 + 4.0);
      expect(Math.abs(lhs - 3.0)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5400
     * @tc.name testMathLog2054
     * @tc.desc Verify log2 with non-positive values [-1,-2,-5,-10] returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ns: int[] = [-1, -2, -5, -10]
      for (let i: int = 0; i < ns.length; i++) {
        let r: double = Math.log2(ns[i])
        expect(isNaN(r)).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5500
     * @tc.name testMathLog2055
     * @tc.desc Verify log2 cross-type consistency: log2(int -1) and log2(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(isNaN(result1)).assertTrue()
      expect(isNaN(result2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5600
     * @tc.name testMathLog2056
     * @tc.desc Verify log2 cross-type consistency: log2(long 0) and log2(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertEqual(Number.NEGATIVE_INFINITY)
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5700
     * @tc.name testMathLog2057
     * @tc.desc Verify log2 throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.log2(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5800
     * @tc.name testMathLog2058
     * @tc.desc Verify log2 cross-type consistency: log2(short 15) and log2(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertClose(3.9068905958080475, 1e-6)
      expect(result2).assertClose(3.9068905958080475, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5900
     * @tc.name testMathLog2059
     * @tc.desc Verify log2 throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.log2(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6000
     * @tc.name testMathLog2060
     * @tc.desc Verify log2 returns Number.NEGATIVE_INFINITY with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathLog2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.log2(val)
      expect(result).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6100
     * @tc.name testMathLog2061
     * @tc.desc Verify log2 throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.log2(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6200
     * @tc.name testMathLog2062
     * @tc.desc Verify log2: log2(binary literal 0b1000) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bin: int = 0b1000
      expect(Math.log2(bin)).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6300
     * @tc.name testMathLog2063
     * @tc.desc Verify log2 cross-type consistency: log2(int 1) and log2(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.log2(val1)
      let result2: double = Math.log2(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6400
     * @tc.name testMathLog2064
     * @tc.desc Verify log2: log2(double 3) = 1.584962500721156
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.log2(val)
      expect(result).assertClose(1.584962500721156, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6500
     * @tc.name testMathLog2065
     * @tc.desc Verify log2 throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.log2(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}


