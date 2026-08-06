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
  observeMathExpm1NullConversion,
  observeMathExpm1StringConversion
} from './MathExpm1';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathExpm1WithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.expm1(input);
  }
  return Math.expm1(Number(input));
}

export default function mathExpm1Test(): void {
  describe('MathExpm1Test', (): void => {
    /**
     * @tc.name testMathExpm1001
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0100
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1002
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0200
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1003
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0300
     * @tc.desc Verify one returns E minus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(1);
      const isApproxResult: boolean = isApprox(result, Math.E - 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1004
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0400
     * @tc.desc Verify negative Infinity returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(-Infinity);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathExpm1005
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0500
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathExpm1006
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathExpm1WithUnion(1);
      const isApproxResult: boolean = isApprox(result, Math.E - 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1007
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathExpm1WithUnion('1');
      const isApproxResult: boolean = isApprox(result, Math.E - 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1008
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathExpm1StringConversion();
      const isApproxResult: boolean = isApprox(result, Math.E - 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1009
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1010
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_1000
     * @tc.desc Verify tiny positive input retains expm1 precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(1e-10);
      const isApproxResult: boolean = isApprox(result, 1.00000000005e-10, 1e-25);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathExpm1011
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_1100
     * @tc.desc Verify minimum positive input remains observable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(Number.MIN_VALUE);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name testMathExpm1012
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_1200
     * @tc.desc Verify negative minimum input remains observable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.expm1(-Number.MIN_VALUE);
      expect(result).assertEqual(-Number.MIN_VALUE);
    });

    /**
     * @tc.name testMathExpm1013
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXPM1_1300
     * @tc.desc Verify null converts to positive zero for exponential minus one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExpm1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathExpm1NullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
