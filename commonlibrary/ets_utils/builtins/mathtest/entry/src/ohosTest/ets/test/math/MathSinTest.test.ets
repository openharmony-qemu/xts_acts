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
  observeMathSinNullConversion,
  observeMathSinStringConversion
} from './MathSin';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathSinWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.sin(input);
  }
  return Math.sin(Number(input));
}

export default function mathSinTest(): void {
  describe('MathSinTest', (): void => {
    /**
     * @tc.name testMathSin001
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0100
     * @tc.desc Verify zero returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSin002
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0200
     * @tc.desc Verify PI divided by two returns one within precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(Math.PI / 2);
      const isApproxResult: boolean = isApprox(result, 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSin003
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0300
     * @tc.desc Verify negative PI divided by two returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(-Math.PI / 2);
      const isApproxResult: boolean = isApprox(result, -1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSin004
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0400
     * @tc.desc Verify sine is odd for a representative finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.sin(0.75);
      const negative: number = Math.sin(-0.75);
      const isApproxResult: boolean = isApprox(positive, -negative, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSin005
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0500
     * @tc.desc Verify Infinity input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(Infinity);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathSin006
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSinWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSin007
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSinWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSin008
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSinStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSin009
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_0900
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSin010
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sin(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathSin011
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_1100
     * @tc.desc Verify sine is periodic across a two PI shift
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.25;
      const original: number = Math.sin(input);
      const shifted: number = Math.sin(input + 2 * Math.PI);
      const isApproxResult: boolean = isApprox(shifted, original, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSin012
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIN_1200
     * @tc.desc Verify null converts to positive zero for sine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSinNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
