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

export default function mathTruncTest2(): void {
  describe('MathTruncTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0100
     * @tc.name testMathTrunc001
     * @tc.desc Verify trunc throws ClassCastError with CJK string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.trunc(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0200
     * @tc.name testMathTrunc002
     * @tc.desc Verify trunc cross-type consistency: trunc(byte 1) and trunc(double 1.0) cross-type consistency, expect trunc(1)=1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0300
     * @tc.name testMathTrunc003
     * @tc.desc Verify trunc: trunc rounds toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-3.7, -1.2, -0.5, 0.3, 1.7, 2.5, 4.0]
      for (let i: int = 0; i < vs.length; i++) {
        let r: double = Math.trunc(vs[i])
        if (vs[i] >= 0) { expect(r >= 0).assertTrue()
        }    if (vs[i] <= 0) { expect(r <= 0).assertTrue()
        }  }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0400
     * @tc.name testMathTrunc004
     * @tc.desc Verify trunc batch property: trunc(int 0) equals trunc(double 0.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let val1: int = 0
    let val2: double = 0.0
    let result1: double = Math.trunc(val1)
    let result2: double = Math.trunc(val2)
    let isEqual: boolean = result1 === result2
    expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0500
     * @tc.name testMathTrunc005
     * @tc.desc Verify trunc throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.trunc(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0600
     * @tc.name testMathTrunc006
     * @tc.desc Verify trunc(1.2) and floor(1.2) both equal 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathTrunc006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 1.2
      let truncResult: double = Math.trunc(val)
      let floorResult: double = Math.floor(val)
      expect(truncResult).assertEqual(1.0)
      expect(floorResult).assertEqual(1.0)
      expect(truncResult).assertEqual(floorResult)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0700
     * @tc.name testMathTrunc007
     * @tc.desc Verify trunc returns 10 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.trunc(val)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0800
     * @tc.name testMathTrunc008
     * @tc.desc Verify trunc cross-type consistency: trunc(byte 0) and trunc(float 0.0f) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_0900
     * @tc.name testMathTrunc009
     * @tc.desc Verify trunc cross-type consistency: trunc(short 0) and trunc(float 0.0f) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1000
     * @tc.name testMathTrunc010
     * @tc.desc Verify trunc cross-type consistency: trunc(int 100) and trunc(long 100) cross-type consistency, expect trunc(100)=100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(100.0, 1e-6)
      expect(result2).assertClose(100.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1100
     * @tc.name testMathTrunc011
     * @tc.desc Verify trunc returns 1 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.trunc(val)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1200
     * @tc.name testMathTrunc012
     * @tc.desc Verify trunc cross-type consistency: trunc(byte 1) and trunc(int 1) cross-type consistency, expect trunc(1)=1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1300
     * @tc.name testMathTrunc013
     * @tc.desc Verify trunc cross-type consistency: trunc(short -30) and trunc(long -30) cross-type consistency, expect trunc(-30)=-30.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(-30.0, 1e-6)
      expect(result2).assertClose(-30.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1400
     * @tc.name testMathTrunc014
     * @tc.desc Verify trunc returns 2 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.trunc(val)
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1500
     * @tc.name testMathTrunc015
     * @tc.desc Verify trunc throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.trunc(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1600
     * @tc.name testMathTrunc016
     * @tc.desc Verify trunc cross-type consistency: trunc(int -1) and trunc(long -1) cross-type consistency, expect trunc(-1)=-1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(-1.0, 1e-6)
      expect(result2).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1700
     * @tc.name testMathTrunc017
     * @tc.desc Verify trunc returns -1 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.trunc(val)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1800
     * @tc.name testMathTrunc018
     * @tc.desc Verify trunc throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.trunc(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_1900
     * @tc.name testMathTrunc019
     * @tc.desc Verify trunc throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.trunc(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2000
     * @tc.name testMathTrunc020
     * @tc.desc Verify trunc throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.trunc(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2100
     * @tc.name testMathTrunc021
     * @tc.desc Verify trunc throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.trunc(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2200
     * @tc.name testMathTrunc022
     * @tc.desc Verify trunc vs ceil for positive: trunc(3.7) differs from Math.ceil(3.7)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truncResult: number = Math.trunc(3.7)
      let ceilResult: number = Math.ceil(3.7)
      expect(truncResult !== ceilResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2300
     * @tc.name testMathTrunc023
     * @tc.desc Verify trunc: trunc(floor(2.7)) = trunc(2.0) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: double = Math.floor(2.7)
      expect(Math.trunc(f)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2400
     * @tc.name testMathTrunc024
     * @tc.desc Verify trunc throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.trunc(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2500
     * @tc.name testMathTrunc025
     * @tc.desc Verify Math.trunc with byte value 1 returns double 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.trunc(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2600
     * @tc.name testMathTrunc026
     * @tc.desc Verify trunc throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.trunc(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2700
     * @tc.name testMathTrunc027
     * @tc.desc Verify trunc cross-type consistency: trunc(byte 0) and trunc(short 0) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2800
     * @tc.name testMathTrunc028
     * @tc.desc Verify trunc throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.trunc(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_2900
     * @tc.name testMathTrunc029
     * @tc.desc Verify trunc returns itself with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let is: int[] = [0, 1, 2, 10, 100, -1, -10, -100]
    for (let i: int = 0; i < is.length; i++) {
    let val: int = is[i]
    let result: double = Math.trunc(val)
    expect(result).assertEqual(is[i])
    }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3000
     * @tc.name testMathTrunc030
     * @tc.desc Verify trunc: trunc(round(4.6)) = trunc(5.0) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.round(4.6)
      expect(Math.trunc(r)).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3100
     * @tc.name testMathTrunc031
     * @tc.desc Verify trunc(-0.0) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.trunc(-0.0)
      expect(1.0 / result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3200
     * @tc.name testMathTrunc032
     * @tc.desc Verify trunc returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathTrunc032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.trunc(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3300
     * @tc.name testMathTrunc033
     * @tc.desc Verify trunc cross-type consistency: trunc(float 0.0f) and trunc(double 0.0) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3400
     * @tc.name testMathTrunc034
     * @tc.desc Verify trunc: trunc(log(10)) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.trunc(Math.log(10.0))).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3500
     * @tc.name testMathTrunc035
     * @tc.desc Verify trunc: trunc(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: double = 3.7
      let f: double = Math.trunc(n)
      let s: double = Math.trunc(n)
      let t: double = Math.trunc(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3600
     * @tc.name testMathTrunc036
     * @tc.desc Verify trunc throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.trunc(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3700
     * @tc.name testMathTrunc037
     * @tc.desc Verify trunc throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.trunc(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3800
     * @tc.name testMathTrunc038
     * @tc.desc Verify trunc with radix literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: int = 0xA
      expect(Math.trunc(hex)).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_3900
     * @tc.name testMathTrunc039
     * @tc.desc Verify trunc: trunc(-PI) = -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -Math.PI
      let result: double = Math.trunc(val)
      expect(result).assertEqual(-3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4000
     * @tc.name testMathTrunc040
     * @tc.desc Verify trunc: trunc(ceil(2.3)) = trunc(3.0) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: double = Math.ceil(2.3)
      expect(Math.trunc(c)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4100
     * @tc.name testMathTrunc041
     * @tc.desc Verify trunc throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.trunc(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4200
     * @tc.name testMathTrunc042
     * @tc.desc Verify trunc: trunc(exp(1)) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.trunc(Math.exp(1.0))).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4300
     * @tc.name testMathTrunc043
     * @tc.desc Verify trunc: trunc(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fs: double[] = [-1.5, -0.5, 0.0, 0.5, 1.5, 10.3, 100.9]
      let exp: double[] = [-1, 0, 0, 0, 1, 10, 100]
      for (let i: int = 0; i < fs.length; i++) {
        let result: double = Math.trunc(fs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4400
     * @tc.name testMathTrunc044
     * @tc.desc Verify trunc cross-type consistency: trunc(int 1) and trunc(float 1.0f) cross-type consistency, expect trunc(1)=1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4500
     * @tc.name testMathTrunc045
     * @tc.desc Verify trunc({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Record<string, string> = {}
        Math.trunc(obj as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4600
     * @tc.name testMathTrunc046
     * @tc.desc Verify trunc throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.trunc(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4700
     * @tc.name testMathTrunc047
     * @tc.desc Verify trunc cross-type consistency: trunc(short 1) and trunc(double 1.0) cross-type consistency, expect trunc(1)=1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4800
     * @tc.name testMathTrunc048
     * @tc.desc Verify trunc returns 3 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.trunc(val)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_4900
     * @tc.name testMathTrunc049
     * @tc.desc Verify trunc vs ceil for negative: trunc(-3.7) equals Math.ceil(-3.7)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.trunc(-3.7)).assertClose(Math.ceil(-3.7), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5000
     * @tc.name testMathTrunc050
     * @tc.desc Verify trunc throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.trunc(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5100
     * @tc.name testMathTrunc051
     * @tc.desc Verify trunc: trunc(sqrt2) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.trunc(Math.sqrt(2.0))).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5200
     * @tc.name testMathTrunc052
     * @tc.desc Verify trunc cross-type consistency: trunc(int 0) and trunc(double 0.0) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5300
     * @tc.name testMathTrunc053
     * @tc.desc Verify trunc cross-type consistency: trunc(short 15) and trunc(int 15) cross-type consistency, expect trunc(15)=15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(15.0, 1e-6)
      expect(result2).assertClose(15.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5400
     * @tc.name testMathTrunc054
     * @tc.desc Verify trunc: trunc(abs(-4.2)) = 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-4.2)
      expect(Math.trunc(a)).assertEqual(4.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5500
     * @tc.name testMathTrunc055
     * @tc.desc Verify trunc cross-type consistency: trunc(long 0) and trunc(double 0.0) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5600
     * @tc.name testMathTrunc056
     * @tc.desc Verify trunc cross-type consistency: trunc(long 0) and trunc(float 0.0f) cross-type consistency, expect trunc(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.trunc(val1)
      let result2: double = Math.trunc(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5700
     * @tc.name testMathTrunc057
     * @tc.desc Verify Math.trunc() with expression 5.7 - 3.2, expected result near 2.0 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 5.7 - 3.2;
      const result: number = Math.trunc(val);
      const expectVal: number = 2.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5800
     * @tc.name testMathTrunc058
     * @tc.desc Verify trunc vs floor for negative: trunc(-3.7) differs from Math.floor(-3.7)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let truncResult: number = Math.trunc(-3.7)
      let floorResult: number = Math.floor(-3.7)
      expect(truncResult !== floorResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_5900
     * @tc.name testMathTrunc059
     * @tc.desc Verify trunc returns itself with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let is: double[] = [1.0, 5.0, 100.0, -5.0, -100.0]
      for (let i: int = 0; i < is.length; i++) {
        let val: double = is[i]
        let result: double = Math.trunc(val)
        expect(result).assertEqual(is[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_6000
     * @tc.name testMathTrunc060
     * @tc.desc Verify trunc throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.trunc(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_6100
     * @tc.name testMathTrunc061
     * @tc.desc Verify trunc returns -1.0 for negative double -1.2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -1.2
      let truncResult: double = Math.trunc(val)
      expect(truncResult).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_6200
     * @tc.name testMathTrunc062
     * @tc.desc Verify Math.trunc with byte value 0 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.trunc(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TRUNC_6300
     * @tc.name testMathTrunc063
     * @tc.desc Verify Math.trunc() with expression 1.2 + 2.3, expected result near 3.0 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTrunc063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 1.2 + 2.3;
      const result: number = Math.trunc(val);
      const expectVal: number = 3.0;
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

  });
}
