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
  observeMathTanhNullConversion,
  observeMathTanhStringConversion
} from './MathTanh';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathTanhWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.tanh(input);
  }
  return Math.tanh(Number(input));
}

export default function mathTanhTest(): void {
  describe('MathTanhTest', (): void => {
    /**
     * @tc.name testMathTanh001
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0100
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tanh(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathTanh002
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0200
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tanh(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathTanh003
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0300
     * @tc.desc Verify one returns the expected approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tanh(1);
      const isApproxResult: boolean = isApprox(result, 0.7615941559557649, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathTanh004
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0400
     * @tc.desc Verify positive Infinity returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tanh(Infinity);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathTanh005
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0500
     * @tc.desc Verify negative Infinity returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tanh(-Infinity);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathTanh006
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathTanhWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTanh007
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathTanhWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTanh008
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathTanhStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTanh009
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tanh(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathTanh010
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_1000
     * @tc.desc Verify hyperbolic tangent is odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.tanh(0.5);
      const negative: number = Math.tanh(-0.5);
      const isApproxResult: boolean = isApprox(negative, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathTanh011
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_1100
     * @tc.desc Verify hyperbolic tangent increases for ordered finite inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.tanh(-0.5);
      const second: number = Math.tanh(0);
      const third: number = Math.tanh(0.5);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathTanh012
     * @tc.number SUB_BUILTINS_UTIL_MATH_TANH_1200
     * @tc.desc Verify null converts to positive zero for hyperbolic tangent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTanh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathTanhNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
