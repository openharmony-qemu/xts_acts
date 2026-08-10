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
  observeMathFroundNullConversion,
  observeMathFroundStringConversion
} from './MathFround';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathFroundWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.fround(input);
  }
  return Math.fround(Number(input));
}

export default function mathFroundTest(): void {
  describe('MathFroundTest', (): void => {
    /**
     * @tc.name testMathFround001
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0100
     * @tc.desc Verify exact single precision value remains unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(1.5);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.name testMathFround002
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0200
     * @tc.desc Verify nonrepresentable value rounds to nearest single precision value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(1.337);
      expect(result).assertEqual(1.3370000123977661);
    });

    /**
     * @tc.name testMathFround003
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0300
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathFround004
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0400
     * @tc.desc Verify value beyond single precision range overflows to Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(3.5e38);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathFround005
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathFround006
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathFroundWithUnion(1.5);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.name testMathFround007
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathFroundWithUnion('1.5');
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.name testMathFround008
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathFroundStringConversion();
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.name testMathFround009
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_0900
     * @tc.desc Verify negative value beyond single precision range overflows to negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(-Number.MAX_VALUE);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathFround010
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_1000
     * @tc.desc Verify tiny positive value underflows to positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(Number.MIN_VALUE);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathFround011
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_1100
     * @tc.desc Verify tiny negative value underflows to negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(-Number.MIN_VALUE);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathFround012
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_1200
     * @tc.desc Verify maximum finite float32 boundary remains finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 3.4028234663852886e38;
      const result: number = Math.fround(input);
      expect(result).assertEqual(input);
    });

    /**
     * @tc.name testMathFround013
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_1300
     * @tc.desc Verify minimum positive float32 subnormal remains representable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 1.401298464324817e-45;
      const result: number = Math.fround(input);
      expect(result).assertEqual(input);
    });

    /**
     * @tc.name testMathFround014
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_1400
     * @tc.desc Verify the float32 integer precision boundary rounds to even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.fround(16777217);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.name testMathFround015
     * @tc.number SUB_BUILTINS_UTIL_MATH_FROUND_1500
     * @tc.desc Verify null converts to positive zero for single precision rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFround015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathFroundNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
