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


export default function mathCeilTest(): void {
  describe('MathCeilTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0100
     * @tc.name testMathCeil001
     * @tc.desc Verify ceil method with double input 3.7 for expected return 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.7;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0200
     * @tc.name testMathCeil002
     * @tc.desc Verify ceil method with double input 0.618 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.618;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0300
     * @tc.name testMathCeil003
     * @tc.desc Verify ceil method with double input -3.7 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.7;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0400
     * @tc.name testMathCeil004
     * @tc.desc Verify ceil method with double input -0.618 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.618;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0500
     * @tc.name testMathCeil005
     * @tc.desc Verify ceil method with double input 5.0 for expected return 5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0600
     * @tc.name testMathCeil006
     * @tc.desc Verify ceil method with double input -5.0 for expected return -5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0700
     * @tc.name testMathCeil007
     * @tc.desc Verify ceil method with double input 99999.999 for expected return 100000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 99999.999;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(100000);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0800
     * @tc.name testMathCeil008
     * @tc.desc Verify ceil method with double input -99999.001 for expected return -99999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -99999.001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-99999);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_0900
     * @tc.name testMathCeil009
     * @tc.desc Verify ceil method with double input 0.0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1000
     * @tc.name testMathCeil010
     * @tc.desc Verify ceil method with double input -0.0 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1100
     * @tc.name testMathCeil011
     * @tc.desc Verify ceil method with double input 2.0000000001 for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0000000001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1200
     * @tc.name testMathCeil012
     * @tc.desc Verify ceil method with double input 1.9999999999 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.9999999999;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1300
     * @tc.name testMathCeil013
     * @tc.desc Verify ceil method with double input -2.0000000001 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0000000001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1400
     * @tc.name testMathCeil014
     * @tc.desc Verify ceil method with double input -2.9999999999 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.9999999999;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1500
     * @tc.name testMathCeil015
     * @tc.desc Verify ceil method with double input 1e+100 for expected return 10000000000000000159028911097599180468360808563945281389781327557747838772170381060813469985856815104
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1e+100;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1600
     * @tc.name testMathCeil016
     * @tc.desc Verify ceil method with double input -1e+100 for expected return -10000000000000000159028911097599180468360808563945281389781327557747838772170381060813469985856815104
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1e+100;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1700
     * @tc.name testMathCeil017
     * @tc.desc Verify ceil method with double input 5e-324 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5e-324;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1800
     * @tc.name testMathCeil018
     * @tc.desc Verify ceil method with double input -5e-324 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5e-324;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_1900
     * @tc.name testMathCeil019
     * @tc.desc Verify ceil method with double input 2147483647.0 for expected return 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2147483647);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2000
     * @tc.name testMathCeil020
     * @tc.desc Verify ceil method with double input 0.5 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2100
     * @tc.name testMathCeil021
     * @tc.desc Verify ceil method with double input -0.5 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.5;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2200
     * @tc.name testMathCeil022
     * @tc.desc Verify ceil method with double NaN input for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let result: double = Math.ceil(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2300
     * @tc.name testMathCeil023
     * @tc.desc Verify ceil method with double positive Infinity for Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.ceil(infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2400
     * @tc.name testMathCeil024
     * @tc.desc Verify ceil method with double negative Infinity for negative Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = -1.0 / 0.0;
      let result: double = Math.ceil(negInfValue);
      expect(result).assertEqual(negInfValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2500
     * @tc.name testMathCeil025
     * @tc.desc Verify ceil method with double variable for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.718;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2600
     * @tc.name testMathCeil026
     * @tc.desc Verify ceil is static method callable via Math class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.5;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2700
     * @tc.name testMathCeil027
     * @tc.desc Verify ceil idempotency with repeated same-input calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCeil027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.14159;
      let firstCallResult: double = Math.ceil(x);
      let secondCallResult: double = Math.ceil(x);
      let thirdCallResult: double = Math.ceil(x);
      expect(firstCallResult).assertEqual(4);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2800
     * @tc.name testMathCeil028
     * @tc.desc Verify ceil return value is not smaller than representative inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCeil028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveFractionInput: double = 3.14;
      let negativeFractionInput: double = -3.14;
      let largeFractionInput: double = 100.001;
      expect(Math.ceil(positiveFractionInput) >= positiveFractionInput).assertTrue();
      expect(Math.ceil(negativeFractionInput) >= negativeFractionInput).assertTrue();
      expect(Math.ceil(largeFractionInput) >= largeFractionInput).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_2900
     * @tc.name testMathCeil029
     * @tc.desc Verify ceil returns integer unchanged for integer inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathCeil029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveIntegerInput: double = 5.0;
      let negativeIntegerInput: double = -5.0;
      let largeIntegerInput: double = 100.0;
      expect(Math.ceil(positiveIntegerInput)).assertEqual(positiveIntegerInput);
      expect(Math.ceil(negativeIntegerInput)).assertEqual(negativeIntegerInput);
      expect(Math.ceil(largeIntegerInput)).assertEqual(largeIntegerInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3000
     * @tc.name testMathCeil030
     * @tc.desc Verify ceil method with double input 1.1 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.1;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3100
     * @tc.name testMathCeil031
     * @tc.desc Verify ceil method with double input -1.1 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.1;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3200
     * @tc.name testMathCeil032
     * @tc.desc Verify ceil method with double input 2.2 for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.2;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3300
     * @tc.name testMathCeil033
     * @tc.desc Verify ceil method with double input -2.2 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.2;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3400
     * @tc.name testMathCeil034
     * @tc.desc Verify ceil method with double input 3.3 for expected return 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.3;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3500
     * @tc.name testMathCeil035
     * @tc.desc Verify ceil method with double input -3.3 for expected return -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.3;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3600
     * @tc.name testMathCeil036
     * @tc.desc Verify ceil method with double input 7.7 for expected return 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 7.7;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3700
     * @tc.name testMathCeil037
     * @tc.desc Verify ceil method with double input -7.7 for expected return -7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -7.7;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-7);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3800
     * @tc.name testMathCeil038
     * @tc.desc Verify ceil method with double input 12.34 for expected return 13
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 12.34;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(13);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_3900
     * @tc.name testMathCeil039
     * @tc.desc Verify ceil method with double input -12.34 for expected return -12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -12.34;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4000
     * @tc.name testMathCeil040
     * @tc.desc Verify ceil method with double input 0.001 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4100
     * @tc.name testMathCeil041
     * @tc.desc Verify ceil method with double input -0.001 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4200
     * @tc.name testMathCeil042
     * @tc.desc Verify ceil method with double input 100.001 for expected return 101
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 100.001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(101);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4300
     * @tc.name testMathCeil043
     * @tc.desc Verify ceil method with double input -100.001 for expected return -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -100.001;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-100);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4400
     * @tc.name testMathCeil044
     * @tc.desc Verify ceil method with double input 0.25 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.25;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4500
     * @tc.name testMathCeil045
     * @tc.desc Verify ceil method with double input -0.25 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.25;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4600
     * @tc.name testMathCeil046
     * @tc.desc Verify ceil method with double input 1.75 for expected return 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.75;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4700
     * @tc.name testMathCeil047
     * @tc.desc Verify ceil method with double input -1.75 for expected return -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.75;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4800
     * @tc.name testMathCeil048
     * @tc.desc Verify ceil method with double input 123.456 for expected return 124
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 123.456;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(124);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_4900
     * @tc.name testMathCeil049
     * @tc.desc Verify ceil method with double input -123.456 for expected return -123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -123.456;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-123);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5000
     * @tc.name testMathCeil050
     * @tc.desc Verify ceil method with double input 0.333 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.333;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5100
     * @tc.name testMathCeil051
     * @tc.desc Verify ceil method with double input -0.333 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.333;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5200
     * @tc.name testMathCeil052
     * @tc.desc Verify ceil method with Math.E constant input for expected return 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = Math.E;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5300
     * @tc.name testMathCeil053
     * @tc.desc Verify ceil method with double input -2.718 for expected return -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.718;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5400
     * @tc.name testMathCeil054
     * @tc.desc Verify ceil method with double input 10.01 for expected return 11
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 10.01;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(11);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5500
     * @tc.name testMathCeil055
     * @tc.desc Verify ceil method with double input -10.01 for expected return -10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -10.01;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5600
     * @tc.name testMathCeil056
     * @tc.desc Verify ceil method with double input 0.9 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.9;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5700
     * @tc.name testMathCeil057
     * @tc.desc Verify ceil method with double input -0.9 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.9;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5800
     * @tc.name testMathCeil058
     * @tc.desc Verify ceil method with double input 20.2 for expected return 21
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 20.2;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(21);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_5900
     * @tc.name testMathCeil059
     * @tc.desc Verify ceil method with double input -20.2 for expected return -20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -20.2;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6000
     * @tc.name testMathCeil060
     * @tc.desc Verify ceil method with double input 0.05 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.05;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6100
     * @tc.name testMathCeil061
     * @tc.desc Verify ceil method with double input -0.05 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.05;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6200
     * @tc.name testMathCeil062
     * @tc.desc Verify ceil method with double input 0.95 for expected return 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.95;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6300
     * @tc.name testMathCeil063
     * @tc.desc Verify ceil method with double input -0.95 for expected return 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.95;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6400
     * @tc.name testMathCeil064
     * @tc.desc Verify ceil method with double input 8.99 for expected return 9
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 8.99;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_CEIL_6500
     * @tc.name testMathCeil065
     * @tc.desc Verify ceil method with double input -8.99 for expected return -8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathCeil065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -8.99;
      let result: double = Math.ceil(input);
      expect(result).assertEqual(-8);
    });
  });
}
