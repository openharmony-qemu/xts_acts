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
  observeMathTruncNullConversion,
  observeMathTruncStringConversion
} from './MathTrunc';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathTruncWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.trunc(input);
  }
  return Math.trunc(Number(input));
}

export default function mathTruncTest(): void {
  describe('MathTruncTest', (): void => {
    /**
     * @tc.name testMathTrunc001
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0100
     * @tc.desc Verify positive fraction removes its fractional digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(3.9);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathTrunc002
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0200
     * @tc.desc Verify negative fraction removes its fractional digits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(-3.9);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathTrunc003
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0300
     * @tc.desc Verify negative fraction below one produces negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(-0.5);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathTrunc004
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0400
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathTrunc005
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathTrunc006
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathTruncWithUnion(3.9);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathTrunc007
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathTruncWithUnion('3.9');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathTrunc008
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathTruncStringConversion();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathTrunc009
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_0900
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathTrunc010
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_1000
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathTrunc011
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_1100
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.trunc(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathTrunc012
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_1200
     * @tc.desc Verify trunc is monotonic nondecreasing for ordered positive inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.trunc(1.2);
      const second: number = Math.trunc(2.8);
      const third: number = Math.trunc(3.1);
      expect(first).assertLessOrEqual(second);
      expect(second).assertLessOrEqual(third);
    });

    /**
     * @tc.name testMathTrunc013
     * @tc.number SUB_BUILTINS_UTIL_MATH_TRUNC_1300
     * @tc.desc Verify null converts to positive zero for truncation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathTrunc013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathTruncNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
