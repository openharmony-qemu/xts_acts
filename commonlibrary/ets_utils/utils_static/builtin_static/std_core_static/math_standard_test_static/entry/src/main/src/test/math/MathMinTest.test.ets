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
     * @tc.desc Verify min method with no arguments returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with a single Double.NaN argument propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with a single Double.POSITIVE_INFINITY argument returns Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with a single Double.NEGATIVE_INFINITY argument returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with Double.NaN in the second binary position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with Double.NaN in the first binary position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with Double.NaN in a middle variadic position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.desc Verify min method with Double.POSITIVE_INFINITY and Double.MAX_VALUE returns Double.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(Double.POSITIVE_INFINITY, Double.MAX_VALUE);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.name testMathMin017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_1700
     * @tc.desc Verify min method with Double.NEGATIVE_INFINITY and a finite value returns Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: long = Int.toLong(2048);
      let result: double = Math.min(longValue, 4096.0);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.name testMathMin029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_2900
     * @tc.desc Verify min method accepts a number typed variable input and returns the smaller candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
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
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(Math.E, Math.PI);
      expect(result).assertEqual(Math.E);
    });
    /**
     * @tc.name testMathMin032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3200
     * @tc.desc Verify min method accepts a byte zero source value and returns the negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3300
     * @tc.desc Verify min method accepts the byte maximum boundary source value and returns the smaller candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.min(inputValue, 126.0);
      expect(result).assertEqual(126.0);
    });
    /**
     * @tc.name testMathMin034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3400
     * @tc.desc Verify min method accepts the byte minimum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.name testMathMin035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3500
     * @tc.desc Verify min method accepts a byte overflow-mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-128.0);
    });
    /**
     * @tc.name testMathMin036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3600
     * @tc.desc Verify min method accepts a byte underflow-mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toByte(127));
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.name testMathMin037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3700
     * @tc.desc Verify min method accepts a byte negative one source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.min(inputValue, 0.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3800
     * @tc.desc Verify min method accepts a short zero source value and returns the negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_3900
     * @tc.desc Verify min method accepts the short maximum boundary source value and returns the smaller candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.min(inputValue, 32760.0);
      expect(result).assertEqual(32760.0);
    });
    /**
     * @tc.name testMathMin040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4000
     * @tc.desc Verify min method accepts the short minimum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-32768.0);
    });
    /**
     * @tc.name testMathMin041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4100
     * @tc.desc Verify min method accepts a short upper-limit mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4200
     * @tc.desc Verify min method accepts a short lower-limit mapped source value after explicit conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.toShort(32767));
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.name testMathMin043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4300
     * @tc.desc Verify min method accepts an int zero source value and returns the negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4400
     * @tc.desc Verify min method accepts the int maximum boundary source value and returns the smaller candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.min(inputValue, 0.0);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.name testMathMin045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4500
     * @tc.desc Verify min method accepts the int minimum boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.name testMathMin046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4600
     * @tc.desc Verify min method accepts an int overflow-mapped source value after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-2147483648.0);
    });
    /**
     * @tc.name testMathMin047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4700
     * @tc.desc Verify min method accepts an int underflow-mapped source value after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.name testMathMin048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4800
     * @tc.desc Verify min method accepts an int hexadecimal source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.min(inputValue, 4000.0);
      expect(result).assertEqual(4000.0);
    });
    /**
     * @tc.name testMathMin049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_4900
     * @tc.desc Verify min method accepts binary and octal int source values as separate candidates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryValue: int = 0b1010;
      let octalValue: int = 0o123;
      let result: double = Math.min(binaryValue, octalValue);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.name testMathMin050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5000
     * @tc.desc Verify min method accepts an int maximum-minus-one adjacent boundary source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.min(inputValue, Int.MAX_VALUE);
      expect(result).assertEqual(2147483646.0);
    });
    /**
     * @tc.name testMathMin051
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5100
     * @tc.desc Verify min method accepts a long zero source value and returns the negative candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.name testMathMin052
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5200
     * @tc.desc Verify min method accepts a long hexadecimal source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(0x1234);
      let result: double = Math.min(inputValue, 5000.0);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.name testMathMin053
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5300
     * @tc.desc Verify min method accepts the long maximum boundary source value and returns the smaller candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.min(inputValue, 0.0);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.name testMathMin054
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5400
     * @tc.desc Verify min method accepts Long.MIN_VALUE and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.min(inputValue, -1.0);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.name testMathMin055
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5500
     * @tc.desc Verify min method accepts a long overflow-mapped Long.MIN_VALUE source and returns its double representation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      let expectedValue: double = Long.MIN_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.name testMathMin056
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5600
     * @tc.desc Verify min method accepts a long underflow-mapped source value after arithmetic conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.name testMathMin057
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5700
     * @tc.desc Verify min method accepts a long negative marker source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: double = Math.min(inputValue, -2.0);
      expect(result).assertEqual(-2.0);
    });
    /**
     * @tc.name testMathMin058
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5800
     * @tc.desc Verify min method with float positive and negative zero returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZero: float = Double.toFloat(-0.0);
      let positiveZero: float = Double.toFloat(0.0);
      let result: double = Math.min(negativeZero, positiveZero);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin059
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_5900
     * @tc.desc Verify min method accepts the float maximum boundary source value and returns the smaller candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: double = Math.min(inputValue, 1.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathMin060
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6000
     * @tc.desc Verify min method accepts the float minimum positive boundary source value and returns zero as smaller
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: double = Math.min(inputValue, 0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin061
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6100
     * @tc.desc Verify min method accepts direct Float.POSITIVE_INFINITY input with a finite candidate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: double = Math.min(inputValue, Float.MAX_VALUE);
      let expected: double = Float.MAX_VALUE;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathMin062
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6200
     * @tc.desc Verify min method accepts direct Float.NEGATIVE_INFINITY input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.min(inputValue, -5.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.name testMathMin063
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6300
     * @tc.desc Verify min method with Float.NaN in the first position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: double = Math.min(inputValue, 1.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin064
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6400
     * @tc.desc Verify min method with Float.NaN in the second position propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: double = Math.min(1.0, inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin065
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6500
     * @tc.desc Verify min method accepts a float Math.SQRT2 constant source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Math.SQRT2);
      let result: double = Math.min(inputValue, 2.0);
      let expected: double = inputValue;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathMin066
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6600
     * @tc.desc Verify min method accepts a negative float Math.SQRT2 constant source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Math.SQRT2);
      let result: double = Math.min(inputValue, -1.0);
      let expected: double = inputValue;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathMin067
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6700
     * @tc.desc Verify min method accepts a float overflowed source value as Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.min(inputValue, Float.MAX_VALUE);
      let expected: double = Float.MAX_VALUE;
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.name testMathMin068
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6800
     * @tc.desc Verify min method accepts a float underflowed source value as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.min(inputValue, Double.toFloat(-0.0));
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin069
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_6900
     * @tc.desc Verify min method accepts negative Double.MIN_VALUE and negative zero and returns negative minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(-Double.MIN_VALUE, -0.0);
      expect(result).assertEqual(-Double.MIN_VALUE);
    });
    /**
     * @tc.name testMathMin070
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7000
     * @tc.desc Verify min method accepts a double Math.SQRT2 constant source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.SQRT2;
      let result: double = Math.min(inputValue, 2.0);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin071
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7100
     * @tc.desc Verify min method accepts a negative double Math.SQRT2 constant source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Math.SQRT2;
      let result: double = Math.min(inputValue, -1.0);
      expect(result).assertEqual(inputValue);
    });
    /**
     * @tc.name testMathMin072
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7200
     * @tc.desc Verify min method accepts a double overflowed source expression as Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.min(inputValue, Double.MAX_VALUE);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.name testMathMin073
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7300
     * @tc.desc Verify min method accepts a double underflowed source expression as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.min(inputValue, Double.MIN_VALUE);
      expect(inputValue).assertEqual(0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin074
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7400
     * @tc.desc Verify min method accepts a double negative underflowed source expression as negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.min(inputValue, 0.0);
      expect(inputValue).assertEqual(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin075
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7500
     * @tc.desc Verify min method with duplicate minimum double values returns the shared minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(5.0, 1.0, 1.0, 9.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.name testMathMin076
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7600
     * @tc.desc Verify min method with trailing Double.NaN in variadic double values propagates Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(1.0, 2.0, Double.NaN);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin077
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7700
     * @tc.desc Verify min method with only positive zero double values preserves positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(0.0, 0.0);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin078
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7800
     * @tc.desc Verify min method with a single negative zero double value preserves negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(-0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.name testMathMin079
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_7900
     * @tc.desc Verify min method accepts Math.pow expression as a source value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.pow(2.0, 10.0);
      let result: double = Math.min(inputValue, 1000.0);
      expect(result).assertEqual(1000.0);
    });
    /**
     * @tc.name testMathMin080
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_8000
     * @tc.desc Verify min method accepts helper number source value and a smaller competitor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let helperInput: number = buildMinNumberInputFromHelper();
      let result: number = Math.min(helperInput, -100.0);
      expect(result).assertEqual(-100.0);
    });
    /**
     * @tc.name testMathMin081
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_MIN_8100
     * @tc.desc Verify min method with variadic signed zeros returns negative zero when any negative zero is present
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.min(0.0, -0.0, 0.0);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
  });
}
