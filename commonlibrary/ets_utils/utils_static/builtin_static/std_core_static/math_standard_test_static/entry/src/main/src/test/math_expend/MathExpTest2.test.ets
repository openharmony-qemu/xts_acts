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

export default function mathExpTest2(): void {
  describe('MathExpTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0100
     * @tc.name testMathExp001
     * @tc.desc Verify exp cross-type consistency: exp(short 0) and exp(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0200
     * @tc.name testMathExp002
     * @tc.desc Verify exp throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.exp(null as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0300
     * @tc.name testMathExp003
     * @tc.desc Verify exp throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.exp(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0400
     * @tc.name testMathExp004
     * @tc.desc Verify Math.exp with expression ln(2) + ln(3), expected value 6.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Math.log(2.0) + Math.log(3.0);
      let result: double = Math.exp(val);
      expect(Math.abs(result - 6.0)).assertLess(1e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0500
     * @tc.name testMathExp005
     * @tc.desc Verify exp throws ClassCastError with string '\u200B' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '\u200B'
        Math.exp(str as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0600
     * @tc.name testMathExp006
     * @tc.desc Verify exp: exp(integer) and exp(floating-point) consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: double = 1.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(Math.abs(result1 - result2) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0700
     * @tc.name testMathExp007
     * @tc.desc Verify Math.exp consistency: exp(2 * 2) equals exp(4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = 2.0 * 2.0;
      let val2: double = 4.0;
      let result1: double = Math.exp(val1);
      let result2: double = Math.exp(val2);
      expect(Math.abs(result1 - result2)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0800
     * @tc.name testMathExp008
     * @tc.desc Verify exp throws ClassCastError with Color.RED as Object as double parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.exp(Color.RED as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0900
     * @tc.name testMathExp009
     * @tc.desc Verify exp: exp(-1.0e-5) small negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-5
      let r: double = Math.exp(x)
      let isClose: boolean = Math.abs(r - 0.9999900005) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1000
     * @tc.name testMathExp010
     * @tc.desc Verify Math.exp with 2.0 returns E^2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.exp(2.0)
      let exprResult: boolean = Math.abs(result - Math.E * Math.E) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1100
     * @tc.name testMathExp011
     * @tc.desc Verify exp: exp(log(x)) approximately equals x for x in [1.0, 100.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [1.0, 2.0, 5.0, 10.0, 100.0]
      for (let i: int = 0; i < vals.length; i++) {
        expect(Math.exp(Math.log(vals[i]))).assertClose(vals[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1200
     * @tc.name testMathExp012
     * @tc.desc Verify exp throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.exp(list as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1300
     * @tc.name testMathExp013
     * @tc.desc Verify exp overflow behavior: exp(int 100) and exp(long 100) both return Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1400
     * @tc.name testMathExp014
     * @tc.desc Verify exp: exp(cosh(0)) = exp(1) = E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.exp(Math.cosh(0.0))).assertClose(Math.E, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1500
     * @tc.name testMathExp015
     * @tc.desc Verify exp throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.exp(longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1600
     * @tc.name testMathExp016
     * @tc.desc Verify exp: exp(-x) approximately equals 1/exp(x) for values in [0.5, 3.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.5, 1.0, 2.0, 3.0]
      for (let i: int = 0; i < vals.length; i++) {
        let x: double = vals[i]
        expect(Math.exp(-x)).assertClose(1.0 / Math.exp(x), 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1700
     * @tc.name testMathExp017
     * @tc.desc Verify exp throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.exp(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1800
     * @tc.name testMathExp018
     * @tc.desc Verify exp: exp(-1.0) returns approximately 0.3678794
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = -1.0
      let result: number = Math.exp(v)
      let expected: number = 0.3678794
      expect(Math.abs(result - expected) < 0.0001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1900
     * @tc.name testMathExp019
     * @tc.desc Verify exp throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.exp(fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2000
     * @tc.name testMathExp020
     * @tc.desc Verify exp cross-type consistency: exp(long 0) and exp(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2100
     * @tc.name testMathExp021
     * @tc.desc Verify exp underflow behavior: exp(short -32768) returns close to 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = -32768
      let r: double = Math.exp(x)
      expect(r).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2200
     * @tc.name testMathExp022
     * @tc.desc Verify exp returns 1.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathExp022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.exp(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2300
     * @tc.name testMathExp023
     * @tc.desc Verify exp: exp(1.0e-5) precision for small values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-5
      let r: double = Math.exp(x)
      let isClose: boolean = Math.abs(r - 1.0000100005) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2400
     * @tc.name testMathExp024
     * @tc.desc Verify exp: exp(int 1) returns Math.E across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let result1: double = Math.exp(val1)
      expect(result1).assertClose(Math.E, 1e-6)
      let val2: int = 1
      let result2: double = Math.exp(val2)
      expect(result2).assertClose(Math.E, 1e-6)
      let val3: int = 1
      let result3: double = Math.exp(val3)
      expect(result3).assertClose(Math.E, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2500
     * @tc.name testMathExp025
     * @tc.desc Verify exp cross-type consistency: exp(byte 0) and exp(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2600
     * @tc.name testMathExp026
     * @tc.desc Verify exp throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.exp(set as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2700
     * @tc.name testMathExp027
     * @tc.desc Verify Math.exp consistency: exp(1 + 2) equals exp(3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = 1.0 + 2.0;
      let val2: double = 3.0;
      let result1: double = Math.exp(val1);
      let result2: double = Math.exp(val2);
      expect(Math.abs(result1 - result2)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2800
     * @tc.name testMathExp028
     * @tc.desc Verify exp: exp value is always positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals2: double[] = [-5.0, -1.0, 0.0, 1.0, 5.0, 10.0]
      for (let i: int = 0; i < vals2.length; i++) {
        expect(Math.exp(vals2[i]) > 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2900
     * @tc.name testMathExp029
     * @tc.desc Verify exp: exp(x) * exp(-x) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 2.0
      expect(Math.exp(x) * Math.exp(-x)).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3000
     * @tc.name testMathExp030
     * @tc.desc Verify exp throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.exp(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3100
     * @tc.name testMathExp031
     * @tc.desc Verify exp throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.exp(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3200
     * @tc.name testMathExp032
     * @tc.desc Verify exp cross-type consistency: exp(long 0) and exp(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3300
     * @tc.name testMathExp033
     * @tc.desc Verify exp: exp(0.5) returns approximately 1.6487212
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 0.5
      let result: number = Math.exp(v)
      let expected: number = 1.6487212
      expect(Math.abs(result - expected) < 0.0001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3400
     * @tc.name testMathExp034
     * @tc.desc Verify exp: exp(0.5) returns approximately 1.6487212707001282
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.exp(0.5)
      let expected: number = 1.6487212707001282
      expect(Math.abs(result - expected) < 0.0000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3500
     * @tc.name testMathExp035
     * @tc.desc Verify exp: exp(x) increasing property x<y ⇒ exp(x)<exp(y)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.exp(1.0) < Math.exp(2.0)).assertTrue()
      expect(Math.exp(2.0) < Math.exp(3.0)).assertTrue()
      expect(Math.exp(3.0) < Math.exp(5.0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3600
     * @tc.name testMathExp036
     * @tc.desc Verify exp(max(1,2)) equals exp(2) = e^2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathExp036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(1.0, 2.0)
      expect(m).assertEqual(2.0)
      let result: double = Math.exp(m)
      expect(result).assertClose(7.38905609893065, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3700
     * @tc.name testMathExp037
     * @tc.desc Verify exp returns 2.718281828459045 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.exp(val)
      expect(result).assertClose(2.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3800
     * @tc.name testMathExp038
     * @tc.desc Verify exp cross-type consistency: exp(int 0) and exp(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3900
     * @tc.name testMathExp039
     * @tc.desc Verify exp cross-type consistency: exp(int -1) and exp(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(0.36787944117144233, 1e-6)
      expect(result2).assertClose(0.36787944117144233, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4000
     * @tc.name testMathExp040
     * @tc.desc Verify exp throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.exp(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4100
     * @tc.name testMathExp041
     * @tc.desc Verify exp: exp(a+b) = exp(a)*exp(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 1.0
      let b: double = 2.0
      expect(Math.exp(a + b)).assertClose(Math.exp(a) * Math.exp(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4200
     * @tc.name testMathExp042
     * @tc.desc Verify exp: exp(byte 0) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.exp(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4300
     * @tc.name testMathExp043
     * @tc.desc Verify exp: exp(log(x)) = x for x>0 holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.0
      expect(Math.exp(Math.log(x))).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4400
     * @tc.name testMathExp044
     * @tc.desc Verify Math.exp double overload with 2.0 returns Math.E squared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.exp(2.0)
      let expected: double = Math.E * Math.E
      let exprResult: boolean = Math.abs(result - expected) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4500
     * @tc.name testMathExp045
     * @tc.desc Verify exp: exp(-1.0e-10) approximately 1 - 1.0e-10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-10
      let r: double = Math.exp(x)
      let isClose: boolean = Math.abs(r - 1.0 + 1.0e-10) < 1e-9
      expect(isClose).assertTrue()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4600
     * @tc.name testMathExp046
     * @tc.desc Verify exp: exp(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 3
      let f: double = Math.exp(n)
      let s: double = Math.exp(n)
      let t: double = Math.exp(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(20.085536923187668, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4700
     * @tc.name testMathExp047
     * @tc.desc Verify exp cross-type consistency: exp(float 0.0f) and exp(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4800
     * @tc.name testMathExp048
     * @tc.desc Verify exp throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.exp(u as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4900
     * @tc.name testMathExp049
     * @tc.desc Verify exp throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.exp(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5000
     * @tc.name testMathExp050
     * @tc.desc Verify exp throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.exp(map as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5100
     * @tc.name testMathExp051
     * @tc.desc Verify exp cross-type consistency: exp(byte 1) and exp(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(2.718281828459045, 1e-6)
      expect(result2).assertClose(2.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5200
     * @tc.name testMathExp052
     * @tc.desc Verify Math.exp with 1 required parameter returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.exp(1.0)
      let exprResult: boolean = Math.abs(result - Math.E) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5300
     * @tc.name testMathExp053
     * @tc.desc Verify exp: exp(1.0e-10) approximately 1 + 1.0e-10 (small value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-10
      let r: double = Math.exp(x)
      let isClose: boolean = Math.abs(r - 1.0 - 1.0e-10) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5400
     * @tc.name testMathExp054
     * @tc.desc Verify exp: exp(a-b) = exp(a)/exp(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3.0
      let b: double = 1.0
      expect(Math.exp(a - b)).assertClose(Math.exp(a) / Math.exp(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5500
     * @tc.name testMathExp055
     * @tc.desc Verify exp: exp(x) > x for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs2: double[] = [-5.0, -1.0, 0.0, 1.0, 2.0, 5.0]
      for (let i: int = 0; i < xs2.length; i++) {
        expect(Math.exp(xs2[i]) > xs2[i]).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5600
     * @tc.name testMathExp056
     * @tc.desc Verify exp(int 0) and exp(double 0.0) both return 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathExp056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertEqual(result2)
      expect(result1).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5700
     * @tc.name testMathExp057
     * @tc.desc Verify exp: exp(1.0) returns Math.E across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 1.0
        let result: double = Math.exp(val as Object as double)
        expect(result).assertClose(Math.E, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5800
     * @tc.name testMathExp058
     * @tc.desc Verify exp: exp(0.0) returns 1.0 across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.exp(val as Object as double)
        expect(result).assertClose(1.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5900
     * @tc.name testMathExp059
     * @tc.desc Verify exp: exp(0.5*log(x)) = sqrt(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 4.0
      expect(Math.exp(0.5 * Math.log(x))).assertClose(Math.sqrt(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6000
     * @tc.name testMathExp060
     * @tc.desc Verify exp cross-type consistency: exp(byte 0) and exp(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6100
     * @tc.name testMathExp061
     * @tc.desc Verify exp throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.exp(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6200
     * @tc.name testMathExp062
     * @tc.desc Verify Math.exp double overload with 10.0 returns approximately 22026.4658
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.exp(10.0)
      let expected: double = 22026.465794806718
      let diff: double = Math.abs(result - expected)
      let exprResult: boolean = diff / expected < 1e-4
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6300
     * @tc.name testMathExp063
     * @tc.desc Verify Math.exp consistency: exp(6 / 2) equals exp(3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = 6.0 / 2.0;
      let val2: double = 3.0;
      let result1: double = Math.exp(val1);
      let result2: double = Math.exp(val2);
      expect(Math.abs(result1 - result2)).assertLess(1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6400
     * @tc.name testMathExp064
     * @tc.desc Verify exp: exp(-10.0) returns approximately 4.5399929762484854e-5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.exp(-10.0)
      let expected: number = 4.5399929762484854e-5
      expect(Math.abs(result - expected) < 0.00000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6500
     * @tc.name testMathExp065
     * @tc.desc Verify exp cross-type consistency: exp(short -30) and exp(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(9.357622968840175e-14, 1e-6)
      expect(result2).assertClose(9.357622968840175e-14, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6600
     * @tc.name testMathExp066
     * @tc.desc Verify exp cross-type consistency: exp(int 1) and exp(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(2.718281828459045, 1e-6)
      expect(result2).assertClose(2.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6700
     * @tc.name testMathExp067
     * @tc.desc Verify exp throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.exp(matrix as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6800
     * @tc.name testMathExp068
     * @tc.desc Verify exp: exp(Number.MIN_VALUE) returns approximately 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.exp(Number.MIN_VALUE)
      expect(Math.abs(result - 1.0) < 0.0000001).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6900
     * @tc.name testMathExp069
     * @tc.desc Verify exp cross-type consistency: exp(short 1) and exp(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(2.718281828459045, 1e-6)
      expect(result2).assertClose(2.718281828459045, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7000
     * @tc.name testMathExp070
     * @tc.desc Verify exp returns 20.085536923187668 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.exp(val)
      expect(result).assertClose(20.085536923187668, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7100
     * @tc.name testMathExp071
     * @tc.desc Verify Math.exp float overload with 1.0f returns Math.E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: float = 1.0f
      let result: float = Math.exp(value)
      let exprResult: boolean = Math.abs(result - Math.E) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7200
     * @tc.name testMathExp072
     * @tc.desc Verify exp: exp(sinh(1)) and exp(1.1752) approximately
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.sinh(1.0)
      expect(Math.exp(x)).assertClose(Math.exp(1.1752011936438014), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7300
     * @tc.name testMathExp073
     * @tc.desc Verify exp returns 22026.465794806718 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.exp(val)
      expect(result).assertClose(22026.465794806718, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7400
     * @tc.name testMathExp074
     * @tc.desc Verify exp: exp(0.5) and sqrt(E) equivalent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = 0.5
      let result1: double = Math.exp(val1)
      let expected: double = Math.sqrt(Math.E)
      expect(result1).assertClose(expected, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7500
     * @tc.name testMathExp075
     * @tc.desc Verify exp overflow behavior: float value 89.0f returns float positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 89.0f
      let r: float = Math.exp(x)
      expect(r).assertEqual(Float.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7600
     * @tc.name testMathExp076
     * @tc.desc Verify exp returns 7.38905609893065 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.exp(val)
      expect(result).assertClose(7.38905609893065, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7700
     * @tc.name testMathExp077
     * @tc.desc Verify exp: exp(x) > 0 for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0]
      for (let i: int = 0; i < xs.length; i++) {
        expect(Math.exp(xs[i]) > 0.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7800
     * @tc.name testMathExp078
     * @tc.desc Verify exp cross-type consistency: exp(short 15) and exp(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(3269017.3724721107, 1e-6)
      expect(result2).assertClose(3269017.3724721107, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7900
     * @tc.name testMathExp079
     * @tc.desc Verify exp returns 0.36787944117144233 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.exp(val)
      expect(result).assertClose(0.36787944117144233, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8000
     * @tc.name testMathExp080
     * @tc.desc Verify exp cross-type consistency: exp(byte 1) and exp(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.exp(val1)
      let result2: double = Math.exp(val2)
      expect(result1).assertClose(2.718281828459045, 1e-6)
      expect(result2).assertClose(2.718281828459045, 1e-6)
    });

  });
}
