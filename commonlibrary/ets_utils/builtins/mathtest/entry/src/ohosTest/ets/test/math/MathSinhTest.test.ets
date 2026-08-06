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
  observeMathSinhNullConversion,
  observeMathSinhStringConversion
} from './MathSinh';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathSinhWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.sinh(input);
  }
  return Math.sinh(Number(input));
}

export default function mathSinhTest(): void {
  describe('MathSinhTest', (): void => {
    /**
     * @tc.name testMathSinh001
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0100
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSinh002
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0200
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSinh003
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0300
     * @tc.desc Verify one returns the expected approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(1);
      const isApproxResult: boolean = isApprox(result, 1.1752011936438014, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSinh004
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0400
     * @tc.desc Verify hyperbolic sine is odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.sinh(1);
      const negative: number = Math.sinh(-1);
      const isApproxResult: boolean = isApprox(positive, -negative, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSinh005
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0500
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathSinh006
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSinhWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSinh007
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSinhWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSinh008
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSinhStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathSinh009
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_0900
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathSinh010
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathSinh011
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_1100
     * @tc.desc Verify hyperbolic sine matches its exponential identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.5;
      const expected: number = (Math.exp(input) - Math.exp(-input)) / 2;
      const result: number = Math.sinh(input);
      const isApproxResult: boolean = isApprox(result, expected, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathSinh012
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_1200
     * @tc.desc Verify hyperbolic sine increases for ordered positive inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.sinh(0.5);
      const second: number = Math.sinh(1);
      const third: number = Math.sinh(2);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathSinh013
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_1300
     * @tc.desc Verify minimum positive input remains observable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(Number.MIN_VALUE);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name testMathSinh014
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_1400
     * @tc.desc Verify negative minimum input remains observable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sinh(-Number.MIN_VALUE);
      expect(result).assertEqual(-Number.MIN_VALUE);
    });

    /**
     * @tc.name testMathSinh015
     * @tc.number SUB_BUILTINS_UTIL_MATH_SINH_1500
     * @tc.desc Verify null converts to positive zero for hyperbolic sine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSinh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSinhNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
