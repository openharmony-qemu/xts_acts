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

function buildAcosInputFromHelper(): number {
  return Math.min(0.75, 0.9);
}

function buildFloatAcosInputFromHelper(): float {
  return Double.toFloat(Math.max(0.25, -0.5));
}

export default function mathAcosTest(): void {
  describe('MathAcosTest', (): void => {
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
     * @tc.name testMathAcos001
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0100
     * @tc.desc Verify acos method with double upper bound 1.0 for exact 0.0 return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.acos(inputValue);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.name testMathAcos002
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0200
     * @tc.desc Verify acos method with double lower bound -1.0 for exact PI return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.acos(inputValue);
      expect(result).assertEqual(Math.PI);
    });

    /**
     * @tc.name testMathAcos003
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0300
     * @tc.desc Verify acos method with double zero 0.0 for exact PI/2 return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.acos(inputValue);
      expect(result).assertEqual(Math.PI / 2.0);
    });

    /**
     * @tc.name testMathAcos004
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0400
     * @tc.desc Verify acos method with negative zero -0.0 for exact PI/2 return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.acos(inputValue);
      expect(result).assertEqual(Math.PI / 2.0);
    });

    /**
     * @tc.name testMathAcos005
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0500
     * @tc.desc Verify acos method with double input 0.5 for approximate PI/3 return within floating tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let expected: double = Math.PI / 3.0;
      let result: double = Math.acos(inputValue);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos006
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0600
     * @tc.desc Verify acos method with double input -0.5 for approximate 2PI/3 return within floating tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let expected: double = 2.0 * Math.PI / 3.0;
      let result: double = Math.acos(inputValue);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos007
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0700
     * @tc.desc Verify acos method with double input Math.SQRT1_2 for approximate PI/4 return within floating tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.SQRT1_2;
      let expected: double = Math.PI / 4.0;
      let result: double = Math.acos(inputValue);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos008
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0800
     * @tc.desc Verify acos method with double near-upper-bound 0.9999999999999999 for finite positive return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.9999999999999999;
      let result: double = Math.acos(inputValue);
      let expected: double = 1.4901161193847656e-08;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos009
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_0900
     * @tc.desc Verify acos method with double near-boundary valid input -0.9999999999999999 for finite positive return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.9999999999999999;
      let result: double = Math.acos(inputValue);
      let expected: double = 3.141592638688632;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos010
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1000
     * @tc.desc Verify acos method with double out-of-domain upper values for Double.NaN return without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputNearUpper: double = 1.0 + 1.0e-15;
      let inputFarUpper: double = 100.0;
      expect(Utils.isNaNValue(Math.acos(inputNearUpper))).assertTrue();
      expect(Utils.isNaNValue(Math.acos(inputFarUpper))).assertTrue();
    });

    /**
     * @tc.name testMathAcos011
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1100
     * @tc.desc Verify acos method with double out-of-domain lower values for Double.NaN return without exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputNearLower: double = -1.0 - 1.0e-15;
      let inputFarLower: double = -100.0;
      expect(Utils.isNaNValue(Math.acos(inputNearLower))).assertTrue();
      expect(Utils.isNaNValue(Math.acos(inputFarLower))).assertTrue();
    });

    /**
     * @tc.name testMathAcos012
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1200
     * @tc.desc Verify acos method with special values Double.NaN, Double.POSITIVE_INFINITY, and Double.NEGATIVE_INFINITY for Double.NaN return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = Double.NaN;
      let posInfInput: double = Double.POSITIVE_INFINITY;
      let negInfInput: double = Double.NEGATIVE_INFINITY;
      expect(Utils.isNaNValue(Math.acos(nanInput))).assertTrue();
      expect(Utils.isNaNValue(Math.acos(posInfInput))).assertTrue();
      expect(Utils.isNaNValue(Math.acos(negInfInput))).assertTrue();
    });

    /**
     * @tc.name testMathAcos013
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1300
     * @tc.desc Verify acos method with float upper bound 1.0f for exact 0.0f return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 1.0f;
      let result: float = Math.acos(inputValue);
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.name testMathAcos014
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1400
     * @tc.desc Verify acos method with float lower bound -1.0f for valid positive return near PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -1.0f;
      let result: float = Math.acos(inputValue);
      let expected: float = Double.toFloat(Math.PI);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos015
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1500
     * @tc.desc Verify acos method with float zero 0.0f for valid positive return near PI/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.0f;
      let result: float = Math.acos(inputValue);
      let expected: float = Double.toFloat(Math.PI / 2.0);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos016
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1600
     * @tc.desc Verify acos method with float input 0.5f for valid positive non-NaN return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = 0.5f;
      let result: float = Math.acos(inputValue);
      let expected: float = 1.0471976f;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos017
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1700
     * @tc.desc Verify acos method with special values Float.NaN, Float.POSITIVE_INFINITY, and Float.NEGATIVE_INFINITY for Float.NaN return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: float = Float.NaN;
      let posInfInput: float = Float.POSITIVE_INFINITY;
      let negInfInput: float = Float.NEGATIVE_INFINITY;
      expect(Utils.isNaNFloat(Math.acos(nanInput))).assertTrue();
      expect(Utils.isNaNFloat(Math.acos(posInfInput))).assertTrue();
      expect(Utils.isNaNFloat(Math.acos(negInfInput))).assertTrue();
    });

    /**
     * @tc.name testMathAcos018
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1800
     * @tc.desc Verify acos method with float out-of-domain values for Float.NaN return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let upperInvalid: float = 1.0001f;
      let lowerInvalid: float = -1.0001f;
      expect(Utils.isNaNFloat(Math.acos(upperInvalid))).assertTrue();
      expect(Utils.isNaNFloat(Math.acos(lowerInvalid))).assertTrue();
    });

    /**
     * @tc.name testMathAcos019
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_1900
     * @tc.desc Verify acos method widened byte input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(1);
      let result: double = Math.acos(inputValue);
      expect(result).assertEqual(Math.acos(1.0));
    });

    /**
     * @tc.name testMathAcos020
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2000
     * @tc.desc Verify acos method widened long input follows the same result path as equivalent double input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(1);
      let result: double = Math.acos(inputValue);
      expect(result).assertEqual(Math.acos(1.0));
    });

    /**
     * @tc.name testMathAcos021
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2100
     * @tc.desc Verify acos method accepts number typed variable input and follows double precision path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = 0.75;
      let result: number = Math.acos(inputValue);
      let expected: double = 0.7227342478134157;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos022
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2200
     * @tc.desc Verify acos method accepts helper function return value typed as number and preserves expected angle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: number = buildAcosInputFromHelper();
      let result: number = Math.acos(inputValue);
      let expected: double = 0.7227342478134157;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos023
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2300
     * @tc.desc Verify acos and cos inverse relationship cos(acos(x)) approximately recovers signed double inputs within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInput: double = -0.8;
      let smallPositiveInput: double = 0.1;
      let positiveInput: double = 0.8;
      let recoveredNegativeInput: double = Math.cos(Math.acos(negativeInput));
      let recoveredSmallPositiveInput: double = Math.cos(Math.acos(smallPositiveInput));
      let recoveredPositiveInput: double = Math.cos(Math.acos(positiveInput));
      expect(Utils.getAbsDiff(recoveredNegativeInput, negativeInput) < 1.0e-14).assertTrue();
      expect(Utils.getAbsDiff(recoveredSmallPositiveInput, smallPositiveInput) < 1.0e-14).assertTrue();
      expect(Utils.getAbsDiff(recoveredPositiveInput, positiveInput) < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos024
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2400
     * @tc.desc Verify acos domain symmetry where acos(x) plus acos(-x) stays within tolerance of PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.6;
      let sumValue: double = Math.acos(inputValue) + Math.acos(-inputValue);
      let diff: double = Utils.getAbsDiff(sumValue, Math.PI);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos025
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2500
     * @tc.desc Verify acos method with ascending double inputs for strict monotonic decreasing results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInput: double = -0.8;
      let zeroInput: double = 0.0;
      let positiveInput: double = 0.8;
      let negativeInputResult: double = Math.acos(negativeInput);
      let zeroInputResult: double = Math.acos(zeroInput);
      let positiveInputResult: double = Math.acos(positiveInput);
      expect(negativeInputResult > zeroInputResult).assertTrue();
      expect(zeroInputResult > positiveInputResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos026
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2600
     * @tc.desc Verify acos method repeated double calls with the same input return identical results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let firstCallResult: double = Math.acos(inputValue);
      let secondCallResult: double = Math.acos(inputValue);
      let thirdCallResult: double = Math.acos(inputValue);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });

    /**
     * @tc.name testMathAcos027
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2700
     * @tc.desc Verify acos in law-of-cosines triangle angle calculation with sides 3-4-5 for right angle PI/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sideA: double = 3.0;
      let sideB: double = 4.0;
      let sideC: double = 5.0;
      let cosAngleC: double = (sideA * sideA + sideB * sideB - sideC * sideC) / (2.0 * sideA * sideB);
      let angleC: double = Math.acos(cosAngleC);
      expect(angleC).assertEqual(Math.PI / 2.0);
    });

    /**
     * @tc.name testMathAcos028
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2800
     * @tc.desc Verify acos in dot-product vector angle calculation between (1,0) and (1,1) for PI/4 within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseVectorX: double = 1.0;
      let baseVectorY: double = 0.0;
      let diagonalVectorX: double = 1.0;
      let diagonalVectorY: double = 1.0;
      let dotProduct: double = baseVectorX * diagonalVectorX + baseVectorY * diagonalVectorY;
      let baseVectorMagnitude: double = Math.sqrt(baseVectorX * baseVectorX + baseVectorY * baseVectorY);
      let diagonalVectorMagnitude: double =
        Math.sqrt(diagonalVectorX * diagonalVectorX + diagonalVectorY * diagonalVectorY);
      let cosAngle: double = dotProduct / (baseVectorMagnitude * diagonalVectorMagnitude);
      let angle: double = Math.acos(cosAngle);
      let expected: double = Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(angle, expected);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos029
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_2900
     * @tc.desc Verify acos method with float negative zero input for valid return near PI/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.acos(inputValue);
      let expected: float = Double.toFloat(Math.PI / 2.0);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos030
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3000
     * @tc.desc Verify acos method with Double.MIN_VALUE stays finite and remains effectively equal to PI/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.acos(inputValue);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(Utils.getAbsDiff(result, Math.PI / 2.0) < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos031
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3100
     * @tc.desc Verify acos method with Float.MIN_VALUE stays finite and slightly below PI/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.acos(inputValue);
      let halfPi: float = Double.toFloat(Math.PI / 2.0);
      let diff: double = Utils.getAbsDiff(result, halfPi);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(result < halfPi).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos032
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3200
     * @tc.desc Verify acos method accepts helper function return value typed as float and preserves expected angle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = buildFloatAcosInputFromHelper();
      let result: float = Math.acos(inputValue);
      let expected: float = 1.3181161f;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos033
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3300
     * @tc.desc Verify acos principal-range composition acos(cos(theta)) recovers an obtuse theta within tolerance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let theta: double = 2.0 * Math.PI / 3.0;
      let result: double = Math.acos(Math.cos(theta));
      let diff: double = Utils.getAbsDiff(result, theta);
      expect(diff < 1.0e-14).assertTrue();
    });

    /**
     * @tc.name testMathAcos034
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3400
     * @tc.desc Verify acos correctly calculates obtuse angle when cosine is negative with triangle sides 2-3-4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sideA: double = 2.0;
      let sideB: double = 3.0;
      let sideC: double = 4.0;
      let cosAngleC: double = (sideA * sideA + sideB * sideB - sideC * sideC) / (2.0 * sideA * sideB);
      let angleC: double = Math.acos(cosAngleC);
      let expected: double = 1.8234765819369754;
      let diff: double = Utils.getAbsDiff(angleC, expected);
      expect(diff < 1.0e-14).assertTrue();
      expect(angleC > Math.PI / 2.0).assertTrue();
      expect(angleC < Math.PI).assertTrue();
    });

    /**
     * @tc.name testMathAcos035
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3500
     * @tc.desc Verify acos method widened byte minimum value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos036
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3600
     * @tc.desc Verify acos method widened byte maximum value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos037
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3700
     * @tc.desc Verify acos method widened Long.MIN_VALUE value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos038
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3800
     * @tc.desc Verify acos method widened Long.MAX_VALUE value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos039
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_3900
     * @tc.desc Verify acos method argument runtime cast from undefined to double throws ClassCastError before evaluation completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = Math.acos(undefined as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAcos040
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4000
     * @tc.desc Verify acos method argument runtime cast from null to double throws ClassCastError before evaluation completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = Math.acos(null as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAcos041
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4100
     * @tc.desc Verify acos method argument runtime cast from boolean to double throws ClassCastError before evaluation completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result: double = Math.acos(true as double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testMathAcos042
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4200
     * @tc.desc Verify acos method with float input -0.5f for valid positive return near 2PI/3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -0.5f;
      let result: float = Math.acos(inputValue);
      let expected: float = 2.0943952f;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos043
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4300
     * @tc.desc Verify acos method with float input converted from Math.SQRT1_2 for valid return near PI/4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Math.SQRT1_2);
      let result: float = Math.acos(inputValue);
      let expected: float = 0.7853982f;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(Utils.isFiniteFloat(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos044
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4400
     * @tc.desc Verify acos method widened short zero input returns a finite value near PI/2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.acos(inputValue);
      let diff: double = Utils.getAbsDiff(result, Math.PI / 2.0);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos045
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4500
     * @tc.desc Verify acos method widened short minimum value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos046
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4600
     * @tc.desc Verify acos method widened short maximum value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos047
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4700
     * @tc.desc Verify acos method widened int negative one input returns a finite value near PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = -1;
      let result: double = Math.acos(inputValue);
      let diff: double = Utils.getAbsDiff(result, Math.PI);
      expect(Utils.isFiniteValue(result)).assertTrue();
      expect(diff < 1.0e-6).assertTrue();
    });

    /**
     * @tc.name testMathAcos048
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4800
     * @tc.desc Verify acos method widened int minimum value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos049
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_4900
     * @tc.desc Verify acos method widened int maximum value returns Double.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      expect(Utils.isNaNValue(Math.acos(inputValue))).assertTrue();
    });

    /**
     * @tc.name testMathAcos050
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ACOS_5000
     * @tc.desc Verify acos method with Float.MAX_VALUE input returns Float.NaN outside the valid domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      expect(Utils.isNaNFloat(Math.acos(inputValue))).assertTrue();
    });
  });
}
