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

export default function mathAtan2Test2(): void {
  describe('MathAtan2Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0010
     * @tc.name testMathAtan2001
     * @tc.desc Verify atan2 returns PI/2 with input y, x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: long = 10
      let x: long = 0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0020
     * @tc.name testMathAtan2002
     * @tc.desc Verify atan2 returns -1.5707963267948966 with input (int -1, int 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1
      let b: int = 0
      let result: double = Math.atan2(a, b)
      expect(result).assertClose(-1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0030
     * @tc.name testMathAtan2003
     * @tc.desc Verify atan2: atan2(y, 0) = -PI/2 for y<0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(-1.0, 0.0)).assertClose(-Math.PI / 2.0, 1e-6)
      expect(Math.atan2(-5.0, 0.0)).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0040
     * @tc.name testMathAtan2004
     * @tc.desc Verify atan2: atan2(float y 1.0f + double x Double.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 1.0f
      let x: double = Double.POSITIVE_INFINITY
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0050
     * @tc.name testMathAtan2005
     * @tc.desc Verify atan2 throws ClassCastError with Object instance as second argument parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.atan2(1.0, obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0060
     * @tc.name testMathAtan2006
     * @tc.desc Verify atan2: atan2(byte y 1 + double x 1.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = 1
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0070
     * @tc.name testMathAtan2007
     * @tc.desc Verify atan2 throws ClassCastError with Color.RED as Object as double parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atan2(Color.RED as Object as double, 1.0 as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0080
     * @tc.name testMathAtan2008
     * @tc.desc Verify atan2 batch property: result within [-PI, PI] for double pairs (1.0,1.0), (-1.0,1.0), (-1.0,-1.0), (1.0,-1.0), (2.0,0.0), (-2.0,0.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pairs: double[][] = [[1.0,1.0],[-1.0,1.0],[-1.0,-1.0],[1.0,-1.0],[2.0,0.0],[-2.0,0.0]]
      for (let i: int = 0; i < pairs.length; i++) {
        let r: double = Math.atan2(pairs[i][0], pairs[i][1])
        expect(r >= -Math.PI).assertTrue()
        expect(r <= Math.PI).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0090
     * @tc.name testMathAtan2009
     * @tc.desc Verify atan2 throws ClassCastError with string 'abc' as first argument parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atan2('abc' as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0100
     * @tc.name testMathAtan2010
     * @tc.desc Verify Math.atan2 float overload with y=1.0f, x=0.0f returns PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 1.0f
      let x: float = 0.0f
      let result: float = Math.atan2(y, x)
      let exprResult: boolean = Math.abs(result - Math.PI / 2) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0110
     * @tc.name testMathAtan2011
     * @tc.desc Verify atan2(+Infinity, 1.0) returns PI/2 and atan2(-Infinity, 1.0) returns -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(Double.POSITIVE_INFINITY, 1.0)).assertClose(Math.PI / 2.0, 1e-6)
      expect(Math.atan2(Double.NEGATIVE_INFINITY, 1.0)).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0120
     * @tc.name testMathAtan2012
     * @tc.desc Verify atan2 with NaN returns NaN with input y, x [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 1.0
      let x: double = Double.NaN
      let result: double = Math.atan2(y, x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0130
     * @tc.name testMathAtan2013
     * @tc.desc Verify Math.atan2 with y=1.0, x=Number.NEGATIVE_INFINITY returns PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(1.0, Number.NEGATIVE_INFINITY)
      let exprResult: boolean = Math.abs(result - Math.PI) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0140
     * @tc.name testMathAtan2014
     * @tc.desc Verify atan2 throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
        Math.atan2(arr as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0150
     * @tc.name testMathAtan2015
     * @tc.desc Verify atan2 throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atan2(null as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0160
     * @tc.name testMathAtan2016
     * @tc.desc Verify atan2 returns PI with input y, x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: short = 0
      let x: short = -1
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0170
     * @tc.name testMathAtan2017
     * @tc.desc Verify atan2 throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
        Math.atan2(u as Object as double, u as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0180
     * @tc.name testMathAtan2018
     * @tc.desc Verify atan2: atan2(long y 0 + float x 1.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: long = 0
      let x: float = 1.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0190
     * @tc.name testMathAtan2019
     * @tc.desc Verify atan2: atan2(int y 1 + long x 0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x: long = 0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0200
     * @tc.name testMathAtan2020
     * @tc.desc Verify atan2 throws ClassCastError with CJK string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.atan2(s as Object as double, s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0210
     * @tc.name testMathAtan2021
     * @tc.desc Verify Math.atan2 return value range [-PI, PI]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(100.0, 1.0)
      let exprResult: boolean = result >= -Math.PI && result <= Math.PI
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0220
     * @tc.name testMathAtan2022
     * @tc.desc Verify atan2(1.0, +Infinity) returns 0 and atan2(1.0, -Infinity) returns PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(1.0, Double.POSITIVE_INFINITY)).assertClose(0.0, 1e-6)
      expect(Math.atan2(1.0, Double.NEGATIVE_INFINITY)).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0230
     * @tc.name testMathAtan2023
     * @tc.desc Verify atan2 returns PI (negative x-axis)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 0.0
      let x: double = -1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0240
     * @tc.name testMathAtan2024
     * @tc.desc Verify Math.atan2 float overload with x=Number.NaN returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 1.0f
      let x: float = Float.NaN
      let result: float = Math.atan2(y, x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0250
     * @tc.name testMathAtan2025
     * @tc.desc Verify atan2 returns PI/2 with input y, x [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = 1
      let x: byte = 0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0260
     * @tc.name testMathAtan2026
     * @tc.desc Verify atan2: atan2(short y 1 + double x 0.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: short = 1
      let x: double = 0.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0270
     * @tc.name testMathAtan2027
     * @tc.desc Verify atan2: atan2(int y 0 + long x 1) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 0
      let x: long = 1
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0280
     * @tc.name testMathAtan2028
     * @tc.desc Verify atan2(+Infinity, +Infinity) returns PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.POSITIVE_INFINITY
      let x: double = Double.POSITIVE_INFINITY
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0290
     * @tc.name testMathAtan2029
     * @tc.desc Verify atan2: atan2(short y 0 + double x -1.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: short = 0
      let x: double = -1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0300
     * @tc.name testMathAtan2030
     * @tc.desc Verify atan2: atan2(double y 0.0 + float x 2.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 0.0
      let x: float = 2.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0310
     * @tc.name testMathAtan2031
     * @tc.desc Verify atan2: atan2(sin(a), cos(a)) returns a for angles on the circle
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let angles: double[] = [0.0, Math.PI/4, Math.PI/2, 3*Math.PI/4, Math.PI, -3*Math.PI/4, -Math.PI/2, -Math.PI/4]
      for (let i: int = 0; i < angles.length; i++) {
        let yVal: double = Math.sin(angles[i])
        let xVal: double = Math.cos(angles[i])
        let result: double = Math.atan2(yVal, xVal)
        let isClose: boolean = Math.abs(result - angles[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0320
     * @tc.name testMathAtan2032
     * @tc.desc Verify atan2 returns PI/2 with input y, x [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 3.0f
      let x: float = 0.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0330
     * @tc.name testMathAtan2033
     * @tc.desc Verify atan2: atan2(byte y 0 + double x -1.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = 0
      let x: double = -1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0340
     * @tc.name testMathAtan2034
     * @tc.desc Verify atan2: atan2(int y 1 + float x Float.MAX_VALUE) normal + boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x: float = Float.MAX_VALUE
      let result: double = Math.atan2(y, x)
      expect(Math.abs(result) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0350
     * @tc.name testMathAtan2035
     * @tc.desc Verify atan2 with short values y=-1, x=0 returns approx -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: short = -1
      let x: short = 0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0360
     * @tc.name testMathAtan2036
     * @tc.desc Verify atan2(-Infinity, -Infinity) returns -3PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.NEGATIVE_INFINITY
      let x: double = Double.NEGATIVE_INFINITY
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-3.0 * Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0370
     * @tc.name testMathAtan2037
     * @tc.desc Verify atan2 with NaN returns NaN with input y, x [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.NaN
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0380
     * @tc.name testMathAtan2038
     * @tc.desc Verify atan2 returns 0.6435011087932844 with input (double 3, double 4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3
      let b: double = 4
      let result: double = Math.atan2(a, b)
      expect(result).assertClose(0.6435011087932844, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0390
     * @tc.name testMathAtan2039
     * @tc.desc Verify atan2(-Infinity, +Infinity) returns -PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.NEGATIVE_INFINITY
      let x: double = Double.POSITIVE_INFINITY
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0400
     * @tc.name testMathAtan2040
     * @tc.desc Verify atan2 returns -PI/4 with input y, x [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = -3
      let x: int = 3
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0410
     * @tc.name testMathAtan2041
     * @tc.desc Verify atan2: atan2(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 1.0
      let x: double = 0.0
      let first: double = Math.atan2(y, x)
      let second: double = Math.atan2(y, x)
      let third: double = Math.atan2(y, x)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(1.5707963267948966, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0420
     * @tc.name testMathAtan2042
     * @tc.desc Verify atan2 returns -PI/4 (fourth quadrant)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = -1.0
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0430
     * @tc.name testMathAtan2043
     * @tc.desc Verify atan2: atan2(int y 2147483647 + double x 1.0) boundary + normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 2147483647
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0440
     * @tc.name testMathAtan2044
     * @tc.desc Verify atan2 batch property with double pairs (0,1), (1,1), (-1,-1) returns 0.0, PI/4, -3PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(0, 1)).assertClose(0.0, 1e-6)
      expect(Math.atan2(1, 1)).assertClose(0.7853981633974483, 1e-6)
      expect(Math.atan2(-1, -1)).assertClose(-2.356194490192345, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0450
     * @tc.name testMathAtan2045
     * @tc.desc Verify atan2 throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
        Math.atan2(list as Object as double, list as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0460
     * @tc.name testMathAtan2046
     * @tc.desc Verify atan2: atan2(y, 0) = PI/2 for y>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(1.0, 0.0)).assertClose(Math.PI / 2.0, 1e-6)
      expect(Math.atan2(5.0, 0.0)).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0470
     * @tc.name testMathAtan2047
     * @tc.desc Verify atan2 batch property: atan2(-y, 1.0) = -atan2(y, 1.0) for double values 0.5, 1.0, 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ys: double[] = [0.5, 1.0, 2.0, -0.5, -1.0]
      for (let i: int = 0; i < ys.length; i++) {
        let r1: double = Math.atan2(ys[i], 1.0)
        let r2: double = Math.atan2(-ys[i], 1.0)
        expect(r2).assertClose(-r1, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0480
     * @tc.name testMathAtan2048
     * @tc.desc Verify atan2 returns -PI/2 (y negative y-axis)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = -1.0
      let x: double = 0.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0490
     * @tc.name testMathAtan2049
     * @tc.desc Verify atan2 returns PI/2 (y positive y-axis)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 1.0
      let x: double = 0.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0500
     * @tc.name testMathAtan050
     * @tc.desc Verify atan2 returns -PI/4 with input y, x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = -5
      let x: byte = 5
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0510
     * @tc.name testMathAtan051
     * @tc.desc Verify atan2 throws ClassCastError with XSS script string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '<script>alert(1)</script>'
        Math.atan2(str as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0520
     * @tc.name testMathAtan052
     * @tc.desc Verify atan2: atan2(y,x) = 0 when y=0, x>0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let yVal: double = 0.0
        let xVal: double = 1.0
        let result: double = Math.atan2(yVal, xVal)
        expect(result).assertClose(0.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0530
     * @tc.name testMathAtan053
     * @tc.desc Verify atan2 throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
        Math.atan2(map as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0540
     * @tc.name testMathAtan054
     * @tc.desc Verify Math.atan2 with y=0.0, x=1.0 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(0.0, 1.0)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0550
     * @tc.name testMathAtan055
     * @tc.desc Verify atan2 with double values y=-0.0, x=1.0 returns double -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = -0.0
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0560
     * @tc.name testMathAtan056
     * @tc.desc Verify atan2(+Infinity, -Infinity) returns 3PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.POSITIVE_INFINITY
      let x: double = Double.NEGATIVE_INFINITY
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(3.0 * Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0570
     * @tc.name testMathAtan057
     * @tc.desc Verify atan2: atan2(int y 1 + double x Double.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x: double = Double.POSITIVE_INFINITY
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0580
     * @tc.name testMathAtan058
     * @tc.desc Verify atan2: atan2(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[][] = [[1.0,2.0],[-3.0,4.0],[5.0,-6.0],[-7.0,-8.0],[0.5,0.5]]
      let exp: double[] = [0.4636476090008061, -0.6435011087932844, 2.44685437739309, -2.4227626539681686, 0.7853981633974483]
      for (let i: int = 0; i < vs.length; i++) {
        let r: double = Math.atan2(vs[i][0], vs[i][1])
        expect(r).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0590
     * @tc.name testMathAtan059
     * @tc.desc Verify atan2: atan2(0, x) = PI for x<0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(0, -1.0)).assertClose(Math.PI, 1e-6)
      expect(Math.atan2(0, -5.0)).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0600
     * @tc.name testMathAtan060
     * @tc.desc Verify Math.atan2 float overload with y=Number.NaN returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = Float.NaN
      let x: float = 1.0f
      let result: float = Math.atan2(y, x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0610
     * @tc.name testMathAtan061
     * @tc.desc Verify Math.atan2 float overload with y=0.0f, x=1.0f returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 0.0f
      let x: float = 1.0f
      let result: float = Math.atan2(y, x)
      expect(result).assertClose(0.0f, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0620
     * @tc.name testMathAtan062
     * @tc.desc Verify atan2: atan2(float y 0.0f + int x -1) normal values(arguments swapped)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 0.0f
      let x: int = -1
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0630
     * @tc.name testMathAtan063
     * @tc.desc Verify atan2(+Infinity, 1.0) returns PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.POSITIVE_INFINITY
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0640
     * @tc.name testMathAtan064
     * @tc.desc Verify atan2: atan2(long y 1 + float x 0.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: long = 1
      let x: float = 0.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0650
     * @tc.name testMathAtan065
     * @tc.desc Verify Math.atan2 with both y and x Number.NaN returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(Number.NaN, Number.NaN)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0660
     * @tc.name testMathAtan066
     * @tc.desc Verify atan2 throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
        Math.atan2(arr as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0670
     * @tc.name testMathAtan067
     * @tc.desc Verify atan2 returns 0.4636476090008061 with input (short 1, short 2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1
      let b: short = 2
      let result: double = Math.atan2(a, b)
      expect(result).assertClose(0.4636476090008061, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0680
     * @tc.name testMathAtan068
     * @tc.desc Verify atan2 throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1, 2, 3]
        Math.atan2(arr as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0690
     * @tc.name testMathAtan069
     * @tc.desc Verify atan2 throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.atan2(arr as Object as double, arr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0700
     * @tc.name testMathAtan070
     * @tc.desc Verify atan2 returns 0.0 with input byte 0, byte 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAtan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0
      let b: byte = 1
      let result: double = Math.atan2(a, b)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0710
     * @tc.name testMathAtan071
     * @tc.desc Verify atan2 throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.atan2(fn as Object as double, fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0720
     * @tc.name testMathAtan072
     * @tc.desc Verify atan2 throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atan2(true as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0730
     * @tc.name testMathAtan073
     * @tc.desc Verify atan2 returns 0.5880026035475675 with input (float 2, float 3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2
      let b: float = 3
      let result: double = Math.atan2(a, b)
      expect(result).assertClose(0.5880026035475675, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0740
     * @tc.name testMathAtan074
     * @tc.desc Verify atan2 throws ClassCastError with Object instance as first argument parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.atan2(obj as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0750
     * @tc.name testMathAtan075
     * @tc.desc Verify atan2: atan2(scientific notation y 2.0e0, x 2.0e0) = PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 2.0e0
      let x: double = 2.0e0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0760
     * @tc.name testMathAtan076
     * @tc.desc Verify atan2 throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
        set.add(1)
        Math.atan2(set as Object as double, set as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0770
     * @tc.name testMathAtan077
     * @tc.desc Verify atan2: atan2(int y 0 + double x -1.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 0
      let x: double = -1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0780
     * @tc.name testMathAtan078
     * @tc.desc Verify Math.atan2(0, -0) returns PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(0, -0)
      let exprResult: boolean = Math.abs(result - Math.PI) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0790
     * @tc.name testMathAtan079
     * @tc.desc Verify atan2: atan2(byte y 1 + short x 0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = 1
      let x: short = 0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0800
     * @tc.name testMathAtan080
     * @tc.desc Verify Math.atan2 with y=0.5, x=1.0 returns an angle satisfying tan(result)=0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(0.5, 1.0)
      let exprResult: boolean = Math.abs(Math.tan(result) - 0.5) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0810
     * @tc.name testMathAtan081
     * @tc.desc Verify atan2: atan2(0, 1) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intY1: int = 0
      let intX1: int = 1
      let dblY1: double = 0.0
      let dblX1: double = 1.0
      let floatY1: float = 0.0f
      let floatX1: float = 1.0f
      let intResult1: double = Math.atan2(intY1, intX1)
      let dblResult1: double = Math.atan2(dblY1, dblX1)
      let floatResult1: double = Math.atan2(floatY1, floatX1)
      expect(intResult1).assertClose(0.0, 1e-6)
      expect(dblResult1).assertClose(0.0, 1e-6)
      expect(floatResult1).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0820
     * @tc.name testMathAtan082
     * @tc.desc Verify atan2 returns -3PI/4 (third quadrant)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = -1.0
      let x: double = -1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-3.0 * Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0830
     * @tc.name testMathAtan083
     * @tc.desc Verify Math.atan2 with y=1.0, x=Number.POSITIVE_INFINITY returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(1.0, Number.POSITIVE_INFINITY)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0840
     * @tc.name testMathAtan084
     * @tc.desc Verify atan2 returns 0.7378150601204649 with input (long 10, long 11)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10
      let b: long = 11
      let result: double = Math.atan2(a, b)
      expect(result).assertClose(0.7378150601204649, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0850
     * @tc.name testMathAtan085
     * @tc.desc Verify atan2(-Infinity, 1.0) returns -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = Double.NEGATIVE_INFINITY
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(-Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0860
     * @tc.name testMathAtan086
     * @tc.desc Verify Math.atan2 extreme values still in range [-PI, PI]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(1e308, -1e308)
      let exprResult: boolean = result >= -Math.PI && result <= Math.PI
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0870
     * @tc.name testMathAtan087
     * @tc.desc Verify atan2 throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.atan2(c as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0880
     * @tc.name testMathAtan088
     * @tc.desc Verify Math.atan2(-0, -0) returns -PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(-0, -0)
      let exprResult: boolean = Math.abs(result + Math.PI) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0890
     * @tc.name testMathAtan089
     * @tc.desc Verify atan2: atan2(0, x) = 0 for x>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.atan2(0, 1.0)).assertClose(0.0, 1e-6)
      expect(Math.atan2(0, 5.0)).assertClose(0.0, 1e-6)
      expect(Math.atan2(0, 100.0)).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0900
     * @tc.name testMathAtan090
     * @tc.desc Verify atan2 with NaN returns NaN with input y, x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = Float.NaN
      let x: double = 1.0
      let result: double = Math.atan2(y, x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0910
     * @tc.name testMathAtan091
     * @tc.desc Verify atan2 returns PI with input y, x [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 0.0f
      let x: float = -2.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0920
     * @tc.name testMathAtan092
     * @tc.desc Verify atan2: atan2(byte y 0 + short x 1) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = 0
      let x: short = 1
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0930
     * @tc.name testMathAtan093
     * @tc.desc Verify atan2 returns PI with input y, x [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: byte = 0
      let x: int = -1
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0940
     * @tc.name testMathAtan094
     * @tc.desc Verify Math.atan2 float overload with y=1.0f, x=1.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 1.0f
      let x: float = 1.0f
      let result: float = Math.atan2(y, x)
      let exprResult: boolean = Math.abs(result - Math.PI / 4) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0950
     * @tc.name testMathAtan095
     * @tc.desc Verify atan2: atan2(int y 1 + float x 0.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: int = 1
      let x: float = 0.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0960
     * @tc.name testMathAtan096
     * @tc.desc Verify atan2 throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
        Math.atan2(matrix as Object as double, matrix as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0970
     * @tc.name testMathAtan097
     * @tc.desc Verify atan2: atan2(y,x) = PI when y=0, x<0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let yVal: double = 0.0
        let xVal: double = -1.0
        let result: double = Math.atan2(yVal, xVal)
        expect(result).assertClose(Math.PI, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0980
     * @tc.name testMathAtan098
     * @tc.desc Verify Math.atan2 with y=1.0, x=-1.0 returns 3PI/4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(1.0, -1.0)
      let exprResult: boolean = Math.abs(result - 3 * Math.PI / 4) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_0990
     * @tc.name testMathAtan099
     * @tc.desc Verify atan2: atan2(float y 2.0f + double x 2.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 2.0f
      let x: double = 2.0
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1000
     * @tc.name testMathAtan100
     * @tc.desc Verify atan2 throws ClassCastError with string 'abc' as second argument parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.atan2(1.0, 'abc' as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1010
     * @tc.name testMathAtan101
     * @tc.desc Verify atan2: atan2(double y 3.0 + float x 0.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 3.0
      let x: float = 0.0f
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1020
     * @tc.name testMathAtan102
     * @tc.desc Verify atan2: atan2(float y 1.0f + int x 1.0) normal values(arguments swapped)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: float = 1.0f
      let x: int = 1
      let result: double = Math.atan2(y, x)
      expect(result).assertClose(Math.PI / 4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1030
     * @tc.name testMathAtan103
     * @tc.desc Verify Math.atan2 consistency with Math.atan when x>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let y: double = 2.0
      let x: double = 3.0
      let result: double = Math.atan2(y, x)
      let expected: double = Math.atan(y / x)
      let exprResult: boolean = Math.abs(result - expected) < 1e-6
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1040
     * @tc.name testMathAtan104
     * @tc.desc Verify atan2 throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.atan2(longStr as Object as double, longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1050
     * @tc.name testMathAtan105
     * @tc.desc Verify Math.atan2(-0, 0) returns double -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan2(-0, 0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN2_1060
     * @tc.name testMathAtan106
     * @tc.desc Verify atan2: atan2(y, x) = atan2(-y, -x) + PI quadrant property
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let yVal: double = 1.0
      let xVal: double = 1.0
      let r1: double = Math.atan2(yVal, xVal)
      let r2: double = Math.atan2(-yVal, -xVal) + Math.PI
      let isClose: boolean = Math.abs(r1 - r2) < 1e-9
      expect(isClose).assertTrue()
    });

  });
}
