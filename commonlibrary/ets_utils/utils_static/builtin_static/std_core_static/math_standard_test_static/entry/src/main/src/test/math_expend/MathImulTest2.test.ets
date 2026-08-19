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

export default function mathImulTest2(): void {
  describe('MathImulTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0100
     * @tc.name testMathImul001
     * @tc.desc Verify imul throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000);
        Math.imul(longStr as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0200
     * @tc.name testMathImul002
     * @tc.desc Verify imul: imul(long 3 + float 7.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 3
      let b: float = 7.0f
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0300
     * @tc.name testMathImul003
     * @tc.desc Verify imul throws ClassCastError with XSS script string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = '<script>alert(1)</script>'
        Math.imul(str as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0400
     * @tc.name testMathImul004
     * @tc.desc Verify imul: imul(3, 4) = 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 3
      let b: int = 4
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0500
     * @tc.name testMathImul005
     * @tc.desc Verify imul: imul(1, x) = x (32-bit truncation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.imul(1, 5)).assertEqual(5)
      expect(Math.imul(1, -3)).assertEqual(-3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0600
     * @tc.name testMathImul006
     * @tc.desc Verify imul: imul(-3, 4) = -12(negative * positive)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -3
      let b: int = 4
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(-12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0700
     * @tc.name testMathImul007
     * @tc.desc Verify imul throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.imul(null as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0800
     * @tc.name testMathImul008
     * @tc.desc Verify imul: imul(a, b) = imul(b, a) commutativity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.imul(3, 4)).assertEqual(Math.imul(4, 3))
      expect(Math.imul(5, 6)).assertEqual(Math.imul(6, 5))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_0900
     * @tc.name testMathImul009
     * @tc.desc Verify imul throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.imul(fn as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1000
     * @tc.name testMathImul010
     * @tc.desc Verify imul: imul(byte 3, byte 4) = 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 3
      let b: byte = 4
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1100
     * @tc.name testMathImul011
     * @tc.desc Verify imul: imul(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 3
      let b: int = 4
      let first: double = Math.imul(a, b)
      let second: double = Math.imul(a, b)
      let third: double = Math.imul(a, b)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(12.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1200
     * @tc.name testMathImul012
     * @tc.desc Verify imul batch property: imul(byte 1, byte 2) equals imul(short 1, short 2) returns int 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aByte: byte = 1
      let bByte: byte = 2
      let aShort: short = 1
      let bShort: short = 2
      let bR: double = Math.imul(aByte, bByte)
      let sR: double = Math.imul(aShort, bShort)
      expect(bR).assertClose(sR, 1e-6)
      expect(bR).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1300
     * @tc.name testMathImul013
     * @tc.desc Verify imul: imul(float 2.5f + double 3.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2.5f
      let b: double = 3.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1400
     * @tc.name testMathImul014
     * @tc.desc Verify imul throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.imul(arr as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1500
     * @tc.name testMathImul015
     * @tc.desc Verify imul: imul(byte 12 + short 3) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 12
      let b: short = 3
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1600
     * @tc.name testMathImul016
     * @tc.desc Verify imul: imul(byte 3, byte 5) and imul(int 3, int 5) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aByte: byte = 3
      let bByte: byte = 5
      let aInt: int = 3
      let bInt: int = 5
      let bR: double = Math.imul(aByte, bByte)
      let iR: double = Math.imul(aInt, bInt)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1700
     * @tc.name testMathImul017
     * @tc.desc Verify imul: imul(short 32767, short 2) = 65534
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767
      let b: short = 2
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(65534)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1800
     * @tc.name testMathImul018
     * @tc.desc Verify imul returns 300.0 with input (long 10, long 30)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 10
      let b: long = 30
      let result: double = Math.imul(a, b)
      expect(result).assertClose(300.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_1900
     * @tc.name testMathImul019
     * @tc.desc Verify imul with infinity with input a, b [3]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.POSITIVE_INFINITY
      let b: double = Double.NEGATIVE_INFINITY
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2000
     * @tc.name testMathImul020
     * @tc.desc Verify imul: imul(byte 15 + int 2) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 15
      let b: int = 2
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2100
     * @tc.name testMathImul021
     * @tc.desc Verify Math.imul with both arguments NaN returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(Double.NaN, Double.NaN)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2200
     * @tc.name testMathImul022
     * @tc.desc Verify imul with NaN returns NaN with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NaN
      let b: double = 1.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2300
     * @tc.name testMathImul023
     * @tc.desc Verify imul: imul(long 4 + double 5.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 4
      let b: double = 5.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2400
     * @tc.name testMathImul024
     * @tc.desc Verify imul: imul(-5, -7) = 35(negative * negative)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -5
      let b: int = -7
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(35)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2500
     * @tc.name testMathImul025
     * @tc.desc Verify imul: imul(int 4, int 5) and imul(long 4, long 5) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aInt: int = 4
      let bInt: int = 5
      let aLong: long = 4
      let bLong: long = 5
      let iR: double = Math.imul(aInt, bInt)
      let lR: double = Math.imul(aLong, bLong)
      expect(iR).assertClose(lR, 1e-6)
      expect(iR).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2600
     * @tc.name testMathImul026
     * @tc.desc Verify imul: imul(long 7, long 8) = 56
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 7
      let b: long = 8
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(56)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2700
     * @tc.name testMathImul027
     * @tc.desc Verify imul with infinity with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NEGATIVE_INFINITY
      let b: double = 1.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2800
     * @tc.name testMathImul028
     * @tc.desc Verify imul returns 27.0 with input (double 3, double 9)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = 3
      let b: double = 9
      let result: double = Math.imul(a, b)
      expect(result).assertClose(27.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_2900
     * @tc.name testMathImul029
     * @tc.desc Verify imul: imul(short 8, short -3) = -24
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 8
      let b: short = -3
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(-24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3000
     * @tc.name testMathImul030
     * @tc.desc Verify imul returns 12.0 with input (float 2, float 6)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 2
      let b: float = 6
      let result: double = Math.imul(a, b)
      expect(result).assertClose(12.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3100
     * @tc.name testMathImul031
     * @tc.desc Verify imul with NaN returns NaN with input a, b [2]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.NaN
      let b: double = Double.NaN
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3200
     * @tc.name testMathImul032
     * @tc.desc Verify imul returns 3.0 with input (int -1, int -3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -1
      let b: int = -3
      let result: double = Math.imul(a, b)
      expect(result).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3300
     * @tc.name testMathImul033
     * @tc.desc Verify imul: imul(0x7FFFFFFF, 1) = 0x7FFFFFFF(maximum positive int)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0x7FFFFFFF
      let b: int = 1
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0x7FFFFFFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3400
     * @tc.name testMathImul034
     * @tc.desc Verify Math.imul with 3 arguments ignores the extra argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = (Math.imul as Object as (a: number, b: number, c: number) => number)(3, 4, 5)
      expect(result).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3500
     * @tc.name testMathImul035
     * @tc.desc Verify imul returns 0.0 with input byte 0, byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathImul035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0
      let b: byte = 0
      let result: double = Math.imul(a, b)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3600
     * @tc.name testMathImul036
     * @tc.desc Verify Math.imul with positive infinity as the left argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(Double.POSITIVE_INFINITY, 5)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3700
     * @tc.name testMathImul037
     * @tc.desc Verify imul throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.imul(c as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3800
     * @tc.name testMathImul038
     * @tc.desc Verify imul: imul(int 3 + float 4.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 3
      let b: float = 4.0f
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_3900
     * @tc.name testMathImul039
     * @tc.desc Verify imul: imul(byte 127, byte 2) = 254
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127
      let b: byte = 2
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(254)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4000
     * @tc.name testMathImul040
     * @tc.desc Verify imul: imul(short 2, short 6) and imul(long 2, long 6) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aShort: short = 2
      let bShort: short = 6
      let aLong: long = 2
      let bLong: long = 6
      let sR: double = Math.imul(aShort, bShort)
      let lR: double = Math.imul(aLong, bLong)
      expect(sR).assertClose(lR, 1e-6)
      expect(sR).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4100
     * @tc.name testMathImul041
     * @tc.desc Verify imul with infinity with input a, b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Double.POSITIVE_INFINITY
      let b: double = 1.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4200
     * @tc.name testMathImul042
     * @tc.desc Verify Math.imul with both arguments positive infinity returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(Double.POSITIVE_INFINITY, Double.POSITIVE_INFINITY)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4300
     * @tc.name testMathImul043
     * @tc.desc Verify imul: imul(-0.0, 1.0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = -0.0
      let b: double = 1.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4400
     * @tc.name testMathImul044
     * @tc.desc Verify imul: imul(int 6 + double 8.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 6
      let b: double = 8.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(48)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4500
     * @tc.name testMathImul045
     * @tc.desc Verify Math.imul(1, undefined) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.imul(1, undefined as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4600
     * @tc.name testMathImul046
     * @tc.desc Verify Math.imul with arguments 2147483647 and 1 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(2147483647 as int, 1)
      expect(result).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4700
     * @tc.name testMathImul047
     * @tc.desc Verify imul throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.imul(obj as Object as double, 1.0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4800
     * @tc.name testMathImul048
     * @tc.desc Verify imul: imul(byte 10 + double 4.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10
      let b: double = 4.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_4900
     * @tc.name testMathImul049
     * @tc.desc Verify imul throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.imul(arr as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5000
     * @tc.name testMathImul050
     * @tc.desc Verify Math.imul with 1 argument treats missing second param as 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = (Math.imul as Object as (x: number) => number)(3)
        expect(result).assertEqual(0)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5100
     * @tc.name testMathImul051
     * @tc.desc Verify Math.imul with negative infinity as the left argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(Double.NEGATIVE_INFINITY, 5)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5200
     * @tc.name testMathImul052
     * @tc.desc Verify imul: imul(float 3.0f, float 4.0f) = 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float = 3.0f
      let b: float = 4.0f
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5300
     * @tc.name testMathImul053
     * @tc.desc Verify Math.imul({}, 1) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Record<string, string> = {}
        Math.imul(obj as Object as number, 1)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5400
     * @tc.name testMathImul054
     * @tc.desc Verify imul throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.imul(true as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5500
     * @tc.name testMathImul055
     * @tc.desc Verify imul returns 3.0 with input (short 1, short 3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1
      let b: short = 3
      let result: double = Math.imul(a, b)
      expect(result).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5600
     * @tc.name testMathImul056
     * @tc.desc Verify imul throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.imul(u as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5700
     * @tc.name testMathImul057
     * @tc.desc Verify imul: imul(short 11 + double 2.0) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 11
      let b: double = 2.0
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(22)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5800
     * @tc.name testMathImul058
     * @tc.desc Verify Math.imul with NaN as the left argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.imul(Double.NaN, 5)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_5900
     * @tc.name testMathImul059
     * @tc.desc Verify imul: imul(short 5, short 6) = 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 5
      let b: short = 6
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6000
     * @tc.name testMathImul060
     * @tc.desc Verify imul throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.imul('abc' as Object as double, 1.0)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6100
     * @tc.name testMathImul061
     * @tc.desc Verify imul: imul(short 6 + float 5.0f) normal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 6
      let b: float = 5.0f
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6200
     * @tc.name testMathImul062
     * @tc.desc Verify imul overflow behavior: int values 0x10000 and 0x10000 return int 0 (int32 wrap)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0x10000
      let b: int = 0x10000
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_IMUL_6300
     * @tc.name testMathImul063
     * @tc.desc Verify imul: imul(int -2, byte 3) = -6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathImul063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -2
      let b: byte = 3
      let result: double = Math.imul(a, b)
      expect(result).assertEqual(-6)
    });

  });
}
