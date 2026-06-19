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
     * @tc.desc Verify hypot method propagates NaN when no Infinity argument is present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let normalValue: double = 1.0;
      let result: double = Math.hypot(nanValue, normalValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1100
     * @tc.name testMathHypot011
     * @tc.desc Verify hypot method with positive Infinity returns positive Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityComponent: double = 1.0 / 0.0;
      let firstFiniteComponent: double = 1.0;
      let secondFiniteComponent: double = 2.0;
      let result: double = Math.hypot(positiveInfinityComponent, firstFiniteComponent, secondFiniteComponent);
      expect(result).assertEqual(positiveInfinityComponent);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1200
     * @tc.name testMathHypot012
     * @tc.desc Verify hypot method returns Infinity before NaN when both special values are present
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.hypot(nanValue, infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1300
     * @tc.name testMathHypot013
     * @tc.desc Verify hypot method returns expected results across zero, one, two, and three argument paths
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstComponent: double = 3.0;
      let secondComponent: double = 4.0;
      let thirdComponent: double = 12.0;
      let zeroArgumentResult: double = Math.hypot();
      let singleArgumentResult: double = Math.hypot(firstComponent);
      let twoArgumentResult: double = Math.hypot(firstComponent, secondComponent);
      let threeArgumentResult: double = Math.hypot(firstComponent, secondComponent, thirdComponent);
      expect(zeroArgumentResult).assertEqual(0.0);
      expect(singleArgumentResult).assertEqual(3.0);
      expect(twoArgumentResult).assertEqual(5.0);
      expect(threeArgumentResult).assertEqual(13.0);
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
     * @tc.desc Verify hypot method with a single NaN argument returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let result: double = Math.hypot(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1700
     * @tc.name testMathHypot017
     * @tc.desc Verify hypot method with a single positive Infinity argument returns positive Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInfinityComponent: double = 1.0 / 0.0;
      let result: double = Math.hypot(positiveInfinityComponent);
      expect(result).assertEqual(positiveInfinityComponent);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_HYPOT_1800
     * @tc.name testMathHypot018
     * @tc.desc Verify hypot method with a single negative Infinity argument returns positive Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInfinityComponent: double = -1.0 / 0.0;
      let positiveInfinityExpected: double = 1.0 / 0.0;
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
     * @tc.desc Verify hypot method supports direct static invocation through Math
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.hypot(3.0, 4.0);
      expect(result).assertEqual(5.0);
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
     * @tc.desc Verify hypot method returns non-negative results for negative finite arguments
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstNegativeComponent: double = -5.0;
      let secondNegativeComponent: double = -12.0;
      let twoArgumentResult: double = Math.hypot(firstNegativeComponent, secondNegativeComponent);
      let threeArgumentResult: double = Math.hypot(-1.0, -1.0, -1.0);
      expect(twoArgumentResult >= 0.0).assertTrue();
      expect(threeArgumentResult >= 0.0).assertTrue();
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
     * @tc.desc Verify hypot method with multiple Double.MAX_VALUE inputs overflows the final norm to Infinity
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
     * @tc.desc Verify hypot method delays NaN propagation until all parameters are scanned and no Infinity is present
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
     * @tc.desc Verify hypot method computes a large integer-like business distance from long sources
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathHypot043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let horizontalBusinessComponent: long = Long.toLong(9000000000);
      let verticalBusinessComponent: long = Long.toLong(12000000000);
      let result: double = Math.hypot(horizontalBusinessComponent, verticalBusinessComponent);
      expect(result).assertEqual(15000000000.0);
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
  });
}
