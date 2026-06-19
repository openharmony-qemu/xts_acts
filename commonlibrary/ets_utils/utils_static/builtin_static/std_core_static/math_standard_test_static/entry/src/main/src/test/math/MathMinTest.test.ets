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

function buildMinNumberInputFromHelper(): number {
  return -42.5;
}

export default function mathMinTest(): void {
  describe('MathMinTest', (): void => {
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
     * @tc.name testMathMin001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0100
     * @tc.desc Verify min method with no arguments returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min();
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathMin002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0200
     * @tc.desc Verify min method with a single positive double argument returns the same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.PI;
      let result: double = Math.min(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0300
     * @tc.desc Verify min method with a single negative double argument returns the same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Math.E;
      let result: double = Math.min(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0400
     * @tc.desc Verify min method with a single positive zero argument preserves positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.min(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0500
     * @tc.desc Verify min method with negative and positive zero returns negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZero: double = -0.0;
      let positiveZero: double = 0.0;
      let result: double = Math.min(negativeZero, positiveZero);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0600
     * @tc.desc Verify min method with a single NaN argument propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.NaN;
      let result: double = Math.min(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0700
     * @tc.desc Verify min method with a single positive Infinity argument returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.POSITIVE_INFINITY;
      let result: double = Math.min(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0800
     * @tc.desc Verify min method with a single negative Infinity argument returns negative Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.min(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_0900
     * @tc.desc Verify min method with two finite positive doubles returns the smaller value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 123.456;
      let right: double = 789.012;
      let result: double = Math.min(left, right);
      expect(result).assertEqual(left);
    });
    /**
     * @tc.name testMathMin010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1000
     * @tc.desc Verify min method with two negative doubles returns the value farther from zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = -5.0;
      let right: double = -6.0;
      let result: double = Math.min(left, right);
      expect(result).assertEqual(right);
    });
    /**
     * @tc.name testMathMin011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1100
     * @tc.desc Verify min method with mixed sign doubles returns the negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = -99.99;
      let right: double = 123.456;
      let result: double = Math.min(left, right);
      expect(result).assertEqual(left);
    });
    /**
     * @tc.name testMathMin012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1200
     * @tc.desc Verify min method with equal double arguments returns the shared value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 99.99;
      let result: double = Math.min(inputValue, inputValue, inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1300
     * @tc.desc Verify min method with NaN in the second binary position propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finiteValue: double = 100.0;
      let nanValue: double = Double.NaN;
      let result: double = Math.min(finiteValue, nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1400
     * @tc.desc Verify min method with NaN in the first binary position propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finiteValue: double = 100.0;
      let nanValue: double = Double.NaN;
      let result: double = Math.min(nanValue, finiteValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1500
     * @tc.desc Verify min method with NaN in a middle variadic position propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.min(1.0, nanValue, 2.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1600
     * @tc.desc Verify min method with positive Infinity and Double.MAX_VALUE returns Double.MAX_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(Double.POSITIVE_INFINITY, Double.MAX_VALUE);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.name testMathMin017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1700
     * @tc.desc Verify min method with negative Infinity and a finite value returns negative Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finiteValue: double = -5.0;
      let result: double = Math.min(Double.NEGATIVE_INFINITY, finiteValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathMin018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1800
     * @tc.desc Verify min method with mixed variadic finite values returns the least element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(-50.5, 0.0, 123.456, -2.5, 78.9);
      expect(result).assertEqual(-50.5);
    });
    /**
     * @tc.name testMathMin019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1900
     * @tc.desc Verify min method is commutative for finite double pairs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathMin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 5.0;
      let right: double = 10.0;
      let forwardOrderResult: double = Math.min(left, right);
      let reverseOrderResult: double = Math.min(right, left);
      expect(forwardOrderResult).assertEqual(5.0);
      expect(forwardOrderResult).assertEqual(reverseOrderResult);
    });
    /**
     * @tc.name testMathMin020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2000
     * @tc.desc Verify nested min composition matches the direct variadic minimum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = Math.min(3.0, 7.0);
      let nestedResult: double = Math.min(left, 5.0);
      let variadicResult: double = Math.min(3.0, 7.0, 5.0);
      expect(nestedResult).assertEqual(variadicResult);
    });
    /**
     * @tc.name testMathMin021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2100
     * @tc.desc Verify min method with Double.MIN_VALUE and positive zero returns positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(Double.MIN_VALUE, 0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2200
     * @tc.desc Verify min method with Double.MAX_VALUE and a finite negative value returns the finite negative value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(Double.MAX_VALUE, -1.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2300
     * @tc.desc Verify min method with Float.MIN_VALUE and negative zero returns negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallestFloat: float = Float.MIN_VALUE;
      let result: double = Math.min(smallestFloat, -0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2400
     * @tc.desc Verify min method with Float.MAX_VALUE and a finite double returns the finite double
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largestFloat: float = Float.MAX_VALUE;
      let result: double = Math.min(largestFloat, 1.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathMin025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2500
     * @tc.desc Verify min method accepts widened byte input and returns the smaller comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteValue: byte = Int.toByte(12);
      let result: double = Math.min(byteValue, 12.5);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.name testMathMin026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2600
     * @tc.desc Verify min method accepts widened short input and returns the smaller comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortValue: short = Int.toShort(1024);
      let result: double = Math.min(shortValue, 2048.0);
      expect(result).assertEqual(1024.0);
    });
    /**
     * @tc.name testMathMin027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2700
     * @tc.desc Verify min method accepts widened int input and returns the smaller comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intValue: int = 2048;
      let result: double = Math.min(intValue, 4096.0);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.name testMathMin028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2800
     * @tc.desc Verify min method accepts widened long input and returns the smaller comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: long = Long.toLong(10000000000);
      let result: double = Math.min(longValue, 10000000001.0);
      expect(result).assertEqual(10000000000.0);
    });
    /**
     * @tc.name testMathMin029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2900
     * @tc.desc Verify min method accepts a number typed variable input and returns the smaller candidate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let variableInput: number = -12.5;
      let result: number = Math.min(variableInput, -12.25);
      expect(result).assertEqual(variableInput);
    });
    /**
     * @tc.name testMathMin030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3000
     * @tc.desc Verify min method accepts helper function return typed as number and preserves the helper value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let helperInput: number = buildMinNumberInputFromHelper();
      let result: number = Math.min(helperInput, -41.0);
      expect(result).assertEqual(helperInput);
    });
    /**
     * @tc.name testMathMin031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3100
     * @tc.desc Verify min method with Math constants returns E over PI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(Math.E, Math.PI);
      expect(result).assertEqual(Math.E);
    });
  });
}
