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
  observeMathAsinInvalidStringConversion,
  observeMathAsinNullConversion,
  observeMathAsinStringConversion,
  observeMathAsinUndefinedConversion
} from './MathAsin';
import {
  isApprox,
  isNaNValue,
  isNegativeZero
} from '../MathTestUtils';

function callMathAsinWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.asin(input);
  }
  return Math.asin(Number(input));
}

export default function mathAsinTest(): void {
  describe('MathAsinTest', (): void => {
    /**
     * @tc.name testMathAsin001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0100
     * @tc.desc Verify zero returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsin002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0200
     * @tc.desc Verify upper domain endpoint returns PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(1);
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0300
     * @tc.desc Verify lower domain endpoint returns negative PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(-1);
      const isApproxResult: boolean = isApprox(result, -Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0400
     * @tc.desc Verify input outside the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(2);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0500
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAsinWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsin006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0600
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAsinWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsin007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0700
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAsinStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsin008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0800
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1000
     * @tc.desc Verify arcsine is odd for a representative interior value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.asin(0.5);
      const negative: number = Math.asin(-0.5);
      const isApproxResult: boolean = isApprox(negative, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1100
     * @tc.desc Verify sine reverses asin inside the principal domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.25;
      const result: number = Math.sin(Math.asin(input));
      const isApproxResult: boolean = isApprox(result, input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1200
     * @tc.desc Verify asin increases across ordered domain inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.asin(-0.5);
      const second: number = Math.asin(0);
      const third: number = Math.asin(0.5);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathAsin013
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1300
     * @tc.desc Verify negative input outside the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.asin(-2);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin014
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1400
     * @tc.desc Verify raw null coercion reaches asin as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAsinNullConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAsin015
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1500
     * @tc.desc Verify an invalid numeric string produces NaN for asin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAsinInvalidStringConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAsin016
     * @tc.number SUB_BUILTINS_UTIL_MATH_ASIN_1600
     * @tc.desc Verify undefined conversion produces NaN for asin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAsin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAsinUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

  });
}
