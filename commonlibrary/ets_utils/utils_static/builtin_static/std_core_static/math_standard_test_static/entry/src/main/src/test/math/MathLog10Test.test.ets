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


export default function mathLog10Test(): void {
  describe('MathLog10Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0100
     * @tc.name testMathLog10001
     * @tc.desc Verify log10 method with double input 1.0 for exact zero return at unity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.log10(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0200
     * @tc.name testMathLog10002
     * @tc.desc Verify log10 method with float input 1.0 for exact float zero return at unity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.log10(inputValue);
      expect(result).assertEqual(0.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0300
     * @tc.name testMathLog10003
     * @tc.desc Verify log10 method with positive double input 0.1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0400
     * @tc.name testMathLog10004
     * @tc.desc Verify log10 method with positive double input 1.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0500
     * @tc.name testMathLog10005
     * @tc.desc Verify log10 method with positive double input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0600
     * @tc.name testMathLog10006
     * @tc.desc Verify log10 method with positive double input 100.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0700
     * @tc.name testMathLog10007
     * @tc.desc Verify log10 method with positive double input 1000.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1000.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0800
     * @tc.name testMathLog10008
     * @tc.desc Verify log10 method with positive double input 1.25 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_0900
     * @tc.name testMathLog10009
     * @tc.desc Verify log10 method with positive double input 2.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1000
     * @tc.name testMathLog10010
     * @tc.desc Verify log10 method with positive double input 5.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1100
     * @tc.name testMathLog10011
     * @tc.desc Verify log10 method with positive double input 50.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 50.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1200
     * @tc.name testMathLog10012
     * @tc.desc Verify log10 method with positive double input 500.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 500.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1300
     * @tc.name testMathLog10013
     * @tc.desc Verify log10 method with positive double input 1000000.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1000000.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1400
     * @tc.name testMathLog10014
     * @tc.desc Verify log10 method with positive float input 1.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1500
     * @tc.name testMathLog10015
     * @tc.desc Verify log10 method with positive float input 2.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.0);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1600
     * @tc.name testMathLog10016
     * @tc.desc Verify log10 method with positive float input 5.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(5.0);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1700
     * @tc.name testMathLog10017
     * @tc.desc Verify log10 method with positive float input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1800
     * @tc.name testMathLog10018
     * @tc.desc Verify log10 method with positive float input 0.5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_1900
     * @tc.name testMathLog10019
     * @tc.desc Verify log10 method with positive float input 0.1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.1);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2000
     * @tc.name testMathLog10020
     * @tc.desc Verify log10 method with positive float input 0.01 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.01);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2100
     * @tc.name testMathLog10021
     * @tc.desc Verify log10 method with positive float input 1.25 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.25);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
      expect(result > -1.0e308).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2200
     * @tc.name testMathLog10022
     * @tc.desc Verify log10 method with invalid double input -0.5 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2300
     * @tc.name testMathLog10023
     * @tc.desc Verify log10 method with invalid double input -1.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2400
     * @tc.name testMathLog10024
     * @tc.desc Verify log10 method with invalid double input -2.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2500
     * @tc.name testMathLog10025
     * @tc.desc Verify log10 method with invalid double input -10.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2600
     * @tc.name testMathLog10026
     * @tc.desc Verify log10 method with double input 0.0 returns negative infinity at zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.log10(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2700
     * @tc.name testMathLog10027
     * @tc.desc Verify log10 method with double input -0.0 returns negative infinity at signed zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.log10(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2800
     * @tc.name testMathLog10028
     * @tc.desc Verify log10 method with invalid float input -0.5 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_2900
     * @tc.name testMathLog10029
     * @tc.desc Verify log10 method with invalid float input -1.0 for NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.log10(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3000
     * @tc.name testMathLog10030
     * @tc.desc Verify log10 method with float input 0.0 returns negative infinity at zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.log10(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3100
     * @tc.name testMathLog10031
     * @tc.desc Verify log10 method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.log10(inputValue);
      let expected: double = -0.5228787452803376;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3200
     * @tc.name testMathLog10032
     * @tc.desc Verify log10 method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.log10(inputValue);
      let expected: double = 0.09691001300805642;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3300
     * @tc.name testMathLog10033
     * @tc.desc Verify log10 method with double input 10.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.log10(inputValue);
      let expected: double = 1.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3400
     * @tc.name testMathLog10034
     * @tc.desc Verify log10 method with double input 100.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.log10(inputValue);
      let expected: double = 2.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3500
     * @tc.name testMathLog10035
     * @tc.desc Verify log10 method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.log10(inputValue);
      let expected: float = Double.toFloat(-0.5228787452803376);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3600
     * @tc.name testMathLog10036
     * @tc.desc Verify log10 method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.log10(inputValue);
      let expected: float = Double.toFloat(0.3979400086720376);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3700
     * @tc.name testMathLog10037
     * @tc.desc Verify log10 method with double NaN input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.log10(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3800
     * @tc.name testMathLog10038
     * @tc.desc Verify log10 method with float NaN input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.log10(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_3900
     * @tc.name testMathLog10039
     * @tc.desc Verify log10 method with double positive Infinity input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.log10(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_4000
     * @tc.name testMathLog10040
     * @tc.desc Verify log10 method with double negative Infinity input for expected semantic behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.log10(negInfInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_4100
     * @tc.name testMathLog10041
     * @tc.desc Verify log10 method with double variable input 2.0 for expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0;
      let result: double = Math.log10(input);
      let expected: double = 0.3010299956639812;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_4200
     * @tc.name testMathLog10042
     * @tc.desc Verify log10 method with float variable input 5.0 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.log10(input);
      let expected: float = Double.toFloat(0.6989700043360189);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG10_4300
     * @tc.name testMathLog10043
     * @tc.desc Verify log10 method with direct Math.log10(2.0) static call for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log10(2.0);
      let expected: double = 0.3010299956639812f;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
  });
}
