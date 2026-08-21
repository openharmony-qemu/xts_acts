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

export default function mathAbsTest2(): void {
  describe('MathAbsTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0100
     * @tc.name testMathAbs001
     * @tc.desc Verify abs cross-type consistency: abs(short 15) and abs(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(15.0, 1e-6)
      expect(result2).assertClose(15.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0200
     * @tc.name testMathAbs002
     * @tc.desc Verify Math.abs with compound int expression -5 * 3 returns int 15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Math.abs(-5 * 3)
      expect(result).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0300
     * @tc.name testMathAbs003
     * @tc.desc Verify abs: abs(int -1) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.abs(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0400
     * @tc.name testMathAbs004
     * @tc.desc Verify abs cross-type consistency: abs(int 1) and abs(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0500
     * @tc.name testMathAbs005
     * @tc.desc Verify abs cross-type consistency: abs(byte 1) and abs(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0600
     * @tc.name testMathAbs006
     * @tc.desc Verify Math.abs short overload with zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Math.abs((0).toShort())
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0700
     * @tc.name testMathAbs007
     * @tc.desc Verify abs: abs(float 0.5) = 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 0.5f
      let result: double = Math.abs(val)
      expect(result).assertClose(0.5, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0800
     * @tc.name testMathAbs008
     * @tc.desc Verify abs cross-type consistency: abs(byte 0) and abs(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_0900
     * @tc.name testMathAbs009
     * @tc.desc Verify abs throws ClassCastError with Japanese string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'テスト'
        Math.abs(s as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1000
     * @tc.name testMathAbs010
     * @tc.desc Verify abs: abs(exp(x)) = exp(x)(exp always positive)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -3.0
      let result: double = Math.abs(Math.exp(x))
      expect(result).assertClose(Math.exp(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1100
     * @tc.name testMathAbs011
     * @tc.desc Verify abs: abs(int -3 + 5 - 7) compound expression returns int 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Math.abs(-3 + 5 - 7)
      expect(result).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1200
     * @tc.name testMathAbs012
     * @tc.desc Verify abs overflow behavior: abs(int -2147483648) returns int -2147483648 (overflow stays negative)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648
      let result: int = Math.abs(x)
      expect(result).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1300
     * @tc.name testMathAbs013
     * @tc.desc Verify abs: abs(long 10) = 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.abs(val)
      expect(result).assertClose(10.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1400
     * @tc.name testMathAbs014
     * @tc.desc Verify abs: abs(short 1) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.abs(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1500
     * @tc.name testMathAbs015
     * @tc.desc Verify Math.abs long overload with positive long value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: long = Math.abs((9223372036854775807).toLong())
      expect(result).assertEqual(9223372036854775807)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1600
     * @tc.name testMathAbs016
     * @tc.desc Verify abs cross-type consistency: abs(int 0) and abs(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1700
     * @tc.name testMathAbs017
     * @tc.desc Verify abs cross-type consistency: abs(int 100) and abs(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(100.0, 1e-6)
      expect(result2).assertClose(100.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1800
     * @tc.name testMathAbs018
     * @tc.desc Verify Math.abs with boundary int value 2147483647 returns int 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 2147483647
      let result: int = Math.abs(x)
      expect(result).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_1900
     * @tc.name testMathAbs019
     * @tc.desc Verify abs throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
        Math.abs(list as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2000
     * @tc.name testMathAbs020
     * @tc.desc Verify abs throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.abs(longStr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2100
     * @tc.name testMathAbs021
     * @tc.desc Verify abs always non-negative with input Math.sin(x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.5
      let result: double = Math.abs(Math.sin(x))
      expect(result).assertClose(0.9974949866040544, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2200
     * @tc.name testMathAbs022
     * @tc.desc Verify abs: abs(Number.MIN_SAFE_INTEGER) returns a positive value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.abs(Number.MIN_SAFE_INTEGER)
      expect(result).assertClose(9007199254740991, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2300
     * @tc.name testMathAbs023
     * @tc.desc Verify abs throws ClassCastError with Color.RED as Object as double parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.abs(Color.RED as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2400
     * @tc.name testMathAbs024
     * @tc.desc Verify Math.abs with 1 short parameter returns correct absolute value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Math.abs((-100).toShort())
      expect(result).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2500
     * @tc.name testMathAbs025
     * @tc.desc Verify abs: abs(null as number) triggers Runtime Checking (ClassCastError) for bare null cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let positive1: number = Math.abs(null as number)
        expect(positive1).assertEqual(0)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2600
     * @tc.name testMathAbs026
     * @tc.desc Verify abs: abs(sqrt(x)) = sqrt(x) holds for non-negative numbers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 5.0
      let result: double = Math.abs(Math.sqrt(x))
      expect(result).assertClose(Math.sqrt(x), 1e-9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2700
     * @tc.name testMathAbs027
     * @tc.desc Verify abs throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
        Math.abs(matrix as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2800
     * @tc.name testMathAbs028
     * @tc.desc Verify abs throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.abs(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_2900
     * @tc.name testMathAbs029
     * @tc.desc Verify abs always non-negative with input Math.tan(x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5
      let result: double = Math.abs(Math.tan(x))
      expect(result).assertClose(0.5463024898437905, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3000
     * @tc.name testMathAbs030
     * @tc.desc Verify Math.abs long overload with zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: long = Math.abs((0).toLong())
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3100
     * @tc.name testMathAbs031
     * @tc.desc Verify Math.abs with negative long value -1 returns long 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = -1
      let result: long = Math.abs(x)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3200
     * @tc.name testMathAbs032
     * @tc.desc Verify abs with MAX_VALUE of byte and int
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bR: double = Math.abs(127 as byte)
      let iR: double = Math.abs(2147483647 as int)
      expect(bR).assertEqual(127.0)
      expect(iR).assertEqual(2147483647.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3300
     * @tc.name testMathAbs033
     * @tc.desc Verify abs cross-type consistency: abs(short 1) and abs(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3400
     * @tc.name testMathAbs034
     * @tc.desc Verify abs cross-type consistency: abs(short 0) and abs(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3500
     * @tc.name testMathAbs035
     * @tc.desc Verify abs cross-type consistency: abs(short -1) and abs(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -1
      let val2: long = -1
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3600
     * @tc.name testMathAbs036
     * @tc.desc Verify Math.abs byte overload with max byte value 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: byte = Math.abs((127))
      expect(result).assertEqual(127)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3700
     * @tc.name testMathAbs037
     * @tc.desc Verify abs throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.abs(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3800
     * @tc.name testMathAbs038
     * @tc.desc Verify abs: abs(double 0.25) = 0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 0.25
      let result: double = Math.abs(val)
      expect(result).assertClose(0.25, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_3900
     * @tc.name testMathAbs039
     * @tc.desc Verify abs preserves precision: byte/short/int value 100 all return exact 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteVal: byte = 100
      let shortVal: short = 100
      let intVal: int = 100
      let byteResult: byte = Math.abs(byteVal)
      let shortResult: short = Math.abs(shortVal)
      let intResult: int = Math.abs(intVal)
      expect(byteResult).assertEqual(100)
      expect(shortResult).assertEqual(100)
      expect(intResult).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4000
     * @tc.name testMathAbs040
     * @tc.desc Verify Math.abs with 1 byte parameter returns correct absolute value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: byte = Math.abs((-3).toByte())
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4100
     * @tc.name testMathAbs041
     * @tc.desc Verify abs: abs(Number.MAX_SAFE_INTEGER) returns itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.abs(Number.MAX_SAFE_INTEGER)
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4200
     * @tc.name testMathAbs042
     * @tc.desc Verify abs cross-type consistency: abs(long 0) and abs(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4300
     * @tc.name testMathAbs043
     * @tc.desc Verify Math.abs short overload with max short value 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Math.abs((32767).toShort())
      expect(result).assertEqual(32767)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4400
     * @tc.name testMathAbs044
     * @tc.desc Verify Math constant property: 1 / LOG10E == LN10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let reciprocal: double = 1.0 / Math.LOG10E
      let isEqual: boolean = Math.abs(reciprocal - Math.LN10) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4500
     * @tc.name testMathAbs045
     * @tc.desc Verify Math.abs byte overload with zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: byte = Math.abs((0).toByte())
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4600
     * @tc.name testMathAbs046
     * @tc.desc Verify abs cross-type consistency: abs(byte 0) and abs(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4700
     * @tc.name testMathAbs047
     * @tc.desc Verify Math constant property: PI * PI == 9.869604401089358
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let piSq: double = Math.PI * Math.PI
      let isClose: boolean = Math.abs(piSq - 9.869604401089358) < 1e-9
      expect(isClose).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4800
     * @tc.name testMathAbs048
     * @tc.desc Verify Math.abs returns value involved in arithmetic operation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absResult: int = Math.abs(-5)
      let opResult1 = absResult + 1
      expect(opResult1).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_4900
     * @tc.name testMathAbs049
     * @tc.desc Verify abs: abs(-Number.EPSILON) returns Number.EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.abs(-Number.EPSILON)
      expect(result).assertEqual(Number.EPSILON)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5000
     * @tc.name testMathAbs050
     * @tc.desc Verify Math.abs long overload with min long value overflows
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: long = Math.abs((-9223372036854775808).toLong())
      expect(result).assertEqual(-9223372036854775808)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5100
     * @tc.name testMathAbs051
     * @tc.desc Verify abs: abs(short 50) cross-type with abs(int 50) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortVal: short = 50
      let intVal: int = 50
      let shortResult: short = Math.abs(shortVal)
      let intResult: int = Math.abs(intVal)
      let isEqual: boolean = shortResult === intResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5200
     * @tc.name testMathAbs052
     * @tc.desc Verify Math.abs long overload with 1 and -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.abs((1).toLong())).assertEqual(1)
        let opResult1 = Math.abs((-1).toLong())
        expect(opResult1).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5300
     * @tc.name testMathAbs053
     * @tc.desc Verify abs throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
        set.add(1)
        Math.abs(set as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5400
     * @tc.name testMathAbs054
     * @tc.desc Verify abs throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
        Math.abs(u as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5500
     * @tc.name testMathAbs055
     * @tc.desc Verify Math.abs with compound int expression 10 - 25 returns int 15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Math.abs(10 - 25)
      expect(result).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5600
     * @tc.name testMathAbs056
     * @tc.desc Verify abs with MIN_VALUE of short and int overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sR: double = Math.abs(-32768 as short)
      let iR: double = Math.abs(-2147483648 as int)
      expect(sR).assertEqual(-32768.0)
      expect(iR).assertEqual(-2147483648.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5700
     * @tc.name testMathAbs057
     * @tc.desc Verify abs always non-negative with input Math.cos(x
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -2.0
      let result: double = Math.abs(Math.cos(x))
      expect(result).assertClose(0.4161468365471424, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5800
     * @tc.name testMathAbs058
     * @tc.desc Verify abs cross-type consistency: abs(long 0) and abs(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_5900
     * @tc.name testMathAbs059
     * @tc.desc Verify abs returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathAbs059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.abs(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6000
     * @tc.name testMathAbs060
     * @tc.desc Verify abs batch property: abs(int 5) and abs(int -5) both return int 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 5
      let result1: int = Math.abs(val1)
      expect(result1).assertEqual(5)
      let val2: int = -5
      let result2: int = Math.abs(val2)
      expect(result2).assertEqual(5)
      let val3: float = 3.14f
      let result3: float = Math.abs(val3)
      expect(result3).assertClose(3.14, 1e-6)
      let val4: double = -3.14
      let result4: double = Math.abs(val4)
      expect(result4).assertEqual(3.14)
      let val5: byte = -5 as byte
      let val6: byte = 5 as byte
      let result5: double = Math.abs(val5)
      let result6: double = Math.abs(val6)
      expect(result5).assertEqual(5)
      expect(result6).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6100
     * @tc.name testMathAbs061
     * @tc.desc Verify abs throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.abs(null as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6200
     * @tc.name testMathAbs062
     * @tc.desc Verify abs cross-type consistency: abs(byte 1) and abs(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6300
     * @tc.name testMathAbs063
     * @tc.desc Verify Math constant property: 1 / LN10 == LOG10E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let computed: double = 1.0 / Math.LN10
      let isEqual: boolean = Math.abs(computed - Math.LOG10E) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6400
     * @tc.name testMathAbs064
     * @tc.desc Verify abs throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.abs(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6500
     * @tc.name testMathAbs065
     * @tc.desc Verify abs throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.abs(arr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6600
     * @tc.name testMathAbs066
     * @tc.desc Verify Math.abs short overload with min short value -32768 overflows
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: short = Math.abs((-32768).toShort())
      expect(result).assertEqual(-32768)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6700
     * @tc.name testMathAbs067
     * @tc.desc Verify Math constant property: 1 / LOG2E == LN2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let reciprocal: double = 1.0 / Math.LOG2E
      let isEqual: boolean = Math.abs(reciprocal - Math.LN2) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6800
     * @tc.name testMathAbs068
     * @tc.desc Verify abs throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.abs(fn as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_6900
     * @tc.name testMathAbs069
     * @tc.desc Verify abs: abs(int -2) simple negative number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -2
      let result: byte = Math.abs(x)
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7000
     * @tc.name testMathAbs070
     * @tc.desc Verify Math constant property: 1 / LN2 == LOG2E
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let computed: double = 1.0 / Math.LN2
      let isEqual: boolean = Math.abs(computed - Math.LOG2E) < 1e-9
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7100
     * @tc.name testMathAbs071
     * @tc.desc Verify abs throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
        Math.abs(arr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7200
     * @tc.name testMathAbs072
     * @tc.desc Verify abs: abs(short -100) negative
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = -100
      let result: short = Math.abs(x)
      expect(result).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7300
     * @tc.name testMathAbs073
     * @tc.desc Verify Math.abs returns zero for zero input across all types
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.abs((0).toByte())).assertEqual(0)
      expect(Math.abs((0).toShort())).assertEqual(0)
      expect(Math.abs(0)).assertEqual(0)
      expect(Math.abs((0).toLong())).assertEqual(0)
      expect(Math.abs(0.0f)).assertClose(0.0f, 1e-6)
      expect(Math.abs(0.0)).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7400
     * @tc.name testMathAbs074
     * @tc.desc Verify Math.abs with compound int expression -8 / 2 returns int 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = Math.abs(-8 / 2)
      expect(result).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7500
     * @tc.name testMathAbs075
     * @tc.desc Verify abs: abs(pow - target value) absolute error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let approx: double = Math.pow(2.0, 0.5)
      let target: double = 1.4142135623730951
      let error: double = Math.abs(approx - target)
      expect(error < 1.0e-9).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7600
     * @tc.name testMathAbs076
     * @tc.desc Verify abs: abs(byte 10) cross-type with abs(int 10) consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteVal: byte = 10
      let intVal: int = 10
      let byteResult: byte = Math.abs(byteVal)
      let intResult: int = Math.abs(intVal)
      let isEqual: boolean = byteResult === intResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7700
     * @tc.name testMathAbs077
     * @tc.desc Verify abs: abs(Number.EPSILON) returns itself
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.abs(Number.EPSILON)
      expect(result).assertEqual(Number.EPSILON)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ABS_7800
     * @tc.name testMathAbs078
     * @tc.desc Verify abs cross-type consistency: abs(float 0.0f) and abs(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAbs078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.abs(val1)
      let result2: double = Math.abs(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

  });
}
