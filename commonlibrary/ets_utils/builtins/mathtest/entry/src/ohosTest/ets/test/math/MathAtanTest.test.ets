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
  observeMathAtanNullConversion,
  observeMathAtanStringConversion
} from './MathAtan';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathAtanWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.atan(input);
  }
  return Math.atan(Number(input));
}

export default function mathAtanTest(): void {
  describe('MathAtanTest', (): void => {
    /**
     * @tc.name testMathAtan001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0100
     * @tc.desc Verify zero returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAtan002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0200
     * @tc.desc Verify one returns PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(1);
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0300
     * @tc.desc Verify negative one returns negative PI divided by four
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(-1);
      const isApproxResult: boolean = isApprox(result, -Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0400
     * @tc.desc Verify positive Infinity returns PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(Infinity);
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0500
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAtanWithUnion(1);
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0600
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAtanWithUnion('1');
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0700
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtanStringConversion();
      const isApproxResult: boolean = isApprox(result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0800
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_0900
     * @tc.desc Verify negative Infinity returns negative PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(-Infinity);
      const isApproxResult: boolean = isApprox(result, -Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atan(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_1100
     * @tc.desc Verify arctangent is odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.atan(10);
      const negative: number = Math.atan(-10);
      const isApproxResult: boolean = isApprox(negative, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtan012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATAN_1200
     * @tc.desc Verify null converts to positive zero for arctangent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtanNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
