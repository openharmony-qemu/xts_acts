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
  observeMathCbrtNullConversion,
  observeMathCbrtStringConversion
} from './MathCbrt';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathCbrtWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.cbrt(input);
  }
  return Math.cbrt(Number(input));
}

export default function mathCbrtTest(): void {
  describe('MathCbrtTest', (): void => {
    /**
     * @tc.name testMathCbrt001
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0100
     * @tc.desc Verify positive perfect cube returns its exact root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cbrt(27);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathCbrt002
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0200
     * @tc.desc Verify negative perfect cube preserves the sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cbrt(-8);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name testMathCbrt003
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0300
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cbrt(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathCbrt004
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0400
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cbrt(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathCbrt005
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cbrt(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathCbrt006
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCbrtWithUnion(8);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathCbrt007
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCbrtWithUnion('8');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathCbrt008
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCbrtStringConversion();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathCbrt009
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_0900
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cbrt(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathCbrt010
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_1000
     * @tc.desc Verify cube root is odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.cbrt(2);
      const negative: number = Math.cbrt(-2);
      const isApproxResult: boolean = isApprox(negative, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCbrt011
     * @tc.number SUB_BUILTINS_UTIL_MATH_CBRT_1100
     * @tc.desc Verify null converts to positive zero for cube root
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCbrt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCbrtNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
