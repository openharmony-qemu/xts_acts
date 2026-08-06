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
  observeMathTanNullConversion,
  observeMathTanStringConversion
} from './MathTan';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathTanWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.tan(input);
  }
  return Math.tan(Number(input));
}

export default function mathTanTest(): void {
  describe('MathTanTest', (): void => {
    /**
     * @tc.name testMathTan001
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0100
     * @tc.desc Verify zero returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tan(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTan002
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0200
     * @tc.desc Verify PI divided by four returns one within precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tan(Math.PI / 4);
      const isApproxResult: boolean = isApprox(result, 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathTan003
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0300
     * @tc.desc Verify negative PI divided by four returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tan(-Math.PI / 4);
      const isApproxResult: boolean = isApprox(result, -1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathTan004
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0400
     * @tc.desc Verify tangent is odd for a representative finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.tan(0.5);
      const negative: number = Math.tan(-0.5);
      const isApproxResult: boolean = isApprox(positive, -negative, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathTan005
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0500
     * @tc.desc Verify Infinity input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tan(Infinity);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathTan006
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathTanWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTan007
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathTanWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTan008
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathTanStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathTan009
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_0900
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tan(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathTan010
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.tan(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathTan011
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_1100
     * @tc.desc Verify tangent is periodic across a PI shift
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.25;
      const original: number = Math.tan(input);
      const shifted: number = Math.tan(input + Math.PI);
      const isApproxResult: boolean = isApprox(shifted, original, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathTan012
     * @tc.number SUB_BUILTINS_UTIL_MATH_TAN_1200
     * @tc.desc Verify null converts to positive zero for tangent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTan012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathTanNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
