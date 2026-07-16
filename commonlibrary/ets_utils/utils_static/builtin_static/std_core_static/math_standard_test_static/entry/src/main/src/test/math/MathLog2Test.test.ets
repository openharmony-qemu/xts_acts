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


export default function mathLog2Test(): void {
  describe('MathLog2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0100
     * @tc.name testMathLog2001
     * @tc.desc Verify log2 method with double input 1.0 for exact zero return at unity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0200
     * @tc.name testMathLog2002
     * @tc.desc Verify log2 method with float input 1.0 for exact float zero return at unity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(0.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0300
     * @tc.name testMathLog2003
     * @tc.desc Verify log2 method with positive double input 0.5 for exact negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(-1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0400
     * @tc.name testMathLog2004
     * @tc.desc Verify log2 method with positive double input 4.0 for exact two return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 4.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0500
     * @tc.name testMathLog2005
     * @tc.desc Verify log2 method with positive double input 8.0 for exact three return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 8.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0600
     * @tc.name testMathLog2006
     * @tc.desc Verify log2 method with positive double input 16.0 for exact four return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 16.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(4.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0700
     * @tc.name testMathLog2007
     * @tc.desc Verify log2 method with positive double input 32.0 for exact five return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 32.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0800
     * @tc.name testMathLog2008
     * @tc.desc Verify log2 method with positive double input 1024.0 for exact ten return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1024.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_0900
     * @tc.name testMathLog2009
     * @tc.desc Verify log2 method with positive double input 1.25 for expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.log2(inputValue);
      let expected: double = 0.32192809488736235;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1000
     * @tc.name testMathLog2010
     * @tc.desc Verify log2 method with positive double input 3.0 for expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.0;
      let result: double = Math.log2(inputValue);
      let expected: double = 1.5849625007211563;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1100
     * @tc.name testMathLog2011
     * @tc.desc Verify log2 method with positive double input 10.0 for expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.log2(inputValue);
      let expected: double = 3.321928094887362;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1200
     * @tc.name testMathLog2012
     * @tc.desc Verify log2 method with positive float input 2.0 for exact one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(1.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1300
     * @tc.name testMathLog2013
     * @tc.desc Verify log2 method with positive float input 5.0 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(5.0);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(2.321928094887362);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1400
     * @tc.name testMathLog2014
     * @tc.desc Verify log2 method with positive float input 10.0 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(3.321928094887362);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1500
     * @tc.name testMathLog2015
     * @tc.desc Verify log2 method with positive float input 0.5 for exact negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(-1.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1600
     * @tc.name testMathLog2016
     * @tc.desc Verify log2 method with positive float input 0.1 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.1);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(-3.321928094887362);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1700
     * @tc.name testMathLog2017
     * @tc.desc Verify log2 method with positive float input 0.01 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.01);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(-6.643856189774724);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1800
     * @tc.name testMathLog2018
     * @tc.desc Verify log2 method with positive float input 1.25 for expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.25);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(0.32192809488736235);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_1900
     * @tc.name testMathLog2019
     * @tc.desc Verify log2 method with invalid double input -0.5 for Double.NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.log2(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2000
     * @tc.name testMathLog2020
     * @tc.desc Verify log2 method with invalid double input -1.0 for Double.NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.log2(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2100
     * @tc.name testMathLog2021
     * @tc.desc Verify log2 method with invalid double input -2.0 for Double.NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.log2(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2200
     * @tc.name testMathLog2022
     * @tc.desc Verify log2 method with invalid double input -10.0 for Double.NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.log2(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2300
     * @tc.name testMathLog2023
     * @tc.desc Verify log2 method with double input 0.0 returns Double.NEGATIVE_INFINITY at zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2400
     * @tc.name testMathLog2024
     * @tc.desc Verify log2 method with double input -0.0 returns Double.NEGATIVE_INFINITY at signed zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2500
     * @tc.name testMathLog2025
     * @tc.desc Verify log2 method with invalid float input -0.5 for Float.NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.log2(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2600
     * @tc.name testMathLog2026
     * @tc.desc Verify log2 method with invalid float input -1.0 for Float.NaN return for out-of-domain input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.log2(inputValue);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2700
     * @tc.name testMathLog2027
     * @tc.desc Verify log2 method with float input 0.0 returns Float.NEGATIVE_INFINITY at zero boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2800
     * @tc.name testMathLog2028
     * @tc.desc Verify log2 method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.log2(inputValue);
      let expected: double = -1.7369655941662063;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_2900
     * @tc.name testMathLog2029
     * @tc.desc Verify log2 method with double input 100.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.log2(inputValue);
      let expected: double = 6.643856189774724;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3000
     * @tc.name testMathLog2030
     * @tc.desc Verify log2 method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(-1.7369655941662063);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3100
     * @tc.name testMathLog2031
     * @tc.desc Verify log2 method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(1.3219280948873624);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3200
     * @tc.name testMathLog2032
     * @tc.desc Verify log2 method with Double.NaN input propagates Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = Double.NaN;
      let result: double = Math.log2(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3300
     * @tc.name testMathLog2033
     * @tc.desc Verify log2 method with Float.NaN input propagates Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: float = Float.NaN;
      let result: float = Math.log2(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3400
     * @tc.name testMathLog2034
     * @tc.desc Verify log2 method with Double.POSITIVE_INFINITY input returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = Double.POSITIVE_INFINITY;
      let result: double = Math.log2(infInput);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3500
     * @tc.name testMathLog2035
     * @tc.desc Verify log2 method with Double.NEGATIVE_INFINITY input returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.log2(negInfInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3600
     * @tc.name testMathLog2036
     * @tc.desc Verify log2 method with double variable input 2.0 for exact one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0;
      let result: double = Math.log2(input);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3700
     * @tc.name testMathLog2037
     * @tc.desc Verify log2 method with direct Math.log2(2.0) static call for exact one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log2(2.0);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3800
     * @tc.name testMathLog2038
     * @tc.desc Verify log2 method accepts a byte zero source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_3900
     * @tc.name testMathLog2039
     * @tc.desc Verify log2 method accepts a normal positive byte source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(3.584962500721156);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4000
     * @tc.name testMathLog2040
     * @tc.desc Verify log2 method accepts the byte maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(6.9886846867721655);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4100
     * @tc.name testMathLog2041
     * @tc.desc Verify log2 method accepts a byte negative marker source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4200
     * @tc.name testMathLog2042
     * @tc.desc Verify log2 method accepts the byte minimum boundary source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4300
     * @tc.name testMathLog2043
     * @tc.desc Verify log2 method accepts a byte overflow-mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4400
     * @tc.name testMathLog2044
     * @tc.desc Verify log2 method accepts a byte underflow-mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      let expected: float = Double.toFloat(6.9886846867721655);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4500
     * @tc.name testMathLog2045
     * @tc.desc Verify log2 method accepts a short zero source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4600
     * @tc.name testMathLog2046
     * @tc.desc Verify log2 method accepts a normal positive short source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Double.toFloat(11.0));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4700
     * @tc.name testMathLog2047
     * @tc.desc Verify log2 method accepts the short maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(14.999955971769559);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4800
     * @tc.name testMathLog2048
     * @tc.desc Verify log2 method accepts a short negative marker source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-1);
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_4900
     * @tc.name testMathLog2049
     * @tc.desc Verify log2 method accepts the short minimum boundary source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5000
     * @tc.name testMathLog2050
     * @tc.desc Verify log2 method accepts a short upper-limit mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5100
     * @tc.name testMathLog2051
     * @tc.desc Verify log2 method accepts a short lower-limit mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      let expected: float = Double.toFloat(14.999955971769559);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5200
     * @tc.name testMathLog2052
     * @tc.desc Verify log2 method accepts an int large positive source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1000000;
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(19.931568569324174);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5300
     * @tc.name testMathLog2053
     * @tc.desc Verify log2 method accepts an int hexadecimal source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(12.186114239541643);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5400
     * @tc.name testMathLog2054
     * @tc.desc Verify log2 method accepts an int binary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(3.321928094887362);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5500
     * @tc.name testMathLog2055
     * @tc.desc Verify log2 method accepts an int octal source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0o123;
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(6.3750394313469245);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5600
     * @tc.name testMathLog2056
     * @tc.desc Verify log2 method accepts the int maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(30.999999999328193);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5700
     * @tc.name testMathLog2057
     * @tc.desc Verify log2 method accepts the int minimum boundary source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5800
     * @tc.name testMathLog2058
     * @tc.desc Verify log2 method accepts an int overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_5900
     * @tc.name testMathLog2059
     * @tc.desc Verify log2 method accepts an int underflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      let expected: float = Double.toFloat(30.999999999328193);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6000
     * @tc.name testMathLog2060
     * @tc.desc Verify log2 method accepts a long zero source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6100
     * @tc.name testMathLog2061
     * @tc.desc Verify log2 method accepts a positive long large source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(33.219280948873624);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6200
     * @tc.name testMathLog2062
     * @tc.desc Verify log2 method accepts a long negative marker source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6300
     * @tc.name testMathLog2063
     * @tc.desc Verify log2 method accepts Long.MIN_VALUE source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6400
     * @tc.name testMathLog2064
     * @tc.desc Verify log2 method accepts the long maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: float = Math.log2(inputValue);
      let expectedValue: float = Double.toFloat(63.0);
      let diffValue: double = Utils.getAbsDiff(result, expectedValue);
      expect(diffValue < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6500
     * @tc.name testMathLog2065
     * @tc.desc Verify log2 method accepts a long overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6600
     * @tc.name testMathLog2066
     * @tc.desc Verify log2 method accepts the float maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(127.99999991400867);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-4).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6700
     * @tc.name testMathLog2067
     * @tc.desc Verify log2 method accepts the float minimum positive boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Double.toFloat(-149.0));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6800
     * @tc.name testMathLog2068
     * @tc.desc Verify log2 method accepts direct Float.POSITIVE_INFINITY input and returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_6900
     * @tc.name testMathLog2069
     * @tc.desc Verify log2 method accepts direct Float.NEGATIVE_INFINITY input and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7000
     * @tc.name testMathLog2070
     * @tc.desc Verify log2 method accepts a positive float fractional source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(99.99);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(6.64371191305668);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7100
     * @tc.name testMathLog2071
     * @tc.desc Verify log2 method accepts a float overflowed source value as Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7200
     * @tc.name testMathLog2072
     * @tc.desc Verify log2 method accepts a float underflowed source value as positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: float = Math.log2(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7300
     * @tc.name testMathLog2073
     * @tc.desc Verify log2 method accepts a positive double fractional source value within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 999999.99;
      let result: double = Math.log2(inputValue);
      let expected: double = 19.931568554897222;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7400
     * @tc.name testMathLog2074
     * @tc.desc Verify log2 method accepts a negative double below-domain source value and returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -888.88;
      let result: double = Math.log2(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7500
     * @tc.name testMathLog2075
     * @tc.desc Verify log2 method accepts the Double.MAX_VALUE boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(1024.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7600
     * @tc.name testMathLog2076
     * @tc.desc Verify log2 method accepts the Double.MIN_VALUE boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(-1074.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7700
     * @tc.name testMathLog2077
     * @tc.desc Verify log2 method accepts negative Double.MIN_VALUE and returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.log2(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7800
     * @tc.name testMathLog2078
     * @tc.desc Verify log2 method accepts a double overflowed source expression as Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.log2(inputValue);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_7900
     * @tc.name testMathLog2079
     * @tc.desc Verify log2 method accepts a double underflowed source expression as positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.log2(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8000
     * @tc.name testMathLog2080
     * @tc.desc Verify log2 method accepts a double negative underflowed source expression as negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.log2(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8100
     * @tc.name testMathLog2081
     * @tc.desc Verify log2 method accepts the double safe-integer precision boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740991.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(53.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8200
     * @tc.name testMathLog2082
     * @tc.desc Verify log2 method accepts a double scientific notation source value within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0e6;
      let result: double = Math.log2(inputValue);
      let expected: double = 19.931568569324174;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8300
     * @tc.name testMathLog2083
     * @tc.desc Verify log2 method accepts Math.pow expression for an exact positive exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.pow(2.0, 10.0);
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8400
     * @tc.name testMathLog2084
     * @tc.desc Verify log2 method accepts reciprocal power input and returns negative exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0 / 1024.0;
      let result: double = Math.log2(inputValue);
      expect(result).assertEqual(-10.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8500
     * @tc.name testMathLog2085
     * @tc.desc Verify log2 method accepts Double.MAX_VALUE divided expression within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE / 10.0;
      let result: double = Math.log2(inputValue);
      let expected: double = 1020.6780719051127;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-10).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8600
     * @tc.name testMathLog2086
     * @tc.desc Verify log2 method accepts a normal positive float source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: float = Math.log2(inputValue);
      let expected: float = Double.toFloat(1.6507645591169025);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8700
     * @tc.name testMathLog2087
     * @tc.desc Verify log2 method accepts a negative float below-domain source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-99.99);
      let result: float = Math.log2(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG2_8800
     * @tc.name testMathLog2088
     * @tc.desc Verify log2 method accepts a negative float zero source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog2088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.log2(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });
  });
}
