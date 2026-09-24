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

export default function mathFloorTest2(): void {
  describe('MathFloorTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0100
     * @tc.name testMathFloor001
     * @tc.desc Verify Math.floor with expression 5.7 - 3.2, expected result 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.floor(5.7 - 3.2)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0200
     * @tc.name testMathFloor002
     * @tc.desc Verify floor cross-type consistency: floor(float 0.0f) and floor(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 0.0f
      let val2: double = 0.0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0300
     * @tc.name testMathFloor003
     * @tc.desc Verify floor throws ClassCastError with CJK string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = '测试工程师'
        Math.floor(s as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0400
     * @tc.name testMathFloor004
     * @tc.desc Verify floor: floor for various double input returns integer values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: number[] = [1.8, 3.2, -1.2, -3.7, 0.5, 10.9]
      for (let v of values) {
        let r: number = Math.floor(v)
        expect(r % 1).assertEqual(0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0500
     * @tc.name testMathFloor005
     * @tc.desc Verify floor cross-type consistency: floor(byte 1) and floor(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0600
     * @tc.name testMathFloor006
     * @tc.desc Verify floor: floor(1) = 1 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) { expect(Math.floor(1.0)).assertEqual(1.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0700
     * @tc.name testMathFloor007
     * @tc.desc Verify floor: floor(0) = 0 with repeated calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i: int = 0; i < 10; i++) { expect(Math.floor(0.0)).assertEqual(0.0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0800
     * @tc.name testMathFloor008
     * @tc.desc Verify floor cross-type consistency: floor(short 15) and floor(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(15.0, 1e-6)
      expect(result2).assertClose(15.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0900
     * @tc.name testMathFloor009
     * @tc.desc Verify floor throws ClassCastError with double array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: double[] = [1.0, 2.0, 3.0]
      Math.floor(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1000
     * @tc.name testMathFloor010
     * @tc.desc Verify floor throws ClassCastError with Set parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let set: Set<int> = new Set<int>()
      set.add(1)
      Math.floor(set as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1100
     * @tc.name testMathFloor011
     * @tc.desc Verify floor returns 10 with input long 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 10
      let result: double = Math.floor(val)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1200
     * @tc.name testMathFloor012
     * @tc.desc Verify floor: floor monotonicity x<=y ⇒ floor(x)<=floor(y)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.floor(0.3)).assertLessOrEqual(Math.floor(0.7))
      expect(Math.floor(0.7)).assertLessOrEqual(Math.floor(1.2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1300
     * @tc.name testMathFloor013
     * @tc.desc Verify floor throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
      Math.floor(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1400
     * @tc.name testMathFloor014
     * @tc.desc Verify floor batch property: result <= input for double values -3.7, -1.2, -0.5, 0.3, 1.7, 2.5, 4.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-3.7, -1.2, -0.5, 0.3, 1.7, 2.5, 4.0]
      for (let i: int = 0; i < vs.length; i++) {
        let r: double = Math.floor(vs[i])
        expect(r <= vs[i]).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1500
     * @tc.name testMathFloor015
     * @tc.desc Verify floor returns -1 with input int -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: double = Math.floor(val)
      expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1600
     * @tc.name testMathFloor016
     * @tc.desc Verify floor returns 2 with input float 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 2
      let result: double = Math.floor(val)
      expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1700
     * @tc.name testMathFloor017
     * @tc.desc Verify floor: floor(finite) all finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fs: double[] = [-1.5, -0.5, 0.0, 0.5, 1.5, 10.3, 100.9]
      let exp: double[] = [-2, -1, 0, 0, 1, 10, 100]
      for (let i: int = 0; i < fs.length; i++) {
        let result: double = Math.floor(fs[i])
        expect(result).assertClose(exp[i], 1e-6)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1800
     * @tc.name testMathFloor018
     * @tc.desc Verify floor throws ClassCastError with undefined parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let u: Object | undefined = undefined
      Math.floor(u as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1900
     * @tc.name testMathFloor019
     * @tc.desc Verify floor cross-type consistency: floor(short -30) and floor(long -30) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -30
      let val2: long = -30
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(-30.0, 1e-6)
      expect(result2).assertClose(-30.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2000
     * @tc.name testMathFloor020
     * @tc.desc Verify floor throws ClassCastError with int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: int[] = [1,2,3]
      Math.floor(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2100
     * @tc.name testMathFloor021
     * @tc.desc Verify Math.floor with expression 1.2 + 2.3, expected result 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.floor(1.2 + 2.3)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2200
     * @tc.name testMathFloor022
     * @tc.desc Verify floor returns 0.0 with input byte 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathFloor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.floor(val)
      expect(result).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2300
     * @tc.name testMathFloor023
     * @tc.desc Verify floor: floor(trunc(2.7)) = floor(2.0) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: double = Math.trunc(2.7)
      expect(Math.floor(t)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2400
     * @tc.name testMathFloor024
     * @tc.desc Verify floor returns 1 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.floor(val)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2500
     * @tc.name testMathFloor025
     * @tc.desc Verify floor cross-type consistency: floor(int 0) and floor(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2600
     * @tc.name testMathFloor026
     * @tc.desc Verify floor cross-type consistency: floor(byte 0) and floor(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2700
     * @tc.name testMathFloor027
     * @tc.desc Verify floor: floor(the same input) consistent across three calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: double = 3.7
      let f: double = Math.floor(n)
      let s: double = Math.floor(n)
      let t: double = Math.floor(n)
      expect(f).assertEqual(s)
      expect(s).assertEqual(t)
      expect(f).assertClose(3.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2800
     * @tc.name testMathFloor028
     * @tc.desc Verify floor: floor(abs(-3.7)) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double = Math.abs(-3.7)
      expect(Math.floor(a)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2900
     * @tc.name testMathFloor029
     * @tc.desc Verify Math.floor with byte value 0 returns double 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 0
      let result: double = Math.floor(val)
      expect(result).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3000
     * @tc.name testMathFloor030
     * @tc.desc Verify floor cross-type consistency: floor(short 1) and floor(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 1
      let val2: double = 1.0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3100
     * @tc.name testMathFloor031
     * @tc.desc Verify floor returns 3 with input double 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 3
      let result: double = Math.floor(val)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3200
     * @tc.name testMathFloor032
     * @tc.desc Verify floor cross-type consistency: floor(byte 0) and floor(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3300
     * @tc.name testMathFloor033
     * @tc.desc Verify floor: floor(max(2.3, 4.7)) = floor(4.7) = 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.max(2.3, 4.7)
      expect(Math.floor(m)).assertEqual(4.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3400
     * @tc.name testMathFloor034
     * @tc.desc Verify floor cross-type consistency: floor(int 1) and floor(float 1.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 1
      let val2: float = 1.0f
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3500
     * @tc.name testMathFloor035
     * @tc.desc Verify floor throws ClassCastError with long string (10000 chars) parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let longStr: string = 'x'.repeat(10000)
        Math.floor(longStr as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3600
     * @tc.name testMathFloor036
     * @tc.desc Verify floor: floor(round(4.6)) = floor(5.0) = 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: double = Math.round(4.6)
      expect(Math.floor(r)).assertEqual(5.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3700
     * @tc.name testMathFloor037
     * @tc.desc Verify floor batch property: floor(int 0) equals floor(double 0.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 0
      let val2: double = 0.0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3800
     * @tc.name testMathFloor038
     * @tc.desc Verify floor cross-type consistency: floor(long 0) and floor(double 0.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: double = 0.0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3900
     * @tc.name testMathFloor039
     * @tc.desc Verify floor: floor(sqrt5) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.sqrt(5.0)
      expect(Math.floor(x)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4000
     * @tc.name testMathFloor040
     * @tc.desc Verify floor throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.floor(b as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4100
     * @tc.name testMathFloor041
     * @tc.desc Verify floor throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.floor(obj as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4200
     * @tc.name testMathFloor042
     * @tc.desc Verify floor throws ClassCastError with string array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: string[] = ['a', 'b', 'c']
      Math.floor(arr as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4300
     * @tc.name testMathFloor043
     * @tc.desc Verify floor: floor(sqrt(2)+sqrt(3)) approximately 3.146
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.sqrt(2.0) + Math.sqrt(3.0)
      expect(Math.floor(x)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4400
     * @tc.name testMathFloor044
     * @tc.desc Verify floor throws ClassCastError with 2D int array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let matrix: int[][] = [[1, 2], [3, 4]]
      Math.floor(matrix as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4500
     * @tc.name testMathFloor045
     * @tc.desc Verify floor: floor(min(2.3, 4.7)) = floor(2.3) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: double = Math.min(2.3, 4.7)
      expect(Math.floor(m)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4600
     * @tc.name testMathFloor046
     * @tc.desc Verify floor throws ClassCastError with Array<number> parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let list: Array<number> = new Array<number>(1, 2, 3)
      Math.floor(list as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4700
     * @tc.name testMathFloor047
     * @tc.desc Verify floor batch property: result <= input for double values -2.7, -1.3, -0.1, 0.0, 0.1, 1.5, 3.9, 10.2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vs: double[] = [-2.7, -1.3, -0.1, 0.0, 0.1, 1.5, 3.9, 10.2]
      for (let i: int = 0; i < vs.length; i++) {
        let r: double = Math.floor(vs[i])
        expect(r <= vs[i]).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4800
     * @tc.name testMathFloor048
     * @tc.desc Verify floor: floor(exp(1)) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.exp(1.0)
      expect(Math.floor(x)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4900
     * @tc.name testMathFloor049
     * @tc.desc Verify floor: floor(log(10)) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = Math.log(10.0)
      expect(Math.floor(x)).assertEqual(2.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5000
     * @tc.name testMathFloor050
     * @tc.desc Verify Math.floor with int values 0, 1, 2, 10, 100, -1, -10, -100 returns themselves
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let is: int[] = [0, 1, 2, 10, 100, -1, -10, -100]
      for (let i: int = 0; i < is.length; i++) {
        let val: int = is[i]
        let result: double = Math.floor(val)
        expect(result).assertEqual(is[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5100
     * @tc.name testMathFloor051
     * @tc.desc Verify floor cross-type consistency: floor(byte 1) and floor(double 1.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: double = 1.0
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(1.0, 1e-6)
      expect(result2).assertClose(1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5200
     * @tc.name testMathFloor052
     * @tc.desc Verify floor: floor(ceil(2.3)) = floor(3.0) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: double = Math.ceil(2.3)
      expect(Math.floor(c)).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5300
     * @tc.name testMathFloor053
     * @tc.desc Verify floor cross-type consistency: floor(int 100) and floor(long 100) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 100
      let val2: long = 100
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(100.0, 1e-6)
      expect(result2).assertClose(100.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5400
     * @tc.name testMathFloor054
     * @tc.desc Verify floor throws ClassCastError with Map parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let map: Map<string, int> = new Map<string, int>()
      Math.floor(map as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5500
     * @tc.name testMathFloor055
     * @tc.desc Verify floor cross-type consistency: floor(short 0) and floor(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5600
     * @tc.name testMathFloor056
     * @tc.desc Verify Math.floor(x) <= x <= Math.ceil(x) holds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.8
      let floorVal: double = Math.floor(x)
      let ceilVal: double = Math.ceil(x)
      expect(floorVal <= x).assertTrue()
      expect(x <= ceilVal).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5700
     * @tc.name testMathFloor057
     * @tc.desc Verify floor throws ClassCastError with Function parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn: Function = (): void => {}
        Math.floor(fn as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5800
     * @tc.name testMathFloor058
     * @tc.desc Verify Math.floor(-0.0) returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.floor(-0.0)
      let isNegativeZero: boolean = (1 / result) === Number.NEGATIVE_INFINITY
      expect(isNegativeZero).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5900
     * @tc.name testMathFloor059
     * @tc.desc Verify floor cross-type consistency: floor(int -1) and floor(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(-1.0, 1e-6)
      expect(result2).assertClose(-1.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6000
     * @tc.name testMathFloor060
     * @tc.desc Verify Math.floor with byte value 1 returns double 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.floor(val)
      expect(result).assertEqual(1.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6100
     * @tc.name testMathFloor061
     * @tc.desc Verify floor cross-type consistency: floor(long 0) and floor(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 0
      let val2: float = 0.0f
      let result1: double = Math.floor(val1)
      let result2: double = Math.floor(val2)
      expect(result1).assertClose(0.0, 1e-6)
      expect(result2).assertClose(0.0, 1e-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6200
     * @tc.name testMathFloor062
     * @tc.desc Verify Math.floor return value has no fractional part
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.floor(1.8)
      let exprResult: double = result % 1.0
      expect(exprResult).assertEqual(0.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6300
     * @tc.name testMathFloor063
     * @tc.desc Verify floor throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.floor(c as object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6400
     * @tc.name testMathFloor064
     * @tc.desc Verify floor throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.floor(null as object as double)
      expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

  });
}
