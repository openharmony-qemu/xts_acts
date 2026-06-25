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


export default function mathExpTest(): void {
  describe('MathExpTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0100
     * @tc.name testMathExp001
     * @tc.desc Verify exp method with zero double input 0.0 for exact unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0200
     * @tc.name testMathExp002
     * @tc.desc Verify exp method with float zero input via Double.toFloat(0.0) for exact float unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0300
     * @tc.name testMathExp003
     * @tc.desc Verify exp method with normal positive double input 0.1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0400
     * @tc.name testMathExp004
     * @tc.desc Verify exp method with normal positive double input 0.2 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.2;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0500
     * @tc.name testMathExp005
     * @tc.desc Verify exp method with normal positive double input 0.5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0600
     * @tc.name testMathExp006
     * @tc.desc Verify exp method with normal positive double input 0.9 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.9;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0700
     * @tc.name testMathExp007
     * @tc.desc Verify exp method with normal positive double input 1.25 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0800
     * @tc.name testMathExp008
     * @tc.desc Verify exp method with normal positive double input 2.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0900
     * @tc.name testMathExp009
     * @tc.desc Verify exp method with normal positive double input 3.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1000
     * @tc.name testMathExp010
     * @tc.desc Verify exp method with normal positive double input 5.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1100
     * @tc.name testMathExp011
     * @tc.desc Verify exp method with normal positive double input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1200
     * @tc.name testMathExp012
     * @tc.desc Verify exp method with normal positive double input 18.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 18.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1300
     * @tc.name testMathExp013
     * @tc.desc Verify exp method with normal positive double input 21.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 21.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1400
     * @tc.name testMathExp014
     * @tc.desc Verify exp method with normal positive double input 100.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1500
     * @tc.name testMathExp015
     * @tc.desc Verify exp method with negative double input -0.1 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1600
     * @tc.name testMathExp016
     * @tc.desc Verify exp method with negative double input -0.5 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1700
     * @tc.name testMathExp017
     * @tc.desc Verify exp method with negative double input -1.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1800
     * @tc.name testMathExp018
     * @tc.desc Verify exp method with negative double input -2.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1900
     * @tc.name testMathExp019
     * @tc.desc Verify exp method with negative double input -3.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -3.0;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2000
     * @tc.name testMathExp020
     * @tc.desc Verify exp method with negative double input -10.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2100
     * @tc.name testMathExp021
     * @tc.desc Verify exp method with normal float input 0.3 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.exp(inputValue);
      expect(result > 0.0f).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2200
     * @tc.name testMathExp022
     * @tc.desc Verify exp method with normal float input 1.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.exp(inputValue);
      expect(result > 0.0f).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2300
     * @tc.name testMathExp023
     * @tc.desc Verify exp method with normal float input 2.5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.exp(inputValue);
      expect(result > 0.0f).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2400
     * @tc.name testMathExp024
     * @tc.desc Verify exp method with normal float input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.exp(inputValue);
      expect(result > 0.0f).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2500
     * @tc.name testMathExp025
     * @tc.desc Verify exp method with normal float input 100.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(100.0);
      let result: float = Math.exp(inputValue);
      expect(result > 0.0f).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2600
     * @tc.name testMathExp026
     * @tc.desc Verify exp method with negative float input -0.5 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.exp(inputValue);
      expect(result >= 0.0f).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2700
     * @tc.name testMathExp027
     * @tc.desc Verify exp method with negative float input -1.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.exp(inputValue);
      expect(result >= 0.0f).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2800
     * @tc.name testMathExp028
     * @tc.desc Verify exp method with negative float input -3.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-3.0);
      let result: float = Math.exp(inputValue);
      expect(result >= 0.0f).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2900
     * @tc.name testMathExp029
     * @tc.desc Verify exp method with negative float input -10.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-10.0);
      let result: float = Math.exp(inputValue);
      expect(result >= 0.0f).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3000
     * @tc.name testMathExp030
     * @tc.desc Verify exp method with normal positive double input 0.15 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.15;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3100
     * @tc.name testMathExp031
     * @tc.desc Verify exp method with normal positive double input 0.55 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.55;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3200
     * @tc.name testMathExp032
     * @tc.desc Verify exp method with normal positive double input 0.85 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.85;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3300
     * @tc.name testMathExp033
     * @tc.desc Verify exp method with tiny double input 1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-10;
      let result: double = Math.exp(inputValue);
      let expected: double = 1.0000000001;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3400
     * @tc.name testMathExp034
     * @tc.desc Verify exp method with tiny double input -1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e-10;
      let result: double = Math.exp(inputValue);
      let expected: double = 0.9999999999;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3500
     * @tc.name testMathExp035
     * @tc.desc Verify exp method with tiny double input 1e-20 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-20;
      let result: double = Math.exp(inputValue);
      let expected: double = 1.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3600
     * @tc.name testMathExp036
     * @tc.desc Verify exp method with tiny float input 1e-05 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1e-05);
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(1.00001000005);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3700
     * @tc.name testMathExp037
     * @tc.desc Verify exp method with tiny float input -1e-05 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1e-05);
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(0.9999900000499998);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3800
     * @tc.name testMathExp038
     * @tc.desc Verify exp method with large double input 10000000000.0 for finite result without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10000000000.0;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3900
     * @tc.name testMathExp039
     * @tc.desc Verify exp method with large double input -10000000000.0 for finite result without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10000000000.0;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result <= 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4000
     * @tc.name testMathExp040
     * @tc.desc Verify exp method with large double input 1e+100 for finite result without overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e+100;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4100
     * @tc.name testMathExp041
     * @tc.desc Verify exp method with large float input 10000000000.0 for finite positive result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10000000000.0);
      let result: float = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4200
     * @tc.name testMathExp042
     * @tc.desc Verify exp method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.exp(inputValue);
      let expected: double = 1.3498588075760032;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4300
     * @tc.name testMathExp043
     * @tc.desc Verify exp method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.exp(inputValue);
      let expected: double = 3.4903429574618414;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4400
     * @tc.name testMathExp044
     * @tc.desc Verify exp method with double input 6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 6.0;
      let result: double = Math.exp(inputValue);
      let expected: double = 403.4287934927351;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4500
     * @tc.name testMathExp045
     * @tc.desc Verify exp method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(1.3498588075760032);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4600
     * @tc.name testMathExp046
     * @tc.desc Verify exp method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(12.182493960703473);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4700
     * @tc.name testMathExp047
     * @tc.desc Verify exp method with double NaN input for NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.exp(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4800
     * @tc.name testMathExp048
     * @tc.desc Verify exp method with float NaN input for NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.exp(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4900
     * @tc.name testMathExp049
     * @tc.desc Verify exp method with double positive Infinity input for positive Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.exp(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5000
     * @tc.name testMathExp050
     * @tc.desc Verify exp method with double negative Infinity input for negative Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.exp(negInfInput);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5100
     * @tc.name testMathExp051
     * @tc.desc Verify exp method with float positive Infinity input for positive Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let infInput: float = fOne / fZero;
      let result: float = Math.exp(infInput);
      expect(result).assertEqual(infInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5200
     * @tc.name testMathExp052
     * @tc.desc Verify exp method with float negative Infinity input for negative Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let negInfInput: float = -fOne / fZero;
      let result: float = Math.exp(negInfInput);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5300
     * @tc.name testMathExp053
     * @tc.desc Verify exp method with double variable input 3.0 for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.exp(input);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5400
     * @tc.name testMathExp054
     * @tc.desc Verify exp method with float variable input 5.0 for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.exp(input);
      expect(result > 0.0f).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5500
     * @tc.name testMathExp055
     * @tc.desc Verify exp method directly called via Math class name with double 3.0 for valid finite return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.exp(3.0);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5600
     * @tc.name testMathExp056
     * @tc.desc Verify exp method with double negative zero input -0.0 for exact unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5700
     * @tc.name testMathExp057
     * @tc.desc Verify exp method with float negative zero input for exact float unit return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(1.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5800
     * @tc.name testMathExp058
     * @tc.desc Verify exp method with double scientific notation input 1.5e1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5e1;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5900
     * @tc.name testMathExp059
     * @tc.desc Verify exp method with double scientific notation input 2e-5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2e-5;
      let result: double = Math.exp(inputValue);
      expect(result > 0.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6000
     * @tc.name testMathExp060
     * @tc.desc Verify exp method with double scientific notation input -1.5e1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.5e1;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6100
     * @tc.name testMathExp061
     * @tc.desc Verify exp method with double scientific notation input -2e-5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2e-5;
      let result: double = Math.exp(inputValue);
      expect(result >= 0.0).assertTrue();
      expect(result < 1.0).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6200
     * @tc.name testMathExp062
     * @tc.desc Verify exp method with normal positive double input 19.0 for expected value within relative tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 19.0;
      let result: double = Math.exp(inputValue);
      let expected: double = 178482300.96318728;
      let relativeDiff: double = Utils.getRelativeDiff(result, expected);
      expect(relativeDiff < 1.0e-15).assertTrue();
    });
  });
}
