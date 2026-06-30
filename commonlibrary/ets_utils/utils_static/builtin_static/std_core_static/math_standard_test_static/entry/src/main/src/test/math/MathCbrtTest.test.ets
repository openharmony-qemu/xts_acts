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


export default function mathCbrtTest(): void {
  describe('MathCbrtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0100
     * @tc.name testMathCbrt001
     * @tc.desc Verify cbrt method with exact zero double input 0.0 for precise zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0200
     * @tc.name testMathCbrt002
     * @tc.desc Verify cbrt method with float zero input via Double.toFloat(0.0) for precise float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.cbrt(inputValue);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0300
     * @tc.name testMathCbrt003
     * @tc.desc Verify cbrt method with normal positive double input 0.1 for valid finite return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0400
     * @tc.name testMathCbrt004
     * @tc.desc Verify cbrt method with negative double input -0.1 for valid finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.cbrt(inputValue);
      expect(result < 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0500
     * @tc.name testMathCbrt005
     * @tc.desc Verify cbrt method with normal float input 0.3 for valid finite return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.cbrt(inputValue);
      expect(result > 0.0f).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0600
     * @tc.name testMathCbrt006
     * @tc.desc Verify cbrt method with negative float input -0.5 for valid finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.cbrt(inputValue);
      expect(result < 0.0f).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0700
     * @tc.name testMathCbrt007
     * @tc.desc Verify cbrt method odd function property for double input 0.25 for symmetric double inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = 0.25;
      let negativeInput: double = -0.25;
      let positiveResult: double = Math.cbrt(positiveInput);
      let negativeResult: double = Math.cbrt(negativeInput);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0800
     * @tc.name testMathCbrt008
     * @tc.desc Verify cbrt method odd function property for float input 2.0 for symmetric float inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: float = Double.toFloat(2.0);
      let negativeInput: float = Double.toFloat(-2.0);
      let positiveResult: float = Math.cbrt(positiveInput);
      let negativeResult: float = Math.cbrt(negativeInput);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_0900
     * @tc.name testMathCbrt009
     * @tc.desc Verify cbrt method with tiny double input 1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-10;
      let result: double = Math.cbrt(inputValue);
      let expected: double = 0.0004641588833612781;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1000
     * @tc.name testMathCbrt010
     * @tc.desc Verify cbrt method with tiny double input -1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e-10;
      let result: double = Math.cbrt(inputValue);
      let expected: double = -0.0004641588833612781;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1100
     * @tc.name testMathCbrt011
     * @tc.desc Verify cbrt method with tiny float input 1e-05 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1e-05);
      let result: float = Math.cbrt(inputValue);
      let expected: float = Double.toFloat(0.021544346900318843);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1200
     * @tc.name testMathCbrt012
     * @tc.desc Verify cbrt method with tiny float input -1e-05 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1e-05);
      let result: float = Math.cbrt(inputValue);
      let expected: float = Double.toFloat(-0.021544346900318843);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1300
     * @tc.name testMathCbrt013
     * @tc.desc Verify cbrt method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.cbrt(inputValue);
      let expected: double = 0.6694329500821695;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1400
     * @tc.name testMathCbrt014
     * @tc.desc Verify cbrt method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.cbrt(inputValue);
      let expected: double = 1.077217345015942;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1500
     * @tc.name testMathCbrt015
     * @tc.desc Verify cbrt method with double input 6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 6.0;
      let result: double = Math.cbrt(inputValue);
      let expected: double = 1.8171205928321397;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1600
     * @tc.name testMathCbrt016
     * @tc.desc Verify cbrt method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.cbrt(inputValue);
      let expected: float = Double.toFloat(0.6694329500821695);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1700
     * @tc.name testMathCbrt017
     * @tc.desc Verify cbrt method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.cbrt(inputValue);
      let expected: float = Double.toFloat(1.3572088082974532);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1800
     * @tc.name testMathCbrt018
     * @tc.desc Verify cbrt method with Double.NaN input for Double.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.cbrt(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_1900
     * @tc.name testMathCbrt019
     * @tc.desc Verify cbrt method with Float.NaN input for Float.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.cbrt(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2000
     * @tc.name testMathCbrt020
     * @tc.desc Verify cbrt method with Double.POSITIVE_INFINITY input for Double.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.cbrt(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2100
     * @tc.name testMathCbrt021
     * @tc.desc Verify cbrt method with Double.NEGATIVE_INFINITY input for Double.NEGATIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.cbrt(negInfInput);
      expect(result).assertEqual(negInfInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2200
     * @tc.name testMathCbrt022
     * @tc.desc Verify cbrt method with Float.POSITIVE_INFINITY input for Float.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let infInput: float = fOne / fZero;
      let result: float = Math.cbrt(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2300
     * @tc.name testMathCbrt023
     * @tc.desc Verify cbrt method with Float.NEGATIVE_INFINITY input for Float.NEGATIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let negInfInput: float = -fOne / fZero;
      let result: float = Math.cbrt(negInfInput);
      expect(result).assertEqual(negInfInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2400
     * @tc.name testMathCbrt024
     * @tc.desc Verify cbrt method with double variable input 3.0 for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.cbrt(input);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2500
     * @tc.name testMathCbrt025
     * @tc.desc Verify cbrt method with float variable input 5.0 for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.cbrt(input);
      expect(result > 0.0f).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2600
     * @tc.name testMathCbrt026
     * @tc.desc Verify cbrt method with double negative zero input -0.0 for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2700
     * @tc.name testMathCbrt027
     * @tc.desc Verify cbrt method with float negative zero input for exact negative float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.cbrt(inputValue);
      let expected: float = Double.toFloat(-0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2800
     * @tc.name testMathCbrt028
     * @tc.desc Verify cbrt method with double scientific notation input 1.5e1 for valid finite return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5e1;
      let result: double = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_2900
     * @tc.name testMathCbrt029
     * @tc.desc Verify cbrt method with double scientific notation input 2e-5 for valid finite return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2e-5;
      let result: double = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3000
     * @tc.name testMathCbrt030
     * @tc.desc Verify cbrt method with widened byte normal input 8 returns exact cube root 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(8);
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3100
     * @tc.name testMathCbrt031
     * @tc.desc Verify cbrt method with widened byte zero input preserves exact zero on the double path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3200
     * @tc.name testMathCbrt032
     * @tc.desc Verify cbrt method with widened byte negative one input returns exact cube root -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3300
     * @tc.name testMathCbrt033
     * @tc.desc Verify cbrt method with widened byte maximum boundary returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.cbrt(inputValue);
      expect(result > 5.0).assertTrue();
      expect(result < 6.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3400
     * @tc.name testMathCbrt034
     * @tc.desc Verify cbrt method with byte maximum minus one remains a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(126);
      let result: double = Math.cbrt(inputValue);
      expect(result > 5.0).assertTrue();
      expect(result < 6.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3500
     * @tc.name testMathCbrt035
     * @tc.desc Verify cbrt method with widened byte minimum boundary returns a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.cbrt(inputValue);
      expect(result < -5.0).assertTrue();
      expect(result > -6.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3600
     * @tc.name testMathCbrt036
     * @tc.desc Verify cbrt method with byte minimum plus one remains a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-127);
      let result: double = Math.cbrt(inputValue);
      expect(result < -5.0).assertTrue();
      expect(result > -6.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3700
     * @tc.name testMathCbrt037
     * @tc.desc Verify cbrt method with widened short normal input 100 returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(100);
      let result: double = Math.cbrt(inputValue);
      expect(result > 4.0).assertTrue();
      expect(result < 5.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3800
     * @tc.name testMathCbrt038
     * @tc.desc Verify cbrt method with widened short zero input preserves exact zero on the double path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_3900
     * @tc.name testMathCbrt039
     * @tc.desc Verify cbrt method with widened short maximum boundary remains just below 32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.cbrt(inputValue);
      expect(result > 31.0).assertTrue();
      expect(result < 32.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4000
     * @tc.name testMathCbrt040
     * @tc.desc Verify cbrt method with widened short minimum boundary returns exact cube root -32
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.cbrt(inputValue);
      let expected: double = -32.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4100
     * @tc.name testMathCbrt041
     * @tc.desc Verify cbrt method with widened int normal input 27 returns exact cube root 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 27;
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4200
     * @tc.name testMathCbrt042
     * @tc.desc Verify cbrt method with widened int zero input preserves exact zero on the double path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4300
     * @tc.name testMathCbrt043
     * @tc.desc Verify cbrt method with widened int maximum boundary returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result > 1000.0).assertTrue();
      expect(result < 2000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4400
     * @tc.name testMathCbrt044
     * @tc.desc Verify cbrt method with widened int minimum boundary returns a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result < -1000.0).assertTrue();
      expect(result > -2000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4500
     * @tc.name testMathCbrt045
     * @tc.desc Verify cbrt method with Int.MAX_VALUE minus one returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.cbrt(inputValue);
      expect(result > 1000.0).assertTrue();
      expect(result < 2000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4600
     * @tc.name testMathCbrt046
     * @tc.desc Verify cbrt method with Int.MIN_VALUE plus one returns a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE + 1;
      let result: double = Math.cbrt(inputValue);
      expect(result < -1000.0).assertTrue();
      expect(result > -2000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4700
     * @tc.name testMathCbrt047
     * @tc.desc Verify cbrt method with widened long large value 10000000000 returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: double = Math.cbrt(inputValue);
      expect(result > 2000.0).assertTrue();
      expect(result < 3000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4800
     * @tc.name testMathCbrt048
     * @tc.desc Verify cbrt method with widened long zero input preserves exact zero on the double path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.cbrt(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_4900
     * @tc.name testMathCbrt049
     * @tc.desc Verify cbrt method with widened Long.MAX_VALUE boundary returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result > 2000000.0).assertTrue();
      expect(result < 3000000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5000
     * @tc.name testMathCbrt050
     * @tc.desc Verify cbrt method with Long.MAX_VALUE minus one returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.cbrt(inputValue);
      expect(result > 2000000.0).assertTrue();
      expect(result < 3000000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5100
     * @tc.name testMathCbrt051
     * @tc.desc Verify cbrt method with widened Long.MIN_VALUE boundary returns exact cube root -2097152
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.cbrt(inputValue);
      let expected: double = -2097152.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5200
     * @tc.name testMathCbrt052
     * @tc.desc Verify cbrt method with Long.MIN_VALUE plus one returns a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.cbrt(inputValue);
      let expected: double = -2097152.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5300
     * @tc.name testMathCbrt053
     * @tc.desc Verify cbrt method with Long.MIN_VALUE minus one follows the wrapped Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE - Int.toLong(1);
      let result: double = Math.cbrt(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(result > 2000000.0).assertTrue();
      expect(result < 3000000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5400
     * @tc.name testMathCbrt054
     * @tc.desc Verify cbrt method with Double.MAX_VALUE boundary returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5500
     * @tc.name testMathCbrt055
     * @tc.desc Verify cbrt method with negative Double.MAX_VALUE boundary returns a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result < 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5600
     * @tc.name testMathCbrt056
     * @tc.desc Verify cbrt method with Double.MIN_VALUE boundary returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5700
     * @tc.name testMathCbrt057
     * @tc.desc Verify cbrt method with negative Double.MIN_VALUE boundary returns a finite negative cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.cbrt(inputValue);
      expect(result < 0.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5800
     * @tc.name testMathCbrt058
     * @tc.desc Verify cbrt method with Float.MAX_VALUE boundary returns a finite positive float cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_5900
     * @tc.name testMathCbrt059
     * @tc.desc Verify cbrt method with negative Float.MAX_VALUE boundary returns a finite negative float cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: float = Math.cbrt(inputValue);
      expect(result < 0.0f).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6000
     * @tc.name testMathCbrt060
     * @tc.desc Verify cbrt method with Float.MIN_VALUE boundary returns a finite positive float cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.cbrt(inputValue);
      expect(result > 0.0).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6100
     * @tc.name testMathCbrt061
     * @tc.desc Verify cbrt method with negative Float.MIN_VALUE boundary returns a finite negative float cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: float = Math.cbrt(inputValue);
      expect(result < 0.0f).assertTrue();
      expect(Utils.isFiniteFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6200
     * @tc.name testMathCbrt062
     * @tc.desc Verify cbrt method with widened hexadecimal int input 0x1234 returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.cbrt(inputValue);
      expect(result > 16.0).assertTrue();
      expect(result < 17.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6300
     * @tc.name testMathCbrt063
     * @tc.desc Verify cbrt method with widened binary int input 0b1010 returns a finite positive cube root
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.cbrt(inputValue);
      expect(result > 2.0).assertTrue();
      expect(result < 3.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6400
     * @tc.name testMathCbrt064
     * @tc.desc Verify cbrt method with byte overflow conversion input 128 follows the wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.cbrt(inputValue);
      expect(result < -5.0).assertTrue();
      expect(result > -6.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6500
     * @tc.name testMathCbrt065
     * @tc.desc Verify cbrt method with short overflow conversion input 32768 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.cbrt(inputValue);
      let expected: double = -32.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6600
     * @tc.name testMathCbrt066
     * @tc.desc Verify cbrt method with int overflow from Int.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let inputValue: int = maxValue + 1;
      let result: double = Math.cbrt(inputValue);
      expect(result < -1000.0).assertTrue();
      expect(result > -2000.0).assertTrue();
      expect(Utils.isFiniteValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6700
     * @tc.name testMathCbrt067
     * @tc.desc Verify cbrt method with long overflow from Long.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: long = Long.MAX_VALUE;
      let inputValue: long = maxValue + Int.toLong(1);
      let result: double = Math.cbrt(inputValue);
      let expected: double = -2097152.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6800
     * @tc.name testMathCbrt068
     * @tc.desc Verify cbrt method with direct Float.NaN input propagates Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NaN;
      let result: float = Math.cbrt(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CBRT_6900
     * @tc.name testMathCbrt069
     * @tc.desc Verify cbrt method with direct Double.NaN input propagates Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCbrt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.NaN;
      let result: double = Math.cbrt(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
  });
}
