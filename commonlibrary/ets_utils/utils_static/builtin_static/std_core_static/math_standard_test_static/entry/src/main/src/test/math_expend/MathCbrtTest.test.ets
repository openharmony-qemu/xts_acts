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

export default function mathCbrtTest(): void {
  describe('MathCbrtTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0010
     * @tc.name testMathCbrt001
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 0) and cbrt(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0020
     * @tc.name testMathCbrt002
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 1) and cbrt(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0030
     * @tc.name testMathCbrt003
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int -1) and cbrt(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(-1.0)
      expect(result2).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0040
     * @tc.name testMathCbrt004
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 0) and cbrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0050
     * @tc.name testMathCbrt005
     * @tc.desc Verify cbrt cross-type consistency: cbrt(byte 1) and cbrt(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0060
     * @tc.name testMathCbrt006
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short 15) and cbrt(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertClose(2.466212074330470, 1e-6)
      expect(result2).assertClose(2.466212074330470, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0070
     * @tc.name testMathCbrt007
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short -30) and cbrt(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertClose(-3.107232505953859, 1e-6)
      expect(result2).assertClose(-3.107232505953859, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0080
     * @tc.name testMathCbrt008
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short 0) and cbrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0090
     * @tc.name testMathCbrt009
     * @tc.desc Verify cbrt cross-type consistency: cbrt(short 1) and cbrt(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0100
     * @tc.name testMathCbrt010
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int 100) and cbrt(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertClose(4.641588833612779, 1e-6)
      expect(result2).assertClose(4.641588833612779, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0110
     * @tc.name testMathCbrt011
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int 1) and cbrt(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(1.0)
      expect(result2).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0120
     * @tc.name testMathCbrt012
     * @tc.desc Verify cbrt cross-type consistency: cbrt(int 0) and cbrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0130
     * @tc.name testMathCbrt013
     * @tc.desc Verify cbrt cross-type consistency: cbrt(long 0) and cbrt(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0140
     * @tc.name testMathCbrt014
     * @tc.desc Verify cbrt cross-type consistency: cbrt(long 0) and cbrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0150
     * @tc.name testMathCbrt015
     * @tc.desc Verify cbrt cross-type consistency: cbrt(float 0.0f) and cbrt(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      expect(result1).assertEqual(0.0)
      expect(result2).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0160
     * @tc.name testMathCbrt016
     * @tc.desc Verify cbrt idempotent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: byte = 0
      let val3: byte = 0
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      let result3: double = Math.cbrt(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0170
     * @tc.name testMathCbrt017
     * @tc.desc Verify cbrt idempotent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: short = 1
      let val3: short = 1
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      let result3: double = Math.cbrt(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0180
     * @tc.name testMathCbrt018
     * @tc.desc Verify cbrt idempotent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: int = -1
      let val3: int = -1
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      let result3: double = Math.cbrt(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0190
     * @tc.name testMathCbrt019
     * @tc.desc Verify cbrt idempotent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 10
      let val2: long = 10
      let val3: long = 10
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      let result3: double = Math.cbrt(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0200
     * @tc.name testMathCbrt020
     * @tc.desc Verify cbrt idempotent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 2
      let val2: float = 2
      let val3: float = 2
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      let result3: double = Math.cbrt(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0210
     * @tc.name testMathCbrt021
     * @tc.desc Verify cbrt idempotent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: double = 3
      let val2: double = 3
      let val3: double = 3
      let result1: double = Math.cbrt(val1)
      let result2: double = Math.cbrt(val2)
      let result3: double = Math.cbrt(val3)
      let isEqual1: boolean = result1 === result2
      let isEqual2: boolean = result2 === result3
      let isEqual3: boolean = result1 === result3
      expect(isEqual1).assertTrue()
      expect(isEqual2).assertTrue()
      expect(isEqual3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0220
     * @tc.name testMathCbrt022
     * @tc.desc Verify cbrt: cbrt(x)^3 = x holds for all numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 27.0
      let cbrtX: double = Math.cbrt(x)
      let cube: double = cbrtX * cbrtX * cbrtX
      expect(cube).assertClose(x, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0230
     * @tc.name testMathCbrt023
     * @tc.desc Verify cbrt: cbrt(x^3) = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.0
      let cube: double = x * x * x
      let cbrtCube: double = Math.cbrt(cube)
      expect(cbrtCube).assertClose(x, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0240
     * @tc.name testMathCbrt024
     * @tc.desc Verify cbrt: cbrt(x)^3 equals x for values in [-64.0, 125.0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [1.0, 8.0, 64.0, 125.0, -27.0, -64.0]
      for (let i: int = 0; i < xs.length; i++) {    
        let cr: double = Math.cbrt(xs[i])
        expect(cr * cr * cr).assertClose(xs[i], 1e-9)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0250
     * @tc.name testMathCbrt025
     * @tc.desc Verify cbrt: cbrt(a*b) = cbrt(a)*cbrt(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 8.0
      let b: double = 27.0
      let left: double = Math.cbrt(a * b)
      let right: double = Math.cbrt(a) * Math.cbrt(b)
      expect(left).assertClose(right, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0260
     * @tc.name testMathCbrt026
     * @tc.desc Verify cbrt: cbrt(a/b) = cbrt(a)/cbrt(b) (b != 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 216.0
      let b: double = 8.0
      expect(Math.cbrt(a / b)).assertClose(Math.cbrt(a) / Math.cbrt(b), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0270
     * @tc.name testMathCbrt027
     * @tc.desc Verify cbrt: cbrt(-x) = -cbrt(x) odd function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(-27.0)).assertEqual(-Math.cbrt(27.0))
      expect(Math.cbrt(-64.0)).assertEqual(-Math.cbrt(64.0))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0280
     * @tc.name testMathCbrt028
     * @tc.desc Verify cbrt: cbrt(exp(3)) = exp(1) = E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.exp(3.0)
      let result: double = Math.cbrt(x)
      expect(result).assertClose(Math.E, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0290
     * @tc.name testMathCbrt029
     * @tc.desc Verify cbrt: cbrt(pow(x,3)) = |x|
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.0
      expect(Math.cbrt(Math.pow(x, 3.0))).assertClose(3.0, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0300
     * @tc.name testMathCbrt030
     * @tc.desc Verify cbrt: cbrt(-1.0) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -1.0
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0310
     * @tc.name testMathCbrt031
     * @tc.desc Verify cbrt: cbrt(-27.0) = -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -27.0
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(-3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0320
     * @tc.name testMathCbrt032
     * @tc.desc Verify cbrt: cbrt(2.0)^3 = 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr: double = Math.cbrt(2.0)
      expect(cr * cr * cr).assertClose(2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0330
     * @tc.name testMathCbrt033
     * @tc.desc Verify cbrt: cbrt(0.5)^3 = 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr: double = Math.cbrt(0.5)
      let isClose: boolean = Math.abs(cr * cr * cr - 0.5) < 1e-6
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0340
     * @tc.name testMathCbrt034
     * @tc.desc Verify cbrt: cbrt(-2.0) returns approximately -1.2599210498948732
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -2.0
      let result: double = Math.cbrt(val)
      expect(result).assertClose(-1.2599210498948732, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0350
     * @tc.name testMathCbrt035
     * @tc.desc Verify cbrt: cbrt(Double.MAX_VALUE) finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.MAX_VALUE
      let result: double = Math.cbrt(val)
      expect(Number.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0360
     * @tc.name testMathCbrt036
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.cbrt(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0370
     * @tc.name testMathCbrt037
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'abc'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0380
     * @tc.name testMathCbrt038
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.cbrt(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0390
     * @tc.name testMathCbrt039
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.cbrt(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0400
     * @tc.name testMathCbrt040
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.cbrt(null as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0410
     * @tc.name testMathCbrt041
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.cbrt(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0420
     * @tc.name testMathCbrt042
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.cbrt(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0430
     * @tc.name testMathCbrt043
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.cbrt(map as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0440
     * @tc.name testMathCbrt044
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.cbrt(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0450
     * @tc.name testMathCbrt045
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.cbrt(arr as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0460
     * @tc.name testMathCbrt046
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.cbrt(matrix as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0470
     * @tc.name testMathCbrt047
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.cbrt(list as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0480
     * @tc.name testMathCbrt048
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.cbrt(set as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0490
     * @tc.name testMathCbrt049
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.cbrt(Color.RED as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0500
     * @tc.name testMathCbrt050
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = ''
        Math.cbrt(str as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0510
     * @tc.name testMathCbrt051
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '\u200B'
        Math.cbrt(str as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0520
     * @tc.name testMathCbrt052
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '<script>alert(1)</script>'
        Math.cbrt(str as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0530
     * @tc.name testMathCbrt053
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.cbrt(fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0540
     * @tc.name testMathCbrt054
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.cbrt(u as Object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0550
     * @tc.name testMathCbrt055
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.cbrt(longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0560
     * @tc.name testMathCbrt056
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0570
     * @tc.name testMathCbrt057
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '\u{1F600}测试'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0580
     * @tc.name testMathCbrt058
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'テスト'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0590
     * @tc.name testMathCbrt059
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '테스트'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0600
     * @tc.name testMathCbrt060
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'АБВГД'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0610
     * @tc.name testMathCbrt061
     * @tc.desc Verify cbrt: cbrt(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 27.0
      let first: double = Math.cbrt(input)
      let second: double = Math.cbrt(input)
      let third: double = Math.cbrt(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0620
     * @tc.name testMathCbrt062
     * @tc.desc Verify cbrt: cbrt(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.cbrt(intVal)
      let dblResult: double = Math.cbrt(dblVal)
      let floatResult: double = Math.cbrt(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0630
     * @tc.name testMathCbrt063
     * @tc.desc Verify cbrt: cbrt(8) = 2 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 8
      let dblVal: double = 8.0
      let floatVal: float = 8.0f
      let intResult: double = Math.cbrt(intVal)
      let dblResult: double = Math.cbrt(dblVal)
      let floatResult: double = Math.cbrt(floatVal)
      expect(intResult).assertEqual(2.0)
      expect(dblResult).assertEqual(2.0)
      expect(floatResult).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0640
     * @tc.name testMathCbrt064
     * @tc.desc Verify cbrt: cbrt(1) = 1 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.cbrt(intVal)
      let dblResult: double = Math.cbrt(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0650
     * @tc.name testMathCbrt065
     * @tc.desc Verify cbrt: cbrt(+Infinity) returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.POSITIVE_INFINITY
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0660
     * @tc.name testMathCbrt066
     * @tc.desc Verify cbrt: cbrt(-Infinity) returns Double.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.NEGATIVE_INFINITY
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0670
     * @tc.name testMathCbrt067
     * @tc.desc Verify cbrt with NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = Double.NaN
      let result: double = Math.cbrt(val)
      expect(Number.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0680
     * @tc.name testMathCbrt068
     * @tc.desc Verify cbrt: cbrt(0.0) with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {    
        let val: double = 0.0
        let result: double = Math.cbrt(val)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0690
     * @tc.name testMathCbrt069
     * @tc.desc Verify cbrt: cbrt(x)^3 = x for all x holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-125.0, -64.0, -27.0, -8.0, -1.0, 0.0, 1.0, 8.0, 27.0, 64.0, 125.0]
      for (let i: int = 0; i < xs.length; i++) {    
        let cr: double = Math.cbrt(xs[i])
        let isClose: boolean = Math.abs(cr * cr * cr - xs[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0700
     * @tc.name testMathCbrt070
     * @tc.desc Verify cbrt: cbrt(integer) and cbrt(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(0)).assertClose(Math.cbrt(0.0), 1e-9)
      expect(Math.cbrt(1)).assertClose(Math.cbrt(1.0), 1e-9)
      expect(Math.cbrt(8)).assertClose(Math.cbrt(8.0), 1e-9)
      expect(Math.cbrt(27)).assertClose(Math.cbrt(27.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0710
     * @tc.name testMathCbrt071
     * @tc.desc Verify cbrt: cbrt odd function cbrt(-x) = -cbrt(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [1.0, 8.0, 27.0, 64.0, 125.0]
      for (let i: int = 0; i < vs.length; i++) {    expect(Math.cbrt(-vs[i])).assertEqual(-Math.cbrt(vs[i]))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0720
     * @tc.name testMathCbrt072
     * @tc.desc Verify cbrt: cbrt(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-1000.0, -1.0, 0.0, 1.0, 1000.0, 1e10, 1e20]
      for (let i: int = 0; i < vs.length; i++) {    expect(Number.isFinite(Math.cbrt(vs[i]))).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0730
     * @tc.name testMathCbrt073
     * @tc.desc Verify cbrt: cbrt(int)^3 equals int for ints in [-64, 125]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 8, 27, 64, 125, -1, -8, -27, -64]
      for (let i: int = 0; i < ints.length; i++) {    
        let cr: double = Math.cbrt(ints[i])
        let isClose: boolean = Math.abs(cr * cr * cr - ints[i]) < 1e-9
        expect(isClose).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0740
     * @tc.name testMathCbrt074
     * @tc.desc Verify cbrt: cbrt(-1000.0) returns -10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -1000.0
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(-10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0750
     * @tc.name testMathCbrt075
     * @tc.desc Verify cbrt: cbrt(0.027) cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.027
      let result: double = Math.cbrt(val)
      let isClose: boolean = Math.abs(result - 0.3) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0760
     * @tc.name testMathCbrt076
     * @tc.desc Verify cbrt: cbrt(float 8.0f) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 8.0f
      let result: float = Math.cbrt(val)
      expect(result).assertEqual(2.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0770
     * @tc.name testMathCbrt077
     * @tc.desc Verify cbrt: cbrt(float -8.0f) returns -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = -8.0f
      let result: float = Math.cbrt(val)
      expect(result).assertEqual(-2.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0780
     * @tc.name testMathCbrt078
     * @tc.desc Verify cbrt: cbrt(float 0.0f) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.0f
      let result: float = Math.cbrt(val)
      expect(result).assertEqual(0.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0790
     * @tc.name testMathCbrt079
     * @tc.desc Verify cbrt with NaN returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.NaN
      let result: float = Math.cbrt(val)
      expect(Number.isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0800
     * @tc.name testMathCbrt080
     * @tc.desc Verify cbrt: cbrt(float +Infinity) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.POSITIVE_INFINITY
      let result: float = Math.cbrt(val)
      expect(result).assertEqual(Float.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0810
     * @tc.name testMathCbrt081
     * @tc.desc Verify cbrt: cbrt(float -Infinity) returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.NEGATIVE_INFINITY
      let result: float = Math.cbrt(val)
      expect(result).assertEqual(Float.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0820
     * @tc.name testMathCbrt082
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550e8400-e29b-41d4-a716-446655440000'
        Math.cbrt(val as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0830
     * @tc.name testMathCbrt083
     * @tc.desc Verify cbrt throws ClassCastError with invalid parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'الاختبار'
        Math.cbrt(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0840
     * @tc.name testMathCbrt084
     * @tc.desc Verify cbrt: cbrt(scientific notation 2.7e1) = cbrt(27) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 2.7e1
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0850
     * @tc.name testMathCbrt085
     * @tc.desc Verify cbrt: cbrt(hex literal 0x8) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0x8
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0860
     * @tc.name testMathCbrt086
     * @tc.desc Verify cbrt: cbrt(binary literal 0b1000) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b1000
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(2.0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0870
     * @tc.name testMathCbrt087
     * @tc.desc Verify cbrt: cbrt(short 8) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 8
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0880
     * @tc.name testMathCbrt088
     * @tc.desc Verify cbrt: cbrt(long 8) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 8
      let result: double = Math.cbrt(val)
      expect(result).assertEqual(2.0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0890
     * @tc.name testMathCbrt089
     * @tc.desc Verify Math.cbrt with 1 required parameter executes normally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(8.0)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0900
     * @tc.name testMathCbrt090
     * @tc.desc Verify Math.cbrt double overload with 0.0 returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(0.0)).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0910
     * @tc.name testMathCbrt091
     * @tc.desc Verify Math.cbrt double overload with -8.0 returns -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exprResult: double = Math.cbrt(-8.0)
      expect(exprResult).assertEqual(-2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0920
     * @tc.name testMathCbrt092
     * @tc.desc Verify Math.cbrt with Number.NaN returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN(Math.cbrt(Number.NaN))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0930
     * @tc.name testMathCbrt093
     * @tc.desc Verify Math.cbrt with Number.POSITIVE_INFINITY returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.cbrt(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0940
     * @tc.name testMathCbrt094
     * @tc.desc Verify Math.cbrt with -Number.NEGATIVE_INFINITY returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exprResult: double = Math.cbrt(-Number.NEGATIVE_INFINITY)
      expect(exprResult).assertEqual(-Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0950
     * @tc.name testMathCbrt095
     * @tc.desc Verify Math.cbrt with -0.0 returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(-0.0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0960
     * @tc.name testMathCbrt096
     * @tc.desc Verify Math.cbrt with MAX_VALUE returns finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.cbrt(Number.MAX_VALUE)
      expect(Number.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0970
     * @tc.name testMathCbrt097
     * @tc.desc Verify Math.cbrt with MIN_VALUE returns positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.cbrt(Number.MIN_VALUE)
      expect(result > 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0980
     * @tc.name testMathCbrt098
     * @tc.desc Verify Math.cbrt with 1e-10 returns correct cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(1e-10)
      let expected: double = 1e-10 ** (1.0 / 3.0)
      let exprResult: boolean = Math.abs(result - expected) < 1e-9
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0990
     * @tc.name testMathCbrt099
     * @tc.desc Verify Math.cbrt with 1e10 returns correct cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(1e10)
      let expected: double = 1e10 ** (1.0 / 3.0)
      let exprResult: boolean = Math.abs(result - expected) / expected < 1e-4
      expect(exprResult).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1000
     * @tc.name testMathCbrt100
     * @tc.desc Verify Math.cbrt float overload with 0.0f returns 0.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.0f
      expect(Math.cbrt(val)).assertEqual(0.0f)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1010
     * @tc.name testMathCbrt101
     * @tc.desc Verify Math.cbrt float overload with Number.NaN returns Number.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.NaN
      expect(Number.isNaN(Math.cbrt(val))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1020
     * @tc.name testMathCbrt102
     * @tc.desc Verify Math.cbrt float overload with Number.POSITIVE_INFINITY returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = Float.POSITIVE_INFINITY
      expect(Math.cbrt(val)).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1030
     * @tc.name testMathCbrt103
     * @tc.desc Verify Math.cbrt odd function: cbrt(-x) = -cbrt(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let exprResult: double = Math.cbrt(-27.0)
      expect(exprResult).assertClose(-Math.cbrt(27.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1040
     * @tc.name testMathCbrt104
     * @tc.desc Verify Math.cbrt power relation: cbrt(x)^3 = x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(8.0)
      let exprResult: double = result * result * result
      expect(exprResult).assertClose(8.0, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1050
     * @tc.name testMathCbrt105
     * @tc.desc Verify Math.cbrt return type is number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(8.0)
      expect(Number.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1060
     * @tc.name testMathCbrt106
     * @tc.desc Verify Math.cbrt float return type is number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 8.0f
      let result: number = Math.cbrt(val)
      expect(Number.isFinite(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1070
     * @tc.name testMathCbrt107
     * @tc.desc Verify cbrt: cbrt(-Infinity) returns Number.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            expect(Math.cbrt(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1080
     * @tc.name testMathCbrt108
     * @tc.desc Verify cbrt: cbrt(-0.0) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let result: number = Math.cbrt(-0.0)
            expect(result === 0 && 1 / result === Number.NEGATIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1090
     * @tc.name testMathCbrt109
     * @tc.desc Verify cbrt: cbrt(1e-10) returns the correct cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            expect(Math.cbrt(1e-10)).assertClose(1e-10 ** (1.0 / 3.0), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1100
     * @tc.name testMathCbrt110
     * @tc.desc Verify cbrt: cbrt(0.0) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let val: number = 0.0
            expect(Math.cbrt(val)).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1110
     * @tc.name testMathCbrt111
     * @tc.desc Verify cbrt: cbrt(1.0) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let val: number = 1.0
            expect(Math.cbrt(val)).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1120
     * @tc.name testMathCbrt112
     * @tc.desc Verify cbrt: cbrt(8.0) returns 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let val: number = 8.0
            expect(Math.cbrt(val)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1130
     * @tc.name testMathCbrt113
     * @tc.desc Verify cbrt: cbrt(-8.0) returns -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let val: number = -8.0
            expect(Math.cbrt(val)).assertEqual(-2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1140
     * @tc.name testMathCbrt114
     * @tc.desc Verify cbrt: cbrt(NaN) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let val: number = Number.NaN
            expect(Number.isNaN(Math.cbrt(val))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1150
     * @tc.name testMathCbrt115
     * @tc.desc Verify cbrt: cbrt(Infinity) returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let val: number = Number.POSITIVE_INFINITY
            expect(Math.cbrt(val)).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1160
     * @tc.name testMathCbrt116
     * @tc.desc Verify cbrt: float type input returns number type result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 8.0
      let result: double = Math.cbrt(val)
      expect(result).assertClose(2.0, 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1170
     * @tc.name testMathCbrt117
     * @tc.desc Verify cbrt: cube root of positive zero is positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(0.0)
      expect(result).assertEqual(0.0)
      expect(result === 0 && 1 / result === Number.POSITIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1180
     * @tc.name testMathCbrt118
     * @tc.desc Verify cbrt: cube root of negative zero is negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(-0.0)
      expect(result === 0 && 1 / result === Number.NEGATIVE_INFINITY).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1190
     * @tc.name testMathCbrt119
     * @tc.desc Verify cbrt: double type input returns number type result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cbrt(8.0)
      expect(result).assertClose(2.0, 1e-9)
    });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1200
         * @tc.name testMathCbrt120
         * @tc.desc Verify cbrt: cbrt(NaN) returns NaN (try-catch)
         * @tc.size MEDIUMTEST
         * @tc.type FUNCTION
         * @tc.level LEVEL2
         */
        it('testMathCbrt120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                let r: number = Math.cbrt(Number.NaN)
                expect(Number.isNaN(r)).assertTrue()
            } catch (e) {
                expect(e != null).assertTrue()
            }
    });
  });
}
