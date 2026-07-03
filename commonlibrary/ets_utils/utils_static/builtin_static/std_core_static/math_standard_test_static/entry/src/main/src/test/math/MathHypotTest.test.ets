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


function assertHypotClose(actual: double, expected: double, tolerance: double): void {
  let diff: double = Utils.getAbsDiff(actual, expected);
  expect(diff < tolerance).assertTrue();
}

function buildHypotNumberFromHelper(): number {
  return Math.max(9.0, 4.0);
}


export default function mathHypotTest(): void {
  describe('MathHypotTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0100
     * @tc.name testMathHypot001
     * @tc.desc Verify hypot method with no arguments returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot();
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0200
     * @tc.name testMathHypot002
     * @tc.desc Verify hypot method with a single positive argument returns the absolute value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveComponent: double = 5.0;
      let result: double = Math.hypot(positiveComponent);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0300
     * @tc.name testMathHypot003
     * @tc.desc Verify hypot method with a single negative argument returns the absolute value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeComponent: double = -3.0;
      let result: double = Math.hypot(negativeComponent);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0400
     * @tc.name testMathHypot004
     * @tc.desc Verify hypot method with 3.0 and 4.0 returns the Pythagorean norm 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalComponent: double = 3.0;
      let verticalComponent: double = 4.0;
      let result: double = Math.hypot(horizontalComponent, verticalComponent);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0500
     * @tc.name testMathHypot005
     * @tc.desc Verify hypot method with three arguments returns the Euclidean norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xComponent: double = 2.0;
      let yComponent: double = 3.0;
      let zComponent: double = 6.0;
      let result: double = Math.hypot(xComponent, yComponent, zComponent);
      expect(result).assertEqual(7.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0600
     * @tc.name testMathHypot006
     * @tc.desc Verify hypot method with ten arguments returns the high-dimensional norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstComponent: double = 1.0;
      let secondComponent: double = 2.0;
      let thirdComponent: double = 3.0;
      let fourthComponent: double = 4.0;
      let fifthComponent: double = 5.0;
      let sixthComponent: double = 6.0;
      let seventhComponent: double = 7.0;
      let eighthComponent: double = 8.0;
      let ninthComponent: double = 9.0;
      let tenthComponent: double = 10.0;
      let result: double = Math.hypot(firstComponent, secondComponent, thirdComponent, fourthComponent, fifthComponent,
        sixthComponent, seventhComponent, eighthComponent, ninthComponent, tenthComponent);
      let expected: double = 19.621416870348586;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0700
     * @tc.name testMathHypot007
     * @tc.desc Verify hypot method with mixed signed and zero arguments returns the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeComponent: double = -2.0;
      let zeroComponent: double = 0.0;
      let positiveComponent: double = 3.0;
      let result: double = Math.hypot(negativeComponent, zeroComponent, positiveComponent);
      let expected: double = 3.6055512754639896;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0800
     * @tc.name testMathHypot008
     * @tc.desc Verify hypot method accepts Int.MAX_VALUE with zero and preserves the widened integer boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIntComponent: int = Int.MAX_VALUE;
      let zeroComponent: double = 0.0;
      let result: double = Math.hypot(maxIntComponent, zeroComponent);
      expect(result).assertEqual(2147483647.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_0900
     * @tc.name testMathHypot009
     * @tc.desc Verify hypot method with all zero arguments returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstZero: double = 0.0;
      let secondZero: double = 0.0;
      let thirdZero: double = 0.0;
      let result: double = Math.hypot(firstZero, secondZero, thirdZero);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1000
     * @tc.name testMathHypot010
     * @tc.desc Verify hypot method propagates Double.NaN when no Double.POSITIVE_INFINITY argument is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let normalValue: double = 1.0;
      let result: double = Math.hypot(nanValue, normalValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1100
     * @tc.name testMathHypot011
     * @tc.desc Verify hypot method with Double.POSITIVE_INFINITY returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityComponent: double = Double.POSITIVE_INFINITY;
      let firstFiniteComponent: double = 1.0;
      let secondFiniteComponent: double = 2.0;
      let result: double = Math.hypot(positiveInfinityComponent, firstFiniteComponent, secondFiniteComponent);
      expect(result).assertEqual(positiveInfinityComponent);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1200
     * @tc.name testMathHypot012
     * @tc.desc Verify hypot method returns Double.POSITIVE_INFINITY before Double.NaN when both special values are present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let infValue: double = Double.POSITIVE_INFINITY;
      let result: double = Math.hypot(nanValue, infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1300
     * @tc.name testMathHypot013
     * @tc.desc Verify hypot method with Math.SQRT2 paired inputs returns the expected constant norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstComponent: double = Math.SQRT2;
      let secondComponent: double = Math.SQRT2;
      let result: double = Math.hypot(firstComponent, secondComponent);
      assertHypotClose(result, 2.0, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1400
     * @tc.name testMathHypot014
     * @tc.desc Verify hypot method with a single negative zero argument returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeZeroComponent: double = -0.0;
      let result: double = Math.hypot(negativeZeroComponent);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1500
     * @tc.name testMathHypot015
     * @tc.desc Verify hypot method with a single positive zero argument returns zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroComponent: double = 0.0;
      let result: double = Math.hypot(zeroComponent);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1600
     * @tc.name testMathHypot016
     * @tc.desc Verify hypot method with a single Double.NaN argument returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.hypot(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1700
     * @tc.name testMathHypot017
     * @tc.desc Verify hypot method with a single Double.POSITIVE_INFINITY argument returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityComponent: double = Double.POSITIVE_INFINITY;
      let result: double = Math.hypot(positiveInfinityComponent);
      expect(result).assertEqual(positiveInfinityComponent);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1800
     * @tc.name testMathHypot018
     * @tc.desc Verify hypot method with a single Double.NEGATIVE_INFINITY argument returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInfinityComponent: double = Double.NEGATIVE_INFINITY;
      let positiveInfinityExpected: double = Double.POSITIVE_INFINITY;
      let result: double = Math.hypot(negativeInfinityComponent);
      expect(result).assertEqual(positiveInfinityExpected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1900
     * @tc.name testMathHypot019
     * @tc.desc Verify hypot method with a single Double.MAX_VALUE input preserves the largest finite boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxDoubleComponent: double = Double.MAX_VALUE;
      let result: double = Math.hypot(maxDoubleComponent);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2000
     * @tc.name testMathHypot020
     * @tc.desc Verify hypot method with a tiny finite argument preserves precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tinyComponent: double = 1e-200;
      let result: double = Math.hypot(tinyComponent);
      expect(result).assertEqual(1e-200);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2100
     * @tc.name testMathHypot021
     * @tc.desc Verify hypot method computes a two-dimensional Euclidean distance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let startX: double = 1.0;
      let startY: double = 2.0;
      let endX: double = 5.0;
      let endY: double = 5.0;
      let deltaX: double = endX - startX;
      let deltaY: double = endY - startY;
      let distance: double = Math.hypot(deltaX, deltaY);
      expect(distance).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2200
     * @tc.name testMathHypot022
     * @tc.desc Verify hypot method with 12.0 and -5.0 returns the Pythagorean norm 13.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalComponent: double = 12.0;
      let verticalComponent: double = -5.0;
      let result: double = Math.hypot(horizontalComponent, verticalComponent);
      expect(result).assertEqual(13.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2300
     * @tc.name testMathHypot023
     * @tc.desc Verify hypot method with five arguments returns the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstComponent: double = 1.0;
      let secondComponent: double = 2.0;
      let thirdComponent: double = 3.0;
      let fourthComponent: double = 4.0;
      let fifthComponent: double = 5.0;
      let result: double = Math.hypot(firstComponent, secondComponent, thirdComponent, fourthComponent, fifthComponent);
      let expected: double = 7.416198487095663;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2400
     * @tc.name testMathHypot024
     * @tc.desc Verify hypot method with Math.PI constant input preserves the finite constant
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Math.PI, 0.0);
      expect(result).assertEqual(Math.PI);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2500
     * @tc.name testMathHypot025
     * @tc.desc Verify hypot method returns a stable result across repeated calls with the same inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalComponent: double = 3.0;
      let verticalComponent: double = 4.0;
      let firstResult: double = Math.hypot(horizontalComponent, verticalComponent);
      let secondResult: double = Math.hypot(horizontalComponent, verticalComponent);
      let thirdResult: double = Math.hypot(horizontalComponent, verticalComponent);
      expect(firstResult).assertEqual(5.0);
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2600
     * @tc.name testMathHypot026
     * @tc.desc Verify hypot method computes the exact magnitude for two negative finite arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstNegativeComponent: double = -5.0;
      let secondNegativeComponent: double = -12.0;
      let twoArgumentResult: double = Math.hypot(firstNegativeComponent, secondNegativeComponent);
      expect(twoArgumentResult).assertEqual(13.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2700
     * @tc.name testMathHypot027
     * @tc.desc Verify hypot method accepts Int.MIN_VALUE with zero and returns the exact absolute magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minIntComponent: int = Int.MIN_VALUE;
      let zeroComponent: double = 0.0;
      let result: double = Math.hypot(minIntComponent, zeroComponent);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2800
     * @tc.name testMathHypot028
     * @tc.desc Verify hypot method accepts number typed variables and returns the expected Euclidean norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalComponent: number = 9.0;
      let verticalComponent: number = 12.0;
      let result: double = Math.hypot(horizontalComponent, verticalComponent);
      expect(result).assertEqual(15.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_2900
     * @tc.name testMathHypot029
     * @tc.desc Verify hypot method accepts helper-returned number input and returns the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let helperComponent: number = buildHypotNumberFromHelper();
      let verticalComponent: double = 40.0;
      let result: double = Math.hypot(helperComponent, verticalComponent);
      expect(result).assertEqual(41.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3000
     * @tc.name testMathHypot030
     * @tc.desc Verify hypot method accepts a byte source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(5);
      let zeroComponent: double = 0.0;
      let result: double = Math.hypot(byteComponent, zeroComponent);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3100
     * @tc.name testMathHypot031
     * @tc.desc Verify hypot method accepts a short source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(12);
      let zeroComponent: double = 0.0;
      let result: double = Math.hypot(shortComponent, zeroComponent);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3200
     * @tc.name testMathHypot032
     * @tc.desc Verify hypot method accepts float source values widened to the double rest parameter path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalComponent: float = Double.toFloat(1.5);
      let verticalComponent: float = Double.toFloat(2.0);
      let result: double = Math.hypot(horizontalComponent, verticalComponent);
      assertHypotClose(result, 2.5, 1.0e-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3300
     * @tc.name testMathHypot033
     * @tc.desc Verify hypot method accepts arithmetic expression results as independent input sources
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: double = 2.0;
      let right: double = 10.0;
      let differenceComponent: double = right - left;
      let sumComponent: double = left + right + 3.0;
      let result: double = Math.hypot(differenceComponent, sumComponent);
      expect(result).assertEqual(17.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3400
     * @tc.name testMathHypot034
     * @tc.desc Verify hypot method with multiple Double.MAX_VALUE inputs overflows the final norm to Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.MAX_VALUE, Double.MAX_VALUE, Double.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3500
     * @tc.name testMathHypot035
     * @tc.desc Verify hypot method delays Double.NaN propagation until all parameters are scanned and no Double.POSITIVE_INFINITY is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = Double.NaN;
      let result: double = Math.hypot(3.0, nanValue, 4.0);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3600
     * @tc.name testMathHypot036
     * @tc.desc Verify hypot method scales large finite inputs without overflowing the intermediate square
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(1.0e154, 1.0e154);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertHypotClose(result, 1.414213562373095e154, 1.0e140);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3700
     * @tc.name testMathHypot037
     * @tc.desc Verify hypot method with mixed signed multi-parameter inputs computes the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(-6.0, 8.0, -24.0);
      expect(result).assertEqual(26.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3800
     * @tc.name testMathHypot038
     * @tc.desc Verify hypot method with arguments 1.0 and 3.0 for expected irrational norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalComponent: double = 1.0;
      let verticalComponent: double = 3.0;
      let result: double = Math.hypot(horizontalComponent, verticalComponent);
      assertHypotClose(result, 3.1622776601683795, 1.0e-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_3900
     * @tc.name testMathHypot039
     * @tc.desc Verify hypot method keeps the result unchanged when a positive zero component is added
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withoutZero: double = Math.hypot(5.0, 12.0);
      let withZero: double = Math.hypot(5.0, 12.0, 0.0);
      expect(withZero).assertEqual(withoutZero);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4000
     * @tc.name testMathHypot040
     * @tc.desc Verify hypot method keeps the result unchanged when a negative zero component is added
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withoutZero: double = Math.hypot(8.0, 15.0);
      let withNegativeZero: double = Math.hypot(8.0, 15.0, -0.0);
      expect(withNegativeZero).assertEqual(withoutZero);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4100
     * @tc.name testMathHypot041
     * @tc.desc Verify hypot method with Float.MAX_VALUE and zero stays finite on the widened double path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxFloatComponent: float = Float.MAX_VALUE;
      let zeroComponent: double = 0.0;
      let result: double = Math.hypot(maxFloatComponent, zeroComponent);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertHypotClose(result, Float.MAX_VALUE, 1.0e25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4200
     * @tc.name testMathHypot042
     * @tc.desc Verify hypot method preserves a Double.MIN_VALUE component when paired with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(Double.MIN_VALUE, 0.0);
      expect(result).assertEqual(Double.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4300
     * @tc.name testMathHypot043
     * @tc.desc Verify hypot method with hexadecimal and octal long sources computes the expected norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexadecimalComponent: long = Long.toLong(0x1234);
      let octalComponent: long = Long.toLong(0o123);
      let result: double = Math.hypot(hexadecimalComponent, octalComponent);
      assertHypotClose(result, 4660.739104476886, 1.0e-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4400
     * @tc.name testMathHypot044
     * @tc.desc Verify hypot method consumes Math constant expression inputs and returns the expected finite norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroConstantComponent: double = Math.PI - Math.PI;
      let eConstantComponent: double = Math.E;
      let result: double = Math.hypot(zeroConstantComponent, eConstantComponent);
      expect(result).assertEqual(Math.E);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4500
     * @tc.name testMathHypot045
     * @tc.desc Verify hypot method accepts a byte zero source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(0);
      let result: double = Math.hypot(byteComponent);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4600
     * @tc.name testMathHypot046
     * @tc.desc Verify hypot method accepts a normal positive byte source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(12);
      let result: double = Math.hypot(byteComponent);
      expect(result).assertEqual(12.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4700
     * @tc.name testMathHypot047
     * @tc.desc Verify hypot method accepts a byte negative marker source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(-1);
      let result: double = Math.hypot(byteComponent);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4800
     * @tc.name testMathHypot048
     * @tc.desc Verify hypot method accepts the byte maximum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(127);
      let result: double = Math.hypot(byteComponent);
      expect(result).assertEqual(127.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_4900
     * @tc.name testMathHypot049
     * @tc.desc Verify hypot method accepts the byte minimum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(-128);
      let result: double = Math.hypot(byteComponent);
      expect(result).assertEqual(128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5000
     * @tc.name testMathHypot050
     * @tc.desc Verify hypot method accepts a byte overflow-mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(128);
      let result: double = Math.hypot(byteComponent);
      expect(byteComponent).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(128.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5100
     * @tc.name testMathHypot051
     * @tc.desc Verify hypot method accepts a short zero source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(0);
      let result: double = Math.hypot(shortComponent);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5200
     * @tc.name testMathHypot052
     * @tc.desc Verify hypot method accepts a normal positive short source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(2048);
      let result: double = Math.hypot(shortComponent);
      expect(result).assertEqual(2048.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5300
     * @tc.name testMathHypot053
     * @tc.desc Verify hypot method accepts a short negative marker source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(-1);
      let result: double = Math.hypot(shortComponent);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5400
     * @tc.name testMathHypot054
     * @tc.desc Verify hypot method accepts the short maximum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(32767);
      let result: double = Math.hypot(shortComponent);
      expect(result).assertEqual(32767.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5500
     * @tc.name testMathHypot055
     * @tc.desc Verify hypot method accepts the short minimum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(-32768);
      let result: double = Math.hypot(shortComponent);
      expect(result).assertEqual(32768.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5600
     * @tc.name testMathHypot056
     * @tc.desc Verify hypot method accepts a short upper-limit mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shortComponent: short = Int.toShort(65535);
      let result: double = Math.hypot(shortComponent);
      expect(shortComponent).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5700
     * @tc.name testMathHypot057
     * @tc.desc Verify hypot method accepts an int maximum minus one boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = Int.MAX_VALUE - 1;
      let result: double = Math.hypot(intComponent);
      expect(result).assertEqual(2147483646.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5800
     * @tc.name testMathHypot058
     * @tc.desc Verify hypot method accepts an int hexadecimal source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = 0x1234;
      let result: double = Math.hypot(intComponent);
      expect(result).assertEqual(4660.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_5900
     * @tc.name testMathHypot059
     * @tc.desc Verify hypot method accepts an int binary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = 0b1010;
      let result: double = Math.hypot(intComponent);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6000
     * @tc.name testMathHypot060
     * @tc.desc Verify hypot method accepts an int octal source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = 0o123;
      let result: double = Math.hypot(intComponent);
      expect(result).assertEqual(83.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6100
     * @tc.name testMathHypot061
     * @tc.desc Verify hypot method accepts an int maximum boundary paired with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = Int.MAX_VALUE;
      let result: double = Math.hypot(intComponent);
      expect(result).assertEqual(2147483647.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6200
     * @tc.name testMathHypot062
     * @tc.desc Verify hypot method accepts an int minimum boundary and returns its widened magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = Int.MIN_VALUE;
      let result: double = Math.hypot(intComponent);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6300
     * @tc.name testMathHypot063
     * @tc.desc Verify hypot method accepts an int overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let intComponent: int = maximumValue + 1;
      let result: double = Math.hypot(intComponent);
      expect(intComponent).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6400
     * @tc.name testMathHypot064
     * @tc.desc Verify hypot method accepts a long zero source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longComponent: long = Int.toLong(0);
      let result: double = Math.hypot(longComponent);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6500
     * @tc.name testMathHypot065
     * @tc.desc Verify hypot method accepts a long maximum minus one boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longComponent: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.hypot(longComponent);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6600
     * @tc.name testMathHypot066
     * @tc.desc Verify hypot method accepts a long minimum plus one boundary source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longComponent: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.hypot(longComponent);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6700
     * @tc.name testMathHypot067
     * @tc.desc Verify hypot method accepts a long maximum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longComponent: long = Long.MAX_VALUE;
      let result: double = Math.hypot(longComponent);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6800
     * @tc.name testMathHypot068
     * @tc.desc Verify hypot method accepts Long.MIN_VALUE source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longComponent: long = Long.MIN_VALUE;
      let result: double = Math.hypot(longComponent);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_6900
     * @tc.name testMathHypot069
     * @tc.desc Verify hypot method accepts a long overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let longComponent: long = maximumValue + Int.toLong(1);
      let result: double = Math.hypot(longComponent);
      expect(longComponent).assertEqual(Long.MIN_VALUE);
      let expectedValue: double = Long.MAX_VALUE;
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7000
     * @tc.name testMathHypot070
     * @tc.desc Verify hypot method accepts a normal positive float source value widened at the call site
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(3.14);
      let result: double = Math.hypot(floatComponent);
      assertHypotClose(result, 3.140000104904175, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7100
     * @tc.name testMathHypot071
     * @tc.desc Verify hypot method accepts a positive float scientific notation source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(1.0e3);
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(1000.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7200
     * @tc.name testMathHypot072
     * @tc.desc Verify hypot method accepts a negative float scientific notation source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(-1.0e3);
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(1000.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7300
     * @tc.name testMathHypot073
     * @tc.desc Verify hypot method accepts a positive float zero source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(0.0);
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7400
     * @tc.name testMathHypot074
     * @tc.desc Verify hypot method accepts a negative float zero source value and returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(-0.0);
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7500
     * @tc.name testMathHypot075
     * @tc.desc Verify hypot method accepts the float maximum boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Float.MAX_VALUE;
      let result: double = Math.hypot(floatComponent);
      expect(Utils.isFiniteValue(result)).assertTrue();
      assertHypotClose(result, Float.MAX_VALUE, 1.0e25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7600
     * @tc.name testMathHypot076
     * @tc.desc Verify hypot method accepts the float minimum positive boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Float.MIN_VALUE;
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(Float.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7700
     * @tc.name testMathHypot077
     * @tc.desc Verify hypot method accepts a negative float minimum boundary source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = -Float.MIN_VALUE;
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(Float.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7800
     * @tc.name testMathHypot078
     * @tc.desc Verify hypot method propagates direct Float.NaN input when no Double.POSITIVE_INFINITY is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Float.NaN;
      let result: double = Math.hypot(floatComponent);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_7900
     * @tc.name testMathHypot079
     * @tc.desc Verify hypot method accepts direct Float.POSITIVE_INFINITY input and returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Float.POSITIVE_INFINITY;
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8000
     * @tc.name testMathHypot080
     * @tc.desc Verify hypot method accepts direct Float.NEGATIVE_INFINITY input and returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Float.NEGATIVE_INFINITY;
      let result: double = Math.hypot(floatComponent);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8100
     * @tc.name testMathHypot081
     * @tc.desc Verify hypot method accepts a float overflowed source value as Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: double = Math.hypot(floatComponent);
      expect(floatComponent).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8200
     * @tc.name testMathHypot082
     * @tc.desc Verify hypot method accepts a float underflowed source value as positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let floatComponent: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: double = Math.hypot(floatComponent);
      expect(floatComponent).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8300
     * @tc.name testMathHypot083
     * @tc.desc Verify hypot method accepts a positive double scientific notation source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleComponent: double = 1.0e6;
      let result: double = Math.hypot(doubleComponent);
      expect(result).assertEqual(1000000.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8400
     * @tc.name testMathHypot084
     * @tc.desc Verify hypot method accepts a negative double scientific notation source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleComponent: double = -1.0e6;
      let result: double = Math.hypot(doubleComponent);
      expect(result).assertEqual(1000000.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8500
     * @tc.name testMathHypot085
     * @tc.desc Verify hypot method accepts the negative Double.MAX_VALUE boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleComponent: double = -Double.MAX_VALUE;
      let result: double = Math.hypot(doubleComponent);
      expect(result).assertEqual(Double.MAX_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8600
     * @tc.name testMathHypot086
     * @tc.desc Verify hypot method accepts a negative Double.MIN_VALUE source value and returns its magnitude
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleComponent: double = -Double.MIN_VALUE;
      let result: double = Math.hypot(doubleComponent);
      expect(result).assertEqual(Double.MIN_VALUE);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8700
     * @tc.name testMathHypot087
     * @tc.desc Verify hypot method accepts a double overflowed source expression as Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleComponent: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.hypot(doubleComponent);
      expect(doubleComponent).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8800
     * @tc.name testMathHypot088
     * @tc.desc Verify hypot method with byte and short mapped marker values computes the combined norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteComponent: byte = Int.toByte(128);
      let shortComponent: short = Int.toShort(65535);
      let result: double = Math.hypot(byteComponent, shortComponent);
      assertHypotClose(result, 128.00390619039717, 1.0e-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_8900
     * @tc.name testMathHypot089
     * @tc.desc Verify hypot method with int boundary and float scientific sources computes the mixed widened norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intComponent: int = Int.MAX_VALUE - 1;
      let floatComponent: float = Double.toFloat(1.0e3);
      let result: double = Math.hypot(intComponent, floatComponent);
      assertHypotClose(result, 2147483646.0002327, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9000
     * @tc.name testMathHypot090
     * @tc.desc Verify hypot method with long hexadecimal and double scientific sources computes the mixed widened norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longComponent: long = Long.toLong(0x1234);
      let doubleComponent: double = -1.0e6;
      let result: double = Math.hypot(longComponent, doubleComponent);
      assertHypotClose(result, 1000010.8577410547, 1.0e-8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9100
     * @tc.name testMathHypot091
     * @tc.desc Verify hypot method with all numeric marker values computes the expected multi-argument norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteMarker: byte = Int.toByte(-1);
      let shortMarker: short = Int.toShort(-1);
      let intMarker: int = -1;
      let longMarker: long = Int.toLong(-1);
      let result: double = Math.hypot(byteMarker, shortMarker, intMarker, longMarker);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9200
     * @tc.name testMathHypot092
     * @tc.desc Verify hypot method returns Double.POSITIVE_INFINITY when Float.POSITIVE_INFINITY appears before Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infiniteComponent: float = Float.POSITIVE_INFINITY;
      let nanComponent: double = Double.NaN;
      let result: double = Math.hypot(infiniteComponent, nanComponent);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9300
     * @tc.name testMathHypot093
     * @tc.desc Verify hypot method returns Double.POSITIVE_INFINITY when Double.NEGATIVE_INFINITY appears before Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infiniteComponent: double = Double.NEGATIVE_INFINITY;
      let nanComponent: float = Float.NaN;
      let result: double = Math.hypot(infiniteComponent, nanComponent);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9400
     * @tc.name testMathHypot094
     * @tc.desc Verify hypot method with zero values from all numeric source types returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let byteZero: byte = Int.toByte(0);
      let shortZero: short = Int.toShort(0);
      let intZero: int = 0;
      let longZero: long = Int.toLong(0);
      let floatZero: float = Double.toFloat(0.0);
      let doubleZero: double = -0.0;
      let result: double = Math.hypot(byteZero, shortZero, intZero, longZero, floatZero, doubleZero);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9500
     * @tc.name testMathHypot095
     * @tc.desc Verify hypot method with int maximum and minimum boundaries computes a finite mixed norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIntComponent: int = Int.MAX_VALUE;
      let minIntComponent: int = Int.MIN_VALUE;
      let result: double = Math.hypot(maxIntComponent, minIntComponent);
      assertHypotClose(result, 3037000499.268943, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_9600
     * @tc.name testMathHypot096
     * @tc.desc Verify hypot method with long maximum and minimum boundaries computes a finite mixed norm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxLongComponent: long = Long.MAX_VALUE;
      let minLongComponent: long = Long.MIN_VALUE;
      let result: double = Math.hypot(maxLongComponent, minLongComponent);
      assertHypotClose(result, 1.3043817825332783e19, 1.0e4);
    });
  });
}
