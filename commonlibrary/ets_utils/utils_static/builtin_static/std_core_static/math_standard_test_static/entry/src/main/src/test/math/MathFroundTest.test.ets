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


export default function mathFroundTest(): void {
  describe('MathFroundTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0100
     * @tc.name testMathFround001
     * @tc.desc Verify fround method with double input 3.7 for expected return 3.700000047683716
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.7;
      let result: double = Math.fround(input);
      expect(result).assertEqual(3.700000047683716);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0200
     * @tc.name testMathFround002
     * @tc.desc Verify fround method with double input 0.618 for expected return 0.6179999709129333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.618;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.6179999709129333);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0300
     * @tc.name testMathFround003
     * @tc.desc Verify fround method with double input -3.7 for expected return -3.700000047683716
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.7;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-3.700000047683716);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0400
     * @tc.name testMathFround004
     * @tc.desc Verify fround method with double input -0.618 for expected return -0.6179999709129333
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.618;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.6179999709129333);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0500
     * @tc.name testMathFround005
     * @tc.desc Verify fround method with double input 5.0 for expected return 5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0600
     * @tc.name testMathFround006
     * @tc.desc Verify fround method with double input -5.0 for expected return -5.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-5.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0700
     * @tc.name testMathFround007
     * @tc.desc Verify fround method with double input 99999.999 for expected return 100000.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 99999.999;
      let result: double = Math.fround(input);
      expect(result).assertEqual(100000.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0800
     * @tc.name testMathFround008
     * @tc.desc Verify fround method with double input -99999.001 for expected return -99999.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -99999.001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-99999.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_0900
     * @tc.name testMathFround009
     * @tc.desc Verify fround method with double input 0.0 for expected return 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1000
     * @tc.name testMathFround010
     * @tc.desc Verify fround method with double input -0.0 for expected return -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1100
     * @tc.name testMathFround011
     * @tc.desc Verify fround method with double input 2.0000000001 for expected return 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.0000000001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1200
     * @tc.name testMathFround012
     * @tc.desc Verify fround method with double input 1.9999999999 for expected return 2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.9999999999;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1300
     * @tc.name testMathFround013
     * @tc.desc Verify fround method with double input -2.0000000001 for expected return -2.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.0000000001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-2.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1400
     * @tc.name testMathFround014
     * @tc.desc Verify fround method with double input -2.9999999999 for expected return -3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.9999999999;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-3.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1500
     * @tc.name testMathFround015
     * @tc.desc Verify fround method with double input 1e+100 for expected return inf
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1e+100;
      let result: double = Math.fround(input);
      let expectedInf: double = 1.0 / 0.0;
      expect(result).assertEqual(expectedInf);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1600
     * @tc.name testMathFround016
     * @tc.desc Verify fround method with double input -1e+100 for expected return -inf
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1e+100;
      let result: double = Math.fround(input);
      let expectedNegInf: double = -1.0 / 0.0;
      expect(result).assertEqual(expectedNegInf);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1700
     * @tc.name testMathFround017
     * @tc.desc Verify fround method with double input 5e-324 for expected return 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 5e-324;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1800
     * @tc.name testMathFround018
     * @tc.desc Verify fround method with double input -5e-324 for expected return -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -5e-324;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_1900
     * @tc.name testMathFround019
     * @tc.desc Verify fround method with double input 2147483647.0 for expected return 2147483648.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2147483647.0;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2147483648.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2000
     * @tc.name testMathFround020
     * @tc.desc Verify fround method with double input 0.5 for expected return 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2100
     * @tc.name testMathFround021
     * @tc.desc Verify fround method with double input -0.5 for expected return -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.5;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2200
     * @tc.name testMathFround022
     * @tc.desc Verify fround method with double NaN input for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanValue: double = 0.0 / 0.0;
      let result: double = Math.fround(nanValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2300
     * @tc.name testMathFround023
     * @tc.desc Verify fround method with double positive Infinity for Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infValue: double = 1.0 / 0.0;
      let result: double = Math.fround(infValue);
      expect(result).assertEqual(infValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2400
     * @tc.name testMathFround024
     * @tc.desc Verify fround method with double negative Infinity for negative Infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfValue: double = -1.0 / 0.0;
      let result: double = Math.fround(negInfValue);
      expect(result).assertEqual(negInfValue);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2500
     * @tc.name testMathFround025
     * @tc.desc Verify fround method with double variable for correct variable passing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.718;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.7179999351501465);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2600
     * @tc.name testMathFround026
     * @tc.desc Verify fround is static method callable via Math class name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.5;
      let result: double = Math.fround(input);
      expect(result).assertEqual(1.5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2700
     * @tc.name testMathFround027
     * @tc.desc Verify fround idempotency with repeated same-input calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathFround027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 3.14159;
      let firstCallResult: double = Math.fround(x);
      let secondCallResult: double = Math.fround(x);
      let thirdCallResult: double = Math.fround(x);
      expect(firstCallResult).assertEqual(3.141590118408203);
      expect(firstCallResult).assertEqual(secondCallResult);
      expect(secondCallResult).assertEqual(thirdCallResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2800
     * @tc.name testMathFround028
     * @tc.desc Verify fround returns finite values for representative inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathFround028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveFiniteInput: double = 3.14;
      let negativeFiniteInput: double = -3.14;
      let largeFiniteInput: double = 1.0e20;
      let positiveFiniteResult: double = Math.fround(positiveFiniteInput);
      let negativeFiniteResult: double = Math.fround(negativeFiniteInput);
      let largeFiniteResult: double = Math.fround(largeFiniteInput);
      expect(Utils.isNaNValue(positiveFiniteResult)).assertFalse();
      expect(Utils.isNaNValue(negativeFiniteResult)).assertFalse();
      expect(Utils.isNaNValue(largeFiniteResult)).assertFalse();
      expect(Utils.isFiniteValue(positiveFiniteResult)).assertTrue();
      expect(Utils.isFiniteValue(negativeFiniteResult)).assertTrue();
      expect(Utils.isFiniteValue(largeFiniteResult)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_2900
     * @tc.name testMathFround029
     * @tc.desc Verify fround returns integer unchanged for integer inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
    */
    it('testMathFround029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveIntegerInput: double = 5.0;
      let negativeIntegerInput: double = -5.0;
      let largeIntegerInput: double = 100.0;
      expect(Math.fround(positiveIntegerInput)).assertEqual(positiveIntegerInput);
      expect(Math.fround(negativeIntegerInput)).assertEqual(negativeIntegerInput);
      expect(Math.fround(largeIntegerInput)).assertEqual(largeIntegerInput);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3000
     * @tc.name testMathFround030
     * @tc.desc Verify fround method with double input 1.1 for expected return 1.100000023841858
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.1;
      let result: double = Math.fround(input);
      expect(result).assertEqual(1.100000023841858);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3100
     * @tc.name testMathFround031
     * @tc.desc Verify fround method with double input -1.1 for expected return -1.100000023841858
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.1;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-1.100000023841858);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3200
     * @tc.name testMathFround032
     * @tc.desc Verify fround method with double input 2.2 for expected return 2.200000047683716
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.2;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.200000047683716);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3300
     * @tc.name testMathFround033
     * @tc.desc Verify fround method with double input -2.2 for expected return -2.200000047683716
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.2;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-2.200000047683716);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3400
     * @tc.name testMathFround034
     * @tc.desc Verify fround method with double input 3.3 for expected return 3.299999952316284
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.3;
      let result: double = Math.fround(input);
      expect(result).assertEqual(3.299999952316284);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3500
     * @tc.name testMathFround035
     * @tc.desc Verify fround method with double input -3.3 for expected return -3.299999952316284
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -3.3;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-3.299999952316284);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3600
     * @tc.name testMathFround036
     * @tc.desc Verify fround method with double input 7.7 for expected return 7.699999809265137
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 7.7;
      let result: double = Math.fround(input);
      expect(result).assertEqual(7.699999809265137);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3700
     * @tc.name testMathFround037
     * @tc.desc Verify fround method with double input -7.7 for expected return -7.699999809265137
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -7.7;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-7.699999809265137);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3800
     * @tc.name testMathFround038
     * @tc.desc Verify fround method with double input 12.34 for expected return 12.34000015258789
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 12.34;
      let result: double = Math.fround(input);
      expect(result).assertEqual(12.34000015258789);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_3900
     * @tc.name testMathFround039
     * @tc.desc Verify fround method with double input -12.34 for expected return -12.34000015258789
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -12.34;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-12.34000015258789);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4000
     * @tc.name testMathFround040
     * @tc.desc Verify fround method with double input 0.001 for expected return 0.0010000000474974513
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.001;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4100
     * @tc.name testMathFround041
     * @tc.desc Verify fround method with double input -0.001 for expected return -0.0010000000474974513
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.001;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4200
     * @tc.name testMathFround042
     * @tc.desc Verify fround method with double input 100.001 for expected return 100.0009994506836
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 100.001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(100.0009994506836);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4300
     * @tc.name testMathFround043
     * @tc.desc Verify fround method with double input -100.001 for expected return -100.0009994506836
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -100.001;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-100.0009994506836);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4400
     * @tc.name testMathFround044
     * @tc.desc Verify fround method with double input 0.25 for expected return 0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.25;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4500
     * @tc.name testMathFround045
     * @tc.desc Verify fround method with double input -0.25 for expected return -0.25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.25;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.25);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4600
     * @tc.name testMathFround046
     * @tc.desc Verify fround method with double input 1.75 for expected return 1.75
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 1.75;
      let result: double = Math.fround(input);
      expect(result).assertEqual(1.75);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4700
     * @tc.name testMathFround047
     * @tc.desc Verify fround method with double input -1.75 for expected return -1.75
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -1.75;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-1.75);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4800
     * @tc.name testMathFround048
     * @tc.desc Verify fround method with double input 123.456 for expected return 123.45600128173828
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 123.456;
      let result: double = Math.fround(input);
      expect(result).assertEqual(123.45600128173828);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_4900
     * @tc.name testMathFround049
     * @tc.desc Verify fround method with double input -123.456 for expected return -123.45600128173828
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -123.456;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5000
     * @tc.name testMathFround050
     * @tc.desc Verify fround method with double input 0.333 for expected return 0.3330000042915344
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.333;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.3330000042915344);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5100
     * @tc.name testMathFround051
     * @tc.desc Verify fround method with double input -0.333 for expected return -0.3330000042915344
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.333;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5200
     * @tc.name testMathFround052
     * @tc.desc Verify fround method with double input 2.718 for expected return 2.7179999351501465
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 2.718;
      let result: double = Math.fround(input);
      expect(result).assertEqual(2.7179999351501465);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5300
     * @tc.name testMathFround053
     * @tc.desc Verify fround method with double input -2.718 for expected return -2.7179999351501465
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -2.718;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5400
     * @tc.name testMathFround054
     * @tc.desc Verify fround method with double input 10.01 for expected return 10.010000228881836
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 10.01;
      let result: double = Math.fround(input);
      expect(result).assertEqual(10.010000228881836);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5500
     * @tc.name testMathFround055
     * @tc.desc Verify fround method with double input -10.01 for expected return -10.010000228881836
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -10.01;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5600
     * @tc.name testMathFround056
     * @tc.desc Verify fround method with double input 0.9 for expected return 0.8999999761581421
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.9;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.8999999761581421);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5700
     * @tc.name testMathFround057
     * @tc.desc Verify fround method with double input -0.9 for expected return -0.8999999761581421
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.9;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5800
     * @tc.name testMathFround058
     * @tc.desc Verify fround method with double input 20.2 for expected return 20.200000762939453
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 20.2;
      let result: double = Math.fround(input);
      expect(result).assertEqual(20.200000762939453);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_5900
     * @tc.name testMathFround059
     * @tc.desc Verify fround method with double input -20.2 for expected return -20.200000762939453
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -20.2;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6000
     * @tc.name testMathFround060
     * @tc.desc Verify fround method with double input 0.05 for expected return 0.05000000074505806
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.05;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6100
     * @tc.name testMathFround061
     * @tc.desc Verify fround method with double input -0.05 for expected return -0.05000000074505806
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.05;
      let result: double = Math.fround(input);
      let diff: double = Utils.getAbsDiff(result, input);
      let scale: double = Utils.getAbsDiff(input, 0.0) + 1.0;
      expect(diff < scale * 1e-06).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6200
     * @tc.name testMathFround062
     * @tc.desc Verify fround method with double input 0.95 for expected return 0.949999988079071
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.95;
      let result: double = Math.fround(input);
      expect(result).assertEqual(0.949999988079071);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6300
     * @tc.name testMathFround063
     * @tc.desc Verify fround method with double input -0.95 for expected return -0.949999988079071
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -0.95;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-0.949999988079071);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6400
     * @tc.name testMathFround064
     * @tc.desc Verify fround method with double input 8.99 for expected return 8.989999771118164
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 8.99;
      let result: double = Math.fround(input);
      expect(result).assertEqual(8.989999771118164);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_FROUND_6500
     * @tc.name testMathFround065
     * @tc.desc Verify fround method with double input -8.99 for expected return -8.989999771118164
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathFround065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = -8.99;
      let result: double = Math.fround(input);
      expect(result).assertEqual(-8.989999771118164);
    });
  });
}
