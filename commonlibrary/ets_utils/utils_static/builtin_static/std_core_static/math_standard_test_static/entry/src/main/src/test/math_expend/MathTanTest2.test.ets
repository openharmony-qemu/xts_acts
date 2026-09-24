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

export default function mathTanTest2(): void {
  describe('MathTanTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0100
     * @tc.name testMathTan001
     * @tc.desc Verify tan cross-type consistency: tan(int 0) and tan(double 0.0) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0200
     * @tc.name testMathTan002
     * @tc.desc Verify tan: tan(PI/2 - 0.01) large positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 2.0 - 0.01
      let r: double = Math.tan(x)
      expect(r > 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0300
     * @tc.name testMathTan003
     * @tc.desc Verify tan cross-type consistency: tan(int 100) and tan(long 100) cross-type consistency, expect tan(100)=-0.5872139151569291
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(-0.5872139151569291, 1e-6)
      expect(result2).assertClose(-0.5872139151569291, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0400
     * @tc.name testMathTan004
     * @tc.desc Verify tan: tan(PI/4) = 1 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Math.PI / 4.0
      let result: double = Math.tan(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0500
     * @tc.name testMathTan005
     * @tc.desc Verify tan(-0.0) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.tan(-0.0)
      expect(1.0 / result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0600
     * @tc.name testMathTan006
     * @tc.desc Verify tan(PI/4) returns approximately 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.tan(Math.PI / 4.0)
      expect(result).assertClose(1.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0700
     * @tc.name testMathTan007
     * @tc.desc Verify tan(PI/6) and tan(0.5235987755982988) both equal 0.57735...
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathTan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let direct: double = Math.tan(0.5235987755982988)
      let viaPi: double = Math.tan(Math.PI / 6.0)
      expect(Math.abs(direct - viaPi)).assertLess(1e-10)
      expect(direct).assertClose(0.5773502691896257, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0800
     * @tc.name testMathTan008
     * @tc.desc Verify tan throws ClassCastError with Japanese string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'テスト'
        Math.tan(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_0900
     * @tc.name testMathTan009
     * @tc.desc Verify trigonometric identity: 1 + tan^2(x) approximately 1/cos^2(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.5
      let left: number = 1.0 + Math.pow(Math.tan(x), 2.0)
      let right: number = 1.0 / Math.pow(Math.cos(x), 2.0)
      expect(left).assertClose(right, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1000
     * @tc.name testMathTan010
     * @tc.desc Verify tan throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.tan(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1100
     * @tc.name testMathTan011
     * @tc.desc Verify tan: tan(PI/4 + PI/4) = tan(PI/2) near the singularity returns a large finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = Math.PI / 4.0 + Math.PI / 4.0
      let r: double = Math.tan(sum)
      expect(r).assertClose(1.633123935319537e+16, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1200
     * @tc.name testMathTan012
     * @tc.desc Verify tan throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.tan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1300
     * @tc.name testMathTan013
     * @tc.desc Verify tan throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.tan(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1400
     * @tc.name testMathTan014
     * @tc.desc Verify tan: tan(scientific notation -1.5e-3) odd function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sciNeg: double = -1.5e-3
      let sciPos: double = 1.5e-3
      expect(Math.tan(sciNeg)).assertEqual(-Math.tan(sciPos))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1500
     * @tc.name testMathTan015
     * @tc.desc Verify tan returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathTan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.tan(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1600
     * @tc.name testMathTan016
     * @tc.desc Verify tan returns -1.5574077246549023 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.tan(val)
      expect(result).assertClose(-1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1700
     * @tc.name testMathTan017
     * @tc.desc Verify tan: tan(5PI/4) = 1 (period PI returns to PI/4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5.0 * Math.PI / 4.0
      let result: double = Math.tan(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1800
     * @tc.name testMathTan018
     * @tc.desc Verify tan throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.tan(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_1900
     * @tc.name testMathTan019
     * @tc.desc Verify tan cross-type consistency: tan(long 0) and tan(float 0.0f) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2000
     * @tc.name testMathTan020
     * @tc.desc Verify Math.tan(): tan(2 * Math.PI / 3) equals -sqrt(3) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 2.0 * Math.PI / 3.0;
      const result: number = Math.tan(val);
      const expectVal: number = -Math.sqrt(3);
      const diff: number = result - expectVal;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2100
     * @tc.name testMathTan021
     * @tc.desc Verify tan: tan(PI - x) = -tan(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      expect(Math.tan(Math.PI - x)).assertClose(-Math.tan(x), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2200
     * @tc.name testMathTan022
     * @tc.desc Verify tan cross-type consistency: tan(float 0.0f) and tan(double 0.0) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2300
     * @tc.name testMathTan023
     * @tc.desc Verify tan throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.tan(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2400
     * @tc.name testMathTan024
     * @tc.desc Verify tan: tan(PI + x) = tan(x)(PI is a period)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let val1: double = Math.PI + x
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(x)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2500
     * @tc.name testMathTan025
     * @tc.desc Verify tan throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.tan(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2600
     * @tc.name testMathTan026
     * @tc.desc Verify tan: tan(1.0e-10) → 1.0e-10 small-angle approximation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-10
      let r: double = Math.tan(x)
      let isClose: boolean = Math.abs(r - 1.0e-10) < 1.0e-20
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2700
     * @tc.name testMathTan027
     * @tc.desc Verify tan throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.tan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2800
     * @tc.name testMathTan028
     * @tc.desc Verify tan throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.tan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_2900
     * @tc.name testMathTan029
     * @tc.desc Verify tan batch property: tan(-x) = -tan(x) for double values 0.5, 1.0, 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.tan(-0.5)).assertEqual(-Math.tan(0.5))
      expect(Math.tan(-1.0)).assertEqual(-Math.tan(1.0))
      expect(Math.tan(-2.0)).assertEqual(-Math.tan(2.0))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3000
     * @tc.name testMathTan030
     * @tc.desc Verify tan: tan(-PI/2 - 0.01) large positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -Math.PI / 2.0 - 0.01
      let r: double = Math.tan(x)
      expect(r > 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3100
     * @tc.name testMathTan031
     * @tc.desc Verify tan returns -2.185039863261519 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.tan(val)
      expect(result).assertClose(-2.185039863261519, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3200
     * @tc.name testMathTan032
     * @tc.desc Verify tan: tan(PI/6 + PI/6) = tan(PI/3) = sqrt3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: double = Math.PI / 6.0 + Math.PI / 6.0
      let val: double = sum
      let result: double = Math.tan(val)
      expect(result).assertClose(1.7320508075688767, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3300
     * @tc.name testMathTan033
     * @tc.desc Verify tan returns -0.1425465430742778 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.tan(val)
      expect(result).assertClose(-0.1425465430742778, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3400
     * @tc.name testMathTan034
     * @tc.desc Verify tan: tan range is all real numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [0.1, 0.5, 1.0, 1.3, 1.4, 2.0, 3.0]
      let exp: double[] = [0.10033467208545055, 0.5463024898437905, 1.5574077246549023, 3.6021024479679786, 5.797883715482887, -2.185039863261519, -0.1425465430742778]
      for (let i: int = 0; i < vals.length; i++) {
        let t: double = Math.tan(vals[i])
        expect(t).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3500
     * @tc.name testMathTan035
     * @tc.desc Verify tan throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.tan(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3600
     * @tc.name testMathTan036
     * @tc.desc Verify tan cross-type consistency: tan(byte 0) and tan(float 0.0f) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3700
     * @tc.name testMathTan037
     * @tc.desc Verify tan(100*PI) returns 1.964386723728472e-15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.tan(100.0 * Math.PI)
      expect(result).assertClose(1.964386723728472e-15, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3800
     * @tc.name testMathTan038
     * @tc.desc Verify tan throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a','b']
      Math.tan(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_3900
     * @tc.name testMathTan039
     * @tc.desc Verify Math.tan() satisfies double-angle identity tan(2x) = 2 * tan(x) / (1 - tan(x) * tan(x)) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 0.3;
      const tan2x: number = Math.tan(2.0 * x);
      const tanX: number = Math.tan(x);
      const expected: number = 2.0 * tanX / (1.0 - tanX * tanX);
      const diff: number = tan2x - expected;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4000
     * @tc.name testMathTan040
     * @tc.desc Verify tan cross-type consistency: tan(int 1) and tan(float 1.0f) cross-type consistency, expect tan(1)=1.5574077246549023
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(1.5574077246549023, 1e-6)
      expect(result2).assertClose(1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4100
     * @tc.name testMathTan041
     * @tc.desc Verify tan: tan(-PI/4) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -Math.PI / 4.0
      let result: double = Math.tan(val)
      expect(result).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4200
     * @tc.name testMathTan042
     * @tc.desc Verify tan is an odd function: tan(-x) = -tan(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Math.PI / 6.0
      expect(Math.tan(-x)).assertClose(-Math.tan(x), 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4300
     * @tc.name testMathTan043
     * @tc.desc Verify tan cross-type consistency: tan(short -30) and tan(long -30) cross-type consistency, expect tan(-30)=6.405331196646276
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(6.405331196646276, 1e-6)
      expect(result2).assertClose(6.405331196646276, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4400
     * @tc.name testMathTan044
     * @tc.desc Verify tan cross-type consistency: tan(short 1) and tan(double 1.0) cross-type consistency, expect tan(1)=1.5574077246549023
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(1.5574077246549023, 1e-6)
      expect(result2).assertClose(1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4500
     * @tc.name testMathTan045
     * @tc.desc Verify tan returns 1.5574077246549023 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.tan(val)
      expect(result).assertClose(1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4600
     * @tc.name testMathTan046
     * @tc.desc Verify tan: tan(135°) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = 135.0 * Math.PI / 180.0
      let val: double = r
      let result: double = Math.tan(val)
      expect(result).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4700
     * @tc.name testMathTan047
     * @tc.desc Verify tan cross-type consistency: tan(byte 0) and tan(short 0) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4800
     * @tc.name testMathTan048
     * @tc.desc Verify tan batch property: tan(PI/4) equals 1.0 across repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 5; i++) {
        let val: double = Math.PI / 4.0
        let result: double = Math.tan(val)
        expect(result).assertClose(1.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_4900
     * @tc.name testMathTan049
     * @tc.desc Verify tan cross-type consistency: tan(long 0) and tan(double 0.0) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5000
     * @tc.name testMathTan050
     * @tc.desc Verify tan({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Record<string, string> = {}
        Math.tan(obj as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5100
     * @tc.name testMathTan051
     * @tc.desc Verify tan batch property: tan(x + PI*k) equals tan(x) for double x=0.3, k=1, 2, 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      for (let k:int = 1;k <= 3;k++) {
      let p: double = Math.tan(x + Math.PI * k)
      expect(p).assertClose(Math.tan(x), 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5200
     * @tc.name testMathTan052
     * @tc.desc Verify tan with radix literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexInt: int = 0x10
      let val1: int = hexInt
      let val2: double = 16.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5300
     * @tc.name testMathTan053
     * @tc.desc Verify Math.tan(): tan(asin(x)) is equivalent to x / sqrt(1 - x * x) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 0.5;
      const tanAsin: number = Math.tan(Math.asin(x));
      const expected: number = x / Math.sqrt(1.0 - x * x);
      const diff: number = tanAsin - expected;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5400
     * @tc.name testMathTan054
     * @tc.desc Verify tan: tan(integer) and tan(floating-point) consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5500
     * @tc.name testMathTan055
     * @tc.desc Verify Math.tan with double value 0.0 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = 0.0 * Math.PI / 180.0
      let val: double = r
      let result: double = Math.tan(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5600
     * @tc.name testMathTan056
     * @tc.desc Verify tan: tan(120°) = -sqrt3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = 120.0 * Math.PI / 180.0
      let val: double = r
      let result: double = Math.tan(val)
      expect(result).assertClose(-1.7320508075688767, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5700
     * @tc.name testMathTan057
     * @tc.desc Verify tan throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.tan(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5800
     * @tc.name testMathTan058
     * @tc.desc Verify tan cross-type consistency: tan(short 0) and tan(float 0.0f) cross-type consistency, expect tan(0)=0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_5900
     * @tc.name testMathTan059
     * @tc.desc Verify tan idempotent across three calls with input n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 42
      let f: double = Math.tan(n)
      let s: double = Math.tan(n)
      let t: double = Math.tan(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(2.2913879924374863, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6000
     * @tc.name testMathTan060
     * @tc.desc Verify tan: tan(2PI - x) = -tan(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      expect(Math.tan(2.0 * Math.PI - x)).assertClose(-Math.tan(x), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6100
     * @tc.name testMathTan061
     * @tc.desc Verify tan: tan(150°) = -1/sqrt3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = 150.0 * Math.PI / 180.0
      let val: double = r
      let result: double = Math.tan(val)
      expect(result).assertClose(-0.5773502691896257, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6200
     * @tc.name testMathTan062
     * @tc.desc Verify tan throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.tan(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6300
     * @tc.name testMathTan063
     * @tc.desc Verify tan is monotonically increasing in first quadrant
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.tan(0.1) < Math.tan(0.5) && Math.tan(0.5) < Math.tan(1.0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6400
     * @tc.name testMathTan064
     * @tc.desc Verify tan: tan(-PI/2 + 0.01) large negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -Math.PI / 2.0 + 0.01
      let r: double = Math.tan(x)
      expect(r < 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6500
     * @tc.name testMathTan065
     * @tc.desc Verify tan: tan parity symmetric about singular points
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.tan(Math.PI / 2.0 - 0.1)
      let b: double = Math.tan(-Math.PI / 2.0 + 0.1)
      expect(a).assertEqual(-b)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6600
     * @tc.name testMathTan066
     * @tc.desc Verify tan: tan(long 100000) consecutive large integers verification
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 100000
      let r: double = Math.tan(x)
      expect(r).assertClose(-0.035771662952898776, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6700
     * @tc.name testMathTan067
     * @tc.desc Verify tan: tan(scientific notation 2.5e2) and tan(250.0) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sci: double = 2.5e2
      let direct: double = 250.0
      expect(Math.tan(sci)).assertClose(-4.027282645076856, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6800
     * @tc.name testMathTan068
     * @tc.desc Verify tan: tan(PI/2 + 0.01) large negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.PI / 2.0 + 0.01
      let r: double = Math.tan(x)
      expect(r < 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_6900
     * @tc.name testMathTan069
     * @tc.desc Verify tan cross-type consistency: tan(byte 1) and tan(double 1.0) cross-type consistency, expect tan(1)=1.5574077246549023
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(1.5574077246549023, 1e-6)
      expect(result2).assertClose(1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7000
     * @tc.name testMathTan070
     * @tc.desc Verify Math.tan(): tan(1.5e3) equals tan(1500.0) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sci: number = 1.5e3;
      const val1: number = sci;
      const val2: number = 1500.0;
      const result1: number = Math.tan(val1);
      const result2: number = Math.tan(val2);
      const diff: number = result1 - result2;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7100
     * @tc.name testMathTan071
     * @tc.desc Verify tan: tan near PI/2 left and right limits have opposite signs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = Math.tan(Math.PI / 2.0 - 1.0e-10)
      let right: double = Math.tan(Math.PI / 2.0 + 1.0e-10)
      expect(left > 0.0).assertTrue()
      expect(right < 0.0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7200
     * @tc.name testMathTan072
     * @tc.desc Verify Math.tan() satisfies identity tan(x) = sin(x) / cos(x) for multiple inputs within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: number[] = [0.1, 0.3, 0.7, 1.0, 1.2];
      const tolerance: number = 1.0e-12;
      for (let i: int = 0; i < vals.length; i++) {
        const x: number = vals[i];
        const t: number = Math.tan(x);
        const expected: number = Math.sin(x) / Math.cos(x);
        const diff: number = t - expected;
        expect(Math.abs(diff) < tolerance).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7300
     * @tc.name testMathTan073
     * @tc.desc Verify tan cross-type consistency: tan(byte 1) and tan(int 1) cross-type consistency, expect tan(1)=1.5574077246549023
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(1.5574077246549023, 1e-6)
      expect(result2).assertClose(1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7400
     * @tc.name testMathTan074
     * @tc.desc Verify tan periodicity: tan(x + PI) approximately tan(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.5
      expect(Math.tan(x + Math.PI)).assertClose(Math.tan(x), 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7500
     * @tc.name testMathTan075
     * @tc.desc Verify tan throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.tan(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7600
     * @tc.name testMathTan076
     * @tc.desc Verify tan: tan(atan(x)) = x holds over the entire domain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      expect(Math.tan(Math.atan(x))).assertEqual(x)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7700
     * @tc.name testMathTan077
     * @tc.desc Verify tan throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.tan(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7800
     * @tc.name testMathTan078
     * @tc.desc Verify tan periodicity: tan(x + 2*PI) approximately tan(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.5
      expect(Math.tan(x + 2.0 * Math.PI)).assertClose(Math.tan(x), 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_7900
     * @tc.name testMathTan079
     * @tc.desc Verify tan cross-type consistency: tan(0) = 0 cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let result1: double = Math.tan(val1)
      expect(result1).assertEqual(0.0)
      let val2: double = 0.0
      let result2: double = Math.tan(val2)
      expect(result2).assertEqual(0.0)
      let val3: float = 0.0f
      let result3: double = Math.tan(val3)
      expect(result3).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8000
     * @tc.name testMathTan080
     * @tc.desc Verify tan: tan(2PI) returns approximately 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 2.0 * Math.PI
      let result: double = Math.tan(val)
      expect(Math.abs(result) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8100
     * @tc.name testMathTan081
     * @tc.desc Verify tan cross-type consistency: tan(1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: double = 1.0
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8200
     * @tc.name testMathTan082
     * @tc.desc Verify tan cross-type consistency: tan(short 15) and tan(int 15) cross-type consistency, expect tan(15)=-0.8559934009085188
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(-0.8559934009085188, 1e-6)
      expect(result2).assertClose(-0.8559934009085188, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8300
     * @tc.name testMathTan083
     * @tc.desc Verify tan: tan(PI/2 - x) = 1/tan(x) (co-function identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.3
      let tanOfComplement: double = Math.tan(Math.PI / 2.0 - x)
      let reciprocal: double = 1.0 / Math.tan(x)
      let isClose: boolean = Math.abs(tanOfComplement - reciprocal) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8400
     * @tc.name testMathTan084
     * @tc.desc Verify tan throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.tan(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8500
     * @tc.name testMathTan085
     * @tc.desc Verify tan cross-type consistency: tan(int -1) and tan(long -1) cross-type consistency, expect tan(-1)=-1.5574077246549023
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.tan(val1)
      let result2: double = Math.tan(val2)
      expect(result1).assertClose(-1.5574077246549023, 1e-6)
      expect(result2).assertClose(-1.5574077246549023, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8600
     * @tc.name testMathTan086
     * @tc.desc Verify tan: tan(315°) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = 315.0 * Math.PI / 180.0
      let val: double = r
      let result: double = Math.tan(val)
      expect(result).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8700
     * @tc.name testMathTan087
     * @tc.desc Verify tan: tan(-1.0e-10) → -1.0e-10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0e-10
      let r: double = Math.tan(x)
      let isClose: boolean = Math.abs(r + 1.0e-10) < 1.0e-20
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_TAN_8800
     * @tc.name testMathTan088
     * @tc.desc Verify tan returns 0.6483608274590866 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathTan088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.tan(val)
      expect(result).assertClose(0.6483608274590866, 1e-6)
    });

  });
}
