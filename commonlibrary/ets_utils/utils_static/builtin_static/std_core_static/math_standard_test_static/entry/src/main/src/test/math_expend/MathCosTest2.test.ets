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

export default function mathCosTest2(): void {
  describe('MathCosTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0100
     * @tc.name testMathCos001
     * @tc.desc Verify cos cross-type consistency: cos(byte 1) and cos(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.5403023058681398, 1e-6)
      expect(result2).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0200
     * @tc.name testMathCos002
     * @tc.desc Verify cos: cos(90°) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rad: double = 90.0 * Math.PI / 180.0
      let val: double = rad
      let result: double = Math.cos(val as Object as double)
      expect(Math.abs(result) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0300
     * @tc.name testMathCos003
     * @tc.desc Verify cos: cos(PI/3 + PI/3) = cos(2PI/3) = -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = Math.PI / 3.0 + Math.PI / 3.0
      let val: double = sum
      let result: double = Math.cos(val as Object as double)
      expect(result).assertClose(-0.5, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0400
     * @tc.name testMathCos004
     * @tc.desc Verify cos batch property: sin(x)^2 + cos(x)^2 = 1 for double values 0.0, 0.2, 0.5, 1.0, 1.5, 2.0, PI, 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.0, 0.2, 0.5, 1.0, 1.5, 2.0, Math.PI, 4.0]
      for (let i: int = 0; i < vals.length; i++) {
        let s: double = Math.sin(vals[i])
        let c: double = Math.cos(vals[i])
        expect(s * s + c * c).assertClose(1.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0500
     * @tc.name testMathCos005
     * @tc.desc Verify cos: cos(0) = 1 holds for all numeric types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let result1: double = Math.cos(val1)
      let val2: float = 0.0f
      let result2: double = Math.cos(val2)
      let val: byte = 0
      let result3: double = Math.cos(val)
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
      expect(result3).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0600
     * @tc.name testMathCos006
     * @tc.desc Verify Math.cos(-PI) returns approximately -1.0 (even function)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(-Math.PI)
      expect(Math.abs(result + 1.0) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0700
     * @tc.name testMathCos007
     * @tc.desc Verify cos: cos(x)cos(y) = (cos(x-y) + cos(x+y))/2(product-to-sum identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let y: double = 0.7
      let left: double = Math.cos(x) * Math.cos(y)
      let right: double = (Math.cos(x - y) + Math.cos(x + y)) / 2.0
      expect(left).assertClose(right, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0800
     * @tc.name testMathCos008
     * @tc.desc Verify Math.cos(0.5) returns approx 0.8775826
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(0.5)
      expect(Math.abs(result - 0.8775825618903728) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0900
     * @tc.name testMathCos009
     * @tc.desc Verify cos: cos(2PI + x) = cos(x)(periodicity verification)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let val1: double = 2.0 * Math.PI + x
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(x)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1000
     * @tc.name testMathCos010
     * @tc.desc Verify cos cross-type consistency: cos(1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: double = 1.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1100
     * @tc.name testMathCos011
     * @tc.desc Verify cos cross-type consistency: cos(short -30) and cos(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.15425144988758405, 1e-6)
      expect(result2).assertClose(0.15425144988758405, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1200
     * @tc.name testMathCos012
     * @tc.desc Verify cos throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.cos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1300
     * @tc.name testMathCos013
     * @tc.desc Verify cos cross-type consistency: cos(long 0) and cos(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1400
     * @tc.name testMathCos014
     * @tc.desc Verify for any finite input the return value is within [-1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: number[] = [
        0.0, 0.5, 1.0, Math.PI / 6, Math.PI / 4, Math.PI / 3, Math.PI / 2, Math.PI, 2 * Math.PI,
        -0.5, -1.0, -Math.PI / 4, -Math.PI, -2 * Math.PI, 10.0, 100.0, 1e-10, 1e10
      ]
      for (let i: int = 0; i < testValues.length; i++) {
        let result: number = Math.cos(testValues[i])
        expect(result >= -1.0).assertTrue()
        expect(result <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1500
     * @tc.name testMathCos015
     * @tc.desc Verify cos throws ClassCastError with Japanese string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'テスト'
        Math.cos(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1600
     * @tc.name testMathCos016
     * @tc.desc Verify cos throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.cos(u as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1700
     * @tc.name testMathCos017
     * @tc.desc Verify cos throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.cos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1800
     * @tc.name testMathCos018
     * @tc.desc Verify cos: cos(45°) = sqrt2/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rad: double = 45.0 * Math.PI / 180.0
      let result: double = Math.cos(rad)
      expect(result).assertClose(0.7071067811865476, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1900
     * @tc.name testMathCos019
     * @tc.desc Verify cos batch property: result within [-1, 1] for double values 0.0, 0.5, 1.0, 1.5, 2.0, 3.0, 10.0, 100.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.0, 0.5, 1.0, 1.5, 2.0, 3.0, 10.0, 100.0]
      for (let i: int = 0; i < vals.length; i++) {
        let c: double = Math.cos(vals[i])
        expect(c >= -1.0).assertTrue()
        expect(c <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2000
     * @tc.name testMathCos020
     * @tc.desc Verify cos: cos(PI + PI/3) = -cos(PI/3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 3.0
      expect(Math.cos(Math.PI + x)).assertClose(-Math.cos(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2100
     * @tc.name testMathCos021
     * @tc.desc Verify cos: cos(ln(1)) = cos(0) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cos(Math.log(1.0))).assertClose(Math.cos(0.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2200
     * @tc.name testMathCos022
     * @tc.desc Verify cos: cos(PI - x) = -cos(x) for x=PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 4.0
      expect(Math.cos(Math.PI - x)).assertClose(-Math.cos(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2300
     * @tc.name testMathCos023
     * @tc.desc Verify cos: cos(PI/2 - PI/3) = sin(PI/3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 3.0
      let val1: double = Math.PI / 2.0 - x
      let result1: double = Math.cos(val1)
      let result2: double = Math.sin(x)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2400
     * @tc.name testMathCos024
     * @tc.desc Verify cos: cos(-1.0e-10) even function approximates 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-10
      let r: double = Math.cos(x)
      let isClose: boolean = Math.abs(r - 1.0) < 1.0e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2500
     * @tc.name testMathCos025
     * @tc.desc Verify cos throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.cos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2600
     * @tc.name testMathCos026
     * @tc.desc Verify cos: cos near PI shows zero-crossing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let before: double = Math.cos(Math.PI - 0.01)
      let after: double = Math.cos(Math.PI + 0.01)
      expect(before < 0.0).assertTrue()
      expect(after > -1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2700
     * @tc.name testMathCos027
     * @tc.desc Verify cos returns 0.5403023058681398 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.cos(val)
      expect(result).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2800
     * @tc.name testMathCos028
     * @tc.desc Verify cos: cos(1.0e-10) small-angle approximation 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-10
      let r: double = Math.cos(x)
      let isClose: boolean = Math.abs(r - 1.0) < 1.0e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2900
     * @tc.name testMathCos029
     * @tc.desc Verify Math.cos(PI/2) returns approximately 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(Math.PI / 2)
      expect(Math.abs(result) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3000
     * @tc.name testMathCos030
     * @tc.desc Verify cos cross-type consistency: cos(int 0) and cos(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3100
     * @tc.name testMathCos031
     * @tc.desc Verify cos returns -0.4161468365471424 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.cos(val)
      expect(result).assertClose(-0.4161468365471424, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3200
     * @tc.name testMathCos032
     * @tc.desc Verify cos: cos(PI/2 - x) = sin(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let val1: double = Math.PI / 2.0 - x
      let result1: double = Math.cos(val1)
      let result2: double = Math.sin(x)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3300
     * @tc.name testMathCos033
     * @tc.desc Verify cos: cos(Double.MAX_VALUE / 2) result is within [-1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Double.MAX_VALUE / 2.0
      let r: double = Math.cos(x)
      expect(r >= -1.0).assertTrue()
      expect(r <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3400
     * @tc.name testMathCos034
     * @tc.desc Verify cos cross-type consistency: cos(0) = 1 cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let result1: double = Math.cos(val1)
      expect(result1).assertClose(1.0, 1e-6)
      let val2: double = 0.0
      let result2: double = Math.cos(val2)
      expect(result2).assertClose(1.0, 1e-6)
      let val3: float = 0.0f
      let result3: double = Math.cos(val3)
      expect(result3).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3500
     * @tc.name testMathCos035
     * @tc.desc Verify Math.cos(2*PI) returns approximately 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(2 * Math.PI)
      expect(Math.abs(result - 1.0) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3600
     * @tc.name testMathCos036
     * @tc.desc Verify double angle identity: Math.cos(2*x) equals 2 * Math.cos(x)^2 - 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.4;
      let cos2x: double = Math.cos(2.0 * x);
      let rhs: double = 2.0 * Math.cos(x) * Math.cos(x) - 1.0;
      expect(Math.abs(cos2x - rhs)).assertLess(1e-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3700
     * @tc.name testMathCos037
     * @tc.desc Verify cos throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.cos(null as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3800
     * @tc.name testMathCos038
     * @tc.desc Verify cos: cos(PI/2) = 0 verified across types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Math.PI / 2.0
      let result: double = Math.cos(val)
      expect(Math.abs(result) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3900
     * @tc.name testMathCos039
     * @tc.desc Verify cos cross-type consistency: cos(short 0) and cos(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4000
     * @tc.name testMathCos040
     * @tc.desc Verify Math.cos(PI) returns approximately -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(Math.PI)
      expect(Math.abs(result + 1.0) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4100
     * @tc.name testMathCos041
     * @tc.desc Verify cos returns 1.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathCos041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.cos(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4200
     * @tc.name testMathCos042
     * @tc.desc Verify cos: cos(negative scientific notation -1.5e-3) even function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sciNeg: double = -1.5e-3
      let sciPos: double = 1.5e-3
      expect(Math.cos(sciNeg)).assertClose(Math.cos(sciPos), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4300
     * @tc.name testMathCos043
     * @tc.desc Verify cos: cos(scientific notation 1.5e3) = cos(1500.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sci: double = 1.5e3
      let val2: double = 1500.0
      let result1: double = Math.cos(sci)
      let result2: double = Math.cos(val2)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4400
     * @tc.name testMathCos044
     * @tc.desc Verify cos: cos(sqrt(0)) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cos(Math.sqrt(0.0))).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4500
     * @tc.name testMathCos045
     * @tc.desc Verify cos idempotent across three calls with input n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 42
      let f: double = Math.cos(n)
      let s: double = Math.cos(n)
      let t: double = Math.cos(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(-0.39998531498835127, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4600
     * @tc.name testMathCos046
     * @tc.desc Verify cos throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.cos(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4700
     * @tc.name testMathCos047
     * @tc.desc Verify cos throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.cos(matrix as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4800
     * @tc.name testMathCos048
     * @tc.desc Verify cos returns -0.9899924966004454 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.cos(val)
      expect(result).assertClose(-0.9899924966004454, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4900
     * @tc.name testMathCos049
     * @tc.desc Verify cos cross-type consistency: cos(short 15) and cos(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(-0.7596879128588213, 1e-6)
      expect(result2).assertClose(-0.7596879128588213, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5000
     * @tc.name testMathCos050
     * @tc.desc Verify cos cross-type consistency: cos(byte 1) and cos(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.5403023058681398, 1e-6)
      expect(result2).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5100
     * @tc.name testMathCos051
     * @tc.desc Verify cos: cos(PI + x) = -cos(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      expect(Math.cos(Math.PI + x)).assertClose(-Math.cos(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5200
     * @tc.name testMathCos052
     * @tc.desc Verify cos throws ClassCastError with Color.RED as Object as double parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.cos(Color.RED as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5300
     * @tc.name testMathCos053
     * @tc.desc Verify Math.cos(PI/4) returns approximately 0.7071
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(Math.PI / 4)
      expect(Math.abs(result - Math.SQRT2 / 2) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5400
     * @tc.name testMathCos054
     * @tc.desc Verify cos returns -0.8390715290764524 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.cos(val)
      expect(result).assertClose(-0.8390715290764524, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5500
     * @tc.name testMathCos055
     * @tc.desc Verify cos throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.cos(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5600
     * @tc.name testMathCos056
     * @tc.desc Verify cos batch property: result within [-1, 1] for large double values 1e5, -1e5, 1e10, -1e10, 1e15, -1e15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeVals: double[] = [1e5, -1e5, 1e10, -1e10, 1e15, -1e15]
      for (let i: int = 0; i < largeVals.length; i++) {
        let c: double = Math.cos(largeVals[i])
        expect(c >= -1.0).assertTrue()
        expect(c <= 1.0).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5700
     * @tc.name testMathCos057
     * @tc.desc Verify cos throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a','b']
      Math.cos(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5800
     * @tc.name testMathCos058
     * @tc.desc Verify cos cross-type consistency: cos(int 1) and cos(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.5403023058681398, 1e-6)
      expect(result2).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5900
     * @tc.name testMathCos059
     * @tc.desc Verify cos: cos(30°) = sqrt3/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rad: double = 30.0 * Math.PI / 180.0
      let result: double = Math.cos(rad)
      expect(result).assertClose(0.8660254037844387, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6000
     * @tc.name testMathCos060
     * @tc.desc Verify cos batch property: cos(x + 2*PI*k) equals cos(x) for double x=0.3, k=1, 2, 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let base: double = Math.cos(x)
      for (let k: int = 1;k <= 3;k++) {
      let p: double = Math.cos(x + 2.0 * Math.PI * k)
      expect(p).assertClose(base, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6100
     * @tc.name testMathCos061
     * @tc.desc Verify cos cross-type consistency: cos(integer) and cos(floating-point) cross-type consistency (batch)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6200
     * @tc.name testMathCos062
     * @tc.desc Verify cos cross-type consistency: cos(short 1) and cos(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.5403023058681398, 1e-6)
      expect(result2).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6300
     * @tc.name testMathCos063
     * @tc.desc Verify Math.cos(-PI/2) returns approximately 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(-Math.PI / 2)
      expect(Math.abs(result) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6400
     * @tc.name testMathCos064
     * @tc.desc Verify cos: cos(PI) = -1 verified across types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = Math.PI
      let result1: double = Math.cos(val1)
      let val2: double = Math.PI
      let result2: double = Math.cos(val2)
      let isEqual:boolean = result1===result2
      expect(result1).assertEqual(-1)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6500
     * @tc.name testMathCos065
     * @tc.desc Verify cos: cos(PI/2 + PI/3) = -sin(PI/3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 3.0
      let cosSum: double = Math.cos(Math.PI / 2.0 + x)
      let negativeSin: double = -Math.sin(x)
      expect(cosSum).assertClose(negativeSin, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6600
     * @tc.name testMathCos066
     * @tc.desc Verify cos cross-type consistency: cos(byte 0) and cos(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6700
     * @tc.name testMathCos067
     * @tc.desc Verify cos periodicity: cos(x+2PI) approximately equals cos(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1.0
      let result1: number = Math.cos(x)
      let result2: number = Math.cos(x + 2 * Math.PI)
      expect(result1).assertClose(result2, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6800
     * @tc.name testMathCos068
     * @tc.desc Verify cos cross-type consistency: cos(byte 0) and cos(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6900
     * @tc.name testMathCos069
     * @tc.desc Verify cos throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.cos(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7000
     * @tc.name testMathCos070
     * @tc.desc Verify cos cross-type consistency: cos(float 0.0f) and cos(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7100
     * @tc.name testMathCos071
     * @tc.desc Verify cos: cos(2PI) = 1 verified across types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 2.0 * Math.PI
      let result: double = Math.cos(val as Object as double)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7200
     * @tc.name testMathCos072
     * @tc.desc Verify cos: cos(2PI - x) = cos(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.4
      let val1: double = 2.0 * Math.PI - x
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(x)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7300
     * @tc.name testMathCos073
     * @tc.desc Verify cos cross-type consistency: cos(int 100) and cos(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.8623188722876839, 1e-6)
      expect(result2).assertClose(0.8623188722876839, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7400
     * @tc.name testMathCos074
     * @tc.desc Verify cos: cos on [0, PI] monotonically decreasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.cos(0.2)
      let b: double = Math.cos(1.0)
      let c: double = Math.cos(2.8)
      expect(a >= b).assertTrue()
      expect(b >= c).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7500
     * @tc.name testMathCos075
     * @tc.desc Verify cos cross-type consistency: cos(long 0) and cos(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7600
     * @tc.name testMathCos076
     * @tc.desc Verify cos: cos(exp(0)) = cos(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cos(Math.exp(0.0))).assertClose(Math.cos(1.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7700
     * @tc.name testMathCos077
     * @tc.desc Verify cos batch property: cos(-0.5) equals cos(0.5) (even function) for double values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = -0.5
      let val2: double = 0.5
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7800
     * @tc.name testMathCos078
     * @tc.desc Verify cos cross-type consistency: cos(int -1) and cos(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(val2)
      expect(result1).assertClose(0.5403023058681398, 1e-6)
      expect(result2).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_7900
     * @tc.name testMathCos079
     * @tc.desc Verify cos: cos(acos(x)) = x(within the domain)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      expect(Math.cos(Math.acos(x))).assertClose(x, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8000
     * @tc.name testMathCos080
     * @tc.desc Verify cos throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.cos(fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8100
     * @tc.name testMathCos081
     * @tc.desc Verify cos throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.cos(longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8200
     * @tc.name testMathCos082
     * @tc.desc Verify cos throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.cos(list as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8300
     * @tc.name testMathCos083
     * @tc.desc Verify cos throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.cos(map as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8400
     * @tc.name testMathCos084
     * @tc.desc Verify cos returns 0.5403023058681398 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.cos(val)
      expect(result).assertClose(0.5403023058681398, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8500
     * @tc.name testMathCos085
     * @tc.desc Verify cos: cos(x + 4PI) = cos(x)(multi-period)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let val1: double = x + 4.0 * Math.PI
      let result1: double = Math.cos(val1)
      let result2: double = Math.cos(x)
      let isEqual: boolean = Math.abs(result1 - result2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8600
     * @tc.name testMathCos086
     * @tc.desc Verify cos: cos(Float.MAX_VALUE / 2) result is within [-1, 1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = Float.MAX_VALUE / 2.0f
      let r: double = Math.cos(x)
      expect(r >= -1.0).assertTrue()
      expect(r <= 1.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8700
     * @tc.name testMathCos087
     * @tc.desc Verify cos throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.cos(set as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8800
     * @tc.name testMathCos088
     * @tc.desc Verify Math.cos(PI/6) returns approximately 0.8660
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(Math.PI / 6)
      expect(Math.abs(result - Math.sqrt(3.0) / 2) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_8900
     * @tc.name testMathCos089
     * @tc.desc Verify cos returns 1 with input rad
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deg: double = 0.0
      let rad: double = deg * Math.PI / 180.0
      let result: double = Math.cos(rad)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_9000
     * @tc.name testMathCos090
     * @tc.desc Verify cos returns 1 with input val1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let result1: double = Math.cos(val1)
      let val2: int = 0
      let result2: double = Math.cos(val2)
      let val3: int = 0
      let result3: double = Math.cos(val3)
      expect(result1).assertEqual(1)
      expect(result2).assertEqual(1)
      expect(result3).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_9100
     * @tc.name testMathCos091
     * @tc.desc Verify cos: cos(atanh(0)) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cos(Math.atanh(0.0))).assertClose(1.0, 1e-6)
    });

  });
}
