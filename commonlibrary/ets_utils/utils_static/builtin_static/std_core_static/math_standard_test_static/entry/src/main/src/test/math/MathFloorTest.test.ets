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


export default function mathFloorTest(): void {
  describe('MathFloorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0100
     * @tc.name testMathFloor001
     * @tc.desc Verify floor method with double input 3.7 for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.7;
      let result: double = Math.floor(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0200
     * @tc.name testMathFloor002
     * @tc.desc Verify floor method with double input 0.618 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.618;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0300
     * @tc.name testMathFloor003
     * @tc.desc Verify floor method with double input -3.7 for expected return -4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.7;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0400
     * @tc.name testMathFloor004
     * @tc.desc Verify floor method with double input -0.618 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.618;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0500
     * @tc.name testMathFloor005
     * @tc.desc Verify floor method with double input 5.0 for expected return 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0600
     * @tc.name testMathFloor006
     * @tc.desc Verify floor method with double input -5.0 for expected return -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0700
     * @tc.name testMathFloor007
     * @tc.desc Verify floor method with double input 99999.999 for expected return 99999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 99999.999;
      let result: double = Math.floor(input);
      expect(result).assertEqual(99999);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0800
     * @tc.name testMathFloor008
     * @tc.desc Verify floor method with double input -99999.001 for expected return -100000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -99999.001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-100000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_0900
     * @tc.name testMathFloor009
     * @tc.desc Verify floor method with double input 0.0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1000
     * @tc.name testMathFloor010
     * @tc.desc Verify floor method with double input -0.0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1100
     * @tc.name testMathFloor011
     * @tc.desc Verify floor method with double input 2.0000000001 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0000000001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1200
     * @tc.name testMathFloor012
     * @tc.desc Verify floor method with double input 1.9999999999 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.9999999999;
      let result: double = Math.floor(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1300
     * @tc.name testMathFloor013
     * @tc.desc Verify floor method with double input -2.0000000001 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0000000001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1400
     * @tc.name testMathFloor014
     * @tc.desc Verify floor method with double input -2.9999999999 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.9999999999;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1500
     * @tc.name testMathFloor015
     * @tc.desc Verify floor method with double input 1e+100 for expected return 10000000000000000159028911097599180468360808563945281389781327557747838772170381060813469985856815104
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1e+100;
      let result: double = Math.floor(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1600
     * @tc.name testMathFloor016
     * @tc.desc Verify floor method with double input -1e+100 for expected return -10000000000000000159028911097599180468360808563945281389781327557747838772170381060813469985856815104
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1e+100;
      let result: double = Math.floor(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1700
     * @tc.name testMathFloor017
     * @tc.desc Verify floor method with double input 5e-324 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5e-324;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1800
     * @tc.name testMathFloor018
     * @tc.desc Verify floor method with double input -5e-324 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5e-324;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_1900
     * @tc.name testMathFloor019
     * @tc.desc Verify floor method with double input 2147483647.0 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2000
     * @tc.name testMathFloor020
     * @tc.desc Verify floor method with double input 0.5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2100
     * @tc.name testMathFloor021
     * @tc.desc Verify floor method with double input -0.5 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.5;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2200
     * @tc.name testMathFloor022
     * @tc.desc Verify floor method with double NaN input for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let result: double = Math.floor(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2300
     * @tc.name testMathFloor023
     * @tc.desc Verify floor method with double positive Infinity for Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.floor(infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2400
     * @tc.name testMathFloor024
     * @tc.desc Verify floor method with double negative Infinity for negative Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = -1.0 / 0.0;
      let result: double = Math.floor(negInfValue);
      expect(result).assertEqual(negInfValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2500
     * @tc.name testMathFloor025
     * @tc.desc Verify floor method with double variable for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.718;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2600
     * @tc.name testMathFloor026
     * @tc.desc Verify floor is static method callable via Math class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.5;
      let result: double = Math.floor(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2700
     * @tc.name testMathFloor027
     * @tc.desc Verify floor idempotency with repeated same-input calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathFloor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.14159;
      let firstCallResult: double = Math.floor(x);
      let secondCallResult: double = Math.floor(x);
      let thirdCallResult: double = Math.floor(x);
      expect(firstCallResult).assertEqual(3);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2800
     * @tc.name testMathFloor028
     * @tc.desc Verify floor return value is not greater than representative inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathFloor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveFractionInput: double = 3.14;
      let negativeFractionInput: double = -3.14;
      let largeFractionInput: double = 100.001;
      expect(Math.floor(positiveFractionInput) <= positiveFractionInput).assertTrue();
      expect(Math.floor(negativeFractionInput) <= negativeFractionInput).assertTrue();
      expect(Math.floor(largeFractionInput) <= largeFractionInput).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_2900
     * @tc.name testMathFloor029
     * @tc.desc Verify floor returns integer unchanged for integer inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathFloor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveIntegerInput: double = 5.0;
      let negativeIntegerInput: double = -5.0;
      let largeIntegerInput: double = 100.0;
      expect(Math.floor(positiveIntegerInput)).assertEqual(positiveIntegerInput);
      expect(Math.floor(negativeIntegerInput)).assertEqual(negativeIntegerInput);
      expect(Math.floor(largeIntegerInput)).assertEqual(largeIntegerInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3000
     * @tc.name testMathFloor030
     * @tc.desc Verify floor method with double input 1.1 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.1;
      let result: double = Math.floor(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3100
     * @tc.name testMathFloor031
     * @tc.desc Verify floor method with double input -1.1 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.1;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3200
     * @tc.name testMathFloor032
     * @tc.desc Verify floor method with double input 2.2 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.2;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3300
     * @tc.name testMathFloor033
     * @tc.desc Verify floor method with double input -2.2 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.2;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3400
     * @tc.name testMathFloor034
     * @tc.desc Verify floor method with double input 3.3 for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.3;
      let result: double = Math.floor(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3500
     * @tc.name testMathFloor035
     * @tc.desc Verify floor method with double input -3.3 for expected return -4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.3;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3600
     * @tc.name testMathFloor036
     * @tc.desc Verify floor method with double input 7.7 for expected return 7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 7.7;
      let result: double = Math.floor(input);
      expect(result).assertEqual(7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3700
     * @tc.name testMathFloor037
     * @tc.desc Verify floor method with double input -7.7 for expected return -8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -7.7;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3800
     * @tc.name testMathFloor038
     * @tc.desc Verify floor method with double input 12.34 for expected return 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 12.34;
      let result: double = Math.floor(input);
      expect(result).assertEqual(12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_3900
     * @tc.name testMathFloor039
     * @tc.desc Verify floor method with double input -12.34 for expected return -13
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -12.34;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-13);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4000
     * @tc.name testMathFloor040
     * @tc.desc Verify floor method with double input 0.001 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4100
     * @tc.name testMathFloor041
     * @tc.desc Verify floor method with double input -0.001 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4200
     * @tc.name testMathFloor042
     * @tc.desc Verify floor method with double input 100.001 for expected return 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 100.001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(100);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4300
     * @tc.name testMathFloor043
     * @tc.desc Verify floor method with double input -100.001 for expected return -101
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -100.001;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-101);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4400
     * @tc.name testMathFloor044
     * @tc.desc Verify floor method with double input 0.25 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.25;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4500
     * @tc.name testMathFloor045
     * @tc.desc Verify floor method with double input -0.25 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.25;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4600
     * @tc.name testMathFloor046
     * @tc.desc Verify floor method with double input 1.75 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.75;
      let result: double = Math.floor(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4700
     * @tc.name testMathFloor047
     * @tc.desc Verify floor method with double input -1.75 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.75;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4800
     * @tc.name testMathFloor048
     * @tc.desc Verify floor method with double input 123.456 for expected return 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 123.456;
      let result: double = Math.floor(input);
      expect(result).assertEqual(123);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_4900
     * @tc.name testMathFloor049
     * @tc.desc Verify floor method with double input -123.456 for expected return -124
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -123.456;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-124);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5000
     * @tc.name testMathFloor050
     * @tc.desc Verify floor method with double input 0.333 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.333;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5100
     * @tc.name testMathFloor051
     * @tc.desc Verify floor method with double input -0.333 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.333;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5200
     * @tc.name testMathFloor052
     * @tc.desc Verify floor method with Math.E constant input for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.E;
      let result: double = Math.floor(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5300
     * @tc.name testMathFloor053
     * @tc.desc Verify floor method with double input -2.718 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.718;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5400
     * @tc.name testMathFloor054
     * @tc.desc Verify floor method with double input 10.01 for expected return 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 10.01;
      let result: double = Math.floor(input);
      expect(result).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5500
     * @tc.name testMathFloor055
     * @tc.desc Verify floor method with double input -10.01 for expected return -11
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -10.01;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-11);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5600
     * @tc.name testMathFloor056
     * @tc.desc Verify floor method with double input 0.9 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.9;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5700
     * @tc.name testMathFloor057
     * @tc.desc Verify floor method with double input -0.9 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.9;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5800
     * @tc.name testMathFloor058
     * @tc.desc Verify floor method with double input 20.2 for expected return 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 20.2;
      let result: double = Math.floor(input);
      expect(result).assertEqual(20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_5900
     * @tc.name testMathFloor059
     * @tc.desc Verify floor method with double input -20.2 for expected return -21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -20.2;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6000
     * @tc.name testMathFloor060
     * @tc.desc Verify floor method with double input 0.05 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.05;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6100
     * @tc.name testMathFloor061
     * @tc.desc Verify floor method with double input -0.05 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.05;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6200
     * @tc.name testMathFloor062
     * @tc.desc Verify floor method with double input 0.95 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.95;
      let result: double = Math.floor(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6300
     * @tc.name testMathFloor063
     * @tc.desc Verify floor method with double input -0.95 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.95;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6400
     * @tc.name testMathFloor064
     * @tc.desc Verify floor method with double input 8.99 for expected return 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 8.99;
      let result: double = Math.floor(input);
      expect(result).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FLOOR_6500
     * @tc.name testMathFloor065
     * @tc.desc Verify floor method with double input -8.99 for expected return -9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFloor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -8.99;
      let result: double = Math.floor(input);
      expect(result).assertEqual(-9);
    });
  });
}
