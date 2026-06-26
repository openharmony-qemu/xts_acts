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

function expectCoshReference(actual: double, expected: double, tolerance: double): void {
  let difference: double = Utils.getAbsDiff(actual, expected);
  expect(difference < tolerance).assertTrue();
}

function expectCoshRelativeReference(actual: double, expected: double, tolerance: double): void {
  let relativeDiff: double = Utils.getRelativeDiff(actual, expected);
  expect(relativeDiff < tolerance).assertTrue();
}

export default function mathCoshTest(): void {
  describe('MathCoshTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0100
     * @tc.name testMathCosh001
     * @tc.desc Verify cosh method with exact zero double input 0.0 for exact unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0200
     * @tc.name testMathCosh002
     * @tc.desc Verify cosh method with float negative zero input via Double.toFloat(-0.0) for exact float unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.cosh(inputValue);
      let expected: float = Double.toFloat(1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0300
     * @tc.name testMathCosh003
     * @tc.desc Verify cosh method with normal positive double input 0.1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 1.0050041680558035, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0400
     * @tc.name testMathCosh004
     * @tc.desc Verify cosh method with normal positive double input 100.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.cosh(inputValue);
      expectCoshRelativeReference(result, 1.3440585709080678e43, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0500
     * @tc.name testMathCosh005
     * @tc.desc Verify cosh method with negative double input -0.1 returns the positive reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 1.0050041680558035, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0600
     * @tc.name testMathCosh006
     * @tc.desc Verify cosh method with negative double input -10.0 returns the positive reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 11013.232920103323, 1.0e-9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0700
     * @tc.name testMathCosh007
     * @tc.desc Verify cosh method with normal float input 0.3 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.cosh(inputValue);
      expectCoshReference(result, 1.0453385141288605, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0800
     * @tc.name testMathCosh008
     * @tc.desc Verify cosh method with normal float input 10.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.cosh(inputValue);
      expectCoshReference(result, 11013.232920103323, 1.0e-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_0900
     * @tc.name testMathCosh009
     * @tc.desc Verify cosh method with negative float input -0.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.cosh(inputValue);
      expectCoshReference(result, 1.1276259652063807, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1000
     * @tc.name testMathCosh010
     * @tc.desc Verify cosh method even function property for double input 0.25 for symmetric double inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = 0.25;
      let negativeInput: double = -0.25;
      let positiveResult: double = Math.cosh(positiveInput);
      let negativeResult: double = Math.cosh(negativeInput);
      expect(negativeResult).assertEqual(positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1100
     * @tc.name testMathCosh011
     * @tc.desc Verify cosh method even function property for float input 2.0 for symmetric float inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: float = Double.toFloat(2.0);
      let negativeInput: float = Double.toFloat(-2.0);
      let positiveResult: float = Math.cosh(positiveInput);
      let negativeResult: float = Math.cosh(negativeInput);
      expect(negativeResult).assertEqual(positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1200
     * @tc.name testMathCosh012
     * @tc.desc Verify cosh method with tiny double input 1e-10 for near-unit result within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-10;
      let result: double = Math.cosh(inputValue);
      let expected: double = 1.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1300
     * @tc.name testMathCosh013
     * @tc.desc Verify cosh method with tiny double input -1e-10 for near-unit result within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e-10;
      let result: double = Math.cosh(inputValue);
      let expected: double = 1.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1400
     * @tc.name testMathCosh014
     * @tc.desc Verify cosh method with tiny float input 1e-05 for near-unit result within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1e-05);
      let result: float = Math.cosh(inputValue);
      let expected: float = Double.toFloat(1.00000000005);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1500
     * @tc.name testMathCosh015
     * @tc.desc Verify cosh method with tiny float input -1e-05 for near-unit result within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1e-05);
      let result: float = Math.cosh(inputValue);
      let expected: float = Double.toFloat(1.00000000005);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1600
     * @tc.name testMathCosh016
     * @tc.desc Verify cosh method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.cosh(inputValue);
      let expected: double = 1.0453385141288605;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1700
     * @tc.name testMathCosh017
     * @tc.desc Verify cosh method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.cosh(inputValue);
      let expected: double = 1.8884238771610158;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1800
     * @tc.name testMathCosh018
     * @tc.desc Verify cosh method with double input 6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 6.0;
      let result: double = Math.cosh(inputValue);
      let expected: double = 201.7156361224559;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_1900
     * @tc.name testMathCosh019
     * @tc.desc Verify cosh method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.cosh(inputValue);
      let expected: float = Double.toFloat(1.0453385141288605);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2000
     * @tc.name testMathCosh020
     * @tc.desc Verify cosh method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.cosh(inputValue);
      let expected: float = Double.toFloat(6.132289479663686);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2100
     * @tc.name testMathCosh021
     * @tc.desc Verify cosh method with Double.NaN input for Double.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.cosh(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2200
     * @tc.name testMathCosh022
     * @tc.desc Verify cosh method with Float.NaN input for Float.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.cosh(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2300
     * @tc.name testMathCosh023
     * @tc.desc Verify cosh method with Double.POSITIVE_INFINITY input for Double.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.cosh(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2400
     * @tc.name testMathCosh024
     * @tc.desc Verify cosh method with Double.NEGATIVE_INFINITY input for Double.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.cosh(negInfInput);
      let expectedInf: double = 1.0 / 0.0;
      expect(result).assertEqual(expectedInf);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2500
     * @tc.name testMathCosh025
     * @tc.desc Verify cosh method with Float.POSITIVE_INFINITY input for Float.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let infInput: float = fOne / fZero;
      let result: float = Math.cosh(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2600
     * @tc.name testMathCosh026
     * @tc.desc Verify cosh method with Float.NEGATIVE_INFINITY input for Float.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let negInfInput: float = -fOne / fZero;
      let result: float = Math.cosh(negInfInput);
      let expectedInf: float = fOne / fZero;
      expect(result).assertEqual(expectedInf);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2700
     * @tc.name testMathCosh027
     * @tc.desc Verify cosh method with double variable input 3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.cosh(input);
      expectCoshReference(result, 10.067661995777765, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2800
     * @tc.name testMathCosh028
     * @tc.desc Verify cosh method with float variable input 5.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.cosh(input);
      expectCoshReference(result, 74.20994852478785, 1.0e-4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_2900
     * @tc.name testMathCosh029
     * @tc.desc Verify cosh method with double negative zero input -0.0 for exact unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3000
     * @tc.name testMathCosh030
     * @tc.desc Verify cosh method with double scientific notation input 1.5e1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5e1;
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 1634508.6862362083, 1.0e-9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3100
     * @tc.name testMathCosh031
     * @tc.desc Verify cosh method with double scientific notation input 2e-5 returns the near-unit reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2e-5;
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 1.0000000002, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3200
     * @tc.name testMathCosh032
     * @tc.desc Verify cosh method with normal positive double input 19.0 for expected value within relative tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 19.0;
      let result: double = Math.cosh(inputValue);
      let expected: double = 89241150.48159364;
      let relativeDiff: double = Utils.getRelativeDiff(result, expected);
      expect(relativeDiff < 1.0e-15).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3300
     * @tc.name testMathCosh033
     * @tc.desc Verify cosh method with widened byte zero input returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3400
     * @tc.name testMathCosh034
     * @tc.desc Verify cosh method with widened byte normal input 12 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 81377.3984375, 1.0e-9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3500
     * @tc.name testMathCosh035
     * @tc.desc Verify cosh method with widened byte negative one input returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 1.5430806875228882, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3600
     * @tc.name testMathCosh036
     * @tc.desc Verify cosh method with widened byte maximum boundary 127 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3700
     * @tc.name testMathCosh037
     * @tc.desc Verify cosh method with widened byte minimum boundary -128 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3800
     * @tc.name testMathCosh038
     * @tc.desc Verify cosh method with byte overflow conversion input 128 follows the wrapped byte value and returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.cosh(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_3900
     * @tc.name testMathCosh039
     * @tc.desc Verify cosh method with widened short zero input returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4000
     * @tc.name testMathCosh040
     * @tc.desc Verify cosh method with widened short normal input 2048 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4100
     * @tc.name testMathCosh041
     * @tc.desc Verify cosh method with widened short maximum boundary 32767 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4200
     * @tc.name testMathCosh042
     * @tc.desc Verify cosh method with widened short minimum boundary -32768 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4300
     * @tc.name testMathCosh043
     * @tc.desc Verify cosh method with short mapped value 65535 follows the wrapped short float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.cosh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expectCoshReference(result, 1.5430806875228882, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4400
     * @tc.name testMathCosh044
     * @tc.desc Verify cosh method with short overflow conversion input 32768 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.cosh(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4500
     * @tc.name testMathCosh045
     * @tc.desc Verify cosh method with hexadecimal int input 0x1234 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4600
     * @tc.name testMathCosh046
     * @tc.desc Verify cosh method with binary int input 0b1010 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.cosh(inputValue);
      expectCoshReference(result, 11013.2333984375, 1.0e-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4700
     * @tc.name testMathCosh047
     * @tc.desc Verify cosh method with Int.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4800
     * @tc.name testMathCosh048
     * @tc.desc Verify cosh method with Int.MIN_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_4900
     * @tc.name testMathCosh049
     * @tc.desc Verify cosh method with Int.MAX_VALUE minus one returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5000
     * @tc.name testMathCosh050
     * @tc.desc Verify cosh method with int overflow from Int.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let inputValue: int = maxValue + 1;
      let result: double = Math.cosh(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5100
     * @tc.name testMathCosh051
     * @tc.desc Verify cosh method with widened long zero input returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5200
     * @tc.name testMathCosh052
     * @tc.desc Verify cosh method with widened Long.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5300
     * @tc.name testMathCosh053
     * @tc.desc Verify cosh method with Long.MAX_VALUE minus one returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE - Int.toLong(1);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5400
     * @tc.name testMathCosh054
     * @tc.desc Verify cosh method with widened Long.MIN_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5500
     * @tc.name testMathCosh055
     * @tc.desc Verify cosh method with Long.MIN_VALUE plus one returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE + Int.toLong(1);
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5600
     * @tc.name testMathCosh056
     * @tc.desc Verify cosh method with Long.MIN_VALUE minus one follows the wrapped Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE - Int.toLong(1);
      let result: double = Math.cosh(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5700
     * @tc.name testMathCosh057
     * @tc.desc Verify cosh method with long overflow from Long.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: long = Long.MAX_VALUE;
      let inputValue: long = maxValue + Int.toLong(1);
      let result: double = Math.cosh(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5800
     * @tc.name testMathCosh058
     * @tc.desc Verify cosh method with float normal input 3.14f returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: float = Math.cosh(inputValue);
      expectCoshReference(result, 11.573576037887909, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_5900
     * @tc.name testMathCosh059
     * @tc.desc Verify cosh method with Float.MAX_VALUE boundary returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.cosh(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6000
     * @tc.name testMathCosh060
     * @tc.desc Verify cosh method with negative Float.MAX_VALUE boundary returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: float = Math.cosh(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6100
     * @tc.name testMathCosh061
     * @tc.desc Verify cosh method with Float.MIN_VALUE boundary returns exact float one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.cosh(inputValue);
      expect(result).assertEqual(Double.toFloat(1.0));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6200
     * @tc.name testMathCosh062
     * @tc.desc Verify cosh method with negative Float.MIN_VALUE boundary returns exact float one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: float = Math.cosh(inputValue);
      expect(result).assertEqual(Double.toFloat(1.0));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6300
     * @tc.name testMathCosh063
     * @tc.desc Verify cosh method with Double.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6400
     * @tc.name testMathCosh064
     * @tc.desc Verify cosh method with negative Double.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6500
     * @tc.name testMathCosh065
     * @tc.desc Verify cosh method with Double.MIN_VALUE boundary returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_COSH_6600
     * @tc.name testMathCosh066
     * @tc.desc Verify cosh method with negative Double.MIN_VALUE boundary returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCosh066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.cosh(inputValue);
      expect(result).assertEqual(1.0);
    });
  });
}
