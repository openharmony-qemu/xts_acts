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

export default function mathClz32Test2(): void {
  describe('MathClz32Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0100
     * @tc.name testMathClz32001
     * @tc.desc Verify clz32 throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.clz32(b as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0200
     * @tc.name testMathClz32002
     * @tc.desc Verify clz32 throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.clz32(arr as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0300
     * @tc.name testMathClz32003
     * @tc.desc Verify clz32 returns 31 with input short 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 1
      let result: double = Math.clz32(val)
      expect(result).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0400
     * @tc.name testMathClz32004
     * @tc.desc Verify clz32 throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.clz32(null as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0500
     * @tc.name testMathClz32005
     * @tc.desc Verify clz32 cross-type consistency: clz32(long 12) and clz32(float 12.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 12
      let val2: float = 12.0f
      let result1: double = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(28)
      expect(result2).assertEqual(28)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0600
     * @tc.name testMathClz32006
     * @tc.desc Verify clz32 cross-type consistency: clz32(short 5) and clz32(double 5.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 5
      let val2: double = 5.0
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(29)
      expect(result2).assertEqual(29)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0700
     * @tc.name testMathClz32007
     * @tc.desc Verify clz32 with int negative input -1 returns int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1
      let result: int = Math.clz32(val)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0800
     * @tc.name testMathClz32008
     * @tc.desc Verify Math.clz32 Int overload with 2147483647 returns int 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int = Math.clz32(new Int(2147483647))
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_0900
     * @tc.name testMathClz32009
     * @tc.desc Verify clz32 returns 31 with input byte 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
        it('testMathClz32009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: double = Math.clz32(val)
      expect(result).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1000
     * @tc.name testMathClz32010
     * @tc.desc Verify Math.clz32 return value range [0, 32] for double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: double = Math.clz32(1.0)
      let r2: double = Math.clz32(0.0)
      let opResult1: boolean = r1 >= 0 && r1 <= 32
      expect(opResult1).assertTrue()
      let opResult2: boolean = r2 >= 0 && r2 <= 32
      expect(opResult2).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1100
     * @tc.name testMathClz32011
     * @tc.desc Verify clz32: clz32(0x10000000) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0x10000000
      let result: int = Math.clz32(val)
      expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1200
     * @tc.name testMathClz32012
     * @tc.desc Verify Math.clz32 with octal literal 0o20 (decimal 16)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0o20;
      let result: int = Math.clz32(val);
      expect(result).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1300
     * @tc.name testMathClz32013
     * @tc.desc Verify clz32 throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.clz32(c as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1400
     * @tc.name testMathClz32014
     * @tc.desc Verify clz32 batch property with int values 0, 1, 2, 4, 8, 16, 32, 64, 128, 256 returns int 32, 31, 30, 29, 28, 27, 26, 25, 24, 23
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: int[] = [0, 1, 2, 4, 8, 16, 32, 64, 128, 256]
      let exp: int[] = [32, 31, 30, 29, 28, 27, 26, 25, 24, 23]
      for (let i: int = 0; i < vals.length; i++) {
        let result: int = Math.clz32(vals[i])
        expect(result).assertEqual(exp[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1500
     * @tc.name testMathClz32015
     * @tc.desc Verify clz32 cross-type consistency: clz32(int 7) and clz32(long 7) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 7
      let val2: long = 7
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(29)
      expect(result2).assertEqual(29)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1600
     * @tc.name testMathClz32016
     * @tc.desc Verify clz32 throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.clz32(obj as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1700
     * @tc.name testMathClz32017
     * @tc.desc Verify clz32 cross-type consistency: clz32(short 0) and clz32(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 0
      let val2: float = 0.0f
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(32)
      expect(result2).assertEqual(32)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1800
     * @tc.name testMathClz32018
     * @tc.desc Verify clz32 throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'abc'
        Math.clz32(str as Object as double)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_1900
     * @tc.name testMathClz32019
     * @tc.desc Verify clz32 returns 31 with input int 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1
      let result: double = Math.clz32(val)
      expect(result).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2000
     * @tc.name testMathClz32020
     * @tc.desc Verify clz32 cross-type consistency: clz32(long 15) and clz32(double 15.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: long = 15
      let val2: double = 15.0
      let result1: double = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(28)
      expect(result2).assertEqual(28)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2100
     * @tc.name testMathClz32021
     * @tc.desc Verify clz32 cross-type consistency: clz32(byte 9) and clz32(long 9) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 9
      let val2: long = 9
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(28)
      expect(result2).assertEqual(28)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2200
     * @tc.name testMathClz32022
     * @tc.desc Verify clz32 cross-type consistency: clz32(byte 2) and clz32(double 2.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 2
      let val2: double = 2.0
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(30)
      expect(result2).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2300
     * @tc.name testMathClz32023
     * @tc.desc Verify clz32 with byte input 1 returns int 31
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 1
      let result: int = Math.clz32(val)
      expect(result).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2400
     * @tc.name testMathClz32024
     * @tc.desc Verify clz32 cross-type consistency: clz32(float 2.5f) and clz32(double 2.5) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: float = 2.5f
      let val2: double = 2.5
      let result1: double = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(30)
      expect(result2).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2500
     * @tc.name testMathClz32025
     * @tc.desc Verify clz32 cross-type consistency: clz32(short 3) and clz32(int 3) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 3
      let val2: int = 3
      let result1: int = Math.clz32(val1)
      let result2: int = Math.clz32(val2)
      expect(result1).assertEqual(30)
      expect(result2).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2600
     * @tc.name testMathClz32026
     * @tc.desc Verify clz32 returns 31 with input long 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 1
      let result: double = Math.clz32(val)
      expect(result).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2700
     * @tc.name testMathClz32027
     * @tc.desc Verify Math.clz32 with byte value 127 and int value 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteVal: byte = 127
      let intVal: int = 2147483647
      let byteResult: int = Math.clz32(byteVal)
      let intResult: int = Math.clz32(intVal)
      expect(byteResult).assertEqual(25)
      expect(intResult).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2800
     * @tc.name testMathClz32028
     * @tc.desc Verify clz32 cross-type consistency: clz32(byte 0) and clz32(short 0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: short = 0
      let result1: int = Math.clz32(val1)
      let result2: int = Math.clz32(val2)
      expect(result1).assertEqual(32)
      expect(result2).assertEqual(32)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_2900
     * @tc.name testMathClz32029
     * @tc.desc Verify Math.clz32 with binary int literal 0b11111111 returns double 24
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0b11111111
      let result: double = Math.clz32(val)
      expect(result).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3000
     * @tc.name testMathClz32030
     * @tc.desc Verify clz32 batch property with byte values 0, 1, 2, 4, 8, 16 returns int 32, 31, 30, 29, 28, 27
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: byte[] = [0, 1, 2, 4, 8, 16]
      let exp: int[] = [32, 31, 30, 29, 28, 27]
      for (let i: int = 0; i < vals.length; i++) {
        let result: int = Math.clz32(vals[i])
        expect(result).assertEqual(exp[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3100
     * @tc.name testMathClz32031
     * @tc.desc Verify Math.clz32 for negative float numbers, result should be 0 after ToUint32 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: float[] = [-1.0f, -2.0f, -100.0f];
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.clz32(vals[i]);
        expect(result).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3200
     * @tc.name testMathClz32032
     * @tc.desc Verify clz32 cross-type consistency: clz32(int 8) and clz32(float 8.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 8
      let val2: float = 8.0f
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(28)
      expect(result2).assertEqual(28)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3300
     * @tc.name testMathClz32033
     * @tc.desc Verify clz32 cross-type consistency: clz32(int -1) and clz32(long -1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = -1
      let val2: long = -1
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(0)
      expect(result2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3400
     * @tc.name testMathClz32034
     * @tc.desc Verify clz32 cross-type consistency: clz32(byte 0) and clz32(float 0.0f) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 0
      let val2: float = 0.0f
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(32)
      expect(result2).assertEqual(32)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3500
     * @tc.name testMathClz32035
     * @tc.desc Verify clz32 with large int input 0x40000000 returns int 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0x40000000
      let result: int = Math.clz32(val)
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3600
     * @tc.name testMathClz32036
     * @tc.desc Verify clz32 cross-type consistency: clz32(byte 1) and clz32(int 1) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 1
      let val2: int = 1
      let result1: int = Math.clz32(val1)
      let result2: int = Math.clz32(val2)
      expect(result1).assertEqual(31)
      expect(result2).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3700
     * @tc.name testMathClz32037
     * @tc.desc Verify clz32 cross-type consistency: clz32(short -2) and clz32(long -2) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = -2
      let val2: long = -2
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(0)
      expect(result2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3800
     * @tc.name testMathClz32038
     * @tc.desc Verify clz32 batch property with negative double values -1.0, -2.0, -100.0 returns int 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: double[] = [-1.0, -2.0, -100.0]
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.clz32(vals[i])
        expect(result).assertEqual(0)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_3900
     * @tc.name testMathClz32039
     * @tc.desc Verify clz32 cross-type consistency: clz32(int 10) and clz32(double 10.0) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 10
      let val2: double = 10.0
      let result1: int = Math.clz32(val1)
      let result2: double = Math.clz32(val2)
      expect(result1).assertEqual(28)
      expect(result2).assertEqual(28)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4000
     * @tc.name testMathClz32040
     * @tc.desc Verify clz32: clz32(short -1) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -1
      let result: int = Math.clz32(val)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CLZ32_4100
     * @tc.name testMathClz32041
     * @tc.desc Verify Math.clz32 for values [0, 1, 2, 4, 8], check leading zero count >= 28
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathClz32041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: long[] = [0, 1, 2, 4, 8];
      let exp: int[] = [32, 31, 30, 29, 28];
      for (let i: int = 0; i < vals.length; i++) {
        let result: double = Math.clz32(vals[i]);
        expect(result).assertEqual(exp[i]);
      }
    });

  });
}
