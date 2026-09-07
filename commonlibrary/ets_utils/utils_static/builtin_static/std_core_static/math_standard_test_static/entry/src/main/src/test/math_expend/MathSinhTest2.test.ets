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

function sinhOneArg(x: number): number {
  return Math.sinh(x);
}

export default function mathSinhTest2(): void {
  describe('MathSinhTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0100
     * @tc.name testMathSinh001
     * @tc.desc Verify sinh returns -1.1752011936438014 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.sinh(val)
      expect(result).assertClose(-1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0200
     * @tc.name testMathSinh002
     * @tc.desc Verify sinh returns 1.1752011936438014 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.sinh(val)
      expect(result).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0300
     * @tc.name testMathSinh003
     * @tc.desc Verify sinh: sinh(long 1) = 1.1752011936438014
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 1
      let result: double = Math.sinh(val)
      expect(result).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0400
     * @tc.name testMathSinh004
     * @tc.desc Verify sinh cross-type consistency: sinh(long 0) and sinh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0500
     * @tc.name testMathSinh005
     * @tc.desc Verify sinh throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
        Math.sinh(u as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0600
     * @tc.name testMathSinh006
     * @tc.desc Verify sinh cross-type consistency: sinh(int -1) and sinh(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(-1.1752011936438014, 1e-6)
      expect(result2).assertClose(-1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0700
     * @tc.name testMathSinh007
     * @tc.desc Verify sinh throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
        Math.sinh(list as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0800
     * @tc.name testMathSinh008
     * @tc.desc Verify sinh: sinh(sqrt(4)) = sinh(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sinh(Math.sqrt(4.0))).assertClose(3.6268604078470186, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_0900
     * @tc.name testMathSinh009
     * @tc.desc Verify sinh throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
        Math.sinh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1000
     * @tc.name testMathSinh010
     * @tc.desc Verify sinh cross-type consistency: sinh(float 0.0f) and sinh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1100
     * @tc.name testMathSinh011
     * @tc.desc Verify sinh throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.sinh(null as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1200
     * @tc.name testMathSinh012
     * @tc.desc Verify sinh: sinh(byte 1) = sinh(int 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aByte: byte = 1
      let bR: double = Math.sinh(aByte)
      let aInt: int = 1
      let iR: double = Math.sinh(aInt)
      expect(bR).assertClose(iR, 1e-6)
      expect(bR).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1300
     * @tc.name testMathSinh013
     * @tc.desc Verify sinh cross-type consistency: sinh(int 0) and sinh(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1400
     * @tc.name testMathSinh014
     * @tc.desc Verify Math.sinh() satisfies identity sinh(x) = (exp(x) - exp(-x)) / 2 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 1.5;
      const sinhX: number = Math.sinh(x);
      const expected: number = (Math.exp(x) - Math.exp(-x)) / 2.0;
      const diff: number = sinhX - expected;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1500
     * @tc.name testMathSinh015
     * @tc.desc Verify sinh throws ClassCastError with UUID string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = '550e8400-e29b-41d4-a716-446655440000'
        Math.sinh(val as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1600
     * @tc.name testMathSinh016
     * @tc.desc Verify sinh: sinh(byte 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.sinh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1700
     * @tc.name testMathSinh017
     * @tc.desc Verify sinh batch property: cosh(x)^2 - sinh(x)^2 = 1 for double values -2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xs: double[] = [-2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0]
      for (let i: int = 0; i < xs.length; i++) {
        let c: double = Math.cosh(xs[i])
        let s: double = Math.sinh(xs[i])
        expect(c * c - s * s).assertClose(1.0, 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1800
     * @tc.name testMathSinh018
     * @tc.desc Verify sinh cross-type consistency: sinh(short -30) and sinh(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(-5343237290762.231, 1e-6)
      expect(result2).assertClose(-5343237290762.231, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_1900
     * @tc.name testMathSinh019
     * @tc.desc Verify sinh: sinh(integer) and sinh(floating-point) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let intResult: double = Math.sinh(intVal)
      let dblResult: double = Math.sinh(dblVal)
      let isEqual: boolean = intResult === dblResult
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2000
     * @tc.name testMathSinh020
     * @tc.desc Verify Math.sinh(): sinh(0.5 * 2) equals sinh(1.0) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: number = Math.sinh(0.5 * 2.0);
      const right: number = Math.sinh(1.0);
      const diff: number = left - right;
      const tolerance: number = 1.0e-6;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2100
     * @tc.name testMathSinh021
     * @tc.desc Verify sinh returns 10.017874927409903 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.sinh(val)
      expect(result).assertClose(10.017874927409903, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2200
     * @tc.name testMathSinh022
     * @tc.desc Verify sinh cross-type consistency: sinh(byte 1) and sinh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(1.1752011936438014, 1e-6)
      expect(result2).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2300
     * @tc.name testMathSinh023
     * @tc.desc Verify sinh throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.sinh(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2400
     * @tc.name testMathSinh024
     * @tc.desc Verify sinh throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.sinh(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2500
     * @tc.name testMathSinh025
     * @tc.desc Verify sinh: sinh(int 2) = 3.626860407847019
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2
      let result: double = Math.sinh(val)
      expect(result).assertClose(3.626860407847019, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2600
     * @tc.name testMathSinh026
     * @tc.desc Verify sinh: sinh(0.0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 0.0
        let result: double = Math.sinh(val as object as double)
        expect(result).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2700
     * @tc.name testMathSinh027
     * @tc.desc Verify sinh cross-type consistency: sinh(short 15) and sinh(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(1634508.6862359024, 1e-6)
      expect(result2).assertClose(1634508.6862359024, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2800
     * @tc.name testMathSinh028
     * @tc.desc Verify sinh: sinh(long 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 0
      let result: double = Math.sinh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_2900
     * @tc.name testMathSinh029
     * @tc.desc Verify sinh cross-type consistency: sinh(byte 1) and sinh(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(1.1752011936438014, 1e-6)
      expect(result2).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3000
     * @tc.name testMathSinh030
     * @tc.desc Verify sinh: sinh monotonically increasing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sinh(0.5) < Math.sinh(1.0)).assertTrue()
      expect(Math.sinh(1.0) < Math.sinh(2.0)).assertTrue()
      expect(Math.sinh(2.0) < Math.sinh(5.0)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3100
     * @tc.name testMathSinh031
     * @tc.desc Verify sinh: sinh(short 0) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 0
      let result: double = Math.sinh(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3200
     * @tc.name testMathSinh032
     * @tc.desc Verify sinh: sinh(byte 1) = 1.1752011936438014
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.sinh(val)
      expect(result).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3300
     * @tc.name testMathSinh033
     * @tc.desc Verify sinh cross-type consistency: sinh(long 0) and sinh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3400
     * @tc.name testMathSinh034
     * @tc.desc Verify sinh cross-type consistency: sinh(int 100) and sinh(long 100) cross-type consistency, both return Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertEqual(Number.POSITIVE_INFINITY)
      expect(result2).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3500
     * @tc.name testMathSinh035
     * @tc.desc Verify sinh cross-type consistency: sinh(int 1) and sinh(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(1.1752011936438014, 1e-6)
      expect(result2).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3600
     * @tc.name testMathSinh036
     * @tc.desc Verify Math.sinh() against mathematical definition (e^x - e^(-x)) / 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const xs: number[] = [-1.0, -0.5, 0.0, 0.5, 1.0];
      const tolerance: number = 1.0e-12;
      for (let i: int = 0; i < xs.length; i++) {
        const x: number = xs[i];
        const sinhX: number = Math.sinh(x);
        const expected: number = (Math.exp(x) - Math.exp(-x)) / 2.0;
        const diff: number = sinhX - expected;
        const isClose: boolean = Math.abs(diff) < tolerance;
        expect(isClose).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3700
     * @tc.name testMathSinh037
     * @tc.desc Verify Math.sinh(): sinh(1 + 0) equals sinh(1.0) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left: number = Math.sinh(1.0 + 0.0);
      const right: number = Math.sinh(1.0);
      const diff: number = left - right;
      const tolerance: number = 1.0e-6;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3800
     * @tc.name testMathSinh038
     * @tc.desc Verify sinh throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
        set.add(1)
        Math.sinh(set as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_3900
     * @tc.name testMathSinh039
     * @tc.desc Verify sinh throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
        Math.sinh(matrix as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4000
     * @tc.name testMathSinh040
     * @tc.desc Verify sinh(1.0, 2.0) with extra arguments ignores the second argument and returns sinh(1.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: number = (sinhOneArg as Object as (x: number, y: number) => number)(1.0, 2.0)
        expect(result).assertClose(Math.sinh(1.0), 1e-5)
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4100
     * @tc.name testMathSinh041
     * @tc.desc Verify sinh({}) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Record<string, string> = {}
        Math.sinh(obj as Object as number)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4200
     * @tc.name testMathSinh042
     * @tc.desc Verify sinh: sinh(exp(0)) = sinh(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sinh(Math.exp(0.0))).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4300
     * @tc.name testMathSinh043
     * @tc.desc Verify sinh batch property: sinh(-x) = -sinh(x) for double values 0.5, 1.0, 2.0, 3.0, 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [0.5, 1.0, 2.0, 3.0, 5.0]
      for (let i: int = 0; i < vs.length; i++) {
        expect(Math.sinh(-vs[i])).assertEqual(-Math.sinh(vs[i]))
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4400
     * @tc.name testMathSinh044
     * @tc.desc Verify sinh throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.sinh(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4500
     * @tc.name testMathSinh045
     * @tc.desc Verify sinh cross-type consistency: sinh(short 0) and sinh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4600
     * @tc.name testMathSinh046
     * @tc.desc Verify sinh: sinh(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-10.0, -1.0, 0.0, 1.0, 10.0]
      let exp: double[] = [-11013.232874703393, -1.1752011936438014, 0.0, 1.1752011936438014, 11013.232874703393]
      for (let i: int = 0; i < vs.length; i++) {
        let result: double = Math.sinh(vs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4700
     * @tc.name testMathSinh047
     * @tc.desc Verify sinh: sinh(max(0,1)) = sinh(1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(0.0, 1.0)
      expect(Math.sinh(m)).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4800
     * @tc.name testMathSinh048
     * @tc.desc Verify sinh throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.sinh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_4900
     * @tc.name testMathSinh049
     * @tc.desc Verify sinh cross-type consistency: sinh(byte 0) and sinh(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5000
     * @tc.name testMathSinh050
     * @tc.desc Verify sinh throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
        Math.sinh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5100
     * @tc.name testMathSinh051
     * @tc.desc Verify Math.sinh() satisfies identity sinh(2x) = 2 * sinh(x) * cosh(x) within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 0.5;
      const sinh2x: number = Math.sinh(2.0 * x);
      const expected: number = 2.0 * Math.sinh(x) * Math.cosh(x);
      const diff: number = sinh2x - expected;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5200
     * @tc.name testMathSinh052
     * @tc.desc Verify sinh: sinh(abs(-2)) = sinh(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-2.0)
      expect(Math.sinh(a)).assertClose(3.6268604078470186, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5300
     * @tc.name testMathSinh053
     * @tc.desc Verify sinh throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.sinh(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5400
     * @tc.name testMathSinh054
     * @tc.desc Verify sinh: sinh(-x) = -sinh(x) odd function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.sinh(-1.0)).assertClose(-Math.sinh(1.0), 1e-6)
      expect(Math.sinh(-2.0)).assertClose(-Math.sinh(2.0), 1e-6)
      expect(Math.sinh(-3.0)).assertClose(-Math.sinh(3.0), 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5500
     * @tc.name testMathSinh055
     * @tc.desc Verify sinh: sinh(1) cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 1
      let dblVal: double = 1.0
      let intResult: double = Math.sinh(intVal)
      let dblResult: double = Math.sinh(dblVal)
      expect(Math.abs(intResult - dblResult) < 1e-6).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5600
     * @tc.name testMathSinh056
     * @tc.desc Verify sinh cross-type consistency: sinh(short 1) and sinh(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(1.1752011936438014, 1e-6)
      expect(result2).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5700
     * @tc.name testMathSinh057
     * @tc.desc Verify sinh: sinh(short 1) = sinh(int 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sR: double = Math.sinh(1 as short)
      let iR: double = Math.sinh(1)
      expect(sR).assertClose(iR, 1e-6)
      expect(sR).assertClose(1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5800
     * @tc.name testMathSinh058
     * @tc.desc Verify sinh: sinh(short -1) = -1.1752011936438014
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: double = Math.sinh(val)
      expect(result).assertClose(-1.1752011936438014, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_5900
     * @tc.name testMathSinh059
     * @tc.desc Verify sinh cross-type consistency: sinh(byte 0) and sinh(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.sinh(val1)
      let result2: double = Math.sinh(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6000
     * @tc.name testMathSinh060
     * @tc.desc Verify sinh returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathSinh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.sinh(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6100
     * @tc.name testMathSinh061
     * @tc.desc Verify sinh throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
        Math.sinh(map as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6200
     * @tc.name testMathSinh062
     * @tc.desc Verify sinh: cosh^2(x)-sinh^2(x) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.5
      let c: double = Math.cosh(x)
      let s: double = Math.sinh(x)
      expect(c * c - s * s).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6300
     * @tc.name testMathSinh063
     * @tc.desc Verify sinh is an odd function: sinh(-x) = -sinh(x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.0
      let result1: number = Math.sinh(x)
      let result2: number = Math.sinh(-x)
      expect(result1 + result2).assertClose(0.0, 1e-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6400
     * @tc.name testMathSinh064
     * @tc.desc Verify sinh returns 3.6268604078470192 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.sinh(val)
      expect(result).assertClose(3.6268604078470192, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6500
     * @tc.name testMathSinh065
     * @tc.desc Verify sinh batch property with int values 0, 1, 2, 3, 5, -1, -2, -5 returns expected double results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ints: int[] = [0, 1, 2, 3, 5, -1, -2, -5]
      let exp: double[] = [0.0, 1.1752011936438014, 3.6268604078470186, 10.017874927409903, 74.20321057778875, -1.1752011936438014, -3.6268604078470186, -74.20321057778875]
      for (let i: int = 0; i < ints.length; i++) {
        let result: double = Math.sinh(ints[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6600
     * @tc.name testMathSinh066
     * @tc.desc Verify sinh throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.sinh(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6700
     * @tc.name testMathSinh067
     * @tc.desc Verify Math.sinh(): sinh(ln(x)) equals (x - 1 / x) / 2 within precision tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = 2.0;
      const lnX: number = Math.log(x);
      const sinhLn: number = Math.sinh(lnX);
      const expected: number = (x - 1.0 / x) / 2.0;
      const diff: number = sinhLn - expected;
      const tolerance: number = 1.0e-12;
      expect(Math.abs(diff) < tolerance).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6800
     * @tc.name testMathSinh068
     * @tc.desc Verify sinh: sinh(0) = 0 cross-type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intVal: int = 0
      let dblVal: double = 0.0
      let floatVal: float = 0.0f
      let intResult: double = Math.sinh(intVal)
      let dblResult: double = Math.sinh(dblVal)
      let floatResult: double = Math.sinh(floatVal)
      expect(intResult).assertEqual(0.0)
      expect(dblResult).assertEqual(0.0)
      expect(floatResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_6900
     * @tc.name testMathSinh069
     * @tc.desc Verify sinh throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
        Math.sinh(arr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_SINH_7000
     * @tc.name testMathSinh070
     * @tc.desc Verify sinh: sinh(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathSinh070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5
      let first: double = Math.sinh(input)
      let second: double = Math.sinh(input)
      let third: double = Math.sinh(input)
      expect(first).assertEqual(second)
      expect(second).assertEqual(third)
      expect(first).assertClose(0.5210953054937474, 1e-6)
    });

  });
}
