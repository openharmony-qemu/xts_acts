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

function buildMaxNumberInputFromHelper(): number {
  return 42.5;
}

export default function mathMaxTest(): void {
  describe('MathMaxTest', (): void => {
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
     * @tc.name testMathMax001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0100
     * @tc.desc Verify max method with no arguments returns negative Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max();
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathMax002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0200
     * @tc.desc Verify max method with a single positive double argument returns the same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.PI;
      let result: double = Math.max(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMax003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0300
     * @tc.desc Verify max method with a single negative double argument returns the same value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Math.E;
      let result: double = Math.max(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMax004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0400
     * @tc.desc Verify max method with a single negative zero argument preserves negative zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.max(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMax005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0500
     * @tc.desc Verify max method with positive and negative zero returns positive zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZero: double = -0.0;
      let positiveZero: double = 0.0;
      let result: double = Math.max(negativeZero, positiveZero);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMax006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0600
     * @tc.desc Verify max method with a single NaN argument propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.NaN;
      let result: double = Math.max(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMax007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0700
     * @tc.desc Verify max method with a single positive Infinity argument returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.POSITIVE_INFINITY;
      let result: double = Math.max(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMax008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0800
     * @tc.desc Verify max method with a single negative Infinity argument returns negative Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.max(inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMax009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_0900
     * @tc.desc Verify max method with two finite positive doubles returns the larger value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 123.456;
      let right: double = 789.012;
      let result: double = Math.max(left, right);
      expect(result).assertEqual(right);
    });
    /**
     * @tc.name testMathMax010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1000
     * @tc.desc Verify max method with two negative doubles returns the value closer to zero
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = -5.0;
      let right: double = -6.0;
      let result: double = Math.max(left, right);
      expect(result).assertEqual(left);
    });
    /**
     * @tc.name testMathMax011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1100
     * @tc.desc Verify max method with mixed sign doubles returns the positive value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = -99.99;
      let right: double = 123.456;
      let result: double = Math.max(left, right);
      expect(result).assertEqual(right);
    });
    /**
     * @tc.name testMathMax012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1200
     * @tc.desc Verify max method with equal double arguments returns the shared value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 99.99;
      let result: double = Math.max(inputValue, inputValue, inputValue);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMax013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1300
     * @tc.desc Verify max method with NaN in the second binary position propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finiteValue: double = 100.0;
      let nanValue: double = Double.NaN;
      let result: double = Math.max(finiteValue, nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMax014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1400
     * @tc.desc Verify max method with NaN in the first binary position propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finiteValue: double = 100.0;
      let nanValue: double = Double.NaN;
      let result: double = Math.max(nanValue, finiteValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMax015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1500
     * @tc.desc Verify max method with NaN in a middle variadic position propagates NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.max(1.0, nanValue, 2.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMax016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1600
     * @tc.desc Verify max method with positive Infinity and Double.MAX_VALUE returns positive Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(Double.POSITIVE_INFINITY, Double.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.name testMathMax017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1700
     * @tc.desc Verify max method with negative Infinity and a finite value returns the finite value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finiteValue: double = -5.0;
      let result: double = Math.max(Double.NEGATIVE_INFINITY, finiteValue);
      expect(result).assertEqual(finiteValue);
    });
    /**
     * @tc.name testMathMax018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1800
     * @tc.desc Verify max method with mixed variadic finite values returns the greatest element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-50.5, 0.0, 123.456, -2.5, 78.9);
      expect(result).assertEqual(123.456);
    });
    /**
     * @tc.name testMathMax019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1900
     * @tc.desc Verify max method is commutative for finite double pairs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
    */
    it('testMathMax019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 5.0;
      let right: double = 10.0;
      let forwardOrderResult: double = Math.max(left, right);
      let reverseOrderResult: double = Math.max(right, left);
      expect(forwardOrderResult).assertEqual(10.0);
      expect(forwardOrderResult).assertEqual(reverseOrderResult);
    });
    /**
     * @tc.name testMathMax020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2000
     * @tc.desc Verify nested max composition matches the direct variadic maximum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = Math.max(3.0, 7.0);
      let nestedResult: double = Math.max(left, 5.0);
      let variadicResult: double = Math.max(3.0, 7.0, 5.0);
      expect(nestedResult).assertEqual(variadicResult);
    });
    /**
     * @tc.name testMathMax021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2100
     * @tc.desc Verify max method with Double.MIN_VALUE and positive zero returns Double.MIN_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(Double.MIN_VALUE, 0.0);
      expect(result).assertEqual(Double.MIN_VALUE);
    });
    /**
     * @tc.name testMathMax022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2200
     * @tc.desc Verify max method with Double.MAX_VALUE and a finite negative value returns Double.MAX_VALUE
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(Double.MAX_VALUE, -1.0);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.name testMathMax023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2300
     * @tc.desc Verify max method with Float.MIN_VALUE and negative zero returns the widened float minimum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallestFloat: float = Float.MIN_VALUE;
      let result: double = Math.max(smallestFloat, -0.0);
      let expected: double = smallestFloat;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathMax024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2400
     * @tc.desc Verify max method with Float.MAX_VALUE and a finite double returns the widened float maximum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largestFloat: float = Float.MAX_VALUE;
      let result: double = Math.max(largestFloat, 1.0);
      let expected: double = largestFloat;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathMax025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2500
     * @tc.desc Verify max method accepts widened byte input and returns the larger comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteValue: byte = Int.toByte(12);
      let result: double = Math.max(byteValue, 11.5);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.name testMathMax026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2600
     * @tc.desc Verify max method accepts widened short input and returns the larger comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortValue: short = Int.toShort(1024);
      let result: double = Math.max(shortValue, 512.0);
      expect(result).assertEqual(1024.0);
    });
    /**
     * @tc.name testMathMax027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2700
     * @tc.desc Verify max method accepts widened int input and returns the larger comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intValue: int = 2048;
      let result: double = Math.max(intValue, 1024.0);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.name testMathMax028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2800
     * @tc.desc Verify max method accepts widened long input and returns the larger comparison result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: long = Long.toLong(10000000000);
      let result: double = Math.max(longValue, 9999999999.0);
      expect(result).assertEqual(10000000000.0);
    });
    /**
     * @tc.name testMathMax029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2900
     * @tc.desc Verify max method accepts a number typed variable input and returns the larger candidate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let variableInput: number = 12.5;
      let result: number = Math.max(variableInput, 12.25);
      expect(result).assertEqual(variableInput);
    });
    /**
     * @tc.name testMathMax030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3000
     * @tc.desc Verify max method accepts helper function return typed as number and preserves the helper value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let helperInput: number = buildMaxNumberInputFromHelper();
      let result: number = Math.max(helperInput, 41.0);
      expect(result).assertEqual(helperInput);
    });
    /**
     * @tc.name testMathMax031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3100
     * @tc.desc Verify max method with Math constants returns PI over E
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testMathMax031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(Math.E, Math.PI);
      expect(result).assertEqual(Math.PI);
    });
  });
}
