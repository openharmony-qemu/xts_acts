'use static'

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

function buildCeilPow2Input(): int {
  return 100;
}

export default function mathCeilPow2Test(): void {
  describe('MathCeilPow2Test', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    })
    afterAll((): void => {
    })

    /**
     * @tc.name testMathCeilPow2001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0100
     * @tc.desc Verify ceilPow2 method with int input 0 for expected return 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 0;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathCeilPow2002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0200
     * @tc.desc Verify ceilPow2 method with int input 1 for expected return 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 1;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCeilPow2003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0300
     * @tc.desc Verify ceilPow2 method with int input 2 for expected return 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 2;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathCeilPow2004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0400
     * @tc.desc Verify ceilPow2 method with int input 3 for expected return 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 3;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathCeilPow2005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0500
     * @tc.desc Verify ceilPow2 method with int input 7 for expected return 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 7;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathCeilPow2006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0600
     * @tc.desc Verify ceilPow2 method with int input 8 for expected return 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 8;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathCeilPow2007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0700
     * @tc.desc Verify ceilPow2 method with int input 9 for expected return 16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 9;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name testMathCeilPow2008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0800
     * @tc.desc Verify ceilPow2 method with int input 31 for expected return 32
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 31;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathCeilPow2009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_0900
     * @tc.desc Verify ceilPow2 method with int input 32 for expected return 32
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 32;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathCeilPow2010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1000
     * @tc.desc Verify ceilPow2 method with int input 33 for smallest power-of-two return 64
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 33;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(64);
      expect((result >> 1) < input).assertTrue();
    });

    /**
     * @tc.name testMathCeilPow2011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1100
     * @tc.desc Verify ceilPow2 method with int variable input 42 for expected return 64
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 42;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.name testMathCeilPow2012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1200
     * @tc.desc Verify ceilPow2 method with int expression input 17 for expected return 32
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: int = 16;
      let increment: int = 1;
      let input: int = base + increment;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathCeilPow2013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1300
     * @tc.desc Verify ceilPow2 method with function-return int input 100 for expected return 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = buildCeilPow2Input();
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.name testMathCeilPow2014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1400
     * @tc.desc Verify ceilPow2 method with int input 127 for expected return 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 127;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.name testMathCeilPow2015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1500
     * @tc.desc Verify ceilPow2 method with int input 128 for expected return 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 128;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.name testMathCeilPow2016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1600
     * @tc.desc Verify ceilPow2 method with int input 129 for expected return 256
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 129;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(256);
    });

    /**
     * @tc.name testMathCeilPow2017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1700
     * @tc.desc Verify ceilPow2 method with int input 1073741823 for expected return 1073741824
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 1073741823;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(1073741824);
    });

    /**
     * @tc.name testMathCeilPow2018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1800
     * @tc.desc Verify ceilPow2 method with int input 1073741824 for expected return 1073741824
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = 1073741824;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(1073741824);
    });

    /**
     * @tc.name testMathCeilPow2019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_1900
     * @tc.desc Verify ceilPow2 method with negative int input -1 throws RangeError via try-catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nNeg: int = -1;
      try {
        let rNeg: int = Math.ceilPow2(nNeg);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testMathCeilPow2020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_2000
     * @tc.desc Verify ceilPow2 method with negative int input Int.MIN_VALUE throws RangeError via try-catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nNeg: int = Int.MIN_VALUE;
      try {
        let rNeg: int = Math.ceilPow2(nNeg);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testMathCeilPow2021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_2100
     * @tc.desc Verify ceilPow2 keeps equal results across repeated same-input calls for int input 42
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathCeilPow2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nPositive: int = 42;
      let firstCallResult: int = Math.ceilPow2(nPositive);
      let secondCallResult: int = Math.ceilPow2(nPositive);
      let thirdCallResult: int = Math.ceilPow2(nPositive);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });

    /**
     * @tc.name testMathCeilPow2022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_2200
     * @tc.desc Verify ceilPow2 return values remain powers of two for representative positive int inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: int[] = [1, 3, 5, 31, 33, 127, 129, 1023];
      for (let i: int = 0; i < testValues.length; i++) {
        let result: int = Math.ceilPow2(testValues[i]);
        expect((result & (result - 1)) == 0).assertTrue();
      }
    });

    /**
     * @tc.name testMathCeilPow2023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_2300
     * @tc.desc Verify ceilPow2 return values are not smaller than representative positive int inputs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testValues: int[] = [1, 3, 5, 31, 33, 127, 129, 1023];
      for (let i: int = 0; i < testValues.length; i++) {
        let result: int = Math.ceilPow2(testValues[i]);
        expect(result >= testValues[i]).assertTrue();
      }
    });

    /**
     * @tc.name testMathCeilPow2024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_2400
     * @tc.desc Verify ceilPow2 is monotonic across boundary inputs 31, 32, and 33
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputs: int[] = [31, 32, 33];
      let first: int = Math.ceilPow2(inputs[0]);
      let second: int = Math.ceilPow2(inputs[1]);
      let third: int = Math.ceilPow2(inputs[2]);
      expect(first <= second).assertTrue();
      expect(second <= third).assertTrue();
    });

    /**
     * @tc.name testMathCeilPow2025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEILPOW2_2500
     * @tc.desc Verify ceilPow2 method with int input Int.MAX_VALUE for overflow return Int.MIN_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathCeilPow2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: int = Int.MAX_VALUE;
      let result: int = Math.ceilPow2(input);
      expect(result).assertEqual(Int.MIN_VALUE);
    });
  });
}
