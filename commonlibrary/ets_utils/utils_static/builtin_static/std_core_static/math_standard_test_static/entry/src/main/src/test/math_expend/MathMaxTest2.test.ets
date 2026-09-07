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

export default function mathMaxTest2(): void {
  describe('MathMaxTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0100
     * @tc.name testMathMax001
     * @tc.desc Verify max: max(byte 10 + double 3.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10
      let b: double = 3.0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0200
     * @tc.name testMathMax002
     * @tc.desc Verify max throws ClassCastError with Arabic string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'الاختبار'
        Math.max(s as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0300
     * @tc.name testMathMax003
     * @tc.desc Verify max: max(short 9 + float 6.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 9
      let b: float = 6.0f
      let result: double = Math.max(a, b)
      expect(result).assertEqual(9.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0400
     * @tc.name testMathMax004
     * @tc.desc Verify max: max(short 11 + double 8.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 11
      let b: double = 8.0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(11.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0500
     * @tc.name testMathMax005
     * @tc.desc Verify max with radix literal with input val [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b11111111
      let result: double = Math.max(val)
      expect(result).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0600
     * @tc.name testMathMax006
     * @tc.desc Verify max: max(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[][] = [[1.0,2.0],[-3.0,4.0],[0.0,0.0],[1e5,1e10]]
      let exp: double[] = [2.0, 4.0, 0.0, 10000000000.0]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.max(vs[i][0], vs[i][1])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0700
     * @tc.name testMathMax007
     * @tc.desc Verify max returns 20.0 with input (long 20, long 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 20
      let b: long = 10
      let result: double = Math.max(a, b)
      expect(result).assertClose(20.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0800
     * @tc.name testMathMax008
     * @tc.desc Verify Math.max(1.0, 2.0, NaN, 3.0) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.max(1.0, 2.0, Double.NaN, 3.0)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0900
     * @tc.name testMathMax009
     * @tc.desc Verify max throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.max(null as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1000
     * @tc.name testMathMax010
     * @tc.desc Verify max returns 10.0 with input (short 10, short 5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10
      let b: short = 5
      let result: double = Math.max(a, b)
      expect(result).assertClose(10.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1100
     * @tc.name testMathMax011
     * @tc.desc Verify max: max(short 32767, short 0) = 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767
      let b: short = 0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(32767.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1200
     * @tc.name testMathMax012
     * @tc.desc Verify max: max(long 15 + float 10.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 15
      let b: float = 10.0f
      let result: double = Math.max(a, b)
      expect(result).assertEqual(15.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1300
     * @tc.name testMathMax013
     * @tc.desc Verify max: max(byte 127, int -128) = 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127
      let b: int = -128
      let result: double = Math.max(a, b)
      expect(result).assertEqual(127.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1400
     * @tc.name testMathMax014
     * @tc.desc Verify Math.max with double NaN and double 1.0 returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NaN
      let b: double = 1.0
      let result: double = Math.max(a, b)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1500
     * @tc.name testMathMax015
     * @tc.desc Verify max: max(byte 2 + short 8) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 2
      let b: short = 8
      let result: double = Math.max(a, b)
      expect(result).assertEqual(8.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1600
     * @tc.name testMathMax016
     * @tc.desc Verify max: max(int -1, byte 1) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1
      let b: byte = 1
      let result: double = Math.max(a, b)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1700
     * @tc.name testMathMax017
     * @tc.desc Verify max throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.max(true as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1800
     * @tc.name testMathMax018
     * @tc.desc Verify max returns 3.5 with input (float 3.5f, float 2.0f)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 3.5f
      let b: float = 2.0f
      let result: double = Math.max(a, b)
      expect(result).assertClose(3.5, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1900
     * @tc.name testMathMax019
     * @tc.desc Verify max throws ClassCastError with string '550Math.max(val as Object as double), 1.0' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550Math.max(val as Object as double), 1.0'
        Math.max(val as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2000
     * @tc.name testMathMax020
     * @tc.desc Verify max returns 5.0 with input byte 5, byte 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathMax020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 5
      let b: byte = 3
      let result: double = Math.max(a, b)
      expect(result).assertClose(5.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2100
     * @tc.name testMathMax021
     * @tc.desc Verify max with radix literal with input val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 511
      let result: double = Math.max(val)
      expect(result).assertEqual(511)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2200
     * @tc.name testMathMax022
     * @tc.desc Verify Math.max with zero and negative returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.max(0.0, -1.0)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2300
     * @tc.name testMathMax023
     * @tc.desc Verify max: max(0, 0, 0, 0) = 0(all equal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(0.0, 0.0, 0.0, 0.0)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2400
     * @tc.name testMathMax024
     * @tc.desc Verify max throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.max('abc' as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2500
     * @tc.name testMathMax025
     * @tc.desc Verify Math.max with both Infinity values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.max(Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2600
     * @tc.name testMathMax026
     * @tc.desc Verify max: max(short 100, short 50) = 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 100
      let b: short = 50
      let result: double = Math.max(a, b)
      expect(result).assertEqual(100.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2700
     * @tc.name testMathMax027
     * @tc.desc Verify Math.max(Double.NEGATIVE_INFINITY, 1.0) returns 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.max(Double.NEGATIVE_INFINITY, 1.0)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2800
     * @tc.name testMathMax028
     * @tc.desc Verify max: max(byte 3, byte 5) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 3
      let b: byte = 5
      let result: double = Math.max(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2900
     * @tc.name testMathMax029
     * @tc.desc Verify max throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.max(obj as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3000
     * @tc.name testMathMax030
     * @tc.desc Verify Math.max with NaN first argument returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.max(Double.NaN, 1.0)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3100
     * @tc.name testMathMax031
     * @tc.desc Verify max: max(byte 12 + int 20) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 12
      let b: int = 20
      let result: double = Math.max(a, b)
      expect(result).assertEqual(20.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3200
     * @tc.name testMathMax032
     * @tc.desc Verify max: max(byte 2, byte 7) and max(int 2, int 7) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bR: double = Math.max(2 as byte, 7 as byte)
      let iR: double = Math.max(2 as int, 7 as int)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertClose(7.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3300
     * @tc.name testMathMax033
     * @tc.desc Verify max: max(PI, E) = PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.PI
      let b: double = Math.E
      let result: double = Math.max(a, b)
      expect(result).assertClose(Math.PI, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3400
     * @tc.name testMathMax034
     * @tc.desc Verify max: max(float 3.5f + double 2.5) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 3.5f
      let b: double = 2.5
      let result: double = Math.max(a, b as Object as double)
      expect(result).assertEqual(3.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3500
     * @tc.name testMathMax035
     * @tc.desc Verify max with infinity with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NEGATIVE_INFINITY
      let b: double = Double.NEGATIVE_INFINITY
      let result: double = Math.max(a, b)
      expect(result).assertEqual(Double.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3600
     * @tc.name testMathMax036
     * @tc.desc Verify max: max(-5, -3, -1) = -1(multiple negative numbers)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-5.0, -3.0, -1.0)
      expect(result).assertEqual(-1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3700
     * @tc.name testMathMax037
     * @tc.desc Verify max: max(long 30 + double 25.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 30
      let b: double = 25.0
      let result: double = Math.max(a, b as Object as double)
      expect(result).assertEqual(30.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3800
     * @tc.name testMathMax038
     * @tc.desc Verify max throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.max(fn as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3900
     * @tc.name testMathMax039
     * @tc.desc Verify max: max(short -5, short 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -5
      let b: short = 0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4000
     * @tc.name testMathMax040
     * @tc.desc Verify Math.max with -0.0 and 0.0 returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.max(-0.0, 0.0)
      expect(1 / result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4100
     * @tc.name testMathMax041
     * @tc.desc Verify max with radix literal with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0xA
      let b: int = 0x5
      let result: double = Math.max(a, b)
      expect(result).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4200
     * @tc.name testMathMax042
     * @tc.desc Verify max: max(long 1e10, long 2e10) = 2e10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10000000000
      let b: long = 20000000000
      let result: double = Math.max(a, b)
      expect(result).assertEqual(20000000000.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4300
     * @tc.name testMathMax043
     * @tc.desc Verify max: max(a, b) = max(b, a) symmetry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.max(3.0, 5.0)).assertClose(Math.max(5.0, 3.0), 1e-9)
      expect(Math.max(-1.0, 2.0)).assertClose(Math.max(2.0, -1.0), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4400
     * @tc.name testMathMax044
     * @tc.desc Verify max throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.max(c as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4500
     * @tc.name testMathMax045
     * @tc.desc Verify max returns 9.0 with input (int 7, int 9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 7
      let b: int = 9
      let result: double = Math.max(a, b)
      expect(result).assertClose(9.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4600
     * @tc.name testMathMax046
     * @tc.desc Verify max returns 8.0 with input (double 8.0, double 6.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 8.0
      let b: double = 6.0
      let result: double = Math.max(a, b)
      expect(result).assertClose(8.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4700
     * @tc.name testMathMax047
     * @tc.desc Verify max throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.max(arr as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4800
     * @tc.name testMathMax048
     * @tc.desc Verify max: max(the same value) consistent across all types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.max(0, 0)).assertEqual(0.0)
      expect(Math.max(0.0f, 0.0f)).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4900
     * @tc.name testMathMax049
     * @tc.desc Verify Math.max with int values 2147483647 and 0 returns double 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483647
      let b: int = 0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(2147483647.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5000
     * @tc.name testMathMax050
     * @tc.desc Verify max: max(int -1000, int -999) = -999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1000
      let b: int = -999
      let result: double = Math.max(a, b)
      expect(result).assertEqual(-999.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5100
     * @tc.name testMathMax051
     * @tc.desc Verify max: max(int 3 + float 5.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 3
      let b: float = 5.0f
      let result: double = Math.max(a, b)
      expect(result).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5200
     * @tc.name testMathMax052
     * @tc.desc Verify max: max(int 10 + double 20.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 10
      let b: double = 20.0
      let result: double = Math.max(a, b as Object as double)
      expect(result).assertEqual(20.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5300
     * @tc.name testMathMax053
     * @tc.desc Verify max with infinity with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.POSITIVE_INFINITY
      let b: double = 1.0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5400
     * @tc.name testMathMax054
     * @tc.desc Verify max: max(byte 0, byte 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathMax054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0
      let b: byte = 0
      let result: double = Math.max(a, b)
      expect(result).assertEqual(0.0)
    });

  });
}
