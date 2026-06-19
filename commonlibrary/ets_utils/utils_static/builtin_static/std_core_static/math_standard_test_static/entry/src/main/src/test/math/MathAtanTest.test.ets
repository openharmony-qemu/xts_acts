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


export default function mathAtanTest(): void {
  describe('MathAtanTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0100
     * @tc.name testMathAtan001
     * @tc.desc Verify atan method with double zero input 0.0 for exact zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.atan(inputValue);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0200
     * @tc.name testMathAtan002
     * @tc.desc Verify atan method with float zero input via Double.toFloat(0.0) for exact float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.atan(inputValue);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0300
     * @tc.name testMathAtan003
     * @tc.desc Verify atan method with double input 1.0 for exact PI/4 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.atan(inputValue);
      let expected: double = Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0400
     * @tc.name testMathAtan004
     * @tc.desc Verify atan method with double input -1.0 for exact -PI/4 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.atan(inputValue);
      let expected: double = -Math.PI / 4.0;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0500
     * @tc.name testMathAtan005
     * @tc.desc Verify atan method with float input 1.0 for approximate PI/4 return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.atan(inputValue);
      let expected: float = Double.toFloat(0.7853981633974483);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0600
     * @tc.name testMathAtan006
     * @tc.desc Verify atan method with float input -1.0 for approximate -PI/4 return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.atan(inputValue);
      let expected: float = Double.toFloat(-0.7853981633974483);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0700
     * @tc.name testMathAtan007
     * @tc.desc Verify atan method with positive double input 0.1 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0800
     * @tc.name testMathAtan008
     * @tc.desc Verify atan method with positive double input 0.25 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.25;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_0900
     * @tc.name testMathAtan009
     * @tc.desc Verify atan method with positive double input 0.5 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1000
     * @tc.name testMathAtan010
     * @tc.desc Verify atan method with positive double input 0.75 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.75;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1100
     * @tc.name testMathAtan011
     * @tc.desc Verify atan method with positive double input 1.1 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.1;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1200
     * @tc.name testMathAtan012
     * @tc.desc Verify atan method with positive double input 1.5 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1300
     * @tc.name testMathAtan013
     * @tc.desc Verify atan method with positive double input 2.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1400
     * @tc.name testMathAtan014
     * @tc.desc Verify atan method with positive double input 3.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1500
     * @tc.name testMathAtan015
     * @tc.desc Verify atan method with positive double input 5.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1600
     * @tc.name testMathAtan016
     * @tc.desc Verify atan method with positive double input 10.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1700
     * @tc.name testMathAtan017
     * @tc.desc Verify atan method with positive double input 50.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 50.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1800
     * @tc.name testMathAtan018
     * @tc.desc Verify atan method with positive double input 100.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_1900
     * @tc.name testMathAtan019
     * @tc.desc Verify atan method with positive double input 1000.0 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1000.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2000
     * @tc.name testMathAtan020
     * @tc.desc Verify atan method with positive double input 0.6 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.6;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2100
     * @tc.name testMathAtan021
     * @tc.desc Verify atan method with positive double input 2.5 for valid result in open interval (-PI/2, PI/2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.5;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2200
     * @tc.name testMathAtan022
     * @tc.desc Verify atan method with negative double input -0.1 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2300
     * @tc.name testMathAtan023
     * @tc.desc Verify atan method with negative double input -0.25 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.25;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2400
     * @tc.name testMathAtan024
     * @tc.desc Verify atan method with negative double input -0.5 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2500
     * @tc.name testMathAtan025
     * @tc.desc Verify atan method with negative double input -0.75 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.75;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2600
     * @tc.name testMathAtan026
     * @tc.desc Verify atan method with negative double input -2.0 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2700
     * @tc.name testMathAtan027
     * @tc.desc Verify atan method with negative double input -3.0 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -3.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2800
     * @tc.name testMathAtan028
     * @tc.desc Verify atan method with negative double input -5.0 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -5.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_2900
     * @tc.name testMathAtan029
     * @tc.desc Verify atan method with negative double input -10.0 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3000
     * @tc.name testMathAtan030
     * @tc.desc Verify atan method with negative double input -100.0 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -100.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3100
     * @tc.name testMathAtan031
     * @tc.desc Verify atan method with negative double input -1000.0 for valid negative result in open interval
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1000.0;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3200
     * @tc.name testMathAtan032
     * @tc.desc Verify atan method with positive float input 0.1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.1);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3300
     * @tc.name testMathAtan033
     * @tc.desc Verify atan method with positive float input 0.5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3400
     * @tc.name testMathAtan034
     * @tc.desc Verify atan method with positive float input 1.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3500
     * @tc.name testMathAtan035
     * @tc.desc Verify atan method with positive float input 2.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3600
     * @tc.name testMathAtan036
     * @tc.desc Verify atan method with positive float input 5.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(5.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3700
     * @tc.name testMathAtan037
     * @tc.desc Verify atan method with positive float input 10.0 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3800
     * @tc.name testMathAtan038
     * @tc.desc Verify atan method with negative float input -0.1 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.1);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_3900
     * @tc.name testMathAtan039
     * @tc.desc Verify atan method with negative float input -0.5 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4000
     * @tc.name testMathAtan040
     * @tc.desc Verify atan method with negative float input -1.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4100
     * @tc.name testMathAtan041
     * @tc.desc Verify atan method with negative float input -2.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-2.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4200
     * @tc.name testMathAtan042
     * @tc.desc Verify atan method with negative float input -5.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-5.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4300
     * @tc.name testMathAtan043
     * @tc.desc Verify atan method with negative float input -10.0 for valid finite negative non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-10.0);
      let result: float = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4400
     * @tc.name testMathAtan044
     * @tc.desc Verify atan method odd function property atan(-0.5) equals -atan(0.5) for symmetric double inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = 0.5;
      let negativeInput: double = -0.5;
      let positiveResult: double = Math.atan(positiveInput);
      let negativeResult: double = Math.atan(negativeInput);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4500
     * @tc.name testMathAtan045
     * @tc.desc Verify atan method odd function property atan(-1.0) equals -atan(1.0) for symmetric double inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = 1.0;
      let negativeInput: double = -1.0;
      let positiveResult: double = Math.atan(positiveInput);
      let negativeResult: double = Math.atan(negativeInput);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4600
     * @tc.name testMathAtan046
     * @tc.desc Verify atan method odd function property atan(-10.0) equals -atan(10.0) for symmetric double inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: double = 10.0;
      let negativeInput: double = -10.0;
      let positiveResult: double = Math.atan(positiveInput);
      let negativeResult: double = Math.atan(negativeInput);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4700
     * @tc.name testMathAtan047
     * @tc.desc Verify atan method odd function property for float input 2.0 for symmetric float inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveInput: float = Double.toFloat(2.0);
      let negativeInput: float = Double.toFloat(-2.0);
      let positiveResult: float = Math.atan(positiveInput);
      let negativeResult: float = Math.atan(negativeInput);
      expect(negativeResult).assertEqual(-positiveResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4800
     * @tc.name testMathAtan048
     * @tc.desc Verify atan method with tiny double input 1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-10;
      let result: double = Math.atan(inputValue);
      expect(result > 0.0).assertTrue();
      expect(result < 1e-9).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_4900
     * @tc.name testMathAtan049
     * @tc.desc Verify atan method with tiny double input -1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e-10;
      let result: double = Math.atan(inputValue);
      expect(result < 0.0).assertTrue();
      expect(result > -1e-9).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5000
     * @tc.name testMathAtan050
     * @tc.desc Verify atan method with tiny double input 1e-20 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-20;
      let result: double = Math.atan(inputValue);
      expect(result > 0.0).assertTrue();
      expect(result < 1e-9).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5100
     * @tc.name testMathAtan051
     * @tc.desc Verify atan method with tiny double input -1e-20 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e-20;
      let result: double = Math.atan(inputValue);
      expect(result < 0.0).assertTrue();
      expect(result > -1e-9).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5200
     * @tc.name testMathAtan052
     * @tc.desc Verify atan method with tiny float input 1e-05 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1e-05);
      let result: float = Math.atan(inputValue);
      expect(result > 0.0).assertTrue();
      expect(result < 1e-4).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5300
     * @tc.name testMathAtan053
     * @tc.desc Verify atan method with tiny float input -1e-05 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1e-05);
      let result: float = Math.atan(inputValue);
      expect(result < 0.0).assertTrue();
      expect(result > -1e-4).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5400
     * @tc.name testMathAtan054
     * @tc.desc Verify atan method with tiny float input 1e-10 for near-linear approximation near zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1e-10);
      let result: float = Math.atan(inputValue);
      expect(result > 0.0).assertTrue();
      expect(result < 1e-4).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5500
     * @tc.name testMathAtan055
     * @tc.desc Verify atan method with large positive double input 10000000000.0 for asymptotic approach to PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10000000000.0;
      let result: double = Math.atan(inputValue);
      let halfPi: double = Math.PI / 2.0;
      expect(result > 0.0).assertTrue();
      expect(result <= halfPi).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5600
     * @tc.name testMathAtan056
     * @tc.desc Verify atan method with large positive double input 1e+308 for asymptotic approach to PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e+308;
      let result: double = Math.atan(inputValue);
      let halfPi: double = Math.PI / 2.0;
      expect(result > 0.0).assertTrue();
      expect(result <= halfPi).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5700
     * @tc.name testMathAtan057
     * @tc.desc Verify atan method with large negative double input -10000000000.0 for asymptotic approach to -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10000000000.0;
      let result: double = Math.atan(inputValue);
      let negHalfPi: double = -Math.PI / 2.0;
      expect(result < 0.0).assertTrue();
      expect(result >= negHalfPi).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5800
     * @tc.name testMathAtan058
     * @tc.desc Verify atan method with large negative double input -1e+308 for asymptotic approach to -PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e+308;
      let result: double = Math.atan(inputValue);
      let negHalfPi: double = -Math.PI / 2.0;
      expect(result < 0.0).assertTrue();
      expect(result >= negHalfPi).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_5900
     * @tc.name testMathAtan059
     * @tc.desc Verify atan method with large float input 10000000000.0 for result approaching PI/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10000000000.0);
      let result: float = Math.atan(inputValue);
      let halfPi: double = Math.PI / 2.0;
      expect(result > 0.0).assertTrue();
      expect(result <= halfPi).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6000
     * @tc.name testMathAtan060
     * @tc.desc Verify atan method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.atan(inputValue);
      let expected: double = 0.2914567944778671;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6100
     * @tc.name testMathAtan061
     * @tc.desc Verify atan method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.atan(inputValue);
      let expected: double = 0.8960553845713439;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6200
     * @tc.name testMathAtan062
     * @tc.desc Verify atan method with double input 6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 6.0;
      let result: double = Math.atan(inputValue);
      let expected: double = 1.4056476493802699;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6300
     * @tc.name testMathAtan063
     * @tc.desc Verify atan method with double input -0.7 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.7;
      let result: double = Math.atan(inputValue);
      let expected: double = -0.6107259643892086;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6400
     * @tc.name testMathAtan064
     * @tc.desc Verify atan method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.atan(inputValue);
      let expected: float = Double.toFloat(0.2914567944778671);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6500
     * @tc.name testMathAtan065
     * @tc.desc Verify atan method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.atan(inputValue);
      let expected: float = Double.toFloat(1.1902899496825317);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6600
     * @tc.name testMathAtan066
     * @tc.desc Verify atan method with double NaN input for NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.atan(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6700
     * @tc.name testMathAtan067
     * @tc.desc Verify atan method with float NaN input for NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.atan(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6800
     * @tc.name testMathAtan068
     * @tc.desc Verify atan method with double positive Infinity input for exact PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.atan(infInput);
      let expected: double = Math.PI / 2.0;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_6900
     * @tc.name testMathAtan069
     * @tc.desc Verify atan method with double negative Infinity input for exact -PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.atan(negInfInput);
      let expected: double = -Math.PI / 2.0;
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7000
     * @tc.name testMathAtan070
     * @tc.desc Verify atan method with float positive Infinity input for approximate PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let infInput: float = fOne / fZero;
      let result: float = Math.atan(infInput);
      let expected: float = Double.toFloat(1.5707963267948966);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7100
     * @tc.name testMathAtan071
     * @tc.desc Verify atan method with float negative Infinity input for approximate -PI/2 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let negInfInput: float = -fOne / fZero;
      let result: float = Math.atan(negInfInput);
      let expected: float = Double.toFloat(-1.5707963267948966);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7200
     * @tc.name testMathAtan072
     * @tc.desc Verify atan method with double variable input 3.0 for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.atan(input);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7300
     * @tc.name testMathAtan073
     * @tc.desc Verify atan method with float variable input 5.0 for correct variable passing behavior
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.atan(input);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7400
     * @tc.name testMathAtan074
     * @tc.desc Verify atan method directly called via Math class name with double 1.0 for PI/4 return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.atan(1.0);
      let expected: double = Math.PI / 4.0;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-6).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7500
     * @tc.name testMathAtan075
     * @tc.desc Verify atan method with double negative zero input -0.0 for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.atan(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7600
     * @tc.name testMathAtan076
     * @tc.desc Verify atan method with float negative zero input for exact negative float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.atan(inputValue);
      let expected: float = Double.toFloat(-0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7700
     * @tc.name testMathAtan077
     * @tc.desc Verify atan method with double scientific notation input 1.5e1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5e1;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7800
     * @tc.name testMathAtan078
     * @tc.desc Verify atan method with double scientific notation input 1e3 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e3;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_7900
     * @tc.name testMathAtan079
     * @tc.desc Verify atan method with double scientific notation input 2e-5 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2e-5;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_ATAN_8000
     * @tc.name testMathAtan080
     * @tc.desc Verify atan method with double scientific notation input -1.5e1 for valid finite non-NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathAtan080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.5e1;
      let result: double = Math.atan(inputValue);
      let lowerBound: double = -Math.PI / 2.0;
      let upperBound: double = Math.PI / 2.0;
      expect(result > lowerBound).assertTrue();
      expect(result < upperBound).assertTrue();
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertFalse();
    });
  });
}
