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
} from '@ohos/hypium-binary/src/main/indexStatic';
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
     * @tc.desc Verify max method with no arguments returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with a single Double.NaN argument propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with a single Double.POSITIVE_INFINITY argument returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with a single Double.NEGATIVE_INFINITY argument returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with Double.NaN in the second binary position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with Double.NaN in the first binary position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with Double.NaN in a middle variadic position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify max method with Double.POSITIVE_INFINITY and Double.MAX_VALUE returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(Double.POSITIVE_INFINITY, Double.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathMax017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_1700
     * @tc.desc Verify max method with Double.NEGATIVE_INFINITY and a finite value returns the finite value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: long = Int.toLong(2048);
      let result: double = Math.max(longValue, 1024.0);
      expect(result).assertEqual(2048.0);
    });

    /**
     * @tc.name testMathMax029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_2900
     * @tc.desc Verify max method accepts a number typed variable input and returns the larger candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(Math.E, Math.PI);
      expect(result).assertEqual(Math.PI);
    });

    /**
     * @tc.name testMathMax032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3200
     * @tc.desc Verify max method accepts a byte zero source value and returns zero over a negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3300
     * @tc.desc Verify max method accepts the byte maximum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.max(inputValue, 126.0);
      expect(result).assertEqual(127.0);
    });

    /**
     * @tc.name testMathMax034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3400
     * @tc.desc Verify max method accepts the byte minimum boundary source value and returns the larger negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathMax035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3500
     * @tc.desc Verify max method accepts a byte overflow-mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3600
     * @tc.desc Verify max method accepts a byte underflow-mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toByte(127));
      expect(result).assertEqual(127.0);
    });

    /**
     * @tc.name testMathMax037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3700
     * @tc.desc Verify max method accepts a short zero source value and returns zero over a negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3800
     * @tc.desc Verify max method accepts the short maximum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.max(inputValue, 32760.0);
      expect(result).assertEqual(32767.0);
    });

    /**
     * @tc.name testMathMax039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_3900
     * @tc.desc Verify max method accepts the short minimum boundary source value and returns the larger negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathMax040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4000
     * @tc.desc Verify max method accepts a short upper-limit mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4100
     * @tc.desc Verify max method accepts a short lower-limit mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(32767.0);
    });

    /**
     * @tc.name testMathMax042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4200
     * @tc.desc Verify max method accepts an int zero source value and returns zero over a negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4300
     * @tc.desc Verify max method accepts the int maximum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.max(inputValue, 0.0);
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.name testMathMax044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4400
     * @tc.desc Verify max method accepts the int minimum boundary source value and returns the larger negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathMax045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4500
     * @tc.desc Verify max method accepts an int overflow-mapped source value after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4600
     * @tc.desc Verify max method accepts an int underflow-mapped source value after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(2147483647.0);
    });

    /**
     * @tc.name testMathMax047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4700
     * @tc.desc Verify max method accepts an int hexadecimal source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.max(inputValue, 4000.0);
      expect(result).assertEqual(4660.0);
    });

    /**
     * @tc.name testMathMax048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4800
     * @tc.desc Verify max method accepts binary and octal int source values as separate candidates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryValue: int = 0b1010;
      let octalValue: int = 0o123;
      let result: double = Math.max(binaryValue, octalValue);
      expect(result).assertEqual(83.0);
    });

    /**
     * @tc.name testMathMax049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_4900
     * @tc.desc Verify max method accepts a long zero source value and returns zero over a negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5000
     * @tc.desc Verify max method accepts Long.MAX_VALUE and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.max(inputValue, 0.0);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathMax051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5100
     * @tc.desc Verify max method accepts Long.MIN_VALUE source value and returns the larger negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.max(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.name testMathMax052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5200
     * @tc.desc Verify max method accepts a long overflow-mapped source value after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathMax053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5300
     * @tc.desc Verify max method accepts a long underflow-mapped Long.MAX_VALUE source after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.max(inputValue, 0.0);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });

    /**
     * @tc.name testMathMax054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5400
     * @tc.desc Verify max method with float positive and negative zero returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZero: float = Double.toFloat(-0.0);
      let positiveZero: float = Double.toFloat(0.0);
      let result: double = Math.max(negativeZero, positiveZero);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathMax055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5500
     * @tc.desc Verify max method accepts the float maximum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.max(inputValue, 1.0);
      let expected: double = inputValue;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathMax056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5600
     * @tc.desc Verify max method accepts the float minimum positive boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.max(inputValue, 0.0);
      let expected: double = inputValue;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathMax057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5700
     * @tc.desc Verify max method accepts direct Float.POSITIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: double = Math.max(inputValue, Float.MAX_VALUE);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.name testMathMax058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5800
     * @tc.desc Verify max method accepts direct Float.NEGATIVE_INFINITY input with a finite candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.max(inputValue, -5.0);
      expect(result).assertEqual(-5.0);
    });

    /**
     * @tc.name testMathMax059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_5900
     * @tc.desc Verify max method with Float.NaN in the first position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: double = Math.max(inputValue, 1.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathMax060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6000
     * @tc.desc Verify max method accepts negative Double.MIN_VALUE and negative zero and returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-Double.MIN_VALUE, -0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathMax061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6100
     * @tc.desc Verify max method with all negative variadic double values returns the least negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-100.0, -3.0, -50.0, -4.0);
      expect(result).assertEqual(-3.0);
    });

    /**
     * @tc.name testMathMax062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6200
     * @tc.desc Verify max method with trailing Double.NaN in variadic double values propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(1.0, 2.0, Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.name testMathMax063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6300
     * @tc.desc Verify max method with variadic zero values and Double.MIN_VALUE returns the positive minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-0.0, Double.MIN_VALUE, 0.0);
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.name testMathMax064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6400
     * @tc.desc Verify max method with only negative zero double values preserves negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-0.0, -0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathMax065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6500
     * @tc.desc Verify max method with a single positive zero double value preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.name testMathMax066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MAX_6600
     * @tc.desc Verify max method with variadic signed zeros returns positive zero when any positive zero is present
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.max(-0.0, 0.0, -0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
  });
}
