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
} from '@ohos/hypium-binary/src/main/indexStatic';
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
     * @tc.desc Verify log1p method with boundary double input -1.0 for Double.NEGATIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.log1p(inputValue);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3000
     * @tc.name testMathLog1p030
     * @tc.desc Verify log1p method with invalid double input -1.1 below domain for Double.NaN return
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
     * @tc.desc Verify log1p method with invalid double input -2.0 below domain for Double.NaN return
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
     * @tc.desc Verify log1p method with invalid double input -10.0 below domain for Double.NaN return
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
     * @tc.desc Verify log1p method with Double.NaN input for Double.NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = Double.NaN;
      let result: double = Math.log1p(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3400
     * @tc.name testMathLog1p034
     * @tc.desc Verify log1p method with Float.NaN input for Float.NaN propagation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: float = Float.NaN;
      let result: float = Math.log1p(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3500
     * @tc.name testMathLog1p035
     * @tc.desc Verify log1p method with Double.POSITIVE_INFINITY input for Double.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = Double.POSITIVE_INFINITY;
      let result: double = Math.log1p(infInput);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3600
     * @tc.name testMathLog1p036
     * @tc.desc Verify log1p method with Double.NEGATIVE_INFINITY input for Double.NaN return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = Double.NEGATIVE_INFINITY;
      let result: double = Math.log1p(negInfInput);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3700
     * @tc.name testMathLog1p037
     * @tc.desc Verify log1p method with direct Math static literal input 0.5 for expected natural log plus one return within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.log1p(0.5);
      expectLog1pClose(result, 0.4054651081081644, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3800
     * @tc.name testMathLog1p038
     * @tc.desc Verify log1p method with double input -0.0 for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.log1p(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_3900
     * @tc.name testMathLog1p039
     * @tc.desc Verify log1p method with float input -0.0f for exact negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.log1p(inputValue);
      let expected: float = Double.toFloat(-0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4000
     * @tc.name testMathLog1p040
     * @tc.desc Verify log1p method accepts a byte zero source value and returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4100
     * @tc.name testMathLog1p041
     * @tc.desc Verify log1p method accepts a normal positive byte source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 2.5649493574615367, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4200
     * @tc.name testMathLog1p042
     * @tc.desc Verify log1p method accepts the byte maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 4.852030263919617, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4300
     * @tc.name testMathLog1p043
     * @tc.desc Verify log1p method accepts a byte negative one boundary source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4400
     * @tc.name testMathLog1p044
     * @tc.desc Verify log1p method accepts the byte minimum boundary source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: float = Math.log1p(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4500
     * @tc.name testMathLog1p045
     * @tc.desc Verify log1p method accepts a byte overflow-mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4600
     * @tc.name testMathLog1p046
     * @tc.desc Verify log1p method accepts a byte underflow-mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-129);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Int.toByte(127));
      expectLog1pClose(result, 4.852030263919617, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4700
     * @tc.name testMathLog1p047
     * @tc.desc Verify log1p method accepts a short zero source value and returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4800
     * @tc.name testMathLog1p048
     * @tc.desc Verify log1p method accepts a normal positive short source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 7.6251071482389, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_4900
     * @tc.name testMathLog1p049
     * @tc.desc Verify log1p method accepts the short maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 10.39720770839918, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5000
     * @tc.name testMathLog1p050
     * @tc.desc Verify log1p method accepts a short negative one boundary source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-1);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5100
     * @tc.name testMathLog1p051
     * @tc.desc Verify log1p method accepts the short minimum boundary source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: float = Math.log1p(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5200
     * @tc.name testMathLog1p052
     * @tc.desc Verify log1p method accepts a short upper-limit mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5300
     * @tc.name testMathLog1p053
     * @tc.desc Verify log1p method accepts a short lower-limit mapped source value after explicit conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32769);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Int.toShort(32767));
      expectLog1pClose(result, 10.39720770839918, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5400
     * @tc.name testMathLog1p054
     * @tc.desc Verify log1p method accepts an int zero source value and returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0;
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5500
     * @tc.name testMathLog1p055
     * @tc.desc Verify log1p method accepts an int large positive source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 1000000;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 13.815511557963774, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5600
     * @tc.name testMathLog1p056
     * @tc.desc Verify log1p method accepts an int hexadecimal source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 8.446985296372741, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5700
     * @tc.name testMathLog1p057
     * @tc.desc Verify log1p method accepts an int binary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 2.3978952727983707, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5800
     * @tc.name testMathLog1p058
     * @tc.desc Verify log1p method accepts an int octal source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0o123;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 4.430816798843313, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_5900
     * @tc.name testMathLog1p059
     * @tc.desc Verify log1p method accepts the int maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 21.487562597358306, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6000
     * @tc.name testMathLog1p060
     * @tc.desc Verify log1p method accepts the int minimum boundary source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MIN_VALUE;
      let result: float = Math.log1p(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6100
     * @tc.name testMathLog1p061
     * @tc.desc Verify log1p method accepts an int overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: int = Int.MAX_VALUE;
      let inputValue: int = maximumValue + 1;
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6200
     * @tc.name testMathLog1p062
     * @tc.desc Verify log1p method accepts an int underflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: int = Int.MIN_VALUE;
      let inputValue: int = minimumValue - 1;
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Int.MAX_VALUE);
      expectLog1pClose(result, 21.487562597358306, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6300
     * @tc.name testMathLog1p063
     * @tc.desc Verify log1p method accepts a long zero source value and returns positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6400
     * @tc.name testMathLog1p064
     * @tc.desc Verify log1p method accepts a positive long large source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 23.025850930040455, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6500
     * @tc.name testMathLog1p065
     * @tc.desc Verify log1p method accepts a long negative one boundary source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(-1);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6600
     * @tc.name testMathLog1p066
     * @tc.desc Verify log1p method accepts Long.MIN_VALUE source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: float = Math.log1p(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6700
     * @tc.name testMathLog1p067
     * @tc.desc Verify log1p method accepts the long maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 43.66827237527655, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6800
     * @tc.name testMathLog1p068
     * @tc.desc Verify log1p method accepts a long overflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maximumValue: long = Long.MAX_VALUE;
      let inputValue: long = maximumValue + Int.toLong(1);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_6900
     * @tc.name testMathLog1p069
     * @tc.desc Verify log1p method accepts a long underflow-mapped source value after arithmetic conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minimumValue: long = Long.MIN_VALUE;
      let inputValue: long = minimumValue - Int.toLong(1);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Long.MAX_VALUE);
      expectLog1pClose(result, 43.66827237527655, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7000
     * @tc.name testMathLog1p070
     * @tc.desc Verify log1p method accepts the float maximum boundary source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 88.72283905206835, 1.0e-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7100
     * @tc.name testMathLog1p071
     * @tc.desc Verify log1p method accepts the float minimum positive boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7200
     * @tc.name testMathLog1p072
     * @tc.desc Verify log1p method accepts direct Float.POSITIVE_INFINITY input and returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.POSITIVE_INFINITY;
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7300
     * @tc.name testMathLog1p073
     * @tc.desc Verify log1p method accepts direct Float.NEGATIVE_INFINITY input and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.NEGATIVE_INFINITY;
      let result: float = Math.log1p(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7400
     * @tc.name testMathLog1p074
     * @tc.desc Verify log1p method accepts a float negative one boundary source value and returns Float.NEGATIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.log1p(inputValue);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7500
     * @tc.name testMathLog1p075
     * @tc.desc Verify log1p method accepts a float below-domain source value and returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.001);
      let result: float = Math.log1p(inputValue);
      expect(Utils.isNaNFloat(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7600
     * @tc.name testMathLog1p076
     * @tc.desc Verify log1p method accepts a float scientific notation source value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0e3);
      let result: float = Math.log1p(inputValue);
      expectLog1pClose(result, 6.90875477931522, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7700
     * @tc.name testMathLog1p077
     * @tc.desc Verify log1p method accepts a float overflowed source value as Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MAX_VALUE * 10.0);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7800
     * @tc.name testMathLog1p078
     * @tc.desc Verify log1p method accepts a float underflowed source value as positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(Float.MIN_VALUE / 10.0);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(0.0));
      expect(result).assertEqual(Double.toFloat(0.0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_7900
     * @tc.name testMathLog1p079
     * @tc.desc Verify log1p method accepts a float negative underflowed source value as negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-Float.MIN_VALUE / 10.0);
      let result: float = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Double.toFloat(-0.0));
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8000
     * @tc.name testMathLog1p080
     * @tc.desc Verify log1p method accepts a positive double fractional source value within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 999999.99;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 13.815511547963784, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8100
     * @tc.name testMathLog1p081
     * @tc.desc Verify log1p method accepts a negative double below-domain source value and returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -888.88;
      let result: double = Math.log1p(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8200
     * @tc.name testMathLog1p082
     * @tc.desc Verify log1p method accepts the Double.MAX_VALUE boundary source value within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 709.782712893384, 1.0e-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8300
     * @tc.name testMathLog1p083
     * @tc.desc Verify log1p method accepts the Double.MIN_VALUE boundary source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.log1p(inputValue);
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8400
     * @tc.name testMathLog1p084
     * @tc.desc Verify log1p method accepts negative Double.MIN_VALUE and preserves the tiny negative result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.log1p(inputValue);
      expect(result).assertEqual(-Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8500
     * @tc.name testMathLog1p085
     * @tc.desc Verify log1p method accepts a double overflowed source expression as Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE * 2.0;
      let result: double = Math.log1p(inputValue);
      expect(inputValue).assertEqual(Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8600
     * @tc.name testMathLog1p086
     * @tc.desc Verify log1p method accepts a double underflowed source expression as positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE / 2.0;
      let result: double = Math.log1p(inputValue);
      expect(inputValue).assertEqual(0.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8700
     * @tc.name testMathLog1p087
     * @tc.desc Verify log1p method accepts a double negative underflowed source expression as negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE / 2.0;
      let result: double = Math.log1p(inputValue);
      expect(inputValue).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8800
     * @tc.name testMathLog1p088
     * @tc.desc Verify log1p method accepts a double value close to the lower domain boundary from above
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.9999999999999999;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, -36.7368005696771, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_8900
     * @tc.name testMathLog1p089
     * @tc.desc Verify log1p method accepts a double value just below the lower domain boundary and returns Double.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0000000000000002;
      let result: double = Math.log1p(inputValue);
      expect(Utils.isNaNValue(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_9000
     * @tc.name testMathLog1p090
     * @tc.desc Verify log1p method accepts the double safe-integer precision boundary within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 9007199254740991.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 36.7368005696771, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_9100
     * @tc.name testMathLog1p091
     * @tc.desc Verify log1p method accepts a double scientific notation source value within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.0e6;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 13.815511557963774, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_9200
     * @tc.name testMathLog1p092
     * @tc.desc Verify log1p method accepts Math.E minus one expression and returns one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.E - 1.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 1.0, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_9300
     * @tc.name testMathLog1p093
     * @tc.desc Verify log1p method accepts Math.E squared minus one expression and returns two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Math.pow(Math.E, 2.0) - 1.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 2.0, 1.0e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_LOG1P_9400
     * @tc.name testMathLog1p094
     * @tc.desc Verify log1p method accepts Double.MAX_VALUE divided expression within double tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathLog1p094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE / 10.0;
      let result: double = Math.log1p(inputValue);
      expectLog1pClose(result, 707.4801278003899, 1.0e-10);
    });
  });
}
