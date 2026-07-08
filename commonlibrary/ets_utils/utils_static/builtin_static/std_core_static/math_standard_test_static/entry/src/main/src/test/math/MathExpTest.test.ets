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

function expectExpReference(actual: double, expected: double, tolerance: double): void {
  let difference: double = Utils.getAbsDiff(actual, expected);
  expect(difference < tolerance).assertTrue();
}

function expectExpRelativeReference(actual: double, expected: double, tolerance: double): void {
  let relativeDiff: double = Utils.getRelativeDiff(actual, expected);
  expect(relativeDiff < tolerance).assertTrue();
}

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
     * @tc.desc Verify exp method with normal positive double input 0.1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.1;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1.1051709180756477, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0400
     * @tc.name testMathExp004
     * @tc.desc Verify exp method with normal positive double input 0.2 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.2;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1.2214027581601699, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0500
     * @tc.name testMathExp005
     * @tc.desc Verify exp method with normal positive double input 0.5 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.5;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1.6487212707001282, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0600
     * @tc.name testMathExp006
     * @tc.desc Verify exp method with normal positive double input 0.9 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.9;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 2.45960311115695, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0700
     * @tc.name testMathExp007
     * @tc.desc Verify exp method with normal positive double input 1.25 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.25;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 3.4903429574618414, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0800
     * @tc.name testMathExp008
     * @tc.desc Verify exp method with normal positive double input 2.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 7.3890560989306504, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_0900
     * @tc.name testMathExp009
     * @tc.desc Verify exp method with normal positive double input 3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 3.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 20.085536923187668, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1000
     * @tc.name testMathExp010
     * @tc.desc Verify exp method with normal positive double input 5.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 5.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 148.4131591025766, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1100
     * @tc.name testMathExp011
     * @tc.desc Verify exp method with normal positive double input 10.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 22026.465794806718, 1.0e-9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1200
     * @tc.name testMathExp012
     * @tc.desc Verify exp method with normal positive double input 18.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 18.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 65659969.13733051, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1300
     * @tc.name testMathExp013
     * @tc.desc Verify exp method with normal positive double input 21.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 21.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1318815734.4832146, 1.0e-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1400
     * @tc.name testMathExp014
     * @tc.desc Verify exp method with normal positive double input 100.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 100.0;
      let result: double = Math.exp(inputValue);
      expectExpRelativeReference(result, 2.6881171418161356e43, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1500
     * @tc.name testMathExp015
     * @tc.desc Verify exp method with negative double input -0.1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.1;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.9048374180359595, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1600
     * @tc.name testMathExp016
     * @tc.desc Verify exp method with negative double input -0.5 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -0.5;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.6065306597126334, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1700
     * @tc.name testMathExp017
     * @tc.desc Verify exp method with negative double input -1.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.36787944117144233, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1800
     * @tc.name testMathExp018
     * @tc.desc Verify exp method with negative double input -2.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.1353352832366127, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_1900
     * @tc.name testMathExp019
     * @tc.desc Verify exp method with negative double input -3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -3.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.049787068367863944, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2000
     * @tc.name testMathExp020
     * @tc.desc Verify exp method with negative double input -10.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10.0;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 4.5399929762484854e-5, 1.0e-16);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2100
     * @tc.name testMathExp021
     * @tc.desc Verify exp method with normal float input 0.3 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(0.3);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 1.3498588800430298, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2200
     * @tc.name testMathExp022
     * @tc.desc Verify exp method with normal float input 1.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(1.0);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 2.7182817459106445, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2300
     * @tc.name testMathExp023
     * @tc.desc Verify exp method with normal float input 2.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(2.5);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 12.182494163513184, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2400
     * @tc.name testMathExp024
     * @tc.desc Verify exp method with normal float input 10.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10.0);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 22026.46484375, 1.0e-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2500
     * @tc.name testMathExp025
     * @tc.desc Verify exp method with normal float input 100.0 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(100.0);
      let result: float = Math.exp(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2600
     * @tc.name testMathExp026
     * @tc.desc Verify exp method with negative float input -0.5 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-0.5);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 0.6065306663513184, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2700
     * @tc.name testMathExp027
     * @tc.desc Verify exp method with negative float input -1.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-1.0);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 0.3678794503211975, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2800
     * @tc.name testMathExp028
     * @tc.desc Verify exp method with negative float input -3.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-3.0);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 0.049787066876888275, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_2900
     * @tc.name testMathExp029
     * @tc.desc Verify exp method with negative float input -10.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(-10.0);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 4.539993096841499e-5, 1.0e-9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3000
     * @tc.name testMathExp030
     * @tc.desc Verify exp method with normal positive double input 0.15 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.15;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1.161834242728283, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3100
     * @tc.name testMathExp031
     * @tc.desc Verify exp method with normal positive double input 0.55 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.55;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1.7332530178673953, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3200
     * @tc.name testMathExp032
     * @tc.desc Verify exp method with normal positive double input 0.85 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 0.85;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 2.339646851925991, 1.0e-12);
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
     * @tc.desc Verify exp method with large double input 10000000000.0 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 10000000000.0;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_3900
     * @tc.name testMathExp039
     * @tc.desc Verify exp method with large double input -10000000000.0 underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -10000000000.0;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4000
     * @tc.name testMathExp040
     * @tc.desc Verify exp method with large double input 1e+100 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1e+100;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_4100
     * @tc.name testMathExp041
     * @tc.desc Verify exp method with large float input 10000000000.0 returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(10000000000.0);
      let result: float = Math.exp(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
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
     * @tc.desc Verify exp method with Double.NaN input for Double.NaN propagation semantic
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
     * @tc.desc Verify exp method with Float.NaN input for Float.NaN propagation semantic
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
     * @tc.desc Verify exp method with Double.POSITIVE_INFINITY input for Double.POSITIVE_INFINITY return
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
     * @tc.desc Verify exp method with Double.NEGATIVE_INFINITY input for positive zero return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negInfInput: double = -1.0 / 0.0;
      let result: double = Math.exp(negInfInput);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5100
     * @tc.name testMathExp051
     * @tc.desc Verify exp method with Float.POSITIVE_INFINITY input for Float.POSITIVE_INFINITY return
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
     * @tc.desc Verify exp method with Float.NEGATIVE_INFINITY input for positive zero return
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
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5300
     * @tc.name testMathExp053
     * @tc.desc Verify exp method with double variable input 3.0 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: double = 3.0;
      let result: double = Math.exp(input);
      expectExpReference(result, 20.085536923187668, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5400
     * @tc.name testMathExp054
     * @tc.desc Verify exp method with float variable input 5.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: float = Double.toFloat(5.0);
      let result: float = Math.exp(input);
      expectExpReference(result, 148.4131622314453, 1.0e-4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5500
     * @tc.name testMathExp055
     * @tc.desc Verify exp method directly called via Math class name with literal 3.0 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: double = Math.exp(3.0);
      expectExpReference(result, 20.08553695678711, 1.0e-9);
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
     * @tc.desc Verify exp method with double scientific notation input 1.5e1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 1.5e1;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 3269017.3724721107, 1.0e-6);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_5900
     * @tc.name testMathExp059
     * @tc.desc Verify exp method with double scientific notation input 2e-5 returns the near-unit reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = 2e-5;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 1.0000200002000013, 1.0e-12);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6000
     * @tc.name testMathExp060
     * @tc.desc Verify exp method with double scientific notation input -1.5e1 returns the reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -1.5e1;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 3.059023205018258e-7, 1.0e-18);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6100
     * @tc.name testMathExp061
     * @tc.desc Verify exp method with double scientific notation input -2e-5 returns the near-unit reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -2e-5;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.9999800001999987, 1.0e-12);
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
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6300
     * @tc.name testMathExp063
     * @tc.desc Verify exp method with widened byte zero input returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(0);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6400
     * @tc.name testMathExp064
     * @tc.desc Verify exp method with widened byte normal input 12 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(12);
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 162754.796875, 1.0e-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6500
     * @tc.name testMathExp065
     * @tc.desc Verify exp method with widened byte negative one input returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-1);
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 0.3678794503211975, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6600
     * @tc.name testMathExp066
     * @tc.desc Verify exp method with widened byte maximum boundary 127 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(127);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6700
     * @tc.name testMathExp067
     * @tc.desc Verify exp method with widened byte minimum boundary -128 underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(-128);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6800
     * @tc.name testMathExp068
     * @tc.desc Verify exp method with byte overflow conversion input 128 follows the wrapped byte value and underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: byte = Int.toByte(128);
      let result: double = Math.exp(inputValue);
      expect(inputValue).assertEqual(Int.toByte(-128));
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_6900
     * @tc.name testMathExp069
     * @tc.desc Verify exp method with widened short zero input returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(0);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7000
     * @tc.name testMathExp070
     * @tc.desc Verify exp method with widened short normal input 2048 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(2048);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7100
     * @tc.name testMathExp071
     * @tc.desc Verify exp method with widened short maximum boundary 32767 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32767);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7200
     * @tc.name testMathExp072
     * @tc.desc Verify exp method with widened short minimum boundary -32768 underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(-32768);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7300
     * @tc.name testMathExp073
     * @tc.desc Verify exp method with short mapped value 65535 follows the wrapped short float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(65535);
      let result: double = Math.exp(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-1));
      expectExpReference(result, 0.3678794503211975, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7400
     * @tc.name testMathExp074
     * @tc.desc Verify exp method with short overflow conversion input 32768 follows the wrapped short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = Int.toShort(32768);
      let result: double = Math.exp(inputValue);
      expect(inputValue).assertEqual(Int.toShort(-32768));
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7500
     * @tc.name testMathExp075
     * @tc.desc Verify exp method with hexadecimal int input 0x1234 returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0x1234;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7600
     * @tc.name testMathExp076
     * @tc.desc Verify exp method with binary int input 0b1010 returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = 0b1010;
      let result: double = Math.exp(inputValue);
      expectExpReference(result, 22026.46484375, 1.0e-3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7700
     * @tc.name testMathExp077
     * @tc.desc Verify exp method with Int.MAX_VALUE minus one returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: int = Int.MAX_VALUE - 1;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7800
     * @tc.name testMathExp078
     * @tc.desc Verify exp method with int overflow from Int.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: int = Int.MAX_VALUE;
      let inputValue: int = maxValue + 1;
      let result: double = Math.exp(inputValue);
      expect(inputValue).assertEqual(Int.MIN_VALUE);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_7900
     * @tc.name testMathExp079
     * @tc.desc Verify exp method with widened long positive value outside int range returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(10000000000);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8000
     * @tc.name testMathExp080
     * @tc.desc Verify exp method with widened long zero input returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Int.toLong(0);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(1.0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8100
     * @tc.name testMathExp081
     * @tc.desc Verify exp method with widened long negative value outside int range underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.toLong(-10000000000);
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8200
     * @tc.name testMathExp082
     * @tc.desc Verify exp method with widened Long.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MAX_VALUE;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8300
     * @tc.name testMathExp083
     * @tc.desc Verify exp method with widened Long.MIN_VALUE boundary underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: long = Long.MIN_VALUE;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8400
     * @tc.name testMathExp084
     * @tc.desc Verify exp method with long overflow from Long.MAX_VALUE plus one follows the wrapped minimum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue: long = Long.MAX_VALUE;
      let inputValue: long = maxValue + Int.toLong(1);
      let result: double = Math.exp(inputValue);
      expect(inputValue).assertEqual(Long.MIN_VALUE);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8500
     * @tc.name testMathExp085
     * @tc.desc Verify exp method with float normal input 3.14f returns the float-rounded reference value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Double.toFloat(3.14);
      let result: float = Math.exp(inputValue);
      expectExpReference(result, 23.10386848449707, 1.0e-5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8600
     * @tc.name testMathExp086
     * @tc.desc Verify exp method with Float.MAX_VALUE boundary returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MAX_VALUE;
      let result: float = Math.exp(inputValue);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8700
     * @tc.name testMathExp087
     * @tc.desc Verify exp method with negative Float.MAX_VALUE boundary underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MAX_VALUE;
      let result: float = Math.exp(inputValue);
      let expected: float = Double.toFloat(0.0);
      expect(result).assertEqual(expected);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8800
     * @tc.name testMathExp088
     * @tc.desc Verify exp method with Float.MIN_VALUE boundary returns exact float one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = Float.MIN_VALUE;
      let result: float = Math.exp(inputValue);
      expect(result).assertEqual(Double.toFloat(1.0));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_8900
     * @tc.name testMathExp089
     * @tc.desc Verify exp method with negative Float.MIN_VALUE boundary returns exact float one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: float = -Float.MIN_VALUE;
      let result: float = Math.exp(inputValue);
      expect(result).assertEqual(Double.toFloat(1.0));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_9000
     * @tc.name testMathExp090
     * @tc.desc Verify exp method with Double.MAX_VALUE boundary returns Double.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MAX_VALUE;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_9100
     * @tc.name testMathExp091
     * @tc.desc Verify exp method with negative Double.MAX_VALUE boundary underflows to positive zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = -Double.MAX_VALUE;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(0.0);
      expect(Utils.isPositiveZero(result)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MATH_EXP_9200
     * @tc.name testMathExp092
     * @tc.desc Verify exp method with Double.MIN_VALUE boundary returns exact one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testMathExp092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: double = Double.MIN_VALUE;
      let result: double = Math.exp(inputValue);
      expect(result).assertEqual(1.0);
    });
  });
}
