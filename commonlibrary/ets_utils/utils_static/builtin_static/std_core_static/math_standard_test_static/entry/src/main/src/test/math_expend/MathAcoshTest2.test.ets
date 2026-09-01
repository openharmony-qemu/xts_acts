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

export default function mathAcoshTest2(): void {
  describe('MathAcoshTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0100
     * @tc.name testMathAcosh001
     * @tc.desc Verify acosh method with widened byte minimum value -128 returns Double.NaN below the domain lower bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -128
      let result: double = Math.acosh(x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0200
     * @tc.name testMathAcosh002
     * @tc.desc Verify acosh cross-type consistency: acosh(byte 2) and acosh(double 2.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 2
      let val2: double = 2.0
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0300
     * @tc.name testMathAcosh003
     * @tc.desc Verify acosh throws ClassCastError with invalid enum parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acosh(Color.RED as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0400
     * @tc.name testMathAcosh004
     * @tc.desc Verify acosh cross-type consistency: acosh(float 2.0f) and acosh(double 2.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 2.0f
      let val2: double = 2.0
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0500
     * @tc.name testMathAcosh005
     * @tc.desc Verify acosh method with widened int minimum value -2147483648 returns Double.NaN below the domain lower bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -2147483648
      let result: double = Math.acosh(x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0600
     * @tc.name testMathAcosh006
     * @tc.desc Verify acosh cross-type consistency: acosh(byte 2) and acosh(int 2) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 2
      let val2: int = 2
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0700
     * @tc.name testMathAcosh007
     * @tc.desc Verify acosh cross-type consistency: acosh(int 2) and acosh(float 2.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 2
      let val2: float = 2.0f
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0800
     * @tc.name testMathAcosh008
     * @tc.desc Verify acosh cross-type consistency: acosh(byte 2) and acosh(long 2) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 2
      let val2: long = 2
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_0900
     * @tc.name testMathAcosh009
     * @tc.desc Verify acosh throws ClassCastError with invalid string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'abc'
        Math.acosh(str as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1000
     * @tc.name testMathAcosh010
     * @tc.desc Verify acosh method returns consistent result across repeated calls with same double input 2.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 2.5
      let result1: double = Math.acosh(x)
      let result2: double = Math.acosh(x)
      let result3: double = Math.acosh(x)
      expect(result1).assertEqual(result2)
      expect(result2).assertEqual(result3)
      expect(result1).assertClose(1.5667992369724109, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1100
     * @tc.name testMathAcosh011
     * @tc.desc Verify acosh throws ClassCastError with invalid char parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.acosh(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1200
     * @tc.name testMathAcosh012
     * @tc.desc Verify acosh cross-type consistency: acosh(byte 2) and acosh(float 2.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 2
      let val2: float = 2.0f
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1300
     * @tc.name testMathAcosh013
     * @tc.desc Verify acosh throws ClassCastError with invalid double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
        Math.acosh(arr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1400
     * @tc.name testMathAcosh014
     * @tc.desc Verify acosh throws ClassCastError with invalid boolean parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.acosh(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1500
     * @tc.name testMathAcosh015
     * @tc.desc Verify acosh method with widened short minimum value -32768 returns Double.NaN below the domain lower bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = -32768
      let result: double = Math.acosh(x)
      expect(isNaN(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1600
     * @tc.name testMathAcosh016
     * @tc.desc Verify acosh cross-type consistency: acosh(int 2) and acosh(double 2.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 2
      let val2: double = 2.0
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1700
     * @tc.name testMathAcosh017
     * @tc.desc Verify acosh method recovers nonnegative principal value 2.0 from cosh of negative argument -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let generatedInput: double = Math.cosh(-2.0)
      let recovered: double = Math.acosh(generatedInput)
      expect(recovered).assertClose(2.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1800
     * @tc.name testMathAcosh018
     * @tc.desc Verify acosh throws ClassCastError with invalid Object parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.acosh(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_1900
     * @tc.name testMathAcosh019
     * @tc.desc Verify acosh method with hexadecimal int input 0xFF returns finite result for widened boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0xFF
      let result: double = Math.acosh(x)
      expect(isNaN(result)).assertFalse()
      expect(result).assertClose(6.234406881021074, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2000
     * @tc.name testMathAcosh020
     * @tc.desc Verify acosh cross-type consistency: acosh(short 2) and acosh(double 2.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 2
      let val2: double = 2.0
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2100
     * @tc.name testMathAcosh021
     * @tc.desc Verify acosh method with widened short maximum value 32767 returns finite positive result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 32767
      let result: double = Math.acosh(x)
      expect(isNaN(result)).assertFalse()
      expect(result > 11.0).assertTrue()
      expect(result).assertClose(11.090324370682485, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2200
     * @tc.name testMathAcosh022
     * @tc.desc Verify acosh cross-type consistency: acosh(short 2) and acosh(int 2) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 2
      let val2: int = 2
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2300
     * @tc.name testMathAcosh023
     * @tc.desc Verify acosh cross-type consistency: acosh(short 2) and acosh(long 2) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 2
      let val2: long = 2
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2400
     * @tc.name testMathAcosh024
     * @tc.desc Verify acosh method with octal int input 0o10 follows the same result path as decimal 8.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0o10
      let result: double = Math.acosh(x)
      expect(result).assertClose(2.7686593833135738, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2500
     * @tc.name testMathAcosh025
     * @tc.desc Verify acosh throws ClassCastError with invalid Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.acosh(arr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2600
     * @tc.name testMathAcosh026
     * @tc.desc Verify acosh cross-type consistency: acosh(long 2) and acosh(double 2.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 2
      let val2: double = 2.0
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(result1).assertClose(result2, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2700
     * @tc.name testMathAcosh027
     * @tc.desc Verify acosh cross-type consistency: acosh(byte 5) and acosh(short 5) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 5
      let val2: short = 5
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(2.2924316695611777, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2800
     * @tc.name testMathAcosh028
     * @tc.desc Verify acosh cross-type consistency: acosh(short 2) and acosh(float 2.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 2
      let val2: float = 2.0f
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_2900
     * @tc.name testMathAcosh029
     * @tc.desc Verify acosh throws ClassCastError with invalid List parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
        Math.acosh(list as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3000
     * @tc.name testMathAcosh030
     * @tc.desc Verify acosh throws ClassCastError with invalid null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.acosh(null as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3100
     * @tc.name testMathAcosh031
     * @tc.desc Verify acosh method recovers original float argument 3.0f from cosh generated input within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: float = 3.0f
      let generatedInput: float = Math.cosh(original)
      let recovered: double = Math.acosh(generatedInput)
      expect(recovered).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3200
     * @tc.name testMathAcosh032
     * @tc.desc Verify acosh throws ClassCastError with invalid two-dimensional int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
        Math.acosh(matrix as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3300
     * @tc.name testMathAcosh033
     * @tc.desc Verify acosh cross-type consistency: acosh(int 2) and acosh(long 2) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 2
      let val2: long = 2
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3400
     * @tc.name testMathAcosh034
     * @tc.desc Verify acosh method for double input 3.0 matches natural log identity ln(x + sqrt(x^2 - 1)) within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.0
      let result: double = Math.acosh(x)
      let identity: double = Math.log(x + Math.sqrt(x * x - 1.0))
      expect(result).assertClose(identity, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3500
     * @tc.name testMathAcosh035
     * @tc.desc Verify acosh method with widened byte maximum value 127 returns finite positive result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 127
      let result: double = Math.acosh(x)
      expect(isNaN(result)).assertFalse()
      expect(result > 5.0).assertTrue()
      expect(result).assertClose(5.5373187666271475, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3600
     * @tc.name testMathAcosh036
     * @tc.desc Verify acosh cross-type consistency: acosh(long 2) and acosh(float 2.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 2
      let val2: float = 2.0f
      let result1: double = Math.acosh(val1)
      let result2: double = Math.acosh(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertClose(1.3169578969248166, 1e-6)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOSH_3700
     * @tc.name testMathAcosh037
     * @tc.desc Verify acosh throws ClassCastError with invalid Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAcosh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
        set.add(1)
        Math.acosh(set as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}
