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

export default function mathMinTest2(): void {
  describe('MathMinTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0100
     * @tc.name testMathMin001
     * @tc.desc Verify min throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.min(c as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0200
     * @tc.name testMathMin002
     * @tc.desc Verify min returns 5.0 with input (short 10, short 5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10
      let b: short = 5
      let result: double = Math.min(a, b)
      expect(result).assertClose(5.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0300
     * @tc.name testMathMin003
     * @tc.desc Verify min throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.min(obj as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0400
     * @tc.name testMathMin004
     * @tc.desc Verify min with NaN returns NaN with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NaN
      let b: double = 1.0
      let result: double = Math.min(a, b)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0500
     * @tc.name testMathMin005
     * @tc.desc Verify min: min(short 1, short 3) and min(int 1, int 3) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sR: double = Math.min(1 as short, 3 as short)
      let iR: double = Math.min(1 as int, 3 as int)
      expect(sR).assertClose(iR, 1e-6)
      expect(sR).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0600
     * @tc.name testMathMin006
     * @tc.desc Verify min throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.min(true as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0700
     * @tc.name testMathMin007
     * @tc.desc Verify min: min(byte 3 + short 5) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 3
      let b: short = 5
      let result: double = Math.min(a, b)
      expect(result).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0800
     * @tc.name testMathMin008
     * @tc.desc Verify min throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.min('abc' as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0900
     * @tc.name testMathMin009
     * @tc.desc Verify min returns -0.0 with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 0.0
      let b: double = -0.0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1000
     * @tc.name testMathMin010
     * @tc.desc Verify min: min(short 6 + float 9.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 6
      let b: float = 9.0f
      let result: double = Math.min(a, b)
      expect(result).assertEqual(6.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1100
     * @tc.name testMathMin011
     * @tc.desc Verify Math.min with -0.0 and 0.0 returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.min(-0.0, 0.0)
      expect(1 / result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1200
     * @tc.name testMathMin012
     * @tc.desc Verify min throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.min(arr as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1300
     * @tc.name testMathMin013
     * @tc.desc Verify min: min(short -5, short 0) = -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -5
      let b: short = 0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(-5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1400
     * @tc.name testMathMin014
     * @tc.desc Verify min: min(byte 2, byte 7) and min(int 2, int 7) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bR: double = Math.min(2 as byte, 7 as byte)
      let iR: double = Math.min(2 as int, 7 as int)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertClose(2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1500
     * @tc.name testMathMin015
     * @tc.desc Verify min: min(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[][] = [[1.0,2.0],[-3.0,4.0],[0.0,0.0],[1e5,1e10]]
      let exp: double[] = [1.0, -3.0, 0.0, 100000.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.min(vs[i][0], vs[i][1])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1600
     * @tc.name testMathMin016
     * @tc.desc Verify min: min(0, 0, 0, 0) = 0(all equal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(0.0, 0.0, 0.0, 0.0)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1700
     * @tc.name testMathMin017
     * @tc.desc Verify min returns 3.0 with input byte 5, byte 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathMin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 5
      let b: byte = 3
      let result: double = Math.min(a, b)
      expect(result).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1800
     * @tc.name testMathMin018
     * @tc.desc Verify min: min(byte 0, byte 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0
      let b: byte = 0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1900
     * @tc.name testMathMin019
     * @tc.desc Verify min: min(long 10 + float 15.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10
      let b: float = 15.0f
      let result: double = Math.min(a, b)
      expect(result).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2000
     * @tc.name testMathMin020
     * @tc.desc Verify min returns 2.0 with input (float 3.5f, float 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 3.5f
      let b: float = 2.0f
      let result: double = Math.min(a, b)
      expect(result).assertClose(2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2100
     * @tc.name testMathMin021
     * @tc.desc Verify min: min(a, b) = min(b, a) symmetry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.min(3.0, 1.0)).assertClose(Math.min(1.0, 3.0), 1e-9)
      expect(Math.min(-1.0, 2.0)).assertClose(Math.min(2.0, -1.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2200
     * @tc.name testMathMin022
     * @tc.desc Verify min throws ClassCastError with Cyrillic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'АБВГД'
        Math.min(s as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2300
     * @tc.name testMathMin023
     * @tc.desc Verify min: min(byte 1, byte 10) short type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 1
      let b: byte = 10
      let result: double = Math.min(a, b)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2400
     * @tc.name testMathMin024
     * @tc.desc Verify min with infinity with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.POSITIVE_INFINITY
      let b: double = Double.POSITIVE_INFINITY
      let result: double = Math.min(a, b)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2500
     * @tc.name testMathMin025
     * @tc.desc Verify min: min(int -1, byte 1) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1
      let b: byte = 1
      let result: double = Math.min(a, b)
      expect(result).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2600
     * @tc.name testMathMin026
     * @tc.desc Verify min: min(short 0, short 32767) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0
      let b: short = 32767
      let result: double = Math.min(a, b)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2700
     * @tc.name testMathMin027
     * @tc.desc Verify Math.min(Double.POSITIVE_INFINITY, 1.0) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.min(Double.POSITIVE_INFINITY, 1.0)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2800
     * @tc.name testMathMin028
     * @tc.desc Verify min with infinity with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NEGATIVE_INFINITY
      let b: double = 1.0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2900
     * @tc.name testMathMin029
     * @tc.desc Verify min returns 7.0 with input (int 9, int 7)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 9
      let b: int = 7
      let result: double = Math.min(a, b)
      expect(result).assertClose(7.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3000
     * @tc.name testMathMin030
     * @tc.desc Verify min: min(the same value) consistent across all types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.min(0, 0)).assertEqual(0.0)
      expect(Math.min(0.0f, 0.0f)).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3100
     * @tc.name testMathMin031
     * @tc.desc Verify min: min(long 25 + double 30.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 25
      let b: double = 30.0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(25.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3200
     * @tc.name testMathMin032
     * @tc.desc Verify min with NaN returns NaN with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 1.0
      let b: double = Double.NaN
      let result: double = Math.min(a, b)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3300
     * @tc.name testMathMin033
     * @tc.desc Verify min returns -0.0 with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = -0.0
      let b: double = 0.0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(-0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3400
     * @tc.name testMathMin034
     * @tc.desc Verify min throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.min(fn as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3500
     * @tc.name testMathMin035
     * @tc.desc Verify min: min(byte 127, int -128) = -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127
      let b: int = -128
      let result: double = Math.min(a, b)
      expect(result).assertEqual(-128.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3600
     * @tc.name testMathMin036
     * @tc.desc Verify min throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.min(null as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3700
     * @tc.name testMathMin037
     * @tc.desc Verify min: min(int 5 + float 3.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 5
      let b: float = 3.0f
      let result: double = Math.min(a, b)
      expect(result).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3800
     * @tc.name testMathMin038
     * @tc.desc Verify min returns 6.0 with input (double 8.0, double 6.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 8.0
      let b: double = 6.0
      let result: double = Math.min(a, b)
      expect(result).assertClose(6.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3900
     * @tc.name testMathMin039
     * @tc.desc Verify min: min(long 10e9, long 20e9) = 10e9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10000000000
      let b: long = 20000000000
      let result: double = Math.min(a, b)
      expect(result).assertEqual(10000000000.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4000
     * @tc.name testMathMin040
     * @tc.desc Verify min: min(PI, E) = E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.PI
      let b: double = Math.E
      let result: double = Math.min(a, b as Object as double)
      expect(result).assertClose(Math.E, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4100
     * @tc.name testMathMin041
     * @tc.desc Verify min: min(int -999, int -1000) = -1000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -999
      let b: int = -1000
      let result: double = Math.min(a, b)
      expect(result).assertEqual(-1000.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4200
     * @tc.name testMathMin042
     * @tc.desc Verify Math.min with NaN among multiple values returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.min(1.0, 2.0, Double.NaN, 3.0)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4300
     * @tc.name testMathMin043
     * @tc.desc Verify min: min(float 2.5f + double 3.5) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2.5f
      let b: double = 3.5
      let result: double = Math.min(a, b)
      expect(result).assertEqual(2.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4400
     * @tc.name testMathMin044
     * @tc.desc Verify min: min(int 20 + double 10.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 20
      let b: double = 10.0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4500
     * @tc.name testMathMin045
     * @tc.desc Verify min returns 10.0 with input (long 20, long 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 20
      let b: long = 10
      let result: double = Math.min(a, b)
      expect(result).assertClose(10.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4600
     * @tc.name testMathMin046
     * @tc.desc Verify Math.min with hexadecimal int literals 0xA and 0x5 returns double 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0xA
      let b: int = 0x5
      let result: double = Math.min(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4700
     * @tc.name testMathMin047
     * @tc.desc Verify min throws ClassCastError with string '550Math.min(val as Object as double), 1.0' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550Math.min(val as Object as double), 1.0'
        Math.min(val as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4800
     * @tc.name testMathMin048
     * @tc.desc Verify min: min(byte 4 + int 12) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 4
      let b: int = 12
      let result: double = Math.min(a, b)
      expect(result).assertEqual(4.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4900
     * @tc.name testMathMin049
     * @tc.desc Verify min: min(int 0, int 2147483647) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0
      let b: int = 2147483647
      let result: double = Math.min(a, b)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5000
     * @tc.name testMathMin050
     * @tc.desc Verify min: min(short 8 + double 11.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 8
      let b: double = 11.0
      let result: double = Math.min(a, b)
      expect(result).assertEqual(8.0)
    });

  });
}
