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

function expectExpm1Reference(actual: double, expected: double, tolerance: double): void {
  let difference: double = Utils.getAbsDiff(actual, expected);
  expect(difference < tolerance).assertTrue();
}

function expectExpm1RelativeReference(actual: double, expected: double, tolerance: double): void {
  let relativeDiff: double = Utils.getRelativeDiff(actual, expected);
  expect(relativeDiff < tolerance).assertTrue();
}

export default function mathExpm1Test(): void {
  describe('MathExpm1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0100
     * @tc.name testMathExpm1001
     * @tc.desc Verify expm1 method with exact zero double input 0.0 for precise zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.0;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0200
     * @tc.name testMathExpm1002
     * @tc.desc Verify expm1 method with float zero input via Double.toFloat(0.0) for precise float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.0);
      let result: float = Math.expm1(inputValue);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0300
     * @tc.name testMathExpm1003
     * @tc.desc Verify expm1 method with normal positive double input 0.1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.10517091807564763, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0400
     * @tc.name testMathExpm1004
     * @tc.desc Verify expm1 method with normal positive double input 0.2 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.2;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.22140275816016985, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0500
     * @tc.name testMathExpm1005
     * @tc.desc Verify expm1 method with normal positive double input 0.5 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.6487212707001282, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0600
     * @tc.name testMathExpm1006
     * @tc.desc Verify expm1 method with normal positive double input 0.9 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.9;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 1.4596031111569499, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0700
     * @tc.name testMathExpm1007
     * @tc.desc Verify expm1 method with normal positive double input 1.25 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 2.4903429574618414, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0800
     * @tc.name testMathExpm1008
     * @tc.desc Verify expm1 method with normal positive double input 2.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 6.38905609893065, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_0900
     * @tc.name testMathExpm1009
     * @tc.desc Verify expm1 method with normal positive double input 3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 19.085536923187668, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1000
     * @tc.name testMathExpm1010
     * @tc.desc Verify expm1 method with normal positive double input 5.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 147.4131591025766, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1100
     * @tc.name testMathExpm1011
     * @tc.desc Verify expm1 method with normal positive double input 10.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 22025.465794806718, 1.0e-9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1200
     * @tc.name testMathExpm1012
     * @tc.desc Verify expm1 method with normal positive double input 18.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 18.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 65659968.13733051, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1300
     * @tc.name testMathExpm1013
     * @tc.desc Verify expm1 method with normal positive double input 21.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 21.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 1318815733.4832146, 1.0e-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1400
     * @tc.name testMathExpm1014
     * @tc.desc Verify expm1 method with normal positive double input 100.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1RelativeReference(result, 2.6881171418161356e43, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1500
     * @tc.name testMathExpm1015
     * @tc.desc Verify expm1 method with negative double input -0.1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.09516258196404043, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1600
     * @tc.name testMathExpm1016
     * @tc.desc Verify expm1 method with negative double input -0.5 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.3934693402873666, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1700
     * @tc.name testMathExpm1017
     * @tc.desc Verify expm1 method with negative double input -1.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.6321205588285577, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1800
     * @tc.name testMathExpm1018
     * @tc.desc Verify expm1 method with negative double input -2.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.8646647167633873, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_1900
     * @tc.name testMathExpm1019
     * @tc.desc Verify expm1 method with negative double input -3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -3.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.950212931632136, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2000
     * @tc.name testMathExpm1020
     * @tc.desc Verify expm1 method with negative double input -10.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.9999546000702375, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2100
     * @tc.name testMathExpm1021
     * @tc.desc Verify expm1 method with normal float input 0.3 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.349858820438385, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2200
     * @tc.name testMathExpm1022
     * @tc.desc Verify expm1 method with normal float input 1.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, 1.718281865119934, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2300
     * @tc.name testMathExpm1023
     * @tc.desc Verify expm1 method with normal float input 2.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, 11.182494163513184, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2400
     * @tc.name testMathExpm1024
     * @tc.desc Verify expm1 method with normal float input 10.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, 22025.46484375, 1.0e-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2500
     * @tc.name testMathExpm1025
     * @tc.desc Verify expm1 method with normal float input 100.0 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(100.0);
      let result: float = Math.expm1(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2600
     * @tc.name testMathExpm1026
     * @tc.desc Verify expm1 method with negative float input -0.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.39346933364868164, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2700
     * @tc.name testMathExpm1027
     * @tc.desc Verify expm1 method with negative float input -1.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.6321205496788025, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2800
     * @tc.name testMathExpm1028
     * @tc.desc Verify expm1 method with negative float input -3.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-3.0);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.9502129554748535, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_2900
     * @tc.name testMathExpm1029
     * @tc.desc Verify expm1 method with negative float input -10.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-10.0);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.9999545812606812, 1.0e-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3000
     * @tc.name testMathExpm1030
     * @tc.desc Verify expm1 method with normal positive double input 0.15 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.15;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.16183424272828312, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3100
     * @tc.name testMathExpm1031
     * @tc.desc Verify expm1 method with normal positive double input 0.55 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.55;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.7332530178673953, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3200
     * @tc.name testMathExpm1032
     * @tc.desc Verify expm1 method with normal positive double input 0.85 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.85;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 1.3396468519259908, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3300
     * @tc.name testMathExpm1033
     * @tc.desc Verify expm1 method with tiny double input 1e-10 returns the high-precision reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-10;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 1.00000000005e-10, 1.0e-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3400
     * @tc.name testMathExpm1034
     * @tc.desc Verify expm1 method with tiny double input -1e-10 returns the high-precision reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1e-10;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -9.999999999500001e-11, 1.0e-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3500
     * @tc.name testMathExpm1035
     * @tc.desc Verify expm1 method with tiny double input 1e-20 returns the high-precision reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e-20;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 1.0e-20, 1.0e-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3600
     * @tc.name testMathExpm1036
     * @tc.desc Verify expm1 method with tiny float input 1e-05 returns the float-rounded near-zero reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1e-05);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.000010000049769587349, 1.0e-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3700
     * @tc.name testMathExpm1037
     * @tc.desc Verify expm1 method with tiny float input -1e-05 returns the float-rounded near-zero reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1e-05);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.000009999949725170154, 1.0e-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3800
     * @tc.name testMathExpm1038
     * @tc.desc Verify expm1 method with large double input 10000000000.0 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10000000000.0;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_3900
     * @tc.name testMathExpm1039
     * @tc.desc Verify expm1 method with large double input -10000000000.0 returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10000000000.0;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4000
     * @tc.name testMathExpm1040
     * @tc.desc Verify expm1 method with double input 0.3 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.3;
      let result: double = Math.expm1(inputValue);
      let expected: double = 0.3498588075760031;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4100
     * @tc.name testMathExpm1041
     * @tc.desc Verify expm1 method with double input 1.25 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.expm1(inputValue);
      let expected: double = 2.4903429574618414;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4200
     * @tc.name testMathExpm1042
     * @tc.desc Verify expm1 method with double input 6.0 for approximate expected value within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 6.0;
      let result: double = Math.expm1(inputValue);
      let expected: double = 402.4287934927351;
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-12).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4300
     * @tc.name testMathExpm1043
     * @tc.desc Verify expm1 method with float input 0.3 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.expm1(inputValue);
      let expected: float = Double.toFloat(0.3498588075760031);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4400
     * @tc.name testMathExpm1044
     * @tc.desc Verify expm1 method with float input 2.5 for approximate expected value within float tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.expm1(inputValue);
      let expected: float = Double.toFloat(11.182493960703473);
      let diff: double = Utils.getAbsDiff(result, expected);
      expect(diff < 1.0e-5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4500
     * @tc.name testMathExpm1045
     * @tc.desc Verify expm1 method with Double.NaN input for Double.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanInput: double = 0.0 / 0.0;
      let result: double = Math.expm1(nanInput);
      let isNaNResult: boolean = Utils.isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4600
     * @tc.name testMathExpm1046
     * @tc.desc Verify expm1 method with Float.NaN input for Float.NaN propagation semantic
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fZero: float = Double.toFloat(0.0);
      let nanInput: float = fZero / fZero;
      let result: float = Math.expm1(nanInput);
      let isNaNResult: boolean = Utils.isNaNFloat(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4700
     * @tc.name testMathExpm1047
     * @tc.desc Verify expm1 method with Double.POSITIVE_INFINITY input for Double.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infInput: double = 1.0 / 0.0;
      let result: double = Math.expm1(infInput);
      expect(result).assertEqual(infInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4800
     * @tc.name testMathExpm1048
     * @tc.desc Verify expm1 method with Double.NEGATIVE_INFINITY input for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.expm1(negInfInput);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_4900
     * @tc.name testMathExpm1049
     * @tc.desc Verify expm1 method with Float.POSITIVE_INFINITY input for Float.POSITIVE_INFINITY return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let infInput: float = fOne / fZero;
      let result: float = Math.expm1(infInput);
      expect(result).assertEqual(infInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5000
     * @tc.name testMathExpm1050
     * @tc.desc Verify expm1 method with Float.NEGATIVE_INFINITY input for negative one return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fOne: float = Double.toFloat(1.0);
      let fZero: float = Double.toFloat(0.0);
      let negInfInput: float = -fOne / fZero;
      let result: float = Math.expm1(negInfInput);
      let expected: float = Double.toFloat(-1.0);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5100
     * @tc.name testMathExpm1051
     * @tc.desc Verify expm1 method with double variable input 3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.expm1(input);
      expectExpm1Reference(result, 19.085536923187668, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5200
     * @tc.name testMathExpm1052
     * @tc.desc Verify expm1 method with float variable input 5.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.expm1(input);
      expectExpm1Reference(result, 147.4131622314453, 1.0e-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5300
     * @tc.name testMathExpm1053
     * @tc.desc Verify expm1 method with double negative zero input -0.0 preserves negative zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.0;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-0.0);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5400
     * @tc.name testMathExpm1054
     * @tc.desc Verify expm1 method with float negative zero input preserves negative float zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.0);
      let result: float = Math.expm1(inputValue);
      let expected: float = Double.toFloat(-0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isNegativeZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5500
     * @tc.name testMathExpm1055
     * @tc.desc Verify expm1 method with double scientific notation input 1.5e1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5e1;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 3269016.3724721107, 1.0e-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5600
     * @tc.name testMathExpm1056
     * @tc.desc Verify expm1 method with double scientific notation input 2e-5 returns the near-zero reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2e-5;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 0.00002000020000133334, 1.0e-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5700
     * @tc.name testMathExpm1057
     * @tc.desc Verify expm1 method with double scientific notation input -1.5e1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.5e1;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.9999996940976795, 1.0e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5800
     * @tc.name testMathExpm1058
     * @tc.desc Verify expm1 method with double scientific notation input -2e-5 returns the near-zero reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2e-5;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.00001999980000133333, 1.0e-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_5900
     * @tc.name testMathExpm1059
     * @tc.desc Verify expm1 method with widened byte zero input returns exact zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6000
     * @tc.name testMathExpm1060
     * @tc.desc Verify expm1 method with widened byte normal input 12 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 162753.796875, 1.0e-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6100
     * @tc.name testMathExpm1061
     * @tc.desc Verify expm1 method with widened byte negative one input returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, -0.6321205496788025, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6200
     * @tc.name testMathExpm1062
     * @tc.desc Verify expm1 method with widened byte maximum boundary 127 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6300
     * @tc.name testMathExpm1063
     * @tc.desc Verify expm1 method with widened byte minimum boundary -128 returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6400
     * @tc.name testMathExpm1064
     * @tc.desc Verify expm1 method with byte overflow conversion input 128 follows the wrapped byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.expm1(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6500
     * @tc.name testMathExpm1065
     * @tc.desc Verify expm1 method with widened short zero input returns exact zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6600
     * @tc.name testMathExpm1066
     * @tc.desc Verify expm1 method with widened short normal input 2048 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6700
     * @tc.name testMathExpm1067
     * @tc.desc Verify expm1 method with widened short maximum boundary 32767 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6800
     * @tc.name testMathExpm1068
     * @tc.desc Verify expm1 method with widened short minimum boundary -32768 returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_6900
     * @tc.name testMathExpm1069
     * @tc.desc Verify expm1 method with short mapped value 65535 follows the wrapped short float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.expm1(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expectExpm1Reference(result, -0.6321205496788025, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7000
     * @tc.name testMathExpm1070
     * @tc.desc Verify expm1 method with short overflow conversion input 32768 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.expm1(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7100
     * @tc.name testMathExpm1071
     * @tc.desc Verify expm1 method with hexadecimal int input 0x1234 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7200
     * @tc.name testMathExpm1072
     * @tc.desc Verify expm1 method with binary int input 0b1010 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.expm1(inputValue);
      expectExpm1Reference(result, 22025.46484375, 1.0e-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7300
     * @tc.name testMathExpm1073
     * @tc.desc Verify expm1 method with Int.MAX_VALUE minus one returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7400
     * @tc.name testMathExpm1074
     * @tc.desc Verify expm1 method with int overflow from Int.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let inputValue: int = maxValue + 1;
      let result: double = Math.expm1(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7500
     * @tc.name testMathExpm1075
     * @tc.desc Verify expm1 method with widened long positive value outside int range returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7600
     * @tc.name testMathExpm1076
     * @tc.desc Verify expm1 method with widened long zero input returns exact zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7700
     * @tc.name testMathExpm1077
     * @tc.desc Verify expm1 method with widened long negative value outside int range returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(-10000000000);
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7800
     * @tc.name testMathExpm1078
     * @tc.desc Verify expm1 method with widened Long.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_7900
     * @tc.name testMathExpm1079
     * @tc.desc Verify expm1 method with widened Long.MIN_VALUE boundary returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8000
     * @tc.name testMathExpm1080
     * @tc.desc Verify expm1 method with long overflow from Long.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: long = Long.MAX_VALUE;
      let inputValue: long = maxValue + Int.toLong(1);
      let result: double = Math.expm1(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8100
     * @tc.name testMathExpm1081
     * @tc.desc Verify expm1 method with float normal input 3.14f returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: float = Math.expm1(inputValue);
      expectExpm1Reference(result, 22.10386848449707, 1.0e-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8200
     * @tc.name testMathExpm1082
     * @tc.desc Verify expm1 method with Float.MAX_VALUE boundary returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.expm1(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8300
     * @tc.name testMathExpm1083
     * @tc.desc Verify expm1 method with negative Float.MAX_VALUE boundary returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: float = Math.expm1(inputValue);
      expect(result).assertEqual(Double.toFloat(-1.0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8400
     * @tc.name testMathExpm1084
     * @tc.desc Verify expm1 method with Float.MIN_VALUE boundary preserves minimum float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.expm1(inputValue);
      expect(result).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8500
     * @tc.name testMathExpm1085
     * @tc.desc Verify expm1 method with negative Float.MIN_VALUE boundary preserves negative minimum float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: float = Math.expm1(inputValue);
      expect(result).assertEqual(-Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8600
     * @tc.name testMathExpm1086
     * @tc.desc Verify expm1 method with Double.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8700
     * @tc.name testMathExpm1087
     * @tc.desc Verify expm1 method with negative Double.MAX_VALUE boundary returns negative one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8800
     * @tc.name testMathExpm1088
     * @tc.desc Verify expm1 method with Double.MIN_VALUE boundary preserves minimum double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXPM1_8900
     * @tc.name testMathExpm1089
     * @tc.desc Verify expm1 method with negative Double.MIN_VALUE boundary preserves negative minimum double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExpm1089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MIN_VALUE;
      let result: double = Math.expm1(inputValue);
      expect(result).assertEqual(-Double.MIN_VALUE);
    });
  });
}
