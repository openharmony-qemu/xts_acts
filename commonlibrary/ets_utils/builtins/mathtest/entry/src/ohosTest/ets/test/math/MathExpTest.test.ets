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
  observeMathExpNullConversion,
  observeMathExpStringConversion
} from './MathExp';
import {
  isApprox,
  isNaNValue,
  isPositiveZero
} from '../MathTestUtils';

function callMathExpWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.exp(input);
  }
  return Math.exp(Number(input));
}

export default function mathExpTest(): void {
  describe('MathExpTest', (): void => {
    /**
     * @tc.name testMathExp001
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0100
     * @tc.desc Verify zero returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathExp002
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0200
     * @tc.desc Verify one returns the E constant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(1);
      const isApproxResult: boolean = isApprox(result, Math.E, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathExp003
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0300
     * @tc.desc Verify negative Infinity returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(-Infinity);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathExp004
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0400
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathExp005
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathExp006
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathExpWithUnion(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathExp007
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathExpWithUnion('0');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathExp008
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathExpStringConversion();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathExp009
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_0900
     * @tc.desc Verify large finite input overflows to positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(710);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathExp010
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_1000
     * @tc.desc Verify sufficiently negative finite input underflows to positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.exp(-746);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathExp011
     * @tc.number SUB_BUILTINS_UTIL_MATH_EXP_1100
     * @tc.desc Verify null converts to zero and exponential returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathExp011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathExpNullConversion();
      expect(result).assertEqual(1);
    });

  });
}
