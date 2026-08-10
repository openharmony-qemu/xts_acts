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
  observeMathCosNullConversion,
  observeMathCosStringConversion
} from './MathCos';
import {
  isApprox,
  isNaNValue
} from '../MathTestUtils';

function callMathCosWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.cos(input);
  }
  return Math.cos(Number(input));
}

export default function mathCosTest(): void {
  describe('MathCosTest', (): void => {
    /**
     * @tc.name testMathCos001
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0100
     * @tc.desc Verify zero returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cos(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCos002
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0200
     * @tc.desc Verify PI returns negative one within precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cos(Math.PI);
      const isApproxResult: boolean = isApprox(result, -1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCos003
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0300
     * @tc.desc Verify PI divided by two is approximately zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cos(Math.PI / 2);
      const isApproxResult: boolean = isApprox(result, 0, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCos004
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0400
     * @tc.desc Verify cosine is even for a representative finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.cos(0.75);
      const negative: number = Math.cos(-0.75);
      const isApproxResult: boolean = isApprox(positive, negative, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCos005
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0500
     * @tc.desc Verify Infinity input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cos(Infinity);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathCos006
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCosWithUnion(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCos007
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCosWithUnion('0');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCos008
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCosStringConversion();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCos009
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cos(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathCos010
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_1000
     * @tc.desc Verify cosine is periodic across a two PI shift
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.25;
      const original: number = Math.cos(input);
      const shifted: number = Math.cos(input + 2 * Math.PI);
      const isApproxResult: boolean = isApprox(shifted, original, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCos011
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_1100
     * @tc.desc Verify sine and cosine satisfy the Pythagorean identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.75;
      const sine: number = Math.sin(input);
      const cosine: number = Math.cos(input);
      const isApproxResult: boolean = isApprox(sine * sine + cosine * cosine, 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCos012
     * @tc.number SUB_BUILTINS_UTIL_MATH_COS_1200
     * @tc.desc Verify null converts to zero and cosine returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCos012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCosNullConversion();
      expect(result).assertEqual(1);
    });

  });
}
