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
  observeMathAsinhNullConversion,
  observeMathAsinhStringConversion
} from './MathAsinh';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathAsinhWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.asinh(input);
  }
  return Math.asinh(Number(input));
}

export default function mathAsinhTest(): void {
  describe('MathAsinhTest', (): void => {
    /**
     * @tc.name testMathAsinh001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0100
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asinh(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAsinh002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0200
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asinh(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAsinh003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0300
     * @tc.desc Verify one returns the expected approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asinh(1);
      const isApproxResult: boolean = isApprox(result, 0.881373587019543, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAsinh004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0400
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asinh(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathAsinh005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0500
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAsinhWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsinh006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0600
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAsinhWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsinh007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0700
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAsinhStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsinh008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0800
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asinh(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathAsinh009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asinh(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAsinh010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_1000
     * @tc.desc Verify inverse hyperbolic sine is odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.asinh(2);
      const negative: number = Math.asinh(-2);
      const isApproxResult: boolean = isApprox(negative, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAsinh011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_1100
     * @tc.desc Verify inverse hyperbolic sine increases for ordered inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.asinh(0.5);
      const second: number = Math.asinh(1);
      const third: number = Math.asinh(2);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathAsinh012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASINH_1200
     * @tc.desc Verify null converts to positive zero for inverse hyperbolic sine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsinh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAsinhNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
