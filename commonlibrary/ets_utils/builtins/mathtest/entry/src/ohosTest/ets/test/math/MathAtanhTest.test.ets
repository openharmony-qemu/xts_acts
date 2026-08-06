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
  observeMathAtanhInvalidStringConversion,
  observeMathAtanhNullConversion,
  observeMathAtanhStringConversion,
  observeMathAtanhUndefinedConversion
} from './MathAtanh';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathAtanhWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.atanh(input);
  }
  return Math.atanh(Number(input));
}

export default function mathAtanhTest(): void {
  describe('MathAtanhTest', (): void => {
    /**
     * @tc.name testMathAtanh001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0100
     * @tc.desc Verify zero returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAtanh002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0200
     * @tc.desc Verify one half returns the expected approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(0.5);
      const isApproxResult: boolean = isApprox(result, 0.5493061443340548, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0300
     * @tc.desc Verify upper endpoint returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(1);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathAtanh004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0400
     * @tc.desc Verify lower endpoint returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(-1);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathAtanh005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0500
     * @tc.desc Verify input outside the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(1.01);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAtanhWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAtanh007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAtanhWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAtanh008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtanhStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAtanh009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_0900
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1100
     * @tc.desc Verify inverse hyperbolic tangent is odd inside its domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.atanh(0.5);
      const negative: number = Math.atanh(-0.5);
      const isApproxResult: boolean = isApprox(negative, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1200
     * @tc.desc Verify atanh increases across ordered inputs inside its domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.atanh(-0.5);
      const second: number = Math.atanh(0);
      const third: number = Math.atanh(0.5);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathAtanh013
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1300
     * @tc.desc Verify negative input outside the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.atanh(-1.01);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh014
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1400
     * @tc.desc Verify raw null coercion reaches atanh as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtanhNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh015
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1500
     * @tc.desc Verify an invalid numeric string produces NaN for atanh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtanhInvalidStringConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAtanh016
     * @tc.number SUB_BUILTINS_UTIL_MATH_ATANH_1600
     * @tc.desc Verify undefined conversion produces NaN for atanh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAtanh016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAtanhUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

  });
}
