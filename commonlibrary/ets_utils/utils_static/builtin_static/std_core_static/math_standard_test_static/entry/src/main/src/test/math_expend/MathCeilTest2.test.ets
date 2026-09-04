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

export default function mathCeilTest2(): void {
  describe('MathCeilTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0100
     * @tc.name testMathCeil001
     * @tc.desc Verify ceil: ceil(finite values) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fs: double[] = [-1.5, -0.5, 0.0, 0.5, 1.5, 10.3, 100.9]
      let exp: double[] = [-1, 0, 0, 1, 2, 11, 101]
      for (let i: int = 0; i < fs.length; i++) {
        let result: double = Math.ceil(fs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0200
     * @tc.name testMathCeil002
     * @tc.desc Verify ceil cross-type consistency: ceil(short 0) and ceil(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0300
     * @tc.name testMathCeil003
     * @tc.desc Verify ceil cross-type consistency: ceil(int 0) and ceil(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0400
     * @tc.name testMathCeil004
     * @tc.desc Verify Math.ceil with byte value 1 returns double 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.ceil(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0500
     * @tc.name testMathCeil005
     * @tc.desc Verify ceil cross-type consistency: ceil(byte 0) and ceil(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0600
     * @tc.name testMathCeil006
     * @tc.desc Verify ceil: ceil(round(4.2)) = ceil(4.0) = 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.round(4.2)
      expect(Math.ceil(r)).assertEqual(4.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0700
     * @tc.name testMathCeil007
     * @tc.desc Verify ceil cross-type consistency: ceil(short 15) and ceil(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(15.0, 1e-6)
      expect(result2).assertClose(15.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0800
     * @tc.name testMathCeil008
     * @tc.desc Verify ceil: ceil(-PI) = -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = -Math.PI
      let result: double = Math.ceil(val)
      expect(result).assertEqual(-3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0900
     * @tc.name testMathCeil009
     * @tc.desc Verify ceil: ceil(abs(-5.3)) = ceil(5.3) = 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -5.3
      expect(Math.ceil(Math.abs(x))).assertEqual(6.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1000
     * @tc.name testMathCeil010
     * @tc.desc Verify ceil: ceil(abs(-4.2)) = ceil(4.2) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-4.2)
      expect(Math.ceil(a)).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1100
     * @tc.name testMathCeil011
     * @tc.desc Verify Math.ceil with expression 5.7 - 3.2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.ceil(5.7 - 3.2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1200
     * @tc.name testMathCeil012
     * @tc.desc Verify ceil: ceil return value >= original value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [-3.7, -1.2, -0.5, 0.3, 1.7, 2.5, 4.0]
      for (let i: int = 0; i < vals.length; i++) {
        let r: double = Math.ceil(vals[i])
        expect(r >= vals[i]).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1300
     * @tc.name testMathCeil013
     * @tc.desc Verify ceil: ceil(floor(2.7)) = ceil(2.0) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: double = Math.floor(2.7)
      expect(Math.ceil(f)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1400
     * @tc.name testMathCeil014
     * @tc.desc Verify ceil: ceil monotonicity x<=y ⇒ ceil(x)<=ceil(y)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.ceil(0.3) <= Math.ceil(0.7)).assertTrue()
      expect(Math.ceil(0.7) <= Math.ceil(1.2)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1500
     * @tc.name testMathCeil015
     * @tc.desc Verify ceil: ceil(int -1) = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.ceil(val)
      expect(result).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1600
     * @tc.name testMathCeil016
     * @tc.desc Verify ceil: ceil(1) = 1 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) {
        let val: double = 1.0
        let result: double = Math.ceil(val)
        expect(result).assertEqual(1.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1700
     * @tc.name testMathCeil017
     * @tc.desc Verify Math.ceil of -0.1 returns double -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.ceil(-0.1)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1800
     * @tc.name testMathCeil018
     * @tc.desc Verify Math.ceil with int values 0, 1, 2, 10, 100, -1, -10, -100 returns themselves
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let is: int[] = [0, 1, 2, 10, 100, -1, -10, -100]
      for (let i: int = 0; i < is.length; i++) {
        let val: int = is[i]
        let result: double = Math.ceil(val)
        expect(result).assertEqual(is[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1900
     * @tc.name testMathCeil019
     * @tc.desc Verify ceil: ceil(max(2.3, 4.7)) = ceil(4.7) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(2.3, 4.7)
      expect(Math.ceil(m)).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2000
     * @tc.name testMathCeil020
     * @tc.desc Verify ceil cross-type consistency: ceil(float 0.0f) and ceil(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2100
     * @tc.name testMathCeil021
     * @tc.desc Verify ceil cross-type consistency: ceil(long 0) and ceil(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2200
     * @tc.name testMathCeil022
     * @tc.desc Verify ceil batch property: result >= input for double values -2.7, -1.3, -0.1, 0.0, 0.1, 1.5, 3.9, 10.2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-2.7, -1.3, -0.1, 0.0, 0.1, 1.5, 3.9, 10.2]
      for (let i: int = 0; i < vs.length; i++) {
        let r: double = Math.ceil(vs[i])
        expect(r >= vs[i]).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2300
     * @tc.name testMathCeil023
     * @tc.desc Verify ceil returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathCeil023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.ceil(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2400
     * @tc.name testMathCeil024
     * @tc.desc Verify ceil cross-type consistency: ceil(int 100) and ceil(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(100.0, 1e-6)
      expect(result2).assertClose(100.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2500
     * @tc.name testMathCeil025
     * @tc.desc Verify ceil cross-type consistency: ceil(int -1) and ceil(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(-1.0, 1e-6)
      expect(result2).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2600
     * @tc.name testMathCeil026
     * @tc.desc Verify ceil: ceil(short 1) = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.ceil(val)
      expect(result).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2700
     * @tc.name testMathCeil027
     * @tc.desc Verify ceil cross-type consistency: ceil(byte 0) and ceil(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2800
     * @tc.name testMathCeil028
     * @tc.desc Verify Math.ceil of -0.0 returns double -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.ceil(-0.0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2900
     * @tc.name testMathCeil029
     * @tc.desc Verify ceil: ceil(trunc(2.7)) = ceil(2.0) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: double = Math.trunc(2.7)
      expect(Math.ceil(t)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3000
     * @tc.name testMathCeil030
     * @tc.desc Verify Math.ceil returns integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = Math.ceil(1.2)
      let exprResult: number = result % 1
      expect(exprResult).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3100
     * @tc.name testMathCeil031
     * @tc.desc Verify ceil throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.ceil(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3200
     * @tc.name testMathCeil032
     * @tc.desc Verify ceil cross-type consistency: ceil(byte 1) and ceil(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3300
     * @tc.name testMathCeil033
     * @tc.desc Verify ceil: ceil(min(2.3, 4.7)) = ceil(2.3) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.min(2.3, 4.7)
      expect(Math.ceil(m)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3400
     * @tc.name testMathCeil034
     * @tc.desc Verify Math.ceil with expression 1.2 + 2.3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.ceil(1.2 + 2.3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3500
     * @tc.name testMathCeil035
     * @tc.desc Verify Math.ceil with hexadecimal int literal 0xA returns double 10.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hex: int = 0xA
      expect(Math.ceil(hex)).assertEqual(10.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3600
     * @tc.name testMathCeil036
     * @tc.desc Verify ceil: ceil(sqrt(5)) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.sqrt(5.0)
      expect(Math.ceil(x)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3700
     * @tc.name testMathCeil037
     * @tc.desc Verify ceil: ceil(long 10) = 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.ceil(val)
      expect(result).assertClose(10.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3800
     * @tc.name testMathCeil038
     * @tc.desc Verify ceil: ceil(exp(1.5)) finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.exp(1.5)
      let result: double = Math.ceil(x)
      expect(result).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3900
     * @tc.name testMathCeil039
     * @tc.desc Verify ceil: ceil(log(2)*10) finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.log(2.0) * 10.0
      let result: double = Math.ceil(x)
      expect(result).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4000
     * @tc.name testMathCeil040
     * @tc.desc Verify ceil cross-type consistency: ceil(long 0) and ceil(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4100
     * @tc.name testMathCeil041
     * @tc.desc Verify Math.ceil with byte value 0 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.ceil(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4200
     * @tc.name testMathCeil042
     * @tc.desc Verify ceil: ceil(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: double = 3.7
      let f: double = Math.ceil(n)
      let s: double = Math.ceil(n)
      let t: double = Math.ceil(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(4.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4300
     * @tc.name testMathCeil043
     * @tc.desc Verify ceil batch property: ceil(int 0) equals ceil(double 0.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4400
     * @tc.name testMathCeil044
     * @tc.desc Verify ceil cross-type consistency: ceil(short -30) and ceil(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(-30.0, 1e-6)
      expect(result2).assertClose(-30.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4500
     * @tc.name testMathCeil045
     * @tc.desc Verify ceil cross-type consistency: ceil(short 1) and ceil(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4600
     * @tc.name testMathCeil046
     * @tc.desc Verify ceil cross-type consistency: ceil(byte 1) and ceil(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4700
     * @tc.name testMathCeil047
     * @tc.desc Verify ceil cross-type consistency: ceil(int 1) and ceil(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.ceil(val1)
      let result2: double = Math.ceil(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

  });
}
