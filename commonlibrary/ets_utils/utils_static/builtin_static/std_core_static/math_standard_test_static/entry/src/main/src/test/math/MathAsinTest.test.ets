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

function expectAsinReference(actual: double, expected: double, tolerance: double): void {
  let difference: double = Utils.getAbsDiff(actual, expected);
  expect(difference < tolerance).assertTrue();
}

export default function mathAsinTest(): void {
  describe('MathAsinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0100
     * @tc.name testMathAsin001
     * @tc.desc Verify asin method with double zero input for exact zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.asin(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0200
     * @tc.name testMathAsin002
     * @tc.desc Verify asin method with double positive value 0.5 for PI/6 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let expectedValue: double = Math.PI / 6.0;
      let result: double = Math.asin(inputValue);
      let diff: double = Utils.getAbsDiff(result, expectedValue);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0300
     * @tc.name testMathAsin003
     * @tc.desc Verify asin method with double negative value -0.5 for negative PI/6 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let expectedValue: double = -Math.PI / 6.0;
      let result: double = Math.asin(inputValue);
      let diff: double = Utils.getAbsDiff(result, expectedValue);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0400
     * @tc.name testMathAsin004
     * @tc.desc Verify asin method with double upper bound 1.0 for exact PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let expectedValue: double = Math.PI / 2.0;
      let result: double = Math.asin(inputValue);
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0500
     * @tc.name testMathAsin005
     * @tc.desc Verify asin method with double lower bound -1.0 for exact negative PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let expectedValue: double = -Math.PI / 2.0;
      let result: double = Math.asin(inputValue);
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0600
     * @tc.name testMathAsin006
     * @tc.desc Verify asin method with double near-upper-bound 0.9999 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.9999;
      let result: double = Math.asin(inputValue);
      expectAsinReference(result, 1.5566540733173846, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0700
     * @tc.name testMathAsin007
     * @tc.desc Verify asin method with double near-lower-bound -0.9999 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.9999;
      let result: double = Math.asin(inputValue);
      expectAsinReference(result, -1.5566540733173846, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0800
     * @tc.name testMathAsin008
     * @tc.desc Verify asin method with float zero input for exact float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let expectedValue: float = Double.toFloat(0.0);
      let result: float = Math.asin(inputValue);
      expect(result).assertEqual(expectedValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_0900
     * @tc.name testMathAsin009
     * @tc.desc Verify asin method with float positive value 0.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.asin(inputValue);
      expectAsinReference(result, 0.5235987901687622, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1000
     * @tc.name testMathAsin010
     * @tc.desc Verify asin method with float upper bound 1.0f returns the float-rounded PI/2 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.asin(inputValue);
      expectAsinReference(result, 1.5707963705062866, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1100
     * @tc.name testMathAsin011
     * @tc.desc Verify asin method with float lower bound -1.0f returns the float-rounded negative PI/2 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Double.toFloat(1.0);
      let result: float = Math.asin(inputValue);
      expectAsinReference(result, -1.5707963705062866, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1200
     * @tc.name testMathAsin012
     * @tc.desc Verify asin method with float out-of-domain lower bound -2.0f for Float.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-2.0);
      let result: float = Math.asin(inputValue);
      let isNaN: boolean = Utils.isNaNFloat(result);
      expect(isNaN).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1300
     * @tc.name testMathAsin013
     * @tc.desc Verify asin method with double input 0.5 returns the PI/6 reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.asin(inputValue);
      expectAsinReference(result, Math.PI / 6.0, 1.0e-15);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1400
     * @tc.name testMathAsin014
     * @tc.desc Verify asin method with float input 0.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.asin(inputValue);
      expectAsinReference(result, 0.5235987901687622, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1500
     * @tc.name testMathAsin015
     * @tc.desc Verify asin method with boundary inputs returns exact PI/2, negative PI/2, and zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let upperBoundaryInput: double = 1.0;
      let lowerBoundaryInput: double = -1.0;
      let zeroInput: double = 0.0;
      let halfPi: double = Math.PI / 2.0;
      let upperBoundaryResult: double = Math.asin(upperBoundaryInput);
      let lowerBoundaryResult: double = Math.asin(lowerBoundaryInput);
      let zeroResult: double = Math.asin(zeroInput);
      expect(upperBoundaryResult).assertEqual(halfPi);
      expect(lowerBoundaryResult).assertEqual(-halfPi);
      expect(zeroResult).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1600
     * @tc.name testMathAsin016
     * @tc.desc Verify asin method with odd function property asin(-x) equals -asin(x) for double input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let resultNeg: double = Math.asin(-x);
      let resultPos: double = Math.asin(x);
      expect(resultNeg).assertEqual(-resultPos);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1700
     * @tc.name testMathAsin017
     * @tc.desc Verify asin method with distinct double inputs returns ordered reference values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInput: double = 0.0;
      let middleDomainInput: double = 0.5;
      let upperBoundaryInput: double = 1.0;
      let zeroInputResult: double = Math.asin(zeroInput);
      let middleDomainResult: double = Math.asin(middleDomainInput);
      let upperBoundaryResult: double = Math.asin(upperBoundaryInput);
      expect(zeroInputResult).assertEqual(0.0);
      expectAsinReference(middleDomainResult, Math.PI / 6.0, 1.0e-15);
      expect(upperBoundaryResult).assertEqual(Math.PI / 2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1800
     * @tc.name testMathAsin018
     * @tc.desc Verify asin method with double out-of-domain upper values for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let slightlyAboveDomainInput: double = 1.5;
      let farAboveDomainInput: double = 100.0;
      let slightlyAboveDomainResult: double = Math.asin(slightlyAboveDomainInput);
      let farAboveDomainResult: double = Math.asin(farAboveDomainInput);
      expect(Utils.isNaNValue(slightlyAboveDomainResult)).assertTrue();
      expect(Utils.isNaNValue(farAboveDomainResult)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_1900
     * @tc.name testMathAsin019
     * @tc.desc Verify asin method with double out-of-domain lower values for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let slightlyBelowDomainInput: double = -1.5;
      let farBelowDomainInput: double = -100.0;
      let slightlyBelowDomainResult: double = Math.asin(slightlyBelowDomainInput);
      let farBelowDomainResult: double = Math.asin(farBelowDomainInput);
      expect(Utils.isNaNValue(slightlyBelowDomainResult)).assertTrue();
      expect(Utils.isNaNValue(farBelowDomainResult)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2000
     * @tc.name testMathAsin020
     * @tc.desc Verify asin method with special values Double.NaN, Double.POSITIVE_INFINITY, and Double.NEGATIVE_INFINITY for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let infInput: double = 1.0 / 0.0;
      let negInfInput: double = -1.0 / 0.0;
      let nanResult: double = Math.asin(nanInput);
      let positiveInfinityResult: double = Math.asin(infInput);
      let negativeInfinityResult: double = Math.asin(negInfInput);
      expect(Utils.isNaNValue(nanResult)).assertTrue();
      expect(Utils.isNaNValue(positiveInfinityResult)).assertTrue();
      expect(Utils.isNaNValue(negativeInfinityResult)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2100
     * @tc.name testMathAsin021
     * @tc.desc Verify asin method with float out-of-domain value for Float.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.0);
      let result: float = Math.asin(inputValue);
      let isNaN: boolean = Utils.isNaNFloat(result);
      expect(isNaN).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2200
     * @tc.name testMathAsin022
     * @tc.desc Verify asin method with double literal invokes double overload for approximate PI/6 return within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let expectedValue: double = Math.PI / 6.0;
      let result: double = Math.asin(inputValue);
      let diff: double = Utils.getAbsDiff(result, expectedValue);
      expect(diff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2300
     * @tc.name testMathAsin023
     * @tc.desc Verify asin method with float typed variable invokes float overload reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.asin(inputValue);
      expectAsinReference(result, 0.5235987901687622, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2400
     * @tc.name testMathAsin024
     * @tc.desc Verify asin double and float overloads return different precision results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dInput: double = 0.5;
      let fInput: float = Double.toFloat(0.5);
      let resultDouble: double = Math.asin(dInput);
      let resultFloat: float = Math.asin(fInput);
      let precisionDifference: double = Utils.getAbsDiff(resultDouble, resultFloat);
      expectAsinReference(resultDouble, 0.5235987755982989, 1.0e-15);
      expectAsinReference(resultFloat, 0.5235987901687622, 1.0e-6);
      expect(precisionDifference > 0.0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2500
     * @tc.name testMathAsin025
     * @tc.desc Verify asin method with double domain-in value 0.3 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.asin(inputValue);
      expectAsinReference(result, 0.3046926540153975, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2600
     * @tc.name testMathAsin026
     * @tc.desc Verify asin is a static method callable without instance via Math class
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.asin(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2700
     * @tc.name testMathAsin027
     * @tc.desc Verify asin method with double idempotent same-input multiple-call produces identical results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.5;
      let firstCallResult: double = Math.asin(x);
      let secondCallResult: double = Math.asin(x);
      let thirdCallResult: double = Math.asin(x);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2800
     * @tc.name testMathAsin028
     * @tc.desc Verify asin method with float idempotent same-input multiple-call produces identical results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = Double.toFloat(0.5);
      let firstCallResult: float = Math.asin(x);
      let secondCallResult: float = Math.asin(x);
      let thirdCallResult: float = Math.asin(x);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_2900
     * @tc.name testMathAsin029
     * @tc.desc Verify asin method with double out-of-domain repeated calls consistently return Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 2.0;
      let firstCallResult: double = Math.asin(x);
      let secondCallResult: double = Math.asin(x);
      let thirdCallResult: double = Math.asin(x);
      let allNaN: boolean = Utils.isNaNValue(firstCallResult)
        && Utils.isNaNValue(secondCallResult)
        && Utils.isNaNValue(thirdCallResult);
      expect(allNaN).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3000
     * @tc.name testMathAsin030
     * @tc.desc Verify asin method with double negative zero -0.0 for negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negZero: double = -0.0;
      let result: double = Math.asin(negZero);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3100
     * @tc.name testMathAsin031
     * @tc.desc Verify asin method with double slightly above upper bound by machine epsilon for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0 + 1.0e-15;
      let result: double = Math.asin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3200
     * @tc.name testMathAsin032
     * @tc.desc Verify asin method with double slightly below lower bound by machine epsilon for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0 - 1.0e-15;
      let result: double = Math.asin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3300
     * @tc.name testMathAsin033
     * @tc.desc Verify asin method with double tiny positive value near zero returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tinyPos: double = 1.0e-10;
      let result: double = Math.asin(tinyPos);
      expectAsinReference(result, 1.0e-10, 1.0e-20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3400
     * @tc.name testMathAsin034
     * @tc.desc Verify asin method with double tiny negative value near zero returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tinyNeg: double = -1.0e-10;
      let result: double = Math.asin(tinyNeg);
      expectAsinReference(result, -1.0e-10, 1.0e-20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3500
     * @tc.name testMathAsin035
     * @tc.desc Verify sin(asin(x)) equals x identity with multiple double domain values within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInput: double = 0.0;
      let positiveHalfInput: double = 0.5;
      let negativeHalfInput: double = -0.5;
      let upperMidInput: double = 0.8;
      let eps: double = 1.0e-14;
      let zeroRoundTripResult: double = Math.sin(Math.asin(zeroInput));
      let positiveHalfRoundTripResult: double = Math.sin(Math.asin(positiveHalfInput));
      let negativeHalfRoundTripResult: double = Math.sin(Math.asin(negativeHalfInput));
      let upperMidRoundTripResult: double = Math.sin(Math.asin(upperMidInput));
      let zeroRoundTripDiff: double = zeroRoundTripResult - zeroInput;
      let positiveHalfRoundTripDiff: double = positiveHalfRoundTripResult - positiveHalfInput;
      let negativeHalfRoundTripDiff: double = negativeHalfRoundTripResult - negativeHalfInput;
      let upperMidRoundTripDiff: double = upperMidRoundTripResult - upperMidInput;
      expect(zeroRoundTripDiff < eps && zeroRoundTripDiff > -eps).assertTrue();
      expect(positiveHalfRoundTripDiff < eps && positiveHalfRoundTripDiff > -eps).assertTrue();
      expect(negativeHalfRoundTripDiff < eps && negativeHalfRoundTripDiff > -eps).assertTrue();
      expect(upperMidRoundTripDiff < eps && upperMidRoundTripDiff > -eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3600
     * @tc.name testMathAsin036
     * @tc.desc Verify asin 0.5 radian-to-degree conversion yields 30 degrees within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let expectedDegree: double = 30.0;
      let eps: double = 1.0e-12;
      let radian: double = Math.asin(inputValue);
      let degree: double = radian * 180.0 / Math.PI;
      let diff: double = degree - expectedDegree;
      expect(diff < eps && diff > -eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3700
     * @tc.name testMathAsin037
     * @tc.desc Verify asin with opposite/hypotenuse ratio in right triangle yields correct angle
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opposite: double = 3.0;
      let hypotenuse: double = 6.0;
      let expectedDeg: double = 30.0;
      let eps: double = 1.0e-12;
      let ratio: double = opposite / hypotenuse;
      let angleRad: double = Math.asin(ratio);
      let angleDeg: double = angleRad * 180.0 / Math.PI;
      let diff: double = angleDeg - expectedDeg;
      expect(diff < eps && diff > -eps).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3800
     * @tc.name testMathAsin038
     * @tc.desc Verify asin method with ascending double inputs for strict monotonic increasing results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroInput: double = 0.0;
      let lowPositiveInput: double = 0.3;
      let middlePositiveInput: double = 0.6;
      let highPositiveInput: double = 0.9;
      let upperBoundaryInput: double = 1.0;
      let zeroInputResult: double = Math.asin(zeroInput);
      let lowPositiveResult: double = Math.asin(lowPositiveInput);
      let middlePositiveResult: double = Math.asin(middlePositiveInput);
      let highPositiveResult: double = Math.asin(highPositiveInput);
      let upperBoundaryResult: double = Math.asin(upperBoundaryInput);
      expect(zeroInputResult < lowPositiveResult).assertTrue();
      expect(lowPositiveResult < middlePositiveResult).assertTrue();
      expect(middlePositiveResult < highPositiveResult).assertTrue();
      expect(highPositiveResult < upperBoundaryResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_3900
     * @tc.name testMathAsin039
     * @tc.desc Verify asin with symmetrical positive and negative ratios for directional angle calculation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let upRatio: double = 0.34;
      let downRatio: double = -0.34;
      let upAngle: double = Math.asin(upRatio);
      let downAngle: double = Math.asin(downRatio);
      expect(upAngle > 0.0).assertTrue();
      expect(downAngle < 0.0).assertTrue();
      expect(upAngle).assertEqual(-downAngle);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4000
     * @tc.name testMathAsin040
     * @tc.desc Verify asin method with double input 0.8660254037844386 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.8660254037844386;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.0471975511965976;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4100
     * @tc.name testMathAsin041
     * @tc.desc Verify asin method with double input -0.8660254037844386 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.8660254037844386;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.0471975511965976;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4200
     * @tc.name testMathAsin042
     * @tc.desc Verify asin method with double input 0.7071067811865476 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.7071067811865476;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.7853981633974484;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4300
     * @tc.name testMathAsin043
     * @tc.desc Verify asin method with double input -0.7071067811865476 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.7071067811865476;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.7853981633974484;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4400
     * @tc.name testMathAsin044
     * @tc.desc Verify asin method with double input 0.25 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.25;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.25268025514207865;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4500
     * @tc.name testMathAsin045
     * @tc.desc Verify asin method with double input -0.25 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.25;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.25268025514207865;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4600
     * @tc.name testMathAsin046
     * @tc.desc Verify asin method with double input 0.75 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.75;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.848062078981481;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4700
     * @tc.name testMathAsin047
     * @tc.desc Verify asin method with double input -0.75 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.75;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.848062078981481;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4800
     * @tc.name testMathAsin048
     * @tc.desc Verify asin method with double input 0.1 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.1001674211615598;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_4900
     * @tc.name testMathAsin049
     * @tc.desc Verify asin method with double input -0.1 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.1001674211615598;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5000
     * @tc.name testMathAsin050
     * @tc.desc Verify asin method with double input 0.2 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.2;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.2013579207903308;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5100
     * @tc.name testMathAsin051
     * @tc.desc Verify asin method with double input -0.2 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.2;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.2013579207903308;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5200
     * @tc.name testMathAsin052
     * @tc.desc Verify asin method with double input 0.4 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.4;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.41151684606748806;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5300
     * @tc.name testMathAsin053
     * @tc.desc Verify asin method with double input -0.4 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.4;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.41151684606748806;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5400
     * @tc.name testMathAsin054
     * @tc.desc Verify asin method with double input 0.6 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.6;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.6435011087932844;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5500
     * @tc.name testMathAsin055
     * @tc.desc Verify asin method with double input -0.6 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.6;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.6435011087932844;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5600
     * @tc.name testMathAsin056
     * @tc.desc Verify asin method with double input 0.8 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.8;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.9272952180016123;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5700
     * @tc.name testMathAsin057
     * @tc.desc Verify asin method with double input -0.8 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.8;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.9272952180016123;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5800
     * @tc.name testMathAsin058
     * @tc.desc Verify asin method with double input 0.9 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.9;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.1197695149986342;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_5900
     * @tc.name testMathAsin059
     * @tc.desc Verify asin method with double input -0.9 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.9;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.1197695149986342;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6000
     * @tc.name testMathAsin060
     * @tc.desc Verify asin method with double input 0.95 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.95;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.253235897503375;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6100
     * @tc.name testMathAsin061
     * @tc.desc Verify asin method with double input -0.95 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.95;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.253235897503375;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6200
     * @tc.name testMathAsin062
     * @tc.desc Verify asin method with double input 0.99 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.99;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.4292568534704693;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6300
     * @tc.name testMathAsin063
     * @tc.desc Verify asin method with double input -0.99 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.99;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.4292568534704693;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6400
     * @tc.name testMathAsin064
     * @tc.desc Verify asin method with double input 0.999 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.999;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.526071239626163;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6500
     * @tc.name testMathAsin065
     * @tc.desc Verify asin method with double input -0.999 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.999;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.526071239626163;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6600
     * @tc.name testMathAsin066
     * @tc.desc Verify asin method with double input 0.99999 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.99999;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.5663241871131188;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6700
     * @tc.name testMathAsin067
     * @tc.desc Verify asin method with double input -0.99999 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.99999;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.5663241871131188;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6800
     * @tc.name testMathAsin068
     * @tc.desc Verify asin method with double input 0.001 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.001;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.0010000001666667416;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_6900
     * @tc.name testMathAsin069
     * @tc.desc Verify asin method with double input -0.001 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.001;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.0010000001666667416;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7000
     * @tc.name testMathAsin070
     * @tc.desc Verify asin method with double input 0.01 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.01;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.010000166674167114;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7100
     * @tc.name testMathAsin071
     * @tc.desc Verify asin method with double input -0.01 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.01;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.010000166674167114;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7200
     * @tc.name testMathAsin072
     * @tc.desc Verify asin method with double input 0.125 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.125;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.1253278311680654;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7300
     * @tc.name testMathAsin073
     * @tc.desc Verify asin method with double input -0.125 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.125;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.1253278311680654;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7400
     * @tc.name testMathAsin074
     * @tc.desc Verify asin method with double input 0.375 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.375;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.3843967744956391;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7500
     * @tc.name testMathAsin075
     * @tc.desc Verify asin method with double input -0.375 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.375;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.3843967744956391;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7600
     * @tc.name testMathAsin076
     * @tc.desc Verify asin method with double input 0.625 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.625;
      let result: double = Math.asin(inputValue);
      let expected: double = 0.6751315329370317;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7700
     * @tc.name testMathAsin077
     * @tc.desc Verify asin method with double input -0.625 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.625;
      let result: double = Math.asin(inputValue);
      let expected: double = -0.6751315329370317;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7800
     * @tc.name testMathAsin078
     * @tc.desc Verify asin method with double input 0.875 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.875;
      let result: double = Math.asin(inputValue);
      let expected: double = 1.0654358165107394;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_7900
     * @tc.name testMathAsin079
     * @tc.desc Verify asin method with double input -0.875 for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.875;
      let result: double = Math.asin(inputValue);
      let expected: double = -1.0654358165107394;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8000
     * @tc.name testMathAsin080
     * @tc.desc Verify asin method with float input 0.1f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.1f;
      let result: float = Math.asin(inputValue);
      let expected: float = 0.1001674211615598f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8100
     * @tc.name testMathAsin081
     * @tc.desc Verify asin method with float input 0.3f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.3f;
      let result: float = Math.asin(inputValue);
      let expected: float = 0.30469265401539747f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8200
     * @tc.name testMathAsin082
     * @tc.desc Verify asin method with float input 0.5f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.5f;
      let result: float = Math.asin(inputValue);
      let expected: float = 0.5235987755982988f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8300
     * @tc.name testMathAsin083
     * @tc.desc Verify asin method with float input 0.7f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.7f;
      let result: float = Math.asin(inputValue);
      let expected: float = 0.775397496610753f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8400
     * @tc.name testMathAsin084
     * @tc.desc Verify asin method with float input 0.9f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.9f;
      let result: float = Math.asin(inputValue);
      let expected: float = 1.1197695149986342f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8500
     * @tc.name testMathAsin085
     * @tc.desc Verify asin method with float input -0.1f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -0.1f;
      let result: float = Math.asin(inputValue);
      let expected: float = -0.1001674211615598f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8600
     * @tc.name testMathAsin086
     * @tc.desc Verify asin method with float input -0.5f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -0.5f;
      let result: float = Math.asin(inputValue);
      let expected: float = -0.5235987755982988f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8700
     * @tc.name testMathAsin087
     * @tc.desc Verify asin method with float input -0.9f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -0.9f;
      let result: float = Math.asin(inputValue);
      let expected: float = -1.1197695149986342f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8800
     * @tc.name testMathAsin088
     * @tc.desc Verify asin method with float input 0.9999f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.9999f;
      let result: float = Math.asin(inputValue);
      let expected: float = 1.5566540733173846f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_8900
     * @tc.name testMathAsin089
     * @tc.desc Verify asin method with float input -0.9999f for approximate expected arcsine within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -0.9999f;
      let result: float = Math.asin(inputValue);
      let expected: float = -1.5566540733173846f;
      let diff: float = result - expected;
      if (diff < Double.toFloat(0.0)) {
        diff = -diff;
      }
      expect(diff < Double.toFloat(0.0001)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9000
     * @tc.name testMathAsin090
     * @tc.desc Verify asin method with double out-of-domain input 2.0 for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.asin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9100
     * @tc.name testMathAsin091
     * @tc.desc Verify asin method with double out-of-domain input 1.0001 for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0001;
      let result: double = Math.asin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9200
     * @tc.name testMathAsin092
     * @tc.desc Verify asin method with double out-of-domain input -2.0 for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.asin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9300
     * @tc.name testMathAsin093
     * @tc.desc Verify asin method with double out-of-domain input -1.0001 for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0001;
      let result: double = Math.asin(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9400
     * @tc.name testMathAsin094
     * @tc.desc Verify asin method with Double.NaN input for Double.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.asin(nanInput);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9500
     * @tc.name testMathAsin095
     * @tc.desc Verify asin method with double variable input for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.7071067811865476;
      let result: double = Math.asin(input);
      let expected: double = 0.7853981633974484;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9600
     * @tc.name testMathAsin096
     * @tc.desc Verify asin method widened byte one input approximates the upper-bound arcsine result within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(1);
      let expectedValue: double = Math.PI / 2.0;
      let result: double = Math.asin(inputValue);
      let diff: double = Utils.getAbsDiff(result, expectedValue);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9700
     * @tc.name testMathAsin097
     * @tc.desc Verify asin method widened byte negative one input approximates the lower-bound arcsine result within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let expectedValue: double = -Math.PI / 2.0;
      let result: double = Math.asin(inputValue);
      let diff: double = Utils.getAbsDiff(result, expectedValue);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9800
     * @tc.name testMathAsin098
     * @tc.desc Verify asin method widened int maximum value returns Double.NaN outside the valid domain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      expect(Utils.isNaNValue(Math.asin(inputValue))).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ASIN_9900
     * @tc.name testMathAsin099
     * @tc.desc Verify asin method widened Long.MIN_VALUE value returns Double.NaN outside the valid domain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAsin099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      expect(Utils.isNaNValue(Math.asin(inputValue))).assertTrue();
    });
  });
}
