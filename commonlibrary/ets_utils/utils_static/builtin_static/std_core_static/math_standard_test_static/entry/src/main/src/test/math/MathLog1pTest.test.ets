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


function expectLog1pClose(actual: double, expected: double, tolerance: double): void {
  let diff: double = Utils.getAbsDiff(actual, expected);
  expect(diff < tolerance).assertTrue();
}


export default function mathLog1pTest(): void {
  describe('MathLog1pTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0100
     * @tc.name testMathLog1p001
     * @tc.desc Verify log1p method with double zero input 0.0 for precise zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.log1p(inputValue);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0200
     * @tc.name testMathLog1p002
     * @tc.desc Verify log1p method with float zero input for precise 0.0f return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0300
     * @tc.name testMathLog1p003
     * @tc.desc Verify log1p method with double input 0.0001 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0001;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 0.00009999500033330834, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0400
     * @tc.name testMathLog1p004
     * @tc.desc Verify log1p method with double input 0.01 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.01;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 0.009950330853168083, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0500
     * @tc.name testMathLog1p005
     * @tc.desc Verify log1p method with double input 0.1 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 0.09531017980432487, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0600
     * @tc.name testMathLog1p006
     * @tc.desc Verify log1p method with double input 0.5 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 0.4054651081081644, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0700
     * @tc.name testMathLog1p007
     * @tc.desc Verify log1p method with double input 1.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 0.6931471805599453, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0800
     * @tc.name testMathLog1p008
     * @tc.desc Verify log1p method with double input 2.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 1.0986122886681096, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_0900
     * @tc.name testMathLog1p009
     * @tc.desc Verify log1p method with double input 10.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 2.3978952727983707, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1000
     * @tc.name testMathLog1p010
     * @tc.desc Verify log1p method with double input 100.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 4.61512051684126, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1100
     * @tc.name testMathLog1p011
     * @tc.desc Verify log1p method with double input 1000.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1000.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 6.90875477931522, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1200
     * @tc.name testMathLog1p012
     * @tc.desc Verify log1p method with double input 1.25 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 0.8109302162163288, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1300
     * @tc.name testMathLog1p013
     * @tc.desc Verify log1p method with double input 2.5 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.5;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 1.252762968495368, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1400
     * @tc.name testMathLog1p014
     * @tc.desc Verify log1p method with double input 5.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 1.791759469228055, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1500
     * @tc.name testMathLog1p015
     * @tc.desc Verify log1p method with double input 20.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 20.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 3.044522437723423, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1600
     * @tc.name testMathLog1p016
     * @tc.desc Verify log1p method with double input 80.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 80.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 4.394449154672439, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1700
     * @tc.name testMathLog1p017
     * @tc.desc Verify log1p method with negative double input -0.1 in domain for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.log1p(inputValue);
      expect(result < 0.0).assertTrue();
      expectLog1pClose(result, -0.10536051565782631, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1800
     * @tc.name testMathLog1p018
     * @tc.desc Verify log1p method with negative double input -0.25 in domain for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.25;
      let result: double = Math.log1p(inputValue);
      expect(result < 0.0).assertTrue();
      expectLog1pClose(result, -0.2876820724517809, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_1900
     * @tc.name testMathLog1p019
     * @tc.desc Verify log1p method with negative double input -0.5 in domain for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.log1p(inputValue);
      expect(result < 0.0).assertTrue();
      expectLog1pClose(result, -0.6931471805599453, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2000
     * @tc.name testMathLog1p020
     * @tc.desc Verify log1p method with negative double input -0.75 in domain for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.75;
      let result: double = Math.log1p(inputValue);
      expect(result < 0.0).assertTrue();
      expectLog1pClose(result, -1.3862943611198906, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2100
     * @tc.name testMathLog1p021
     * @tc.desc Verify log1p method with negative double input -0.99 in domain for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.99;
      let result: double = Math.log1p(inputValue);
      expect(result < 0.0).assertTrue();
      expectLog1pClose(result, -4.60517018598809, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2200
     * @tc.name testMathLog1p022
     * @tc.desc Verify log1p method with negative double input -0.0001 in domain for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0001;
      let result: double = Math.log1p(inputValue);
      expect(result < 0.0).assertTrue();
      expectLog1pClose(result, -0.00010000500033335834, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2300
     * @tc.name testMathLog1p023
     * @tc.desc Verify log1p method with float input 0.1 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.1);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 0.09531017980432487, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2400
     * @tc.name testMathLog1p024
     * @tc.desc Verify log1p method with float input 0.5 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.5);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 0.4054651081081644, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2500
     * @tc.name testMathLog1p025
     * @tc.desc Verify log1p method with float input 1.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 0.6931471805599453, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2600
     * @tc.name testMathLog1p026
     * @tc.desc Verify log1p method with float input 2.0 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.0);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 1.0986122886681096, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2700
     * @tc.name testMathLog1p027
     * @tc.desc Verify log1p method with float input -0.1 for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.1);
      let result: float = Math.log1p(inputValue);
      expect(result < 0.0f).assertTrue();
      expectLog1pClose(result, -0.10536051565782631, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2800
     * @tc.name testMathLog1p028
     * @tc.desc Verify log1p method with float input -0.5 for expected finite negative return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.log1p(inputValue);
      expect(result < 0.0f).assertTrue();
      expectLog1pClose(result, -0.6931471805599453, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_2900
     * @tc.name testMathLog1p029
     * @tc.desc Verify log1p method with boundary double input -1.0 for negative infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.log1p(inputValue);
      let negInf: double = -1.0 / 0.0;
      expect(result).assertEqual(negInf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3000
     * @tc.name testMathLog1p030
     * @tc.desc Verify log1p method with invalid double input -1.1 below domain for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.1;
      let result: double = Math.log1p(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3100
     * @tc.name testMathLog1p031
     * @tc.desc Verify log1p method with invalid double input -2.0 below domain for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.log1p(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3200
     * @tc.name testMathLog1p032
     * @tc.desc Verify log1p method with invalid double input -10.0 below domain for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.log1p(inputValue);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3300
     * @tc.name testMathLog1p033
     * @tc.desc Verify log1p method with double NaN input for NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.log1p(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3400
     * @tc.name testMathLog1p034
     * @tc.desc Verify log1p method with float NaN input for NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.log1p(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3500
     * @tc.name testMathLog1p035
     * @tc.desc Verify log1p method with double positive infinity input for positive infinity return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.log1p(infInput);
      expect(result).assertEqual(infInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3600
     * @tc.name testMathLog1p036
     * @tc.desc Verify log1p method with double negative infinity input for NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.log1p(negInfInput);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3700
     * @tc.name testMathLog1p037
     * @tc.desc Verify log1p method with double variable input 0.5 for expected natural log plus one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 0.5;
      let result: double = Math.log1p(input);
      expectLog1pClose(result, 0.4054651081081644, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3800
     * @tc.name testMathLog1p038
     * @tc.desc Verify log1p method with direct Math static literal input 0.5 for expected natural log plus one return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log1p(0.5);
      expectLog1pClose(result, 0.4054651081081644, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3900
     * @tc.name testMathLog1p039
     * @tc.desc Verify log1p method with double input -0.0 for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.log1p(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4000
     * @tc.name testMathLog1p040
     * @tc.desc Verify log1p method with float input -0.0f for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.log1p(inputValue);
      let expected: float = Double.toFloat(-0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });
  });
}
