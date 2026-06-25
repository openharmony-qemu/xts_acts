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


export default function mathLogTest(): void {
  describe('MathLogTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0100
     * @tc.name testMathLog001
     * @tc.desc Verify log method with double input 1.0 for exact zero return at unity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.log(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0200
     * @tc.name testMathLog002
     * @tc.desc Verify log method with float input 1.0 for exact float zero return at unity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.log(inputValue);
      expect(result).assertEqual(0.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0300
     * @tc.name testMathLog003
     * @tc.desc Verify log method with positive double input 1.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0400
     * @tc.name testMathLog004
     * @tc.desc Verify log method with positive double input 2.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0500
     * @tc.name testMathLog005
     * @tc.desc Verify log method with positive double input 3.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0600
     * @tc.name testMathLog006
     * @tc.desc Verify log method with positive double input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0700
     * @tc.name testMathLog007
     * @tc.desc Verify log method with positive double input 100.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0800
     * @tc.name testMathLog008
     * @tc.desc Verify log method with positive double input 2.718281828459045 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.718281828459045;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_0900
     * @tc.name testMathLog009
     * @tc.desc Verify log method with positive double input 1.25 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1000
     * @tc.name testMathLog010
     * @tc.desc Verify log method with positive double input 1.5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1100
     * @tc.name testMathLog011
     * @tc.desc Verify log method with positive double input 5.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1200
     * @tc.name testMathLog012
     * @tc.desc Verify log method with positive double input 50.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 50.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1300
     * @tc.name testMathLog013
     * @tc.desc Verify log method with positive double input 500.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 500.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1400
     * @tc.name testMathLog014
     * @tc.desc Verify log method with positive float input 1.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1500
     * @tc.name testMathLog015
     * @tc.desc Verify log method with positive float input 2.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.0);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1600
     * @tc.name testMathLog016
     * @tc.desc Verify log method with positive float input 5.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(5.0);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1700
     * @tc.name testMathLog017
     * @tc.desc Verify log method with positive float input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1800
     * @tc.name testMathLog018
     * @tc.desc Verify log method with positive float input 0.5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_1900
     * @tc.name testMathLog019
     * @tc.desc Verify log method with positive float input 0.1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.1);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2000
     * @tc.name testMathLog020
     * @tc.desc Verify log method with positive float input 0.01 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.01);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2100
     * @tc.name testMathLog021
     * @tc.desc Verify log method with positive float input 1.25 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.25);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2200
     * @tc.name testMathLog022
     * @tc.desc Verify log method with invalid double input -0.5 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2300
     * @tc.name testMathLog023
     * @tc.desc Verify log method with invalid double input -1.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2400
     * @tc.name testMathLog024
     * @tc.desc Verify log method with invalid double input -2.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2500
     * @tc.name testMathLog025
     * @tc.desc Verify log method with invalid double input -10.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2600
     * @tc.name testMathLog026
     * @tc.desc Verify log method with double input 0.0 returns negative infinity at zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.log(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2700
     * @tc.name testMathLog027
     * @tc.desc Verify log method with double input -0.0 returns negative infinity at signed zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.log(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2800
     * @tc.name testMathLog028
     * @tc.desc Verify log method with invalid float input -0.5 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_2900
     * @tc.name testMathLog029
     * @tc.desc Verify log method with invalid float input -1.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.log(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3000
     * @tc.name testMathLog030
     * @tc.desc Verify log method with float input 0.0 returns negative infinity at zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.log(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3100
     * @tc.name testMathLog031
     * @tc.desc Verify log method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.log(inputValue);
      let expected: double = -1.2039728043259361;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3200
     * @tc.name testMathLog032
     * @tc.desc Verify log method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.log(inputValue);
      let expected: double = 0.22314355131420976;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3300
     * @tc.name testMathLog033
     * @tc.desc Verify log method with double input 10.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.log(inputValue);
      let expected: double = 2.302585092994046;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3400
     * @tc.name testMathLog034
     * @tc.desc Verify log method with double input 100.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.log(inputValue);
      let expected: double = 4.605170185988092;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3500
     * @tc.name testMathLog035
     * @tc.desc Verify log method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.log(inputValue);
      let expected: float = Double.toFloat(-1.2039728043259361);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3600
     * @tc.name testMathLog036
     * @tc.desc Verify log method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.log(inputValue);
      let expected: float = Double.toFloat(0.9162907318741551);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3700
     * @tc.name testMathLog037
     * @tc.desc Verify log method with double NaN input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.log(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3800
     * @tc.name testMathLog038
     * @tc.desc Verify log method with float NaN input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.log(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_3900
     * @tc.name testMathLog039
     * @tc.desc Verify log method with double positive Infinity input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.log(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_4000
     * @tc.name testMathLog040
     * @tc.desc Verify log method with double negative Infinity input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.log(negInfInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_4100
     * @tc.name testMathLog041
     * @tc.desc Verify log method with double variable input 2.0 for expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0;
      let result: double = Math.log(input);
      let expected: double = 0.6931471805599453;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_4200
     * @tc.name testMathLog042
     * @tc.desc Verify log method with float variable input 5.0 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.log(input);
      let expected: float = Double.toFloat(1.6094379124341003);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG_4300
     * @tc.name testMathLog043
     * @tc.desc Verify log method with direct Math.log(2.0) static call for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log(2.0);
      let expected: double = 0.6931471805599453f;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
  });
}
