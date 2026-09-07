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

export default function mathCeilPow2Test2(): void {
  describe('MathCeilPow2Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0100
     * @tc.name testMathCeilPow2001
     * @tc.desc Verify ceilPow2 batch property with byte values 1, 2, 3, 5, 9 returns int 1, 2, 4, 8, 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: byte[] = [1, 2, 3, 5, 9]
      let exp: int[] = [1, 2, 4, 8, 16]
      for (let i: int = 0; i < vals.length; i++) {
        let result: int = Math.ceilPow2(vals[i])
        expect(result).assertEqual(exp[i])
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0200
     * @tc.name testMathCeilPow2002
     * @tc.desc Verify ceilPow2 cross-type consistency: ceilPow2(short 15) and ceilPow2(int 15) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: short = 15
      let val2: int = 15
      let result1: int = Math.ceilPow2(val1)
      let result2: int = Math.ceilPow2(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertEqual(16)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0300
     * @tc.name testMathCeilPow2003
     * @tc.desc Verify ceilPow2 method with hex int input 0xFF returns int 256
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0xFF
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(256)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0400
     * @tc.name testMathCeilPow004
     * @tc.desc Verify ceilPow2 cross-type consistency: ceilPow2(int 5) and ceilPow2(short 5) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: int = 5
      let val2: short = 5
      let result1: int = Math.ceilPow2(val1)
      let result2: int = Math.ceilPow2(val2)
      let isEqual: boolean = result1 === result2
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0500
     * @tc.name testMathCeilPow005
     * @tc.desc Verify ceilPow2 cross-type consistency: ceilPow2(byte 93) and ceilPow2(int 93) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 93
      let val2: int = 93
      let result1: int = Math.ceilPow2(val1)
      let result2: int = Math.ceilPow2(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertEqual(128)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0600
     * @tc.name testMathCeilPow006
     * @tc.desc Verify ceilPow2 method with binary int input 0b10010 returns int 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0b10010
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(32)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0700
     * @tc.name testMathCeilPow007
     * @tc.desc Verify ceilPow2 throws ClassCastError with char 'a' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: char = c'a'
        Math.ceilPow2(c as Object as int)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0800
     * @tc.name testMathCeilPow008
     * @tc.desc Verify ceilPow2 throws ClassCastError with Object array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Object[] = [1, 'test', true]
        Math.ceilPow2(arr as Object as int)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0900
     * @tc.name testMathCeilPow009
     * @tc.desc Verify ceilPow2 method with int bit-shift expression input (1 << 7) + (1 << 4) returns int 256
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shift1: int = 7
      let shift2: int = 4
      let input: int = (1 << shift1) + (1 << shift2)
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(256)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1000
     * @tc.name testMathCeilPow010
     * @tc.desc Verify ceilPow2 throws ClassCastError with null parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Math.ceilPow2(null as Object as int)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1100
     * @tc.name testMathCeilPow011
     * @tc.desc Verify ceilPow2 cross-type consistency: ceilPow2(byte 6) and ceilPow2(short 6) cross-type consistency
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val1: byte = 6
      let val2: short = 6
      let result1: int = Math.ceilPow2(val1)
      let result2: int = Math.ceilPow2(val2)
      let isEqual: boolean = result1 === result2
      expect(result1).assertEqual(8)
      expect(isEqual).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1200
     * @tc.name testMathCeilPow012
     * @tc.desc Verify ceilPow2 method with int expression input 17 * 3 returns int 64
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 17
      let multiplier: int = 3
      let input: int = base * multiplier
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(64)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1300
     * @tc.name testMathCeilPow013
     * @tc.desc Verify ceilPow2 throws ClassCastError with string 'abc' parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'abc'
        Math.ceilPow2(str as Object as int)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1400
     * @tc.name testMathCeilPow014
     * @tc.desc Verify ceilPow2 throws ClassCastError with Object instance parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let obj: Object = new Object()
        Math.ceilPow2(obj as Object as int)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1500
     * @tc.name testMathCeilPow015
     * @tc.desc Verify ceilPow2 with expression input (1 << 8) | 3 returns int 512
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shift: int = 8
      let input: int = (1 << shift) | 3
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(512)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1600
     * @tc.name testMathCeilPow016
     * @tc.desc Verify ceilPow2 method with int subtraction expression input 300 - 50 returns int 256
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: int = 300
      let right: int = 50
      let input: int = left - right
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(256)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1700
     * @tc.name testMathCeilPow017
     * @tc.desc Verify ceilPow2 throws ClassCastError with boolean true parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        Math.ceilPow2(b as Object as int)
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError')
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1800
     * @tc.name testMathCeilPow018
     * @tc.desc Verify ceilPow2 power-of-two input 16 returns int 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeilPow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 16
      let result: int = Math.ceilPow2(input)
      expect(result).assertEqual(16)
    });

  });
}
