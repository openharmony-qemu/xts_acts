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
  observeMathSqrtNullConversion,
  observeMathSqrtStringConversion
} from './MathSqrt';
import {
  isApprox,
  isFiniteValue,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathSqrtWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.sqrt(input);
  }
  return Math.sqrt(Number(input));
}

export default function mathSqrtTest(): void {
  describe('MathSqrtTest', (): void => {
    /**
     * @tc.name testMathSqrt001
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0100
     * @tc.desc Verify positive perfect square returns its exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathSqrt002
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0200
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSqrt003
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0300
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSqrt004
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0400
     * @tc.desc Verify negative finite input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(-1);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathSqrt005
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0500
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathSqrt006
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSqrtWithUnion(9);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathSqrt007
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSqrtWithUnion('9');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathSqrt008
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSqrtStringConversion();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathSqrt009
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathSqrt010
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_1000
     * @tc.desc Verify squaring a nonnegative square root recovers the input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(2);
      const isApproxResult: boolean = isApprox(result * result, 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSqrt011
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_1100
     * @tc.desc Verify square root increases for ordered nonnegative inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.sqrt(1);
      const second: number = Math.sqrt(2);
      const third: number = Math.sqrt(4);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathSqrt012
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_1200
     * @tc.desc Verify minimum positive input has a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(Number.MIN_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(2.2227587494850775e-162, 1e-12);
    });

    /**
     * @tc.name testMathSqrt013
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_1300
     * @tc.desc Verify maximum finite input has a finite positive root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sqrt(Number.MAX_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(1.3407807929942596e+154, 1e-12);
    });

    /**
     * @tc.name testMathSqrt014
     * @tc.number SUB_BUILTINS_UTIL_MATH_SQRT_1400
     * @tc.desc Verify null converts to positive zero for square root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSqrt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSqrtNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
