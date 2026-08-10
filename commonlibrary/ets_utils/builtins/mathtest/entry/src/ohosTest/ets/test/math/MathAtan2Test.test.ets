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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  observeMathAtan2NullXConversion,
  observeMathAtan2NullYConversion,
  observeMathAtan2StringConversion,
  observeMathAtan2StringZeroConversion
} from './MathAtan2';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathAtan2WithUnion(first: number | string, second: number | string): number {
  const firstValue: number = typeof first === 'number' ? first : Number(first);
  const secondValue: number = typeof second === 'number' ? second : Number(second);
  return Math.atan2(firstValue, secondValue);
}

export default function mathAtan2Test(): void {
  describe('MathAtan2Test', (): void => {
    /**
     * @tc.name testMathAtan2001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0100
     * @tc.desc Verify point on the positive X axis returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(0, 1);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0200
     * @tc.desc Verify point on the negative X axis returns PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(0, -1);
      const isApproxResult: boolean = isApprox(result, Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0300
     * @tc.desc Verify negative zero on the positive X axis returns negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-0, 1);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0400
     * @tc.desc Verify first quadrant point returns PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(1, 1);
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0500
     * @tc.desc Verify third quadrant point returns negative three PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-1, -1);
      const isApproxResult: boolean = isApprox(result, -3 * Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0600
     * @tc.desc Verify NaN coordinate produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(NaN, 1);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0700
     * @tc.desc Verify number union members reach the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAtan2WithUnion(1, 1);
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0800
     * @tc.desc Verify string union members are normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAtan2WithUnion('1', '1');
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_0900
     * @tc.desc Verify member-local JavaScript string operands undergo numeric coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtan2StringConversion();
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1000
     * @tc.desc Verify second quadrant point returns three PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(1, -1);
      const isApproxResult: boolean = isApprox(result, 3 * Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1100
     * @tc.desc Verify fourth quadrant point returns negative PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-1, 1);
      const isApproxResult: boolean = isApprox(result, -Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1200
     * @tc.desc Verify positive Y axis returns PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(1, 0);
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2013
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1300
     * @tc.desc Verify negative Y axis returns negative PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-1, 0);
      const isApproxResult: boolean = isApprox(result, -Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2014
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1400
     * @tc.desc Verify positive zero origin returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(0, 0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2015
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1500
     * @tc.desc Verify negative zero on the negative X axis returns negative PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-0, -1);
      const isApproxResult: boolean = isApprox(result, -Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2016
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1600
     * @tc.desc Verify two positive Infinity coordinates return PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(Infinity, Infinity);
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2017
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1700
     * @tc.desc Verify positive Infinity Y and negative Infinity X return three PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(Infinity, -Infinity);
      const isApproxResult: boolean = isApprox(result, 3 * Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2018
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1800
     * @tc.desc Verify two negative Infinity coordinates return negative three PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-Infinity, -Infinity);
      const isApproxResult: boolean = isApprox(result, -3 * Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2019
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_1900
     * @tc.desc Verify negative Infinity Y and positive Infinity X return negative PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-Infinity, Infinity);
      const isApproxResult: boolean = isApprox(result, -Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2020
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2000
     * @tc.desc Verify complementary X coordinates produce angles summing to PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.atan2(1, 2);
      const second: number = Math.atan2(1, -2);
      const isApproxResult: boolean = isApprox(first + second, Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2021
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2100
     * @tc.desc Verify positive zero Y and negative zero X return positive PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(+0, -0);
      const isApproxResult: boolean = isApprox(result, Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2022
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2200
     * @tc.desc Verify negative zero Y and negative zero X return negative PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-0, -0);
      const isApproxResult: boolean = isApprox(result, -Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2023
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2300
     * @tc.desc Verify negative zero Y and positive zero X return negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan2(-0, +0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2024
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2400
     * @tc.desc Verify null in the Y position converts to positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtan2NullYConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2025
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2500
     * @tc.desc Verify null in the X position converts to zero before angle calculation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtan2NullXConversion();
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan2026
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN2_2600
     * @tc.desc Verify numeric string operands produce the positive Y axis angle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtan2StringZeroConversion();
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

  });
}
