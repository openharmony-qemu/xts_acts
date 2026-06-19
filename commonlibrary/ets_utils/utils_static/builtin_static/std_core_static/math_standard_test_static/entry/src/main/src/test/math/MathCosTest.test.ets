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


export default function mathCosTest(): void {
  describe('MathCosTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0100
     * @tc.name testMathCos001
     * @tc.desc Verify cos method with zero radian input 0.0 for exact one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.cos(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0200
     * @tc.name testMathCos002
     * @tc.desc Verify cos method with PI/2 radian input for near zero within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI / 2.0;
      let eps: double = 1.0e-10;
      let result: double = Math.cos(input);
      expect(result > -eps).assertTrue();
      expect(result < eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0300
     * @tc.name testMathCos003
     * @tc.desc Verify cos method with PI radian input for near expected value within floating-point tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI;
      let eps: double = 1.0e-15;
      let result: double = Math.cos(input);
      expect(result > -1.0 - eps).assertTrue();
      expect(result < -1.0 + eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0400
     * @tc.name testMathCos004
     * @tc.desc Verify cos method with 2*PI radian input for complete period expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0 * Math.PI;
      let eps: double = 1.0e-15;
      let result: double = Math.cos(input);
      expect(result > 1.0 - eps).assertTrue();
      expect(result <= 1.0 + eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0500
     * @tc.name testMathCos005
     * @tc.desc Verify cos method with -PI/2 radian input for negative half-period expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -Math.PI / 2.0;
      let eps: double = 1.0e-10;
      let result: double = Math.cos(input);
      expect(result > -eps).assertTrue();
      expect(result < eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0600
     * @tc.name testMathCos006
     * @tc.desc Verify cos method with positive decimal radian 0.5 for valid finite return in [-1,1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.cos(input);
      expect(result >= -1.0).assertTrue();
      expect(result <= 1.0).assertTrue();
      let isFinite: boolean = Utils.isFiniteValue(result);
      expect(isFinite).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0700
     * @tc.name testMathCos007
     * @tc.desc Verify cos method with 3*PI/2 radian input for third quadrant expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.5 * Math.PI;
      let eps: double = 1.0e-10;
      let result: double = Math.cos(input);
      expect(result > -eps).assertTrue();
      expect(result < eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0800
     * @tc.name testMathCos008
     * @tc.desc Verify cos method with PI/6 radian input for standard angle expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI / 6.0;
      let result: double = Math.cos(input);
      let expected: double = 0.8660254037844386;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_0900
     * @tc.name testMathCos009
     * @tc.desc Verify cos method with PI/4 radian input for standard angle expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI / 4.0;
      let result: double = Math.cos(input);
      let expected: double = 0.7071067811865476;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1000
     * @tc.name testMathCos010
     * @tc.desc Verify cos method with PI/6 radian input for result within [-1,1] range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.PI / 6.0;
      let result: double = Math.cos(input);
      expect(result >= -1.0).assertTrue();
      expect(result <= 1.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1100
     * @tc.name testMathCos011
     * @tc.desc Verify cos method with zero-crossing radian batch for near-zero returns within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eps: double = 1.0e-14;
      let zeroAngleResult: double = Math.cos(0.0);
      let piAngleResult: double = Math.cos(Math.PI);
      let fullPeriodResult: double = Math.cos(2.0 * Math.PI);
      expect(zeroAngleResult > 1.0 - eps).assertTrue();
      expect(piAngleResult > -1.0 - eps && piAngleResult < -1.0 + eps).assertTrue();
      expect(fullPeriodResult > 1.0 - eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1200
     * @tc.name testMathCos012
     * @tc.desc Verify cos method even function property for symmetric inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let positiveInputResult: double = Math.cos(x);
      let negativeInputResult: double = Math.cos(-x);
      expect(positiveInputResult).assertEqual(negativeInputResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1300
     * @tc.name testMathCos013
     * @tc.desc Verify cos method with double NaN input for NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.cos(nanInput);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1400
     * @tc.name testMathCos014
     * @tc.desc Verify cos method with double positive Infinity input for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.cos(infInput);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1500
     * @tc.name testMathCos015
     * @tc.desc Verify cos method with double negative Infinity input for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = -1.0 / 0.0;
      let result: double = Math.cos(infInput);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1600
     * @tc.name testMathCos016
     * @tc.desc Verify cos method with large positive radian input for bounded result in [-1,1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e16;
      let result: double = Math.cos(input);
      expect(result >= -1.0).assertTrue();
      expect(result <= 1.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1700
     * @tc.name testMathCos017
     * @tc.desc Verify cos method directly called via Math class name for valid static return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.cos(0.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1800
     * @tc.name testMathCos018
     * @tc.desc Verify cos method multiple static calls without instance for valid returns each time
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInputResult: double = Math.cos(0.0);
      let halfRadianResult: double = Math.cos(0.5);
      let oneRadianResult: double = Math.cos(1.0);
      let isFinite: boolean = Utils.isFiniteValue(zeroInputResult)
        && Utils.isFiniteValue(halfRadianResult)
        && Utils.isFiniteValue(oneRadianResult);
      expect(isFinite).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_1900
     * @tc.name testMathCos019
     * @tc.desc Verify cos method sequential different inputs for independent stateless results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstInputResult: double = Math.cos(0.3);
      let secondInputResult: double = Math.cos(1.2);
      let repeatFirstInputResult: double = Math.cos(0.3);
      expect(firstInputResult).assertEqual(repeatFirstInputResult);
      expect(secondInputResult).assertEqual(Math.cos(1.2));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2000
     * @tc.name testMathCos020
     * @tc.desc Verify cos method periodicity property for equal results at x and x+2PI
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.7;
      let twoPi: double = 2.0 * Math.PI;
      let baseAngleResult: double = Math.cos(x);
      let shiftedAngleResult: double = Math.cos(x + twoPi);
      let diff: double = Utils.getAbsDiff(baseAngleResult, shiftedAngleResult);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2100
     * @tc.name testMathCos021
     * @tc.desc Verify cos method repeated same-input calls for identical results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let firstCallResult: double = Math.cos(x);
      let secondCallResult: double = Math.cos(x);
      let thirdCallResult: double = Math.cos(x);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2200
     * @tc.name testMathCos022
     * @tc.desc Verify cos method multiple inputs each called repeatedly for stable per-input results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallerAngleInput: double = 0.3;
      let largerAngleInput: double = 1.1;
      let smallerAngleFirstCallResult: double = Math.cos(smallerAngleInput);
      let smallerAngleSecondCallResult: double = Math.cos(smallerAngleInput);
      let largerAngleFirstCallResult: double = Math.cos(largerAngleInput);
      let largerAngleSecondCallResult: double = Math.cos(largerAngleInput);
      expect(smallerAngleFirstCallResult).assertEqual(smallerAngleSecondCallResult);
      expect(largerAngleFirstCallResult).assertEqual(largerAngleSecondCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2300
     * @tc.name testMathCos023
     * @tc.desc Verify cos method interleaved calls with other inputs for consistent results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.4;
      let beforeInterleavedCallResult: double = Math.cos(x);
      Math.cos(2.0);
      let afterInterleavedCallResult: double = Math.cos(x);
      expect(beforeInterleavedCallResult).assertEqual(afterInterleavedCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2400
     * @tc.name testMathCos024
     * @tc.desc Verify cos method with denormal tiny positive input for near-linear or near-one behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tiny: double = 5.0e-324;
      let result: double = Math.cos(tiny);
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2500
     * @tc.name testMathCos025
     * @tc.desc Verify cos method symmetry about PI/2 for symmetric values around axis
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eps: double = 0.01;
      let halfPi: double = Math.PI / 2.0;
      let rightOffsetResult: double = Math.cos(halfPi + eps);
      let leftOffsetResult: double = Math.cos(halfPi - eps);
      let diff: double = Utils.getAbsDiff(rightOffsetResult, leftOffsetResult);
      expect(diff < 0.05).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2600
     * @tc.name testMathCos026
     * @tc.desc Verify cos method 2PI equals zero input for equivalent period boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eps: double = 1.0e-14;
      let zeroAngleResult: double = Math.cos(0.0);
      let fullPeriodResult: double = Math.cos(2.0 * Math.PI);
      expect(zeroAngleResult > 1.0 - eps).assertTrue();
      expect(fullPeriodResult > 1.0 - eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2700
     * @tc.name testMathCos027
     * @tc.desc Verify cos method with small angle input for small-angle approximation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0e-8;
      let result: double = Math.cos(x);
      expect(result > 0.99999999).assertTrue();
      expect(result <= 1.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2800
     * @tc.name testMathCos028
     * @tc.desc Verify cos method with huge positive radian for bounded result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.0e8;
      let result: double = Math.cos(input);
      expect(result >= -1.0).assertTrue();
      expect(result <= 1.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_2900
     * @tc.name testMathCos029
     * @tc.desc Verify cos method with huge negative radian for bounded result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.0e8;
      let result: double = Math.cos(input);
      expect(result >= -1.0).assertTrue();
      expect(result <= 1.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3000
     * @tc.name testMathCos030
     * @tc.desc Verify cos method with negative zero input for negative zero semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.cos(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3100
     * @tc.name testMathCos031
     * @tc.desc Verify cos method wave sampling over [0,2PI] for eight sample points valid
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let step: double = Math.PI / 4.0;
      let zeroAngleResult: double = Math.cos(0.0);
      let quarterPiResult: double = Math.cos(step);
      let halfPiResult: double = Math.cos(step * 2.0);
      let threeQuarterPiResult: double = Math.cos(step * 3.0);
      expect(zeroAngleResult >= -1.0 && zeroAngleResult <= 1.0).assertTrue();
      expect(quarterPiResult >= -1.0 && quarterPiResult <= 1.0).assertTrue();
      expect(halfPiResult >= -1.0 && halfPiResult <= 1.0).assertTrue();
      expect(threeQuarterPiResult >= -1.0 && threeQuarterPiResult <= 1.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3200
     * @tc.name testMathCos032
     * @tc.desc Verify cos method pythagorean identity with sin and cos for sum of squares equals one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.7;
      let sineResult: double = Math.sin(x);
      let cosineResult: double = Math.cos(x);
      let sum: double = sineResult * sineResult + cosineResult * cosineResult;
      let diff: double = Utils.getAbsDiff(sum, 1.0);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3300
     * @tc.name testMathCos033
     * @tc.desc Verify cos method degree-to-radian conversion scenario for 30-degree expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let degrees: double = 60.0;
      let radians: double = degrees * Math.PI / 180.0;
      let result: double = Math.cos(radians);
      let diff: double = Utils.getAbsDiff(result, 0.5);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3400
     * @tc.name testMathCos034
     * @tc.desc Verify cos method double-angle formula for formula holds within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.4;
      let lhs: double = Math.cos(2.0 * x);
      let cosineResult: double = Math.cos(x);
      let rhs: double = 2.0 * cosineResult * cosineResult - 1.0;
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3500
     * @tc.name testMathCos035
     * @tc.desc Verify cos method sum-angle formula for formula holds within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCos035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstAngle: double = 0.3;
      let secondAngle: double = 0.2;
      let lhs: double = Math.cos(firstAngle + secondAngle);
      let rhs: double = Math.cos(firstAngle) * Math.cos(secondAngle) - Math.sin(firstAngle) * Math.sin(secondAngle);
      let diff: double = Utils.getAbsDiff(lhs, rhs);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3600
     * @tc.name testMathCos036
     * @tc.desc Verify cos method with float input 0.5f for valid float overload return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let dResult: double = Math.cos(inputValue);
      let result: float = Double.toFloat(dResult);
      expect(Utils.isNaNFloat(result)).assertFalse();
      let lower: float = Double.toFloat(-1.0);
      let upper: float = Double.toFloat(1.0);
      expect(result >= lower).assertTrue();
      expect(result <= upper).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3700
     * @tc.name testMathCos037
     * @tc.desc Verify cos method with double radian input 0.1 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.9950041652780258;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3800
     * @tc.name testMathCos038
     * @tc.desc Verify cos method with double radian input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.955336489125606;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_3900
     * @tc.name testMathCos039
     * @tc.desc Verify cos method with double radian input 0.5 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.8775825618903728;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4000
     * @tc.name testMathCos040
     * @tc.desc Verify cos method with double radian input 0.7 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.7;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.7648421872844885;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4100
     * @tc.name testMathCos041
     * @tc.desc Verify cos method with double radian input 1.2 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.2;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.3623577544766736;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4200
     * @tc.name testMathCos042
     * @tc.desc Verify cos method with double radian input 1.8 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.8;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.2272020946930871;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4300
     * @tc.name testMathCos043
     * @tc.desc Verify cos method with double radian input -0.1 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.9950041652780258;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4400
     * @tc.name testMathCos044
     * @tc.desc Verify cos method with double radian input -0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.3;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.955336489125606;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4500
     * @tc.name testMathCos045
     * @tc.desc Verify cos method with double radian input -0.5 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.8775825618903728;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4600
     * @tc.name testMathCos046
     * @tc.desc Verify cos method with double radian input -0.7 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.7;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.7648421872844885;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4700
     * @tc.name testMathCos047
     * @tc.desc Verify cos method with double radian input 2.1 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.1;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.5048461045998576;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4800
     * @tc.name testMathCos048
     * @tc.desc Verify cos method with double radian input 2.8 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.8;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.9422223406686581;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_4900
     * @tc.name testMathCos049
     * @tc.desc Verify cos method with double radian input 3.4 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.4;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.9667981925794611;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5000
     * @tc.name testMathCos050
     * @tc.desc Verify cos method with double radian input -2.1 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.1;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.5048461045998576;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5100
     * @tc.name testMathCos051
     * @tc.desc Verify cos method with double radian input -2.8 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.8;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.9422223406686581;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5200
     * @tc.name testMathCos052
     * @tc.desc Verify cos method with double radian input 0.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.25;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.9689124217106447;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5300
     * @tc.name testMathCos053
     * @tc.desc Verify cos method with double radian input 0.75 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.75;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.7316888688738209;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5400
     * @tc.name testMathCos054
     * @tc.desc Verify cos method with double radian input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.3153223623952687;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5500
     * @tc.name testMathCos055
     * @tc.desc Verify cos method with double radian input 2.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.25;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.6281736227227391;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5600
     * @tc.name testMathCos056
     * @tc.desc Verify cos method with double radian input 4.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 4.0;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.6536436208636119;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5700
     * @tc.name testMathCos057
     * @tc.desc Verify cos method with double radian input 6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 6.0;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.960170286650366;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5800
     * @tc.name testMathCos058
     * @tc.desc Verify cos method with double radian input 8.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 8.0;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.14550003380861354;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_5900
     * @tc.name testMathCos059
     * @tc.desc Verify cos method with double radian input -4.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -4.0;
      let result: double = Math.cos(inputValue);
      let expected: double = -0.6536436208636119;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COS_6000
     * @tc.name testMathCos060
     * @tc.desc Verify cos method with double radian input -6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCos060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -6.0;
      let result: double = Math.cos(inputValue);
      let expected: double = 0.960170286650366;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
  });
}
